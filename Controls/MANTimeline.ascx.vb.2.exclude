Imports System.Drawing
Imports System.Data
Imports System.Drawing.Imaging
Imports System.IO



Partial Class controls_DAQTimeline
    Inherits System.Web.UI.UserControl

    Delegate Sub ElementHandler(ByVal sender As Object, ByVal e As ElementClickArgs)
    Public Event ElementClicked As ElementHandler

    Dim ChartImage As Bitmap
    Dim g As Graphics
    Dim pixPerUnit As Double
    Dim imgmap As ImageMap


#Region "properties"
    Private _daqActdata As DataTable
    Private _daqdata As DataTable
    Private _width As Integer
    Private _lvlheight As Integer
    Private _starttime As DateTime
    Private _endtime As DateTime
    Private _filesToHold As Integer
    Private _click_enabled As Boolean
    Public Property daqData() As DataTable
        Get
            Return _daqdata
        End Get
        Set(ByVal value As DataTable)
            _daqdata = value
        End Set
    End Property
    Public Property daqActData() As DataTable
        Get
            Return _daqActdata
        End Get
        Set(ByVal value As DataTable)
            _daqActdata = value
        End Set
    End Property
    Public Property width() As Integer
        Get
            Return _width
        End Get
        Set(ByVal value As Integer)
            _width = value
        End Set
    End Property
    Public Property lvlHeight() As Integer
        Get
            Return _lvlheight
        End Get
        Set(ByVal value As Integer)
            _lvlheight = value

        End Set
    End Property
    Public Property filesToHold() As Integer
        Get

            Return _filesToHold
        End Get
        Set(ByVal value As Integer)
            _filesToHold = value
        End Set
    End Property

    Public Property StartTime() As DateTime
        Get
            Return _starttime
        End Get
        Set(ByVal value As DateTime)
            _starttime = value

        End Set
    End Property
    Public Property EndTime() As DateTime
        Get
            Return _endtime
        End Get
        Set(ByVal value As DateTime)
            _endtime = value

        End Set
    End Property
    Public Property Click_enabled() As Boolean
        Get
            Return _click_enabled
        End Get
        Set(ByVal value As Boolean)
            _click_enabled = value
        End Set
    End Property

#End Region

    Sub CreateChart()

        'create chart background in bitmap
        ChartImage = New Bitmap(width, (lvlHeight * 2) + 40, PixelFormat.Format32bppRgb)
        g = Graphics.FromImage(ChartImage)

        'set background color
        g.Clear(Color.WhiteSmoke)

        pixPerUnit = width / DateDiff(DateInterval.Second, StartTime, EndTime)

        Dim txtBrush = New SolidBrush(Color.Black)
        'g.DrawString(CStr(Now()), New Font("Veranda", 8), txtBrush, 10, 10)

        Dim linePen As New Pen(Color.Black, 1)
        Dim linePen2 As New Pen(Color.Silver, 1)
        g.DrawRectangle(linePen, 0, 0, ChartImage.Width - 1, ChartImage.Height - 1)
        g.DrawLine(linePen, 0, lvlHeight, width, lvlHeight)
        g.DrawLine(linePen, 0, lvlHeight * 2, width, lvlHeight * 2)
        g.DrawLine(linePen, 0, lvlHeight * 2 + 20, width, lvlHeight * 2 + 20)


        'for each hour draw a vertical line 

        Dim starthour As Integer = Hour(StartTime)
        Dim newdate As DateTime = DateSerial(Year(StartTime), Month(StartTime), Day(StartTime))
        Dim newtime As DateTime = DateAdd(DateInterval.Hour, starthour + 1, newdate)

        Do Until newtime >= EndTime
            Dim xPos As Integer = DateDiff(DateInterval.Second, StartTime, newtime) * pixPerUnit
            g.DrawLine(linePen, xPos, 0, xPos, lvlHeight * 2)
            g.DrawString(CStr(Hour(newtime)) & ":00", New Font("Veranda", 8), txtBrush, xPos - 7, (lvlHeight * 2) + 22)

            xPos = DateDiff(DateInterval.Second, StartTime, newtime) * pixPerUnit + (1800 * pixPerUnit)
            g.DrawLine(linePen2, xPos, 0, xPos, lvlHeight * 2)

            newtime = DateAdd(DateInterval.Hour, 1, newtime)

        Loop

        imgmap = ImageMap1

        Call cleanFolder()
        Call addblocks()

        Try
            Call addActBlocks()
        Catch
        End Try

        Dim pngFileName As String = System.Guid.NewGuid().ToString

        ChartImage.Save(Server.MapPath(".") & "\charttemp\" & pngFileName & ".png", System.Drawing.Imaging.ImageFormat.Png)
        ImageMap1.ImageUrl = "~\frontend\charttemp\" & pngFileName & ".png"


    End Sub
    Sub addActBlocks()
        Dim dtrows As Integer = 0
        Dim mybrush = New SolidBrush(Color.Blue)
        Dim txtBrush = New SolidBrush(Color.White)
        Dim navigateURL As String
        Dim postbackvalue As String


        Do Until dtrows = daqActData.Rows.Count

            Select Case daqActData.Rows(dtrows).Item(1)
                Case 1
                    mybrush = New SolidBrush(Color.Blue)
                    txtBrush = New SolidBrush(Color.White)
                Case 2
                    mybrush = New SolidBrush(Color.Orange)
                    txtBrush = New SolidBrush(Color.Black)
                Case 3
                    mybrush = New SolidBrush(Color.BurlyWood)
            End Select
            'set the navigate URL and postback URL (add the a to stop the postback going to start a downtime)
            navigateURL = daqActData.Rows(dtrows).Item(0)
            postbackvalue = "a" & daqActData.Rows(dtrows).Item(0)

            Dim boxX As Integer = (DateDiff(DateInterval.Second, StartTime, CDate(daqActData.Rows(dtrows).Item(3)))) * pixPerUnit
            Dim boxY As Integer = lvlHeight * 2
            Dim boxWidth As Integer = (DateDiff(DateInterval.Second, CDate(daqActData.Rows(dtrows).Item(3)), CDate(daqActData.Rows(dtrows).Item(4)))) * pixPerUnit
            Dim boxHeight As Integer = 20



            g.FillRectangle(mybrush, boxX, boxY, boxWidth, boxHeight)

            Dim strBoxX As Integer

            If boxX < 3 Then
                strBoxX = 3
            Else
                strBoxX = boxX
            End If

            g.DrawString(CStr(daqActData.Rows(dtrows).Item(5)), New Font("Veranda", 8), txtBrush, strBoxX, boxY + 2)

            If _click_enabled Then
                Dim rect1 As New RectangleHotSpot
                rect1.HotSpotMode = HotSpotMode.Navigate
                rect1.Left = boxX
                rect1.Top = boxY + 20
                rect1.Right = boxX + boxWidth
                rect1.Bottom = boxY
                rect1.AlternateText = daqActData.Rows(dtrows).Item(5)
                rect1.NavigateUrl = "~/frontend/ActivityDetails.aspx?activityID=" & navigateURL
                rect1.Target = "_blank"
                imgmap.HotSpots.Add(rect1)
            End If


            dtrows = dtrows + 1
        Loop

    End Sub
    Sub addblocks()

        imgmap.HotSpots.Clear()
        Dim txtBrush As Brush = New SolidBrush(Color.Black)
        Dim postbackvalue As Integer
        Dim dtrows As Integer = 0


        Do Until dtrows = daqData.Rows.Count

            Dim drawHotSpot As Boolean = True
            Dim downtimeid As Integer = 0
            'create brush per box
            Dim mybrush = New SolidBrush(Color.Red)
            Dim chtRow As Integer
            Dim blockNote As String = ""

            'adjust color to that set in dataset
            Select Case daqData.Rows(dtrows).Item(3)
                Case 0
                    mybrush = New SolidBrush(Color.Red)
                    chtRow = 0
                    blockNote = ""
                    postbackvalue = daqData.Rows(dtrows).Item(0)
                Case 1
                    mybrush = New SolidBrush(Color.DarkGray)
                    chtRow = 1
                    blockNote = ""
                    'if the downtime is completed then downtimeID should be set to allow for details window to open on click
                    downtimeid = daqData.Rows(dtrows).Item(4)
                Case 2
                    mybrush = New SolidBrush(Color.Orange)
                    chtRow = 0
                    blockNote = ""
                    postbackvalue = daqData.Rows(dtrows).Item(0)

                Case 3
                    mybrush = New SolidBrush(Color.DarkGray)
                    chtRow = 1
                    blockNote = ""
                    downtimeid = daqData.Rows(dtrows).Item(4)
                Case 4
                    mybrush = New SolidBrush(Color.Pink)
                    chtRow = 1
                    blockNote = "M"
                    postbackvalue = daqData.Rows(dtrows).Item(0)
                Case 5
                    mybrush = New SolidBrush(Color.DarkGray)
                    'define which row the data is displayed in 
                    chtRow = 1
                    'show note in block
                    blockNote = "M"
                    'set postback value to the downtime id to show dt data when clicked
                    downtimeid = daqData.Rows(dtrows).Item(4)
                Case 6
                    mybrush = New SolidBrush(Color.LimeGreen)
                    chtRow = 1
                    blockNote = ""
                    drawHotSpot = False
                Case 7
                    mybrush = New SolidBrush(Color.LimeGreen)
                    chtRow = 0
                    ' drawHotSpot = False
                    blockNote = ""
                    postbackvalue = daqData.Rows(dtrows).Item(0)
            End Select

            'mybrush.Color = System.Drawing.Color.FromName(daqData.Rows(dtrows).Item(5))

            Dim BoxX As Integer
            BoxX = (DateDiff(DateInterval.Second, StartTime, CDate(daqData.Rows(dtrows).Item(1)))) * pixPerUnit

            Dim BoxY As Integer
            BoxY = CInt(lvlHeight * chtRow)

            Dim BoxWidth As Integer
            BoxWidth = (DateDiff(DateInterval.Second, CDate(daqData.Rows(dtrows).Item(1)), CDate(daqData.Rows(dtrows).Item(2)))) * pixPerUnit
            'draw filled box
            g.FillRectangle(mybrush, BoxX, BoxY, BoxWidth, lvlHeight)
            g.DrawString(blockNote, New Font("Veranda", 8), txtBrush, BoxX + 3, BoxY + 2)

            If _click_enabled And drawHotSpot Then

                If downtimeid > 0 Then
                    'draw hotspot for image map
                    Dim rect1 As New RectangleHotSpot
                    rect1.HotSpotMode = HotSpotMode.Navigate
                    rect1.Left = BoxX
                    rect1.Top = BoxY + lvlHeight
                    rect1.Right = BoxX + BoxWidth
                    rect1.Bottom = BoxY
                    rect1.AlternateText = "Start:" & daqData.Rows(dtrows).Item(1) & " End:" & daqData.Rows(dtrows).Item(2)
                    rect1.NavigateUrl = "~/frontend/downtimedetails.aspx?downtimeID=" & downtimeid
                    rect1.Target = "_blank"
                    imgmap.HotSpots.Add(rect1)
                Else

                    'draw hotspot for image map
                    Dim rect1 As New RectangleHotSpot
                    rect1.HotSpotMode = HotSpotMode.PostBack
                    rect1.Left = BoxX
                    rect1.Top = BoxY + lvlHeight
                    rect1.Right = BoxX + BoxWidth
                    rect1.Bottom = BoxY
                    rect1.AlternateText = "Start:" & daqData.Rows(dtrows).Item(1) & " End:" & daqData.Rows(dtrows).Item(2)
                    rect1.PostBackValue = postbackvalue
                    imgmap.HotSpots.Add(rect1)

                End If
            End If

            dtrows = dtrows + 1

        Loop

    End Sub

    Sub cleanFolder()

        Dim file() As FileInfo
        Dim i As Integer

        Dim dir As New DirectoryInfo(Server.MapPath(".") & "\charttemp")

        file = dir.GetFiles()

        If file.Count > _filesToHold Then

            If file.Length > 0 Then
                For i = 0 To file.Length - 1
                    Try
                        file(i).Delete()
                    Catch ex As Exception

                    End Try
                Next
            End If

        End If



    End Sub

    Protected Sub ImageMap1_Click(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ImageMapEventArgs) Handles ImageMap1.Click
        Dim eArgs As New ElementClickArgs(e.PostBackValue)
        RaiseEvent ElementClicked(Me, eArgs)
    End Sub

End Class

Public Class ElementClickArgs

    Inherits EventArgs
    Public id As String
    Public Sub New(ByVal id As String)
        Me.id = id
    End Sub

End Class
