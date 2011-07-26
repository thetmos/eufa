Imports interfaceprog
Imports WebReference

Partial Class make_combo_bet
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()        

        Dim xmldata As String
        Response.Buffer = True
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "text/xml"

        Dim status As String = ""
        Dim message As String = ""


        Dim postedValues As NameValueCollection = Request.Form
        Dim typeString = postedValues("type")
        Dim aString As String = postedValues("bet")
        Dim betsArrayStr() As String
        If aString <> "" Then
            Dim betsEventsList As New List(Of WebReference.Event)
            betsArrayStr = aString.Split(",")
            Dim betsEventsArr() As WebReference.Event
            ReDim betsEventsArr(betsArrayStr.Count - 1)
            Dim betsCount As UInt16 = 0
            Dim betsWinCount As UInt16 = 0

            Dim tempint As Integer = 0
            For bets = 0 To betsArrayStr.Count - 1                
                If Integer.TryParse(betsArrayStr(betsCount), tempint) Then                    
                    betsEventsArr(betsCount) = ef.ReadEvent(tempint).Event                    
                End If
                betsCount = betsCount + 1
            Next

            


            Dim user As User = getEfuUser()
            Dim betSum As Single = 0


            If Not Equals(user, Nothing) Then
                If typeString = "express" Then
                    betsWinCount = betsCount
                ElseIf typeString = "system" Then
                    If Not UInt16.TryParse(postedValues("winEventsCounter"), betsWinCount) Then
                        status = "1"
                        message = "Число событий, которые должны выиграть было введено неверно. Их количество должно быть больше нуля и меньше общего количества ставок."
                        xmldata = "<?xml version=""1.0"" encoding=""utf-8""?><data status=""" + status + """ message=""" + message + """ ></data>"
                        Response.Write(xmldata)
                        Response.End()
                        Exit Sub
                    End If
                End If

                If Single.TryParse(postedValues("betSum").Replace(".", ","), betSum) AndAlso betSum > 0 Then
                    Dim respmbCombobet As ResponseMakeBet
                    Try                        
                        respmbCombobet = ef.MakeComboBet(betsEventsArr, betsWinCount, betSum, user.Currency)
                        If respmbCombobet.ErrorCode = 0 Then                        
                            status = "0"
                            Dim rBalance As ResponseBalance
                            rBalance = ef.GetCurrentUserBalance()
                            If rBalance.ErrorCode = 0 Then
                                message = "Ставка успешно произведена. Остаток на счете " + rBalance.Balance.ToString() + " " + user.Currency.ToString()
                            Else
                                message = "Ставка успешно произведена. Остаток на счете, к сожалению прочитать не удалось."
                            End If
                        Else
                            status = "1"
                            message = "Ставка не сделана, произошла ошибка: " + respmbCombobet.ErrorMessage
                        End If
                    Catch ex As Exception
                        status = "1"
                        message = "Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз."
                    End Try
                Else
                    status = "1"
                    message = "Сумма ставки была введена неверно, пожалуйста, попробуйте еще раз"
                End If
            Else
                status = "1"
                message = "Для использования сервиса необходимо войти или зарегестрироваться."
            End If
        Else
            status = "1"
            message = "Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз."
        End If
        xmldata = "<?xml version=""1.0"" encoding=""utf-8""?><data status=""" + status + """ message=""" + message + """ ></data>"
        Response.Write(xmldata)
        Response.End()
    End Sub
End Class
