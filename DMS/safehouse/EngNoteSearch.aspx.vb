
Partial Class FrontEnd_DataAnalysis_EngNoteSearch
    Inherits System.Web.UI.Page

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim pathadap As New Helpers
            e.Row.Cells(5).Text = pathadap.getlocpathnolink(e.Row.Cells(6).Text, 0)
        End If

    End Sub

    Protected Sub lnkExportExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExportExcel.Click
        GridView1.AllowPaging = False
        GridView1.AllowSorting = False
        GridView1.DataBind()

        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Engnotes.xls")
        Response.Charset = ""
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.xls"

        Dim stringWrite = New System.IO.StringWriter()
        Dim htmlWrite = New HtmlTextWriter(stringWrite)

        Dim frm As HtmlForm = New HtmlForm()
        Me.Controls.Add(frm)
        frm.Controls.Add(GridView1)
        frm.RenderControl(htmlWrite)

        Response.Write(stringWrite.ToString())
        Response.End()
    End Sub
End Class
