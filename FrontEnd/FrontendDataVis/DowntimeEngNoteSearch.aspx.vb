
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

            If e.Row.RowType = DataControlRowType.DataRow And e.Row.Cells(19).Text <> "&nbsp;" Then
                e.Row.Cells(20).Text = hlp.getlocpathnolink(e.Row.Cells(19).Text, 0)
            End If
        Catch ex As Exception
            Dim hlperr As New Helpers
            hlperr.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            Txtend.Text = Now()
        End If


    End Sub

    Protected Sub LnkExcelExport0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LnkExcelExport0.Click
        GridView2.AllowPaging = False
        GridView2.AllowSorting = False
        GridView2.DataBind()

        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Downtime" & CStr(Now()) & ".xls")
        Response.Charset = ""
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.xls"

        Dim stringWrite = New System.IO.StringWriter()
        Dim htmlWrite = New HtmlTextWriter(stringWrite)

        Dim frm As HtmlForm = New HtmlForm()
        Me.Controls.Add(frm)
        frm.Controls.Add(GridView2)
        frm.RenderControl(htmlWrite)

        Response.Write(stringWrite.ToString())
        Response.End()
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim pathadap As New Helpers
            e.Row.Cells(5).Text = pathadap.getlocpathnolink(e.Row.Cells(6).Text, 0)
        End If
    End Sub

    Protected Sub RadioButtonList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.DataBound
        Dim RBLitem As New ListItem
        RBLitem.Value = "0"
        RBLitem.Text = "All"
        RadioButtonList1.Items.Add(RBLitem)
    End Sub
End Class
