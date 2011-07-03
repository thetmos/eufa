Imports WebReference
Imports interfaceprog
Imports System.Globalization

Partial Class account_history
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()

        If Not Equals(user, Nothing) Then
            'Dim rUserBets As ResponseUserBets
            Dim dateFrom As Date
            Dim dateTo As Date
            If Page.IsPostBack Then
                Date.TryParseExact(ddldayTo.SelectedValue + "." + ddlmonthTo.SelectedValue + "." + ddlyearTo.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateTo)
                Date.TryParseExact(ddldayFrom.SelectedValue + "." + ddlmonthFrom.SelectedValue + "." + ddlyearFrom.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateFrom)
                'read date
                'If Not Date.TryParseExact(ddldayTo.SelectedValue + "." + ddlmonthTo.SelectedValue + "." + ddlyearTo.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateTo) Then
                '    dateTo = Date.Today
                'End If
                'If Not Date.TryParseExact(ddldayFrom.SelectedValue + "." + ddlmonthFrom.SelectedValue + "." + ddlyearFrom.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateFrom) Then
                '    Dim diffDate As New TimeSpan(3, 0, 0, 0)
                '    dateFrom = Date.Today.Subtract(diffDate)
                'End If
                'Else
                '    dateTo = Date.Today
                '    Dim diffDate As New TimeSpan(3, 0, 0, 0)
                '    dateFrom = Date.Today.Subtract(diffDate)
            End If
            Dim respAccHist As ResponseAccountHistory
            Try
                'rUserBets = ef.ReadUserBets(dateFrom, dateTo, "ADLNW", 2)
                respAccHist = ef.ReadAccountHistory(dateFrom, dateTo, "")
                If respAccHist.ErrorCode = 0 Then
                    mvaccount_history.ActiveViewIndex = 0
                    lvaccounthistory.DataSource = respAccHist.Records
                    lvaccounthistory.DataBind()
                Else
                    mvaccount_history.ActiveViewIndex = 1
                    lblstatus.Text = respAccHist.ErrorMessage
                End If
                

            Catch ex As Exception
                lblstatus.Text = "Произошла ошибка на сервере. Пожалуйста, попробуйте еще раз."
            End Try
        Else
            mvaccount_history.ActiveViewIndex = 1
            lblstatus.Text = "Для просмотра этой страницы необходимо авторизоваться на портале"
        End If
    End Sub
End Class
