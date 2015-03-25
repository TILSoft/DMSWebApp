
Partial Class FrontEnd_StartEndLot
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            Dim ws As Integer = Request.Cookies("DMSWorkstation")("Workstation")
        Catch ex As Exception
            Response.Redirect("Setworkstation.aspx")
        End Try

        Session("WorkStationID") = Request.Cookies("DMSWorkstation")("Workstation")

        Dim lineStat As New Helpers

        Dim status As String = lineStat.linestatus(Session("WorkstationID"))

        Select Case status
            Case "No Status"

                lblLineStatus.Text = status

            Case "Lot in Progress"

                lblLineStatus.Text = status
                pnlStartLot.Visible = False
                pnlEndLot.Visible = True
                btnStartLot.Text = "End Lot/Start Changeover"

            Case "Changeover in Progress"

                lblLineStatus.Text = status
                pnlStartLot.Visible = True
                pnlEndLot.Visible = False
                btnStartLot.Text = "Start Lot/End Changeover"
        End Select


    End Sub

    Protected Sub btnStartLot_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStartLot.Click

        txtPopTime.Text = Now()
        MPELogin.Show()

    End Sub


    Protected Sub BtnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSubmit.Click
        'check user id
        Dim userid As Integer
        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        Dim usercount As Integer = useradap.UserPassCheckbyLevel(txtUser.Text, txtpass.Text, 0)

        If usercount = 0 Then
            lbllogMess.text = "Incorrect username and password"
            txtpass.Text = ""

        Else

            userid = useradap.UserIdbyUserName(txtUser.Text)

            If btnStartLot.Text = "End Lot/Start Changeover" Then

                'check if the lot you are about to finish overlaps with any other lots 

                '1) end the lot
                Dim lotadap As New lotsChangeOversTableAdapters.QueriesTableAdapter
                lotadap.UpdatetblLotAtEnd(txtPopTime.Text, CDec(txtGoodUnits.Text), 0, userid, Now(), DetailsLot.DataKey.Value)
                '2) Start a new changeover
                lotadap.InsertNewChangeOver(CDate(txtPopTime.Text), DetailsLot.DataKey.Value, txtCOtype.Text, CInt(Session("WorkstationID")), DateAdd(DateInterval.Day, 2, CDate(txtPopTime.Text)))
                'get new changeover id
                Dim newCOID As Integer = lotadap.MaxCOID
                'update the loc table
                lotadap.UpdateLocTable(0, 2, newCOID, CInt(Session("workstationid")))

                MPELogin.Hide()
                Response.Redirect("WShome.aspx")

            ElseIf btnStartLot.Text = "Start Lot/End Changeover" Then

                'check if the lot you are about to start overlaps with any other lots

                Dim lotOLadap As New lotsChangeOversTableAdapters.tblLotTableAdapter
                Dim lotOLDT As New lotsChangeOvers.tblLotDataTable

                lotOLDT = lotOLadap.CheckForOverlapLots(CInt(Session("WorkstationID")), txtPopTime.Text)


                If lotOLDT.Rows.Count > 0 Then

                    lbllogmess.Text = "There is another lot which overlaps with this time.Please check your time"

                Else
                    '1)start a new lot
                    Dim lotadap As New lotsChangeOversTableAdapters.QueriesTableAdapter

                    lotadap.InsertNewLot(txtPopTime.Text, ddlFormat.SelectedValue, txtLotNumber.Text, CInt(Session("WorkstationID")), userid, Now(), CDec(txtTarget.Text), DateAdd(DateInterval.Day, 2, CDate(txtPopTime.Text)))
                    'get lot id for new lot
                    Dim newlotid As Integer = lotadap.MaxLotID
                    'update loc table with lot number
                    lotadap.UpdateLocTable(newlotid, 1, 0, Session("WorkstationID"))

                    '2) end C/o 
                    'get changover number from location 
                    Dim changeoverid As Integer = DetailsChangeOver.DataKey.Value
                    'b. set changeover details to finish date and time and new lot
                    lotadap.UpdateChangeOver(txtPopTime.Text, newlotid, changeoverid)

                    MPELogin.Hide()
                    Response.Redirect("WShome.aspx")

                End If

            End If


        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        MPELogin.Hide()
    End Sub
End Class
