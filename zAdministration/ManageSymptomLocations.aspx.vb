
Partial Class zAdministration_ManageSymptomLocations
    Inherits System.Web.UI.Page
    Public cboxchkd As Boolean
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

        'Dim lblmsg As Label = FormView2.FindControl("lblmessage")
        'lblmsg.Text = ""


        Dim selNode As TreeNode = TreeView1.SelectedNode
        InitializeTreeView(selNode.Value, selNode)
        FormView1.ChangeMode(FormViewMode.Edit)
        FormView1.DataBind()
        selNode.Expand()

    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'change to edit mode from insert mode
        FormView1.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)



        Dim cbox As CheckBox = FormView1.FindControl("cboxroot")
        If cbox.Checked = True Then

            cboxchkd = True
            'create a new location with a parentlocation of 1

            ObjectDataSource1.InsertParameters("ParentLocID").DefaultValue = 1
            ObjectDataSource1.InsertParameters("DowntimeID").DefaultValue = 0
            ObjectDataSource1.InsertParameters("lotStatus").DefaultValue = 0
            ObjectDataSource1.InsertParameters("LocationStatus").DefaultValue = 1
            ObjectDataSource1.InsertParameters("ChangeOverStatus").DefaultValue = 0

           





        Else
            'when indserting a new node set the parentlocid to that of the selected node
            ObjectDataSource1.InsertParameters("ParentLocID").DefaultValue = TreeView1.SelectedValue
            ObjectDataSource1.InsertParameters("DowntimeID").DefaultValue = 0

        End If


    End Sub
    Protected Sub ObjectDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Inserted

        If cboxchkd = True Then

            'get back the location ID

            Dim Maxlocadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim maxlocidsymp As Integer = Maxlocadap.MaxLocID

            'create a new Root cause location ID with the same name
            Dim desctxt As TextBox = FormView1.FindControl("Locdescriptiontextbox")
            Dim descrip As String = desctxt.Text

            Dim tbllocadap As New LocationsTableAdapters.tblLocTableAdapter
            tbllocadap.Insert(descrip, 0, 0, 0, True, 0, 0)

            'get back the location id for the new root cause id
            Dim maxlocidroot As Integer = Maxlocadap.MaxLocID

            'Link the root cause and the Symptom location IDs for root nodes in the link table

            Dim linkadap As New LocationsTableAdapters.tblLocLinkTableAdapter
            linkadap.Insert(maxlocidroot, maxlocidsymp)

            'insert a line into the asset table to keep track of the assets settings
            Dim Assetadap As New AssetTableAdapters.tblAssetTableAdapter
            Assetadap.Insert(descrip, maxlocidsymp, 0, 0, 0, 0, 0, False, False, 0, "", "", "", 0, False)

            'when a root node is added update the tree view
            Dim selNode As TreeNode = TreeView1.SelectedNode
            TreeView1.Nodes.Clear()
            InitializeTreeView(1, Nothing)

           

        Else
            'when a node is added, repopuplate the selectednodes list and expand
            Dim selNode As TreeNode = TreeView1.SelectedNode
            selNode.ChildNodes.Clear()
            InitializeTreeView(selNode.Value, selNode)
            selNode.Expand()
        End If



        FormView1.ChangeMode(FormViewMode.Insert)


    End Sub
    Protected Sub ObjectDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Updated

        'when a node is edited repopulate the parent nodes list of nodes and expand
        Dim selNode As TreeNode = TreeView1.SelectedNode.Parent

        If selNode Is Nothing Then
            TreeView1.Nodes.Clear()
            InitializeTreeView(1, Nothing)
        Else
            selNode.ChildNodes.Clear()
            InitializeTreeView(selNode.Value, selNode)
            selNode.Expand()
        End If

    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        FormView2.ChangeMode(FormViewMode.Edit)
        FormView2.DataBind()
    End Sub
    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView2.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub InsertButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim lnkbtn As LinkButton = FormView2.FindControl("Insertbutton")
        lblMessage.Text = ""
        lnkbtn.CommandName = "Insert"

        If TreeView1.SelectedValue = Nothing Then
            lnkbtn.CommandName = ""
            lblMessage.Text = "You must select a location before inserting a format"

        Else
            ObjectDataSource3.InsertParameters("LocID").DefaultValue = TreeView1.SelectedValue


        End If


    End Sub
    Protected Sub ObjectDataSource3_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource3.Inserted
        GridView1.DataBind()
    End Sub
    Protected Sub ObjectDataSource3_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource3.Updated
        GridView1.DataBind()
    End Sub
    Protected Sub FromatGV_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FromatGV.SelectedIndexChanged
        lblerror.Text = ""
        formatsFV.ChangeMode(FormViewMode.Edit)
        formatsFV.DataBind()
    End Sub
    Protected Sub lnkFormatInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkFormatInsert.Click
        'note you can only add formats to the top node level where the parentlocid = 1
        formatsfv.changemode(FormViewMode.Insert)

        lblerror.Text = ""

    End Sub
    Protected Sub formatsEditDS_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles formatsEditDS.Inserted
        FromatGV.DataBind()
        formatsFV.ChangeMode(FormViewMode.Insert)

        'if there is no activity for this line already then add an activity for this line

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        Dim actDT As New Activity.tblActivityDataTable

        actDT = actadap.GetDataByLoc(TreeView1.SelectedValue)

        If actDT.Rows.Count = 0 Then

            Dim formatAdap As New LocationsTableAdapters.tblFormatTableAdapter
            Dim dtformat As New Locations.tblFormatDataTable

            dtformat = formatAdap.GetDataByLocIDandActivity(TreeView1.SelectedValue, 1)

            If dtformat.Rows.Count = 0 Then
                lblMessage.Text = "You must create a format for the line"
            Else
                Dim row As Locations.tblFormatRow = dtformat.Rows(0)
                Dim formatid As Integer = row.FormatID()
                Dim actid As Integer

                Dim actQadap As New ActivityTableAdapters.QueriesTableAdapter
                actQadap.spInsertNewLot(1, TreeView1.SelectedValue, DateAdd(DateInterval.Day, -1, Now()), "InitialLot", 0, formatid, 0, 0, Now(), 0, 999999, actid)

                Dim adapLoc As New LocationsTableAdapters.QueriesTableAdapter
                adapLoc.UpdateLotStatusByLocID(actid, TreeView1.SelectedValue)

            End If

        End If



    End Sub
    Protected Sub formatsEditDS_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles formatsEditDS.Updated
        FromatGV.DataBind()
    End Sub
    Protected Sub InsertButton_Click2(ByVal sender As Object, ByVal e As System.EventArgs)
        formatsEditDS.InsertParameters("stdtime").DefaultValue = 0
        lblerror.Text = ""

        If TreeView1.SelectedValue = Nothing Then

            Dim insbut As LinkButton = formatsFV.FindControl("InsertButton")
            insbut.CommandName = "Cancel"
            lblerror.Text = "You must select a root node to add a format to"

        Else



            'get the parentlocid for the selectednode
            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim parentlocid As Integer = locadap.ParentLocIDfromLocID(TreeView1.SelectedValue)

            'if the selectednode is a root node ie parentlocid = 1 then insert as normal
            If parentlocid = 1 Then
                formatsEditDS.InsertParameters("Activitytype").DefaultValue = 1

                formatsEditDS.InsertParameters("LocID").DefaultValue = TreeView1.SelectedValue
            Else

                'stop the insert to the db by changing the button mode to cancel
                Dim insbut As LinkButton = formatsFV.FindControl("InsertButton")
                insbut.CommandName = "Cancel"
                lblerror.Text = "You can only add formats for root nodes ie: at the top level"

            End If
        End If




    End Sub

    Protected Sub GridView3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged
        FVCOtype.ChangeMode(FormViewMode.Edit)
        FVCOtype.DataBind()

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ODSChangeOverEdit.UpdateParameters("LocID").DefaultValue = TreeView1.SelectedValue
        ODSChangeOverEdit.UpdateParameters("ActivityType").DefaultValue = 2
    End Sub

    Protected Sub InsertButton_Click4(ByVal sender As Object, ByVal e As System.EventArgs)
        ODSChangeOverEdit.InsertParameters("stdtime").DefaultValue = 0

        If TreeView1.SelectedValue = Nothing Then

            Dim insbut As LinkButton = FVCOtype.FindControl("InsertButton")
            insbut.CommandName = "Cancel"
            lblError2.Text = "You must select a root node to add a format to"

        Else



            'get the parentlocid for the selectednode
            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
            Dim parentlocid As Integer = locadap.ParentLocIDfromLocID(TreeView1.SelectedValue)

            'if the selectednode is a root node ie parentlocid = 1 then insert as normal
            If parentlocid = 1 Then

                ODSChangeOverEdit.InsertParameters("locid").DefaultValue = TreeView1.SelectedValue
                ODSChangeOverEdit.InsertParameters("Activitytype").DefaultValue = 2
            Else

                'stop the insert to the db by changing the button mode to cancel
                Dim insbut As LinkButton = FVCOtype.FindControl("InsertButton")
                insbut.CommandName = "Cancel"
                lblError2.Text = "You can only add formats for root nodes ie: at the top level"

            End If
        End If



    End Sub

    Protected Sub ODSChangeOverEdit_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSChangeOverEdit.Inserted
        GridView3.DataBind()
    End Sub

    Protected Sub ODSChangeOverEdit_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSChangeOverEdit.Updated
        GridView3.DataBind()
    End Sub

    Protected Sub UpdateButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        formatsEditDS.UpdateParameters("Activitytype").DefaultValue = 1

    End Sub

    Protected Sub UpdateButton_Click2(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub formatsFV_PageIndexChanging(sender As Object, e As FormViewPageEventArgs) Handles formatsFV.PageIndexChanging

    End Sub
End Class
