
Partial Class DAQFrontEnd_imagedisp
    Inherits System.Web.UI.Page
    Public imgrow As ImageHandler.tblShortStopImageRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'get remedy id from click of data
        Dim remedyid As Integer = 1754

        'get all image data from click of data
        Dim imgadap As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
        Dim imgdt As New ImageHandler.tblShortStopImageDataTable
        imgdt = imgadap.GetDataBy(remedyid)
        imgrow = imgdt.Rows(0)

        ImageButton1.ImageUrl = "~/Safehouse/imagework/imggopher.aspx?remedyid=" & remedyid
        ImageButton1.DataBind()

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click

        Dim clickadap As New ImageHandlerTableAdapters.tblImageClickTableAdapter
        clickadap.Insert(imgrow.imageid, e.X, e.Y, Now())

    End Sub
End Class
