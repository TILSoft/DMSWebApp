Imports System.Drawing
Imports System.Data
Imports System.Drawing.Imaging

Partial Class Charting_ChartControl
    Inherits System.Web.UI.UserControl

    Public Event ElementClick()

    Private _height, _xtickmarks, _width As Integer
    Private _chtdatatable As DataTable
    Private _gridlinecolor As Color
    Private _BGcolor As Color
    Private _txtColor As Color
    Private _Title As String


#Region "Properties"
    Property XTickMarks() As Integer
        Get
            XTickMarks = _xtickmarks
        End Get
        Set(ByVal value As Integer)
            _xtickmarks = value
        End Set
    End Property

    Property height() As Integer
        Get
            height = _height
        End Get
        Set(ByVal value As Integer)
            _height = value
        End Set
    End Property
    Property width() As Integer
        Get
            width = _width
        End Get
        Set(ByVal value As Integer)
            _width = value
        End Set
    End Property
    Property gridlinecolor() As Color
        Get
            gridlinecolor = _gridlinecolor
        End Get
        Set(ByVal value As Color)
            _gridlinecolor = value
        End Set
    End Property
    Property BGcolor() As Color
        Get
            BGcolor = _BGcolor
        End Get
        Set(ByVal value As Color)
            _BGcolor = value
        End Set
    End Property
    Property txtColor() As Color
        Get
            txtColor = _txtColor
        End Get
        Set(ByVal value As Color)
            _txtColor = value
        End Set
    End Property
    Property chtdatatable() As DataTable
        Get
            chtdatatable = _chtdatatable
        End Get
        Set(ByVal value As DataTable)
            _chtdatatable = value
        End Set
    End Property
    Property Title() As String
        Get
            Title = _Title
        End Get
        Set(ByVal value As String)
            _Title = value
        End Set
    End Property

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

     

            Dim ChartImage As Bitmap
            Dim g As Graphics

            'create chart background in bitmap
            ChartImage = New Bitmap(height, width, PixelFormat.Format32bppRgb)
            g = Graphics.FromImage(ChartImage)

            'set background color
            g.Clear(_BGcolor)

            'chtdatatable.Columns.Add("TaskName")
            'chtdatatable.Columns.Add("xstart")
            'chtdatatable.Columns.Add("xend")
            'chtdatatable.Columns.Add("ToolTip")
            'chtdatatable.Columns.Add("PostBackReference")
            'Color
            'Note

            'define actual chart area values
            Dim chx As Integer = 120  'start x value
            Dim chy As Integer = 30   'start y value
            Dim chw As Integer = height - (chx + 30) 'width
            Dim chh As Integer = width - 130 'height

            Dim xgridlines As Integer = _xtickmarks
            Dim gridpen As New Pen(_gridlinecolor)

            'set text color
            Dim txtBrush = New SolidBrush(_txtColor)

            'draw box for chart
            g.DrawRectangle(gridpen, chx, chy, chw, chh)
            g.DrawRectangle(gridpen, 0, 0, height - 1, width - 1)
            g.DrawString(_Title, New Font("Veranda", 11), txtBrush, chx, 5)


            'find count of items and date min and max from dataset for gridline calculation
            Dim noOfTasks = chtdatatable.Rows.Count
            Dim boxHeight As Integer = chh / (noOfTasks + 1)
            Dim ygridlines As Integer = noOfTasks + 1

            'find min of start date and max of end date from datatable
            Dim maxVal As DateTime
            Dim minVal As DateTime
            Dim dtrows As Integer

            minVal = chtdatatable.Rows(0).Item(1)

            Do Until dtrows = chtdatatable.Rows.Count

                If chtdatatable.Rows(dtrows).Item(2) > maxVal Then
                    maxVal = chtdatatable.Rows(dtrows).Item(2)
                End If

                If chtdatatable.Rows(dtrows).Item(1) < minVal Then
                    minVal = chtdatatable.Rows(dtrows).Item(1)
                End If
                dtrows = dtrows + 1

            Loop

            maxVal = DateAdd(DateInterval.Minute, 10, maxVal)
            minVal = DateAdd(DateInterval.Minute, -10, minVal)


            'draw y gridlines
            Dim i As Integer = 0
            For i = 1 To noOfTasks
                g.DrawLine(gridpen, chx, CInt(chy + chh / ygridlines * i), chw + chx, CInt(chy + chh / ygridlines * i))
                g.DrawString(chtdatatable.Rows(i - 1).Item(0), New Font("Veranda", 8), txtBrush, 10, CInt(chy + chh / ygridlines * i - 10))
            Next i


            'draw x gridlines        

            Dim xTickDelta As Integer = DateDiff(DateInterval.Minute, minVal, maxVal) / xgridlines
            i = 0
            For i = 0 To xgridlines
                g.DrawLine(gridpen, CInt(chx + chw / xgridlines * i), chy, CInt(chx + chw / xgridlines * i), chy + chh)

                'create x axis values
                Dim xdate As DateTime = DateAdd(DateInterval.Minute, i * xTickDelta, minVal)
                Dim xtime As String = Microsoft.VisualBasic.Right(CStr(xdate), 8)
                'rotate x axis string
                g.TranslateTransform(CInt(chx + chw / xgridlines * i) - 5, width - 25)
                g.RotateTransform(-90)
                'write x axis strings
                g.DrawString(CStr(xtime), New Font("Veranda", 8), txtBrush, 0, 0)
                g.ResetTransform()
            Next i

            'calc pixels per unit
            Dim pixPerUnit As Double = chw / DateDiff(DateInterval.Minute, maxVal, minVal)

            'draw today gridline
            Dim pixtotoday As Integer = DateDiff(DateInterval.Minute, Now(), minVal) * pixPerUnit

            g.DrawLine(Pens.Red, pixtotoday + chx, chy, pixtotoday + chx, chy + chh)


            'draw boxes
            dtrows = 0




            Do Until dtrows = chtdatatable.Rows.Count
                'create brush per box
                Dim mybrush = New SolidBrush(Color.Red)
                'adjust color to that set in dataset
                mybrush.Color = System.Drawing.Color.FromName(chtdatatable.Rows(dtrows).Item(5))

                Dim BoxX As Integer
                BoxX = (DateDiff(DateInterval.Minute, chtdatatable.Rows(dtrows).Item(1), minVal) * pixPerUnit) + chx

                Dim BoxY As Integer
                BoxY = CInt(chy + chh / ygridlines * dtrows) + boxHeight / 2

                Dim BoxWidth As Integer
                BoxWidth = DateDiff(DateInterval.Minute, CDate(chtdatatable.Rows(dtrows).Item(2)), CDate(chtdatatable.Rows(dtrows).Item(1))) * pixPerUnit
                'draw filled box
                g.FillRectangle(mybrush, BoxX, BoxY, BoxWidth, boxHeight)
                'draw black outline box
                g.DrawRectangle(Pens.Black, BoxX, BoxY, BoxWidth, boxHeight)
                'draw text for end of box
                If Not IsDBNull(chtdatatable.Rows(dtrows).Item(6)) Then
                    g.DrawString(chtdatatable.Rows(dtrows).Item(6), New Font("Veranda", 6), txtBrush, BoxX + BoxWidth + 5, BoxY + (0.25 * boxHeight))
                End If

                dtrows = dtrows + 1

            Loop

            Dim imagename As String = 0
            'save chart to file
            ChartImage.Save(Server.MapPath(".") & "\ChartTemp\tester.png", System.Drawing.Imaging.ImageFormat.Png)



            'create image map to allow clickable areas
            Dim ImgMap As ImageMap = ImageMap1
            ImgMap.ImageUrl = "~/perfectflight/ChartTemp/tester.png"

            dtrows = 0

            Do Until dtrows = chtdatatable.Rows.Count

                Dim BoxX As Integer
                BoxX = (DateDiff(DateInterval.Minute, chtdatatable.Rows(dtrows).Item(1), minVal) * pixPerUnit) + chx

                Dim BoxY As Integer
                BoxY = CInt(chy + chh / ygridlines * dtrows) + boxHeight / 2

                Dim BoxWidth As Integer
                BoxWidth = DateDiff(DateInterval.Minute, CDate(chtdatatable.Rows(dtrows).Item(2)), CDate(chtdatatable.Rows(dtrows).Item(1))) * pixPerUnit

                Dim rect1 As New RectangleHotSpot
                rect1.HotSpotMode = HotSpotMode.PostBack
                rect1.Left = BoxX
                rect1.Top = BoxY + boxHeight
                rect1.Right = BoxX + BoxWidth
                rect1.Bottom = BoxY
                If Not IsDBNull(chtdatatable.Rows(dtrows).Item(3)) Then
                    rect1.AlternateText = chtdatatable.Rows(dtrows).Item(3)
                End If

                rect1.PostBackValue = chtdatatable.Rows(dtrows).Item(4)
                ImgMap.HotSpots.Add(rect1)

                dtrows = dtrows + 1

            Loop

            'ChartImage.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)

        Catch ex As Exception
            lblMessage.Text = "There has been an error with the chart generation.  See details " & ex.Message

        End Try
    End Sub

    Protected Sub ImageMap1_Click(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ImageMapEventArgs) Handles ImageMap1.Click
        '  label1.text = e.PostBackValue

        ' RaiseEvent 


    End Sub
End Class
