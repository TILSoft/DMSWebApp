
Partial Class zAdministration_ManageShifts
    Inherits System.Web.UI.Page

    Protected Sub cldStart_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cldStart.SelectionChanged
        cldEnd.SelectedDate = cldStart.SelectedDate
        txtStartTime.Text = DateAdd(DateInterval.Hour, 12, cldStart.SelectedDate)
        txtEndTime.Text = DateAdd(DateInterval.Hour, 12, cldEnd.SelectedDate)

    End Sub
    Protected Sub cldEnd_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cldEnd.SelectionChanged
        txtEndTime.Text = DateAdd(DateInterval.Hour, 12, cldEnd.SelectedDate)

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If



        If Not Page.IsPostBack Then
            InitializeTreeView(1, Nothing)
        End If

    End Sub
    Sub InitializeTreeView(ByVal ParentLocID As Integer, ByVal selNode As TreeNode)

        'get all nodes with a parent location ID = ParentLocID (ie: root nodes for Symptom Location)
        Dim LocAdap As New LocationsTableAdapters.tblLocTableAdapter
        Dim LocTable As New Locations.tblLocDataTable
        Dim LocRow As Locations.tblLocRow
        Dim addnode As Boolean


        LocTable = LocAdap.GetDataByParentLocID(ParentLocID)

        'if the link is returning after a node is clicked check that the selected node doesnt have any
        'children, if it doesnt allow it to add children (addnode = true) if it does do not allow it to add
        'children (addnode = false)

        If selNode IsNot Nothing Then
            If selNode.ChildNodes.Count = 0 Then
                addnode = True
            End If
        End If


        For Each LocRow In LocTable

            Dim node As New TreeNode
            node.Text = LocRow.LocDescription
            node.Value = LocRow.LocID

            'if the selnode is nothing ie: coming from teh page load initialisation then just add node
            If selNode Is Nothing Then

                TreeView1.Nodes.Add(node)

            Else
                ' if sel node is something ie: coming from node click then addnode if there are no children
                'nodes to the selected node already
                If addnode = True Then
                    selNode.ChildNodes.Add(node)
                End If

            End If

        Next


    End Sub
    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
        GridView1.DataBind()
    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        LblMessage.Text = ""

        Dim shiftconflict As New Helpers

        Dim txtstart As TextBox = FormView1.FindControl("ShiftStartTextBox")
        Dim txtend As TextBox = FormView1.FindControl("ShiftendTextBox")
        Dim txtloc As TextBox = FormView1.FindControl("LocIDTextBox")
        Dim lblshift As Label = FormView1.FindControl("ShiftIDLabel1")

        If shiftconflict.checkForShiftCrossEdit(txtstart.Text, txtend.Text, txtloc.Text, lblshift.Text) = 0 Then

            GridView1.DataBind()
        Else
            Dim lnkInsert As LinkButton = FormView1.FindControl("UpdateButton")
            lnkInsert.CommandName = "Cancel"
            LblMessage.Text = "This shift conflicts with another shift"

        End If




    End Sub

    Protected Sub ODSShiftsEdit_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSShiftsEdit.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub btn_getShifts_Click(sender As Object, e As System.EventArgs) Handles btn_getShifts.Click
        GridView1.DataBind()

    End Sub
End Class
