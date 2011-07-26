Imports WebReference
Imports interfaceprog

Partial Class get_bet_restriction
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
        Dim minBet As Single
        Dim maxBet As Single
        Dim betRestriction As String = ""

        Dim status As String = ""
        Dim message As String = ""

        If Not Equals(user, Nothing) Then
            Dim postedValues As NameValueCollection = Request.Form
            Dim eventId As Integer
            Dim gameId As Integer
            Dim num_games As Integer
            Dim num_win_games As Integer
            Dim odd As Single
            
            If Integer.TryParse(postedValues("gameId"), gameId) AndAlso Integer.TryParse(postedValues("num_games"), num_games) AndAlso Integer.TryParse(postedValues("num_win_games"), num_win_games) AndAlso Single.TryParse(postedValues("odd").Replace(".", ","), odd) Then


                Dim rBetRestr As ResponseBetRestiction = ef.GetBetRestriction(gameId, num_games, num_win_games, user.Currency)
                If rBetRestr.ErrorCode = 0 Then
                    status = "0"
                    message = ""

                    betRestriction = "minBet=""" + CInt(rBetRestr.MinBet).ToString().Replace(",", ".") + """ maxbet=""" + CInt(Math.Min(rBetRestr.MaxBet, rBetRestr.MaxGain / odd)).ToString().Replace(",", ".") + """ userCurrency=""" + user.Currency + """"
                Else
                    status = "1"
                    message = "Ставка не сделана, произошла ошибка: " + rBetRestr.ErrorMessage
                End If

                'Response.Write(myMemoryStream.ToString())
            Else
                status = "1"
                message = "Извините, на сервере произошла ошибка. Пожалуйста, попробуйте еще раз.1"
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

        xmldata = "<?xml version=""1.0"" encoding=""utf-8""?><root><data status=""" + status + """ message=""" + message + """ ></data><betRestriction " + betRestriction + "></betRestriction></root>"
        Response.Write(xmldata)
        Response.End()
    End Sub
End Class
