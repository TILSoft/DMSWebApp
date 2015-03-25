
Partial Class DataVisualisation_ActivitySearch
    Inherits System.Web.UI.Page

    Protected Sub lnkExportExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExportExcel.Click
        GridView1.AllowPaging = False
        GridView1.AllowSorting = False
        GridView1.DataBind()

        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Activities.xls")
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEnd.Text = Now()

        End If
    End Sub



End Class
