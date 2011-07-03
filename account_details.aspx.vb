Imports WebReference
Imports interfaceprog

Partial Class account_details
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()
        If Not Equals(user, Nothing) Then
            lbllogin.Text = user.Logon
            txtbank.Text = user.BankName
            txtemail.Text = user.EMail
            txtbankdepartment.Text = user.BankDepartment
            txtphone.Text = user.Phone
            txtbankcity.Text = user.BankCity
            txtaddress.Text = user.Address
            txtbankcode.Text = user.BankCode
            txtpass.Text = user.Password
            'txtbankks.Text = user.BankAccount
            txtrepass.Text = user.Password
            txtbankaccount.Text = user.BankAccount
            txtcheckword.Text = user.CheckWord
            lbllastname.Text = user.LastName
            txtwebmoney.Text = user.WebMoney
            lblfirstname.Text = user.FirstName
            txtedram.Text = user.EDram
            If user.Sex = "M" Then
                lblsex.Text = "Муж"
            Else
                lblsex.Text = "Жен"
            End If
            lblday.Text = user.Birthday.Day.ToString
            Select Case user.Birthday.Month
                Case 1
                    lblmonth.Text = "января"
                Case 2
                    lblmonth.Text = "февраля"
                Case 3
                    lblmonth.Text = "марта"
                Case 4
                    lblmonth.Text = "апреля"
                Case 5
                    lblmonth.Text = "мая"
                Case 6
                    lblmonth.Text = "июня"
                Case 7
                    lblmonth.Text = "июля"
                Case 8
                    lblmonth.Text = "августа"
                Case 9
                    lblmonth.Text = "сентября"
                Case 10
                    lblmonth.Text = "октября"
                Case 11
                    lblmonth.Text = "ноября"
                Case 12
                    lblmonth.Text = "декабря"
                Case Else
                    lblmonth.Text = ""
            End Select
            lblyear.Text = user.Birthday.Year.ToString
            Dim timebias As Decimal = 0
            timebias = user.TimeBias \ 60
            Dim timebiasstring As String = ""
            If timebias > 0 Then
                timebiasstring = "+"
            Else
                timebiasstring = "-"
            End If
            lbltimebias.Text = timebiasstring + timebias.ToString
            lblcurrency.Text = user.Currency


        Else
            mvaccount_details.ActiveViewIndex = 1
            lblstatus.Text = "Для просмотра этой страницы необходимо авторизоваться на портале"
        End If
    End Sub

    Protected Sub btncancelchanges_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btncancelchanges.Click
        mvaccount_details.ActiveViewIndex = 1
        lblstatus.Text = "Обновление данных отменено"
    End Sub

    Protected Sub btnsavechanges_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsavechanges.Click
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()
        If Not Equals(user, Nothing) Then
            Page.Validate()
            If Page.IsValid Then
                user.BankName = txtbank.Text
                user.EMail = txtemail.Text
                user.BankDepartment = txtbankdepartment.Text
                user.Phone = txtphone.Text
                user.BankCity = txtbankcity.Text
                user.Address = txtaddress.Text
                user.BankCode = txtbankcode.Text
                user.Password = txtpass.Text
                'user.BankAccount = txtbankks.Text
                user.Password = txtrepass.Text
                user.BankAccount = txtbankaccount.Text
                user.CheckWord = txtcheckword.Text
                user.WebMoney = txtwebmoney.Text
                user.EDram = txtedram.Text

                lblstatus.Text = "Данные успешно обновлены"
            Else
                lblstatus.Text = "Данные введены с ошибкой, пожалуйста, проверьте правильность введения и повторите попытку еще раз"
            End If
        Else

            lblstatus.Text = "Для выполнения этого действия требуется авторизоваться на портале"
        End If
        mvaccount_details.ActiveViewIndex = 1
    End Sub
End Class
