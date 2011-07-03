Imports WebReference
Imports System.Net
Imports interfaceprog

Partial Class registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            Page.Validate()
            If Page.IsValid Then
                Dim ef As EFU
                Dim intProg As New interfaceprog
                ef = intProg.newEfu()
                'Dim ef As New EFU
                ''Dim userenv As ResponseUserEnv
                ''ef.ClientCertificates.Add(New X509Certificate2("C:\Users\Администратор\Documents\Visual Studio 2010\Projects\WebApplication4\WebApplication4\efu2.crt"))
                'ef.Credentials = New NetworkCredential("morel333", "eufAJ395", "EFU")
                'ef.CookieContainer = New CookieContainer()
                ''userenv = ef.Connect("RU")
                'ef.Connect("RU")
                Dim rUser As New User
                rUser.Address = txtaddress.Text
                rUser.Balance = 0

                rUser.Birthday = Date.Parse(ddlmonth.SelectedValue + "/" + ddlday.SelectedValue + "/" + ddlyear.SelectedValue)
                rUser.CheckWord = txtcheckword.Text
                rUser.EMail = txtemail.Text
                rUser.FirstName = txtname.Text

                rUser.LangCode = ddllang.SelectedValue.ToString 'RU
                rUser.LastName = txtlastname.Text
                rUser.Logon = txtlogon.Text
                rUser.MiddleName = txtmiddlename.Text
                rUser.Password = txtpass.Text
                'rUser.Phone = ""
                rUser.Sex = rblsex.SelectedValue
                rUser.Currency = ddlcurrency.SelectedValue.ToString
                rUser.Role = 1
                rUser.Status = "A"
                Dim timebiasHours As Decimal = 0
                Dim timebiasMinutes As Short = 0
                Decimal.TryParse(ddltimezone.SelectedValue, timebiasMinutes)
                timebiasMinutes = timebiasHours * 60
                rUser.TimeBias = timebiasMinutes
                rUser.UserType = "P"

                Dim rUserCode As ResponseCode = ef.RegisterUser(rUser)
                If rUserCode.ErrorCode = 0 Then
                    MultiView1.ActiveViewIndex = 1
                    lblregstat.Text = "Регистрация прошла успешно"
                ElseIf rUserCode.ErrorCode = 1102 Then
                    MultiView1.ActiveViewIndex = 1
                    lblregstat.Text = "Регистрация не удалась, попробуйте еще раз"
                    lblregerror.Text = "Пользователь с таким именем уже зарегестрирован в системе"
                Else
                    MultiView1.ActiveViewIndex = 1
                    lblregstat.Text = "Регистрация не удалась, попробуйте еще раз"
                End If
            End If
        End If
    End Sub
End Class
