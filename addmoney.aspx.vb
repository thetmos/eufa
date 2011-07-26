Imports WebReference
Imports interfaceprog

Partial Class addmoney
    Inherits System.Web.UI.Page

    Protected Sub btnActivateEfuCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActivateEfuCard.Click
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()

        mvstatus.ActiveViewIndex = 1

        If Not Equals(user, Nothing) Then
            Dim serPartNo As Integer = 0
            Dim numSeqNo As Integer = 0
            Dim pin As Long = 0

            If Integer.TryParse(ser.Text, serPartNo) AndAlso Integer.TryParse(num.Text, numSeqNo) AndAlso Integer.TryParse(pin1.Text + pin2.Text + pin3.Text, pin) Then
                Dim respCode As ResponseCode = ef.CheckEFUCard(serPartNo, numSeqNo)
                If respCode.ErrorCode = 0 Then
                    Dim respAddMoney As ResponseAddMoney = ef.ActivateEFUCard(serPartNo, numSeqNo, pin)
                    If respAddMoney.ErrorCode = 0 Then
                        If respAddMoney.ErrorMessage = "" Then
                            'successMessage
                            lblstatus.Text = "Карта активирована успешно"
                        Else
                            lblstatus.Text = "Карта активирована успешно, но при дальнейшей обработке произошла ошибка:" + respAddMoney.ErrorMessage
                            'errorMessage
                        End If
                    Else
                        lblstatus.Text = "Карта не активирована. Произошла ошибка:" + respAddMoney.ErrorMessage
                        'errorMessage
                    End If
                Else
                    lblstatus.Text = "Карта не активирована. Произошла ошибка:" + respCode.ErrorMessage
                    'errorMessage
                End If
            Else
                lblstatus.Text = "Карта не активирована. Неправильно введены данные"
                'errorMessage
            End If
        Else
            lblstatus.Text = "Для выполнения этого действия необходимо войти или зарегистрироваться на сервисе"
        End If
    End Sub
End Class
