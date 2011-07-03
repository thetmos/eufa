Imports WebReference
Imports interfaceprog

Partial Class results
    Inherits System.Web.UI.Page    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim rLine As ResponseLine
        Try            
            rLine = Master.rLine
            If rLine.ErrorCode = 0 Then
                'code
                lvSports.DataSource = rLine.Sports
                lvSports.DataBind()
            Else
                mvresults.ActiveViewIndex = 1
                lblstatus.Text = rLine.ErrorMessage
            End If
        Catch ex As Exception
            mvresults.ActiveViewIndex = 1
            lblstatus.Text = "Извините, на сайте возникла ошибка. Пожалуйста, попробуйте повторить попытку позже"
        End Try
    End Sub
End Class
