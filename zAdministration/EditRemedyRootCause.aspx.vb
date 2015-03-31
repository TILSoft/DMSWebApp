
Partial Class zAdministration_EditRemedyRootcause2
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If


        Dim RCfromRemadap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
        Session("EditRCID") = RCfromRemadap.RootCauseIDfromRemedy(Request.QueryString("remedy"))
        lblpath.Text = hlp.getlocpathnolink(RCfromRemadap.RootCauseLocFromRootCauseID(CInt(Session("EditRCID"))), 0)



        If Not Page.IsPostBack Then

            Session("editbtnLocID") = 0

            If Request.QueryString("locid") <> Nothing Then
                Session("editbtnLocID") = Request.QueryString("LocID")

                Dim sitepath As New Helpers
                litpath.Text = sitepath.getlocpath(Session("editbtnLocid"), "EditRemedyRootcause.aspx", "&remedy=" & Request.QueryString("remedy"), 0)

            End If

        End If


    End Sub

    Protected Sub lnkEditRem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkEditRem.Click
        Response.Redirect("editremedy.aspx?remedy=" & Request.QueryString("remedy"))
    End Sub

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
      
        Session("editbtnLocID") = e.CommandArgument
        DataList1.DataBind()

        Dim sitepath As New Helpers
        litpath.Text = sitepath.getlocpath(e.CommandArgument, "EditRemedyRootcause.aspx", "&remedy=" & Request.QueryString("remedy"), 0)
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        If DataList1.Items.Count = 0 Then
            BtnUpdateRCLoc.Visible = True
        End If
    End Sub

    Protected Sub BtnUpdateRCLoc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnUpdateRCLoc.Click
        Dim txtbox As TextBox = DetailsView2.FindControl("TextBox3")
        txtbox.Enabled = True
        txtbox.Text = Session("editBtnLocID")
        txtbox.Enabled = False
  

    End Sub

    Protected Sub ODSRootCause_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSRootCause.Updated
        Dim hlp As New Helpers
        Dim RCfromRemadap As New RootCauseRemedyTableAdapters.QueriesTableAdapter
        lblpath.Text = hlp.getlocpathnolink(RCfromRemadap.RootCauseLocFromRootCauseID(CInt(Session("EditRCID"))), 0)


    End Sub
End Class
