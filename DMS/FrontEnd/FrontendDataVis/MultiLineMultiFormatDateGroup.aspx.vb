Imports System.Data.SqlClient
Imports System.Data
Imports dotnetCHARTING

Partial Class FrontEnd_FrontendDataVis_MultiLine1
    Inherits System.Web.UI.Page

    Public SCact As New dotnetCHARTING.Series
    Public SCavg As New dotnetCHARTING.Series
    Public scTarget As New dotnetCHARTING.Series
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetData.Click


        Dim startime As DateTime = CDate(txtStart.Text)
        Dim endtime As DateTime = CDate(txtEnd.Text)
        Dim formatlist As String = ""

        formatlist = getFormatList()

        If formatlist = 0 Then

            lblmessage.Text = "You must select at least one format"

        Else


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


            Call DrawChart(ds)
        End If
    End Sub

    Sub DrawChart(ByVal ds As DataSet)


        Dim average As Decimal = ds.Tables(0).Compute("Avg(Averageformattime)", "")


        For Each row As DataRow In ds.Tables(0).Rows

            Dim ele As New Element
            ele.YValue = CInt(row.Item("AverageFormatTime").ToString())
            ele.Name = row.Item("Year").ToString() & " - " & (row.Item("Period").ToString() + CInt(txtAdjPeriod.Text))
            SCact.AddElements(ele)

            Dim avgEle As New Element

            avgEle.YValue = average
            avgEle.Name = row.Item("Year").ToString() & " - " & (row.Item("Period").ToString() + CInt(txtAdjPeriod.Text))
            SCavg.AddElements(avgEle)


        Next

        ActivityChart.Use3D = False

        SCact.DefaultElement.Transparency = 0

        SCact.Type = SeriesType.Line
        SCact.Name = "Actual Time"
        SCavg.Type = SeriesType.Line
        SCavg.Name = "Average Time"
        scTarget.Type = SeriesType.Line
        scTarget.Name = "Target Time"
        scTarget.DefaultElement.Color = Drawing.Color.Red

        ActivityChart.SeriesCollection.Add(SCact)
        ActivityChart.SeriesCollection.Add(SCavg)
        ActivityChart.SeriesCollection.Add(scTarget)


    End Sub

    Function getFormatList() As String

        Dim indx As Integer
        Dim itemcount As Integer = dlformats.Items.Count
        Dim dlitem As Integer = 0
        Dim formatlist As String = ""


        Do Until dlitem = itemcount

            Dim chkbx As CheckBoxList = dlformats.Items(dlitem).FindControl("Checkboxlist1")
            Dim formatcount As Integer = chkbx.Items.Count

            For indx = 0 To formatcount - 1

                If chkbx.Items(indx).Selected = True Then
                    formatlist = formatlist & "'" & chkbx.Items(indx).Value & "',"

                End If

            Next indx
            indx = 0
            dlitem = dlitem + 1
        Loop
        If Len(formatlist) = 0 Then
            Return 0
        Else
            formatlist = Left(formatlist, Len(formatlist) - 1)
            Return formatlist
        End If


    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Year, -1, Now())

            txtEnd.Text = Now()
        End If

    End Sub

End Class
