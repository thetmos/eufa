
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim rootPath As String = HttpContext.Current.Server.MapPath("~")

        Dim savePath As String = rootPath + "\xml\sport_default.xml"
        If (FileUpload1.HasFile) Then
            Dim fileName As String = FileUpload1.FileName
            'savePath += fileName
            FileUpload1.SaveAs(savePath)
            UploadStatusLabel.Text = "Успешно загружен файл " & fileName
        Else
            ' Notify the user that a file was not uploaded.
            UploadStatusLabel.Text = "Ошибка загрузки"
        End If
    End Sub
End Class
