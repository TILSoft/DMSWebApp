Imports System.Drawing
Imports System.IO

Partial Class imageViewer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myadapter As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
        Dim imgDT As New ImageHandler.tblShortStopImageDataTable
        imgDT = myadapter.GetDataBy(1754)

        Dim imgrow As ImageHandler.tblShortStopImageRow
        imgrow = imgDT.Rows(0)

        Dim data() As Byte = imgrow.image
        Dim mstream As New MemoryStream(data, 0, data.Length)
        Dim img As Image = Image.FromStream(mstream)


        Dim g As Graphics = Graphics.FromImage(img)
        Dim p As New Pen(Color.Red)
        Dim b As New SolidBrush(Color.Red)


        Dim clickAdap As New ImageHandlerTableAdapters.tblImageClickTableAdapter
        Dim Clickdt As New ImageHandler.tblImageClickDataTable
        Clickdt = clickAdap.GetDataBy(imgrow.imageid)

        For Each row As ImageHandler.tblImageClickRow In Clickdt
            g.FillEllipse(b, row.XCoord, row.YCoord, 10, 10)
            Dim circHotSpot As New CircleHotSpot()
            circHotSpot.X = row.XCoord
            circHotSpot.Y = row.YCoord
            circHotSpot.Radius = 10
            circHotSpot.PostBackValue = row.ClickID

            ImageMap1.HotSpots.Add(circHotSpot)

        Next

        img.Save(Server.MapPath("~\imageclicker") & "\savedImage.png")

        ImageMap1.ImageUrl = "~\imageclicker\savedImage.png"



    End Sub

    Protected Sub ImageMap1_Click(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ImageMapEventArgs) Handles ImageMap1.Click
        Response.Write(e.PostBackValue)
    End Sub
End Class
