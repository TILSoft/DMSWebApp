Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Drawing.Design

Partial Class controls_Timeline2

    Inherits System.Web.UI.UserControl
    Public row As Integer
    Private pixpermin As Decimal
    Private _dataColl(10000, 5) As String
    Private _starttime As DateTime
    Private _endtime As DateTime
    Private _width As Integer = 500
    Private _Height As Integer = 50
    Private _colour As Color = Color.Black
    Private _ShowDateTime As Boolean = True
    Private _tooltip As String
    Public Property ShowDateTime() As Boolean
        Get
            Return _ShowDateTime
        End Get
        Set(ByVal value As Boolean)
            _ShowDateTime = value
        End Set
    End Property
    Public Property Width() As Integer
        Get
            Return _width
        End Get
        Set(ByVal value As Integer)
            _width = value
        End Set
    End Property

    Public Property Height() As Integer
        Get
            Return _Height
        End Get
        Set(ByVal value As Integer)
            _Height = value
        End Set
    End Property
    Public Property starttime() As DateTime
        Get
            Return _starttime
        End Get
        Set(ByVal value As DateTime)
            _starttime = value
        End Set
    End Property
    Public Property endtime() As DateTime
        Get
            Return _endtime
        End Get
        Set(ByVal value As DateTime)
            _endtime = value
        End Set
    End Property

    Public Property Colour() As Color
        Get
            Return _colour
        End Get
        Set(ByVal value As Color)
            _colour = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'calculate the lenght of the thing

    End Sub
    Public Sub AddtoCollection(ByVal starttime As DateTime, ByVal endtime As DateTime, ByVal vcolour As Color, ByVal tooltip As String, ByVal Url As String)

        Dim conv As New System.Drawing.ColorConverter

        row = row + 1
        _dataColl(row, 1) = starttime
        _dataColl(row, 2) = endtime
        _dataColl(row, 3) = conv.ConvertToString(vcolour)
        _dataColl(row, 4) = tooltip
        _dataColl(row, 5) = Url

    End Sub
    Public Sub ClearCollection()
        Dim i As Integer
        Dim n As Integer


        For i = 0 To _dataColl.GetUpperBound(0) - 1
            For n = 1 To 5
                _dataColl(i, n) = ""
            Next
        Next

    End Sub



    Public Sub Create()

        Try

            PH1.Controls.Clear()

            If ShowDateTime Then
                LblStart.Text = _starttime
                lblEnd.Text = _endtime
            Else
                LblStart.Visible = False
                lblEnd.Visible = False

            End If

            pixpermin = _width / DateDiff(DateInterval.Minute, _starttime, _endtime)

            'white block for first period

            If Not _dataColl(1, 1) = "" Then
                Dim lblst As New LinkButton
                lblst.Width = pixpermin * DateDiff(DateInterval.Minute, CDate(_starttime), CDate(_dataColl(1, 1)))
                lblst.Height = _Height
                lblst.BackColor = Color.White
                lblst.OnClientClick = ("javascript:return false;")


                PH1.Controls.Add(lblst)
            End If

            Dim conv As New System.Drawing.ColorConverter

            For i = 1 To 1000

                If Not _dataColl(i, 1) = "" Then

                    Dim diffmins As Integer
                    Dim lbl As New LinkButton
                    lbl.Height = _Height

                    If DateDiff(DateInterval.Minute, CDate(_dataColl(i, 1)), CDate(_dataColl(i, 2))) < 0 Then
                        diffmins = 0
                    Else
                        diffmins = DateDiff(DateInterval.Minute, CDate(_dataColl(i, 1)), CDate(_dataColl(i, 2)))

                    End If


                    lbl.Width = pixpermin * diffmins
                    lbl.BackColor = conv.ConvertFromString(_dataColl(i, 3))
                    lbl.ToolTip = _dataColl(i, 4)
                    '    lbl.PostBackUrl = _dataColl(i, 5)

                    If _dataColl(i, 5) = "0" Then
                        lbl.OnClientClick = ("javascript:return false;")
                    Else
                        lbl.OnClientClick = ("javascript:window.open('" & _dataColl(i, 5) & "');return false;")
                    End If

                    PH1.Controls.Add(lbl)





                    If Not _dataColl(i + 1, 1) = "" Then

                        Dim diffminsbl As Integer
                        'insert a blank block
                        Dim blankstart As DateTime
                        Dim blankend As DateTime

                        blankstart = CDate(_dataColl(i, 2))
                        blankend = CDate(_dataColl(i + 1, 1))

                        If DateDiff(DateInterval.Minute, blankstart, blankend) < 0 Then
                            diffminsbl = 0
                        Else
                            diffminsbl = DateDiff(DateInterval.Minute, blankstart, blankend)
                        End If

                        Dim lblbl As New LinkButton()
                        lblbl.Width = pixpermin * diffminsbl
                        lblbl.Height = _Height
                        lblbl.BackColor = Color.White

                        PH1.Controls.Add(lblbl)

                    End If


                End If

            Next

            row = 0
        Catch ex As Exception
            Dim errhlp As New Helpers
            errhlp.InsertError(ex.Message, Right(ex.StackTrace, 200), 1)
        End Try

    End Sub

End Class
