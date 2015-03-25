Imports System.Data.SqlClient
Imports System.Data
Imports dotnetCHARTING
Partial Class FrontEnd_FrontendDataVis_MultiLineMultiFormat1
    Inherits System.Web.UI.Page
    Public SCact As New dotnetCHARTING.Series
    Public scTarget As New dotnetCHARTING.Series
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetData.Click


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

        Dim strSQL As String = " SELECT tblActivity.ActivityID,tblloc.locdescription, DATEDIFF(n, tblActivity.StartTime, tblActivity.endtime) AS activitytime, " & _
        "dbo.AllActivityAnalysisActivityTime(tblActivity.LocIDSymp, tblActivity.StartTime, tblActivity.endtime, tblActivity.ActivityID) AS trimmedtime, " & _
        "tblActivity.Format, tblformat.formatdesc, tblActivity.txtID, tblFormat.StdTime, dbo.ShiftsForActivity(tblActivity.ActivityID) AS shifts " & _
        "FROM  tblActivity INNER JOIN " & _
        "tblFormat ON tblActivity.Format = tblFormat.FormatID INNER JOIN Tblloc on tblactivity.locidsymp = tblloc.locid " & _
        "WHERE (tblActivity.StartTime > @Starttime ) AND " & _
        "(tblActivity.StartTime < @Endtime) AND (tblFormat.FormatID IN (" & formatlist & ")) order by tblactivity.startTime"

        Label3.Text = strSQL

        comm.CommandText = strSQL

        Dim ds As New DataSet

        Dim datadap As New SqlDataAdapter
        datadap.SelectCommand = comm
        datadap.Fill(ds)

        GridView1.DataSource = ds
        GridView1.DataBind()


        Call DrawChart(ds)
    End Sub

    Sub DrawChart(ByVal ds As DataSet)

        For Each row As DataRow In ds.Tables(0).Rows

            Dim ele As New Element
            ele.YValue = CInt(row.Item("Trimmedtime").ToString())

            If cbShifts.Checked = True Then
                Dim anno As New Annotation
                anno.Label.Text = row.Item("Shifts").ToString()
                ele.Annotation = anno
            End If


            ele.Name = row.Item("txtID").ToString() & " - " & row.Item("locDescription").ToString()
            ele.URL = "../activitydetails.aspx?activityid=" & row.Item("ActivityID").ToString()
            ele.URLTarget = "_blank"
            SCact.AddElements(ele)

            If Not IsDBNull(row.Item("stdtime")) Then
                Dim tele As New Element
                tele.YValue = CInt(row.Item("StdTime").ToString())
                tele.Name = ele.Name
                scTarget.AddElements(tele)
            End If

        Next

        ActivityChart.Use3D = False

        SCact.DefaultElement.Transparency = 0

        SCact.Type = SeriesType.Line
        SCact.Name = "Actual Time"
        scTarget.Type = SeriesType.Line
        scTarget.Name = "Target Time"
        scTarget.DefaultElement.Color = Drawing.Color.Red

        ActivityChart.SeriesCollection.Add(SCact)
        ActivityChart.SeriesCollection.Add(scTarget)
        '        ActivityChart.Title = "Line: " & RadioButtonList1.SelectedItem.Text & " ¦ Activity: Change over in progress ¦ Start Date: " & txtStart.Text & " ¦ End date: " & txtEnd.Text & " ¦ Format search: " & ddlformat.SelectedItem.Text


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

        formatlist = Left(formatlist, Len(formatlist) - 1)
        Return formatlist

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())

            txtEnd.Text = Now()
        End If

    End Sub
End Class
