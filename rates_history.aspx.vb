Imports WebReference
Imports interfaceprog
Imports System.Globalization

Partial Class rates_history
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim user As User = getEfuUser()        
        If Not Equals(user, Nothing) Then
            Dim rUserBets As ResponseUserBets
            Dim dateFrom As Date
            Dim dateTo As Date
            If Page.IsPostBack Then
                'read date
                If Not Date.TryParseExact(ddldayTo.SelectedValue + "." + ddlmonthTo.SelectedValue + "." + ddlyearTo.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateTo) Then
                    dateTo = Date.Today
                End If
                If Not Date.TryParseExact(ddldayFrom.SelectedValue + "." + ddlmonthFrom.SelectedValue + "." + ddlyearFrom.SelectedValue, "dd.MM.yyyy", Nothing, DateTimeStyles.None, dateFrom) Then
                    Dim diffDate As New TimeSpan(3, 0, 0, 0)
                    dateFrom = Date.Today.Subtract(diffDate)
                End If
            Else                
                dateTo = Date.Today
                Dim diffDate As New TimeSpan(3, 0, 0, 0)
                dateFrom = Date.Today.Subtract(diffDate)
            End If
            Try
                rUserBets = ef.ReadUserBets(dateFrom, dateTo, "ADLNW", 2)
                If rUserBets.ErrorCode = 0 Then
                    Dim EexpressBetList As New List(Of WebReference.UserBet)
                    Dim CsystemBetList As New List(Of WebReference.UserBet)
                    Dim SsimpleBetList As New List(Of WebReference.UserBet)
                    For Each onebet As WebReference.UserBet In rUserBets.Bets
                        If onebet.Category = "E" Then
                            EexpressBetList.Add(onebet)
                        ElseIf onebet.Category = "C" Then
                            CsystemBetList.Add(onebet)
                        ElseIf onebet.Category = "S" Then
                            SsimpleBetList.Add(onebet)
                        End If
                    Next
                    If EexpressBetList.Count > 0 Then
                        'phexpressBet.Visible = True
                        lvexpressbet.Visible = True
                        lvexpressbet.DataSource = EexpressBetList
                        lvexpressbet.DataBind()
                    End If
                    If SsimpleBetList.Count > 0 Then
                        lvsimpleBetList.Visible = True
                        lvsimpleBetList.DataSource = SsimpleBetList
                        lvsimpleBetList.DataBind()
                    End If
                    Dim nDict As New WebReference.Dictionary
                    'Dim a As Object = nDict.
                Else
                    mvrates_history.ActiveViewIndex = 1
                    lblstatus.Text = rUserBets.ErrorMessage
                End If
            Catch ex As Exception
                mvrates_history.ActiveViewIndex = 1
                lblstatus.Text = "Извините, на сайте возникла ошибка. Пожалуйста, попробуйте повторить попытку позже"
            End Try
        Else
            mvrates_history.ActiveViewIndex = 1
            lblstatus.Text = "Для просмотра этой страницы необходимо авторизоваться на портале"
            'ErrorMessage
        End If
    End Sub
End Class
