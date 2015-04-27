
Partial Class FrontEnd_StartEndActivityaspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BtnSubmit.Attributes.Add("onclick", GetPostBackEventReference(BtnSubmit) & ";this.value='Please wait...';this.disabled = true;")

        'get current status ID of line
        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter

        'Dim ActivityID As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))

        Dim activitytype As Integer = locadap.ActivityTypeFromLocID(CInt(Session("workstationID")))


        'get activity status of the line
        Dim adapLineStatus As New ActivityTableAdapters.QueriesTableAdapter
        Dim status As String = adapLineStatus.ActivityStatusFromLocID(CInt(Session("workstationID")))

        lblStatus.Text = status

        If activitytype = 1 Then

            pnlEndLot.Visible = True

        End If

    End Sub


    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        Select Case RadioButtonList1.SelectedValue

            Case 1

                pnlStartLot.Visible = True
                pnlStartIdleTime.Visible = False
                pnlStartChangeOver.Visible = False

            Case 2

                pnlStartLot.Visible = False
                pnlStartIdleTime.Visible = False
                pnlStartChangeOver.Visible = True

            Case Is > 2

                pnlStartLot.Visible = False
                pnlStartIdleTime.Visible = True
                pnlStartChangeOver.Visible = False

        End Select


    End Sub

    Protected Sub btnChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeStatus.Click
        txtPopTime.Text = Now()
        MPELogin.Show()
    End Sub

    Protected Sub BtnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSubmit.Click
        lbllogmess.Text = ""

        Dim dofinals As Boolean = True

        'check user id
        Dim userid As Integer
        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        Dim usercount As Integer = useradap.UserPassCheckbyLevel(txtUser.Text, txtpass.Text, 0)

        'get current activity ID
        Dim adapcurract As New LocationsTableAdapters.QueriesTableAdapter
        Dim curract As Integer = adapcurract.ActivityIDFromLocID(CInt(Session("workstationID")))

        'check for overlapping activities with current activity start time
        Dim adapActOverlap As New ActivityTableAdapters.ActivityCheckTimeTableAdapter
        Dim dtactoverlap As New Activity.ActivityCheckTimeDataTable

        dtactoverlap = adapActOverlap.GetData(txtPopTime.Text, CInt(Session("workstationID")))
        Dim olactid As Integer

        'check if the overlap is with the current activity

        If dtactoverlap.Rows.Count > 0 Then
            Dim overlaprow As Activity.ActivityCheckTimeRow
            overlaprow = dtactoverlap.Rows(0)
            olactid = overlaprow.ActivityID
        Else

            olactid = -1
        End If


        If usercount = 0 Then
            lbllogmess.Text = "Incorrect username and password"
            txtpass.Text = ""
            MPELogin.Show()

            'check for overlap with another activity for retrospective entry
        ElseIf dtactoverlap.Rows.Count > 0 And olactid <> curract Then

            lbllogmess.Text = "Your time coincides with another lot please adjust as required"
            txtpass.Text = ""
            MPELogin.Show()


        Else

            'check if there is an overlap of the finishing activity or the new activity

            userid = useradap.UserIdbyUserName(txtUser.Text)

            Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter


            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim ActivityID As Integer = locadap.ActivityIDFromLocID(CInt(Session("workstationID")))
            Dim activitytype As Integer = locadap.ActivityTypeFromLocID(CInt(Session("workstationID")))


            Select Case activitytype

                Case 1 'lot in progress
                    'end the lot
                    actiadap.UpdateAtEndOfLot(txtPopTime.Text, txtGoodUnits.Text, txtWasteUnits.Text, userid, Now(), 0, ActivityID)
                Case 2
                    actiadap.UpdateEndCOorIdle(txtPopTime.Text, userid, Now(), ActivityID)
                Case 3
                    actiadap.UpdateEndCOorIdle(txtPopTime.Text, userid, Now(), ActivityID)


            End Select


            Select Case RadioButtonList1.SelectedValue

                Case 1
                    'start a new lot
                    If cbManualLot.Checked = True Then
                        'if manual entry is used for lot no, item code and target
                        actiadap.InsertNewLot(RadioButtonList1.SelectedValue, CInt(Session("workstationID")), txtPopTime.Text, txtLot.Text, ActivityID, ddlFormat.SelectedValue, txtTarget.Text, userid, Now(), txtItemCode.Text)
                    Else
                        'if auto entry is used for lot no, item code and target from xfp_sap WO table.
                        actiadap.InsertNewLot(RadioButtonList1.SelectedValue, CInt(Session("workstationID")), txtPopTime.Text, ddlLotNumber.SelectedItem.Text, ActivityID, ddlFormat.SelectedValue, lblTargOutput.Text, userid, Now(), lblItemcode.Text)
                    End If


                Case 2
                    'start a new CO.
                    actiadap.InsertNewChangeOver(RadioButtonList1.SelectedValue, CInt(Session("workstationID")), txtPopTime.Text, txtPopTime.Text, userid, Now(), ActivityID, ddlCOlist.SelectedValue)

                Case 3
                    'start a new Idle time
                    actiadap.InsertNewIdleTime(RadioButtonList1.SelectedValue, CInt(Session("workstationID")), txtPopTime.Text, ActivityID, userid, Now(), txtPopTime.Text)

            End Select


            If dofinals Then
                'note to self, need to update the manual system to us the stored procedure and return the activityid securely
                'select max activity ID

                Dim newactivityid As Integer = actiadap.MaxActivityId()

                'insert into the oldactivityID postactId field
                actiadap.UpdatePostActivityIDField(newactivityid, ActivityID)

                'update loctable with max activity ID

                Dim qlocadap As New LocationsTableAdapters.QueriesTableAdapter

                qlocadap.UpdateLotStatusByLocID(newactivityid, CInt(Session("workstationID")))
                MPELogin.Hide()
                Response.Redirect("WShome.aspx")
            End If






        End If


    End Sub

    Protected Sub cbManualLot_CheckedChanged(sender As Object, e As EventArgs) Handles cbManualLot.CheckedChanged
        'enable or disable manual lot entry

        If cbManualLot.Checked = True Then
            ddlLotNumber.Enabled = False
            txtLot.Enabled = True
            txtItemCode.Enabled = True
            txtTarget.Enabled = True
            RequiredFieldValidator2.Enabled = True
            RequiredFieldValidator3.Enabled = True
            RequiredFieldValidator4.Enabled = True

        Else
            ddlLotNumber.Enabled = True
            txtLot.Enabled = False
            txtItemCode.Enabled = False
            txtTarget.Enabled = False
            RequiredFieldValidator2.Enabled = False
            RequiredFieldValidator3.Enabled = False
            RequiredFieldValidator4.Enabled = False

        End If

    End Sub

    Protected Sub ddlLotNumber_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlLotNumber.SelectedIndexChanged
        'select itemcode and qty from lot no, populate label fields.

        Dim workorderno As String = ddlLotNumber.SelectedValue
        Dim lotno As String = ddlLotNumber.SelectedItem.Text

        Dim adapWO As New ActivityTableAdapters.tblSAPWorkOrderInterfaceTableAdapter
        Dim dtWO As Activity.tblSAPWorkOrderInterfaceDataTable

        dtWO = adapWO.GetDataBy(Trim(workorderno))

        If dtWO.Rows.Count > 0 Then

            Dim rowWO As Activity.tblSAPWorkOrderInterfaceRow = dtWO.Rows(0)

            lblItemcode.Text = rowWO.Itemcode

            If Not IsDBNull(rowWO.Description) Then
                lblItemdesc.Text = rowWO.Description
            End If

            lblTargOutput.Text = rowWO.Quantity / 1000
            lblUnit.Text = rowWO.Unit

        Else

            lbllogmess.Text = "No work order found for this lot no"

        End If






        ' what to do if there are /1,/2 lots in the list?
        'manage lot numbers coming in so we only 
    End Sub
End Class
