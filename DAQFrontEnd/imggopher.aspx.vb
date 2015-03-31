
Partial Class DAQFrontEnd_imggopher
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myadapter As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
        Dim imgDT As New ImageHandler.tblShortStopImageDataTable
        imgDT = myadapter.GetHighestRevImageEnabled(Request.QueryString("remedyid"))

        Dim imgrow As ImageHandler.tblShortStopImageRow
        imgrow = imgDT.Rows(0)

        Dim data() As Byte = imgrow.image

        Response.ContentType = ".jpg"
        Response.BinaryWrite(data)

    End Sub
End Class
