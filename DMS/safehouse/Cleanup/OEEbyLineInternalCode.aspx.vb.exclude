Imports dotnetCHARTING
Imports System.Data.SqlClient
Imports System.Data

Partial Class DataVisualisation_OEEbyLine
    Inherits System.Web.UI.Page
    Dim seriesOEE As New dotnetCHARTING.Series
    Dim seriesAvail As New dotnetCHARTING.Series
    Dim seriesPerf As New dotnetCHARTING.Series
    Dim seriesQual As New dotnetCHARTING.Series


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtEnd.Text = Now()
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
        End If
        GridView1.Visible = False
        seriesAvail.Type = SeriesType.Line
        seriesPerf.Type = SeriesType.Line
        seriesQual.Type = SeriesType.Line
        seriesOEE.Type = SeriesType.Bar
        seriesOEE.Name = "OEE"
        seriesPerf.Name = "Performance"
        seriesQual.Name = "Quality"
        seriesAvail.Name = "Availablity"


    End Sub

    Protected Sub btnGetOEEdata_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetOEEdata.Click




        Dim startime As DateTime = CDate(txtStart.Text)
        Dim endtime As DateTime = CDate(txtEnd.Text)
        Dim formatlist As String = ""

        formatlist = getFormatList()

        Dim conn As New SqlConnection
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("DowntimeDBv2ConnectionString").ConnectionString
        conn.Open()

        Dim comm As New SqlCommand
        comm.Connection = conn
        Dim param As New SqlParameter
        param = comm.Parameters.Add("@StartTime", SqlDbType.DateTime)
        param.Direction = ParameterDirection.Input
        param.Value = CDate(txtStart.Text)

        param = comm.Parameters.Add("@EndTime", SqlDbType.DateTime)
        param.Direction = ParameterDirection.Input
        param.Value = CDate(txtEnd.Text)

        Dim strSQL As String = "SELECT YEAR(tblActivity.StartTime) AS Year, { fn " & ddlPeriod.SelectedValue & "(tblActivity.StartTime) } AS Period, AVG(dbo.AllActivityAnalysisActivityTime(tblActivity.LocIDSymp, " & _
                "tblActivity.StartTime, tblActivity.endtime, tblActivity.ActivityID)) AS averageFormatTime " & _
                "FROM  tblActivity INNER JOIN " & _
                "tblFormat ON tblActivity.Format = tblFormat.FormatID INNER JOIN " & _
                "tblLoc ON tblActivity.LocIDSymp = tblLoc.LocID " & _
                "WHERE (tblActivity.StartTime > @Starttime) AND (tblActivity.StartTime < @Endtime) AND (tblFormat.FormatID IN (" & formatlist & ")) " & _
                "GROUP BY YEAR(tblActivity.StartTime), { fn " & ddlPeriod.SelectedValue & "(tblActivity.StartTime) } " & _
                "ORDER BY year, period"
        Label3.Text = strSQL

        comm.CommandText = strSQL

        Dim ds As New DataSet

        Dim datadap As New SqlDataAdapter
        datadap.SelectCommand = comm
        datadap.Fill(ds)

        GridView1.DataSource = ds
        GridView1.DataBind()




















        GridView1.Visible = True

        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        chartOEE.SeriesCollection.Add(seriesOEE)
        chartOEE.SeriesCollection.Add(seriesAvail)
        chartOEE.SeriesCollection.Add(seriesPerf)
        chartOEE.SeriesCollection.Add(seriesQual)


    End Sub



    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim eleOEE As New dotnetCHARTING.Element
            Dim eleAvail As New dotnetCHARTING.Element
            Dim elePerf As New dotnetCHARTING.Element
            Dim eleQual As New dotnetCHARTING.Element


            If e.Row.Cells(13).Text = "&nbsp;" Then

                eleOEE.YValue = 0
                eleOEE.Name = e.Row.Cells(0).Text
                seriesOEE.AddElements(eleOEE)
            Else

                eleOEE.YValue = e.Row.Cells(13).Text
                eleOEE.Name = e.Row.Cells(0).Text
                seriesOEE.AddElements(eleOEE)
            End If

            If e.Row.Cells(12).Text = "&nbsp;" Then

                eleQual.YValue = 0
                eleQual.Name = e.Row.Cells(0).Text
                seriesQual.AddElements(eleQual)
            Else
                eleQual.YValue = e.Row.Cells(12).Text
                eleQual.Name = e.Row.Cells(0).Text
                seriesQual.AddElements(eleQual)
            End If


            If e.Row.Cells(10).Text = "&nbsp;" Then

                elePerf.YValue = 0
                elePerf.Name = e.Row.Cells(0).Text
                seriesPerf.AddElements(elePerf)
            Else

                elePerf.YValue = e.Row.Cells(10).Text
                elePerf.Name = e.Row.Cells(0).Text
                seriesPerf.AddElements(elePerf)
            End If

            If e.Row.Cells(7).Text = "&nbsp;" Or e.Row.Cells(7).Text = "NaN" Then

                eleAvail.YValue = 0
                eleAvail.Name = e.Row.Cells(0).Text
                seriesAvail.AddElements(eleAvail)
            Else

                eleAvail.YValue = e.Row.Cells(7).Text
                eleAvail.Name = e.Row.Cells(0).Text
                seriesAvail.AddElements(eleAvail)

            End If

        End If






    End Sub


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Response.Redirect("Periodanalysis.aspx?Start=" & HttpUtility.UrlEncode(GridView1.SelectedDataKey(0)) & "&End=" & HttpUtility.UrlEncode(GridView1.SelectedDataKey(1)) & "&locid=" & RadioButtonList1.SelectedIndex)

    End Sub

   
   
End Class
