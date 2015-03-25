
Partial Class zAdministration_ShiftCopyWizard
    Inherits System.Web.UI.Page


    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim shiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter
        Dim shiftdt As New Shifts.tblShiftsDataTable
        If txtfirst.Enabled = True Then
            txtfirst.Text = GridView1.SelectedDataKey.Value
            txtfirst.Enabled = False
            'select shift details by shift id 

            shiftdt = shiftadap.GetDataByShiftID(GridView1.SelectedDataKey.Value)
            Dim shrow As Shifts.tblShiftsRow = shiftdt.Rows(0)
            lblfirst.Text = " - Start time:" & shrow.ShiftStart

        ElseIf txtlast.Enabled = True Then
            txtlast.Text = GridView1.SelectedDataKey.Value
            txtlast.Enabled = False

            shiftdt = shiftadap.GetDataByShiftID(GridView1.SelectedDataKey.Value)
            Dim shrow As Shifts.tblShiftsRow = shiftdt.Rows(0)
            lbllast.Text = " - Start time:" & shrow.ShiftStart

        End If

    End Sub

    Protected Sub btnCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCopy.Click

        'select all the shifts for this location that fall between the start of the first and the end of the last

        Dim cycleadap As New ShiftsTableAdapters.tblShiftsTableAdapter
        Dim cycledt As New Shifts.tblShiftsDataTable
        Dim i As Integer = 0

        'get the total duration of the update
        Dim totalhours As Integer = TxtRepeatHours.Text * txtRepeats.Text
        'get the start time of the copy period
        Dim startadap As New ShiftsTableAdapters.QueriesTableAdapter

        Dim cycstarttime As DateTime = startadap.SelectStartTimeByShiftID(CInt(txtfirst.Text))
        Dim cycendtime As DateTime = startadap.SelectShiftEndByShiftID(CInt(txtlast.Text))

        'get the end time of the copy period
        Dim endtime As DateTime = DateAdd(DateInterval.Hour, totalhours, cycendtime)
        'delete all shifts which conflict with the start and end time
        startadap.DeleteBetweenTimes(endtime, cycendtime, Request.QueryString("Locid"))

        'get all the shifts between the start and end shift
        cycledt = cycleadap.GetDataByCycleStartEnd(Request.QueryString("Locid"), txtfirst.Text, txtlast.Text)

        ' for the approprate number of repeats
        For i = 1 To CInt(txtRepeats.Text)

            'add hours to the repeat hours text box depending on teh repeat cycle
            Dim hourstoadd As Integer = CInt(TxtRepeatHours.Text) * i

            'for every shift in the defined shift cycle insert a new row with the required hours added to the original shift
            For Each cyclerow As Shifts.tblShiftsRow In cycledt

                ' delete any shift from this location which overlaps with this new shift
                Dim Shiftconflict As New Helpers

                Dim conflictShiftID As Integer = Shiftconflict.checkForShiftCross(DateAdd(DateInterval.Hour, hourstoadd, cyclerow.ShiftStart), DateAdd(DateInterval.Hour, hourstoadd, cyclerow.ShiftEnd), Request.QueryString("Locid"))

                '     Response.Write(DateAdd(DateInterval.Hour, hourstoadd, cyclerow.ShiftStart))

                If conflictShiftID > 0 Then
                    Dim deleteshiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter
                    deleteshiftadap.Delete(conflictShiftID)
                End If

                'insert a new shift 
                cycleadap.Insert(Request.QueryString("Locid"), DateAdd(DateInterval.Hour, hourstoadd, cyclerow.ShiftStart), DateAdd(DateInterval.Hour, hourstoadd, cyclerow.ShiftEnd), cyclerow.ShiftTeam)

            Next

        Next

        GridView1.DataBind()
        lblmessage.Text = "Shifts successfully added"

    End Sub

  
    Protected Sub BtnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnReset.Click
        txtfirst.Text = ""
        txtfirst.Enabled = True
        txtlast.Text = ""
        txtlast.Enabled = True
        TxtRepeatHours.Text = ""
        txtRepeats.Text = ""

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) < 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

    End Sub
End Class
