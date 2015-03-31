
Partial Class zAdministration_ManageSymptomLocations
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If



        If Not Page.IsPostBack Then
            InitializeTreeView(0, Nothing)
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

        Dim selNode As TreeNode = TreeView1.SelectedNode
        InitializeTreeView(selNode.Value, selNode)
        FormView1.DataBind()
        selNode.Expand()
        FormView1.ChangeMode(FormViewMode.Edit)

    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'change to edit mode from insert mode
        FormView1.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'when indserting a new node set the parentlocid to that of the selected node
        ObjectDataSource1.InsertParameters("ParentLocID").DefaultValue = TreeView1.SelectedValue

    End Sub
    Protected Sub ObjectDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Inserted

        'when a node is added, repopuplate the selectednodes list and expand
        Dim selNode As TreeNode = TreeView1.SelectedNode
        selNode.ChildNodes.Clear()
        InitializeTreeView(selNode.Value, selNode)
        selNode.Expand()
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub ObjectDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Updated

        'when a node is edited repopulate the parent nodes list of nodes and expand
        Dim selNode As TreeNode = TreeView1.SelectedNode.Parent
        selNode.ChildNodes.Clear()
        InitializeTreeView(selNode.Value, selNode)
        selNode.Expand()
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        FormView2.ChangeMode(FormViewMode.Edit)
        FormView2.DataBind()

    End Sub
    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView2.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub InsertButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        ObjectDataSource3.InsertParameters("LocationID").DefaultValue = TreeView1.SelectedValue

    End Sub
    Protected Sub ObjectDataSource3_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource3.Inserted
        GridView1.DataBind()
    End Sub
    Protected Sub ObjectDataSource3_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource3.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub lnkRCLocationAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRCLocationAdd.Click
        FormView1.ChangeMode(FormViewMode.Insert)

    End Sub
End Class
