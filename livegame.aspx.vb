Imports WebReference
Imports interfaceprog

Partial Class livegame
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        'Dim user As User = getEfuUser()

        Dim xmldata As String
        Response.Buffer = True
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "text/xml"

        Dim status As String = ""
        Dim message As String = ""
        Dim outputString As New StringBuilder

        'If Not Equals(user, Nothing) Then
        Dim postedValues As NameValueCollection = Request.Form

        Dim gameId As Integer
        Dim sportId As Integer
        If Integer.TryParse(postedValues("id"), gameId) AndAlso Integer.TryParse(postedValues("sportId"), sportId) Then
            Dim eventslist As New List(Of WebReference.Event)
            Dim respOnegame As ResponseGame
            respOnegame = ef.ReadGame(gameId)
            Dim liveiface As New LiveInterface(sportId)
            If respOnegame.ErrorCode = 0 Then

                outputString.Append("<game player1=""")
                outputString.Append(respOnegame.Game.Player1.Name)
                outputString.Append(""" player2=""")
                outputString.Append(respOnegame.Game.Player2.Name)
                outputString.Append(""" />")
                outputString.Append("<events>")
                For Each oneev As WebReference.Event In respOnegame.Game.Events
                    If (oneev.IsLive = "O" OrElse oneev.IsLive = "Y") AndAlso (oneev.Status = "L") Then
                        eventslist.Add(oneev)
                    End If

                Next
                Dim betoutputString As StringBuilder
                For Each kvpgroup As KeyValuePair(Of String, List(Of xmlBet)) In liveiface.GroupList
                    
                    betoutputString = New StringBuilder
                    For Each bet As xmlBet In kvpgroup.Value
                        For Each oneevent As WebReference.Event In eventslist

                            If oneevent.TypeCode = bet.Typecode _
                                                AndAlso (bet.Allowance = 0 OrElse bet.Allowance = oneevent.Allowance) _
                                                AndAlso (bet.Score1 = 0 OrElse bet.Score1 = oneevent.Score1) _
                                                AndAlso (bet.Score2 = 0 OrElse bet.Score1 = oneevent.Score2) _
                                                AndAlso (bet.Periodnr = 0 OrElse bet.Periodnr = oneevent.PeriodNr) _
                                                AndAlso (bet.Total = 0 OrElse bet.Total = oneevent.Total) Then
                                betoutputString.Append("<oneevent id=""")
                                betoutputString.Append(oneevent.Id)
                                betoutputString.Append(""" typecode=""")
                                betoutputString.Append(oneevent.TypeCode)
                                betoutputString.Append(""" name=""")
                                betoutputString.Append(oneevent.Name.Replace(">", "&gt;").Replace("<", "&lt;"))
                                betoutputString.Append(""" alowance=""")
                                betoutputString.Append(oneevent.Allowance)
                                betoutputString.Append(""" total=""")
                                betoutputString.Append(oneevent.Total)
                                betoutputString.Append(""" score1=""")
                                betoutputString.Append(oneevent.Score1)
                                betoutputString.Append(""" score2=""")
                                betoutputString.Append(oneevent.Score2)
                                betoutputString.Append(""" periodnr=""")
                                betoutputString.Append(oneevent.PeriodNr)
                                betoutputString.Append(""" odd=""")
                                betoutputString.Append(oneevent.Odd)
                                betoutputString.Append(""" />")

                                'eventslist.Remove(oneevent)    
                                oneevent.TypeCode = -100
                            End If
                        Next
                    Next
                    If betoutputString.Length > 0 Then
                        outputString.Append("<group name=""")
                        outputString.Append(kvpgroup.Key)
                        outputString.Append(""">")
                        outputString.Append(betoutputString.ToString())
                        outputString.Append("</group>")
                    End If
                Next

                If eventslist.Count > 0 Then
                    outputString.Append("<group name=""Others"">")
                    For Each oneevent As WebReference.Event In eventslist
                        If oneevent.TypeCode <> -100 Then
                            outputString.Append("<oneevent id=""")
                            outputString.Append(oneevent.Id)
                            outputString.Append(""" typecode=""")
                            outputString.Append(oneevent.TypeCode)
                            outputString.Append(""" name=""")
                            outputString.Append(oneevent.Name.Replace(">", "&gt;").Replace("<", "&lt;"))
                            outputString.Append(""" alowance=""")
                            outputString.Append(oneevent.Allowance)
                            outputString.Append(""" total=""")
                            outputString.Append(oneevent.Total)
                            outputString.Append(""" score1=""")
                            outputString.Append(oneevent.Score1)
                            outputString.Append(""" score2=""")
                            outputString.Append(oneevent.Score2)
                            outputString.Append(""" periodnr=""")
                            outputString.Append(oneevent.PeriodNr)
                            outputString.Append(""" odd=""")
                            outputString.Append(oneevent.Odd)
                            outputString.Append(""" />")
                        End If                        
                    Next
                    outputString.Append("</group>")
                End If


                outputString.Append("</events>")
                status = "0"
                message = "Ставка успешно произведена"
            Else
                status = "1"
                message = "Ставка не сделана, произошла ошибка: " + respOnegame.ErrorMessage
            End If

        Else
            status = "1"
            message = "Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз."
        End If

        'Else
        '    status = "1"
        '    message = "Для использования сервиса необходимо войти или зарегестрироваться."
        'End If

        xmldata = "<?xml version=""1.0"" encoding=""utf-8""?><root><data status=""" + status + """ message=""" + message + """ />" + outputString.ToString() + "</root>"
        Response.Write(xmldata)
        Response.End()
    End Sub
End Class
