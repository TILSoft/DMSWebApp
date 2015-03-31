Imports System.Data.SqlClient
Imports System.Data.Sql
Imports System.Drawing
Imports System.IO



Partial Class zAdministration_Default
    Inherits System.Web.UI.Page
    Public commandname As String
    Public commandindex As Integer
#Region "Image Review"


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        commandname = e.CommandName
        commandindex = e.CommandArgument

        Dim remedyid As Integer = GridView1.DataKeys(commandindex).Value

        lblRemedyID.Text = remedyid

        If commandname = "View" Then
            Dim imgadapter As New ImageHandlerTableAdapters.tblShortStopImageTableAdapter
            Dim imgDT As New ImageHandler.tblShortStopImageDataTable
            imgDT = imgadapter.GetHighestRevImageEnabled(remedyid)

            If Not imgDT.Rows.Count = 0 Then

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

            Dim pngFileName As String = System.Guid.NewGuid().ToString

                img.Save(Server.MapPath("~\imageclicker") & "\" & pngFileName & ".png")

                ImageMap1.ImageUrl = "~\imageclicker\" & pngFileName & ".png"
                upimagereview.Update()
                mpeImageReview.Show()

            End If

        ElseIf commandname = "Colour" Then

            upColourAdd.Update()
            mpeColourChange.Show()

        End If

    End Sub

    Protected Sub lnkViewclose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkViewclose.Click
        mpeImageReview.Hide()

    End Sub

#End Region

#Region "Image Upload"


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim remedyid As Integer = GridView1.DataKeys(GridView1.SelectedIndex).Value

        mpeImageUpload.Show()


    End Sub

    Protected Sub btnUploadImage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadImage.Click
        Call upload()
    End Sub

    Sub upload()

        If FUimage.HasFile Then
            Dim fileName As String = Server.HtmlEncode(FUimage.FileName)
            Dim extension As String = System.IO.Path.GetExtension(fileName)
            If (extension.ToUpper = ".JPG") Or (extension.ToUpper = ".GIF") Then

                '**** Resize image section ****
                Dim image_file As System.Drawing.Image = System.Drawing.Image.FromStream(FUimage.PostedFile.InputStream)
                Dim image_height As Integer = image_file.Height
                Dim image_width As Integer = image_file.Width
                Dim max_height As Integer = 480
                Dim max_width As Integer = 640


                image_height = (image_height * max_width) / image_width
                image_width = max_width

                If image_height > max_height Then
                    image_width = (image_width * max_height) / image_height
                    image_height = max_height
                Else
                End If


                Dim bitmap_file As New Bitmap(image_file, image_width, image_height)
                Dim stream As New System.IO.MemoryStream

                bitmap_file.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg)
                stream.Position = 0

                Dim data(stream.Length) As Byte
                stream.Read(data, 0, stream.Length)
                '**** End resize image section ****


                Dim con As New SqlConnection
                con.ConnectionString = ConfigurationManager.ConnectionStrings("DowntimeDBv2ConnectionString").ConnectionString

                'create SQL command

                Dim cmd As New SqlCommand
                cmd.CommandText = "Insert into tblShortstopImage(imagedesc,image, imageuploaddate, remedyid,imagetype,enabled) values (@Imagedesc,@Image,@imageuploaddate, @remedyid, @imagetype, @enabled)"
                cmd.Parameters.AddWithValue("@imagedesc", txtImageTitle.Text)
                cmd.Parameters.AddWithValue("@image", data)
                cmd.Parameters.AddWithValue("@imageuploaddate", Now())
                cmd.Parameters.AddWithValue("@remedyid", GridView1.DataKeys(GridView1.SelectedIndex).Value)
                cmd.Parameters.AddWithValue("@imagetype", extension)
                cmd.Parameters.AddWithValue("@enabled", True)
                cmd.Connection = con


                Try
                    con.Open()
                    cmd.ExecuteNonQuery()
                Catch ex As Exception

                    LblError.Text = ex.Message


                Finally
                    con.Close()
                    txtImageTitle.Text = ""
                End Try

            Else
                LblError.Text = "Please only upload .jpg or .gif files"
                LblError.Visible = True
            End If
        Else
            LblError.Text = "No file selected"
            LblError.Visible = True
        End If

    End Sub
    Protected Sub lnkViewclose0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkViewclose0.Click
        mpeImageUpload.Hide()
    End Sub
#End Region
  
#Region "SS Button colour"

    Protected Sub btnSSColour_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSSColour.Click
        Dim SScolourAdap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
        SScolourAdap.UpdateSSButtonColour(DropDownList1.SelectedValue, CInt(lblRemedyID.Text))
        mpeColourChange.Hide()
        GridView1.DataBind()
        upSSgrid.Update()

    End Sub
    Protected Sub lnkViewclose1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkViewclose1.Click
        mpeColourChange.Hide()
    End Sub

#End Region


End Class
