
Partial Class DataVisualisation_DowntimeSearch
    Inherits System.Web.UI.Page

    Protected Sub LnkExcelExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LnkExcelExport.Click
        GridView1.AllowPaging = False
        GridView1.AllowSorting = False
        GridView1.DataBind()

        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Downtime.xls")
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

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Try

            Dim hlp As New Helpers

            If e.Row.RowType = DataControlRowType.DataRow Then
                e.Row.Cells(18).Text = hlp.getlocpathnolink(e.Row.Cells(17).Text, 0)
            End If
        Catch ex As Exception
            Dim hlperr As New Helpers
            hlperr.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)
        End Try

    End Sub
End Class
