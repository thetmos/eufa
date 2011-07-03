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
        If Integer.TryParse(postedValues("id"), gameId) Then
            Dim respOnegame As ResponseGame
            respOnegame = ef.ReadGame(gameId)
            If respOnegame.ErrorCode = 0 Then

                outputString.Append("<game player1=""")
                outputString.Append(respOnegame.Game.Player1.Name)
                outputString.Append(""" player2=""")                
                outputString.Append(respOnegame.Game.Player2.Name)
                outputString.Append(""" />")
                outputString.Append("<events>")
                For Each oneevent As WebReference.Event In respOnegame.Game.Events
                    If (oneevent.IsLive = "O" OrElse oneevent.IsLive = "Y") AndAlso (oneevent.Status <> "C" AndAlso oneevent.Status <> "N" AndAlso oneevent.Status <> "D") Then
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
