Imports WebReference
Imports interfaceprog

Partial Class make_one_bet
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()

        Dim xmldata As String
        Response.Buffer = True
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "text/xml"

        Dim status As String = ""
        Dim message As String = ""

        If Not Equals(user, Nothing) Then
            Dim postedValues As NameValueCollection = Request.Form
            'Dim eventIdStr As String = postedValues("eventId")
            'Dim betSumStr As String = postedValues("betSum")
            Dim eventId As Integer
            Dim gameId As Integer
            Dim odd As Decimal
            Dim betSum As Single
            If Integer.TryParse(postedValues("eventId"), eventId) AndAlso Integer.TryParse(postedValues("gameId"), gameId) AndAlso Decimal.TryParse(postedValues("odd").Replace(".", ","), odd) Then
                If Single.TryParse(postedValues("betSum").Replace(".", ","), betSum) Then
                    'status = "0"
                    'message = "success"
                    Dim rBetRestr As ResponseBetRestiction = ef.GetBetRestriction(gameId, 1, 1, user.Currency)
                    If rBetRestr.ErrorCode = 0 Then
                        If rBetRestr.MaxBet < rBetRestr.MinBet Then
                            status = "1"
                            message = "К сожалению, прием ставки запрещен."
                        ElseIf Math.Min(rBetRestr.MaxBet, rBetRestr.MaxGain / odd) >= betSum AndAlso betSum > rBetRestr.MinBet Then
                            Dim rMakeBet As ResponseMakeBet
                            rMakeBet = ef.MakeSimpleBet(ef.ReadEvent(eventId).Event, betSum, user.Currency)
                            If rMakeBet.ErrorCode = 0 Then
                                status = "0"
                                message = "Ставка успешно произведена. Остаток на счете " + user.Balance.ToString() + " " + user.Currency.ToString()
                            Else
                                status = "1"
                                message = "Ставка не сделана, произошла ошибка: " + rMakeBet.ErrorMessage
                            End If
                        Else
                            status = "1"
                            message = "Ставка не сделана, сумма ставки не соответствует разрешенной для этой игры. Максимальная ставка: " + Math.Min(rBetRestr.MaxBet, rBetRestr.MaxGain / odd).ToString() + " " + user.Currency.ToString() + ". Минимальная ставка: " + rBetRestr.MinBet.ToString() + " " + user.Currency.ToString() + ". "
                        End If
                    Else
                        status = "1"
                        message = "Ставка не сделана, произошла ошибка: " + rBetRestr.ErrorMessage
                    End If                    
                Else
                    status = "1"
                    message = "Сумма ставки была введена неверно, пожалуйста, попробуйте еще раз"
                End If
                'Response.Write(myMemoryStream.ToString())
            Else
                status = "1"
                message = "Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз."
                'Response.Write("Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз.")
            End If
            'message = message + "|" + betSum.ToString()
            'Dim action As String = Request.QueryString("action")
            ''Dim onebetString = postedValues("action")
            'If action = "make_one_bet" Then
            '    'Response.Write("Success!!!")
            'Else


            'End If
        Else
            status = "1"
            message = "Для использования сервиса необходимо войти или зарегестрироваться."
            'Response.Write("Для использования сервиса необходимо войти или зарегестрироваться.")
        End If

        xmldata = "<?xml version=""1.0"" encoding=""utf-8""?><data status=""" + status + """ message=""" + message + """ ></data>"
        Response.Write(xmldata)
        Response.End()
    End Sub
End Class
