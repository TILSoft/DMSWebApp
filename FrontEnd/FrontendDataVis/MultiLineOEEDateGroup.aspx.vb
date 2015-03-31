Imports System.Data.SqlClient
Imports System.Data
Imports dotnetCHARTING

Partial Class FrontEnd_FrontendDataVis_MultiLine1
    Inherits System.Web.UI.Page

    Public scOEE As New dotnetCHARTING.Series
    Public scTarget As New dotnetCHARTING.Series

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Year, -1, Now())
            txtEnd.Text = Now()
            GridView1.Visible = False
        End If

        scOEE.Type = SeriesType.Line
        scOEE.Name = "OEE"

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetData.Click
        GridView1.Visible = True

        Dim startime As DateTime = CDate(txtStart.Text)
        Dim endtime As DateTime = CDate(txtEnd.Text)

        Dim formatlist As String = getFormatList()
        If formatlist = 0 Then

            lblmessage.Text = "You must select at least one line"
        Else
            Label3.Text = formatlist
            GridView1.DataBind()
            chartOEE.SeriesCollection.Add(scOEE)
        End If



    End Sub

    Function getFormatList() As String

        Dim indx As Integer
        Dim formatlist As String

        Dim formatcount As Integer = cblLines.Items.Count

        For indx = 0 To formatcount - 1

            If cblLines.Items(indx).Selected = True Then
                formatlist = formatlist & cblLines.Items(indx).Value & ","
            End If

        Next indx

        formatlist = Left(formatlist, Len(formatlist) - 1)

        If Len(formatlist) = 1 Then
            Return 0
        Else
            Return formatlist
        End If


    End Function

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim ele As New Element

            If Not e.Row.Cells(4).Text = "&nbsp;" Then
                ele.YValue = CDec(e.Row.Cells(4).Text)
                ele.Name = e.Row.Cells(1).Text
                scOEE.AddElements(ele)
            End If

        End If
    End Sub

    Protected Sub odsOEE_ObjectDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceDisposingEventArgs) Handles odsOEE.ObjectDisposing
        chartOEE.SeriesCollection.Add(scOEE)
    End Sub
End Class
