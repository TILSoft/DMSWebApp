
Partial Class FrontEnd_Note
    Inherits System.Web.UI.Page

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand

        Session("ENLocID") = e.CommandArgument
        Dim pathhlp As New Helpers
        Literal1.Text = pathhlp.getlocpath(e.CommandArgument, "Note.aspx")
        DataList1.DataBind()

        'get Root RC loc ID
        Dim rootloc As Integer = pathhlp.FindRootLoc(Session("ENLocID"), 0)

        'get symptom loc id from RC locid
        Dim sympAdap As New LocationsTableAdapters.QueriesTableAdapter
        Dim sympLocID As Integer = sympAdap.GetSympLocIDFromRCLocID(rootloc)

        'bind the ddl with the new format
        FormatsODS.SelectParameters("LocID").DefaultValue = sympLocID
        FormatsODS.Select()
        ddlFormat.DataBind()


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim pathhlp As New Helpers

        If Not Page.IsPostBack Then

            If Not Request.QueryString("LocID") = Nothing Then
                Session("ENLocID") = Request.QueryString("LocID")
                Literal1.Text = pathhlp.getlocpath(Session("ENLocID"), "Note.aspx")
            Else
                Session("ENLocID") = 0

            End If

        End If


    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        txtTimeDate.Text = Now()

        MPELogin.Show()
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        'check user id is appropriate

        Dim useradap As New UsersTableAdapters.QueriesTableAdapter
        Dim usercnt As Integer = useradap.UserPassCheckbyLevel(txtUserName.Text, txtPassword.Text, 2)

        If usercnt > 0 Then

            Dim userid As Integer = useradap.UserIdbyUserName(txtUserName.Text)
            Dim noteadap As New EngNoteTableAdapters.tblEngNoteTableAdapter
            noteadap.Insert(CInt(Session("ENLocID")), CDate(txtTimeDate.Text), txtNote.Text, ddlFormat.SelectedValue, userid)
            MPELogin.Hide()

            Response.Redirect("WShome.aspx")


        Else

            lblMessage.Text = "Incorrect login details"
            MPELogin.Show()

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        MPELogin.Hide()
    End Sub

 
End Class
