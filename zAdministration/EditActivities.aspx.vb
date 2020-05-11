
Imports System.Drawing

Partial Class DataVisualisation_ActivitySearch
    Inherits System.Web.UI.Page

    Protected Sub lnkExportExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkExportExcel.Click
        GridView1.AllowPaging = False
        GridView1.AllowSorting = False
        GridView1.DataBind()

        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=Activities.xls")
        Response.Charset = ""
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = "application/vnd.xls"

        Dim stringWrite = New System.IO.StringWriter()
        Dim htmlWrite = New HtmlTextWriter(stringWrite)

        Dim frm As HtmlForm = New HtmlForm()
        Me.Controls.Add(frm)
        frm.Controls.Add(GridView1)
        frm.RenderControl(htmlWrite)

        Response.Write(stringWrite.ToString())
        Response.End()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
            txtEnd.Text = Now()
            txtSearc.Text = "%"
            txtSearc.Enabled = False
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        lblError.Text = ""

        Dim idx As Integer = Convert.ToInt32(e.CommandArgument)

        If idx < GridView1.Rows.Count() - 1 Then


            If Left(e.CommandName, 1) = "x" Then

                Dim actID As Integer = GridView1.DataKeys(e.CommandArgument).Value
                hdnActID.Value = actID

                If e.CommandName = "xEdit" Then

                    ModalPopupExtender1.Show()
                    dvActEdit.DataBind()
                    dvActEdit.ChangeMode(DetailsViewMode.Edit)

                ElseIf e.CommandName = "xDelete" Then

                    Call deleteActivity()

                ElseIf e.CommandName = "xAdd" Then

                    ModalPopupExtender1.Show()
                    dvActEdit.DataBind()
                    dvActEdit.ChangeMode(DetailsViewMode.Insert)

                End If

            End If

        Else
            lblError.Text = "You cant edit an activity at the end of the list or that is still in progress. Select a wider date range or close the activity"
        End If

    End Sub

    Sub deleteActivity()



        Dim adapprepost As New ActivityTableAdapters.GetPreAndPostTableAdapter
        Dim dtprepost As New Activity.GetPreAndPostDataTable
        dtprepost = adapprepost.GetPreAndPostTimes(hdnActID.Value)
        Dim rowprepost As Activity.GetPreAndPostRow = dtprepost.Rows(0)

        'set preactivity end time to postactivity start time
        'set preactivity postactivityid to postactivity id
        Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter

        'if the batch has been started but not finished properly, just delete.  All other items should sort themselves
        If Not IsDBNull(rowprepost.Item(4)) Then
            'update the end time of the pre lot with the start time of the new lot, need to update preact.postact with new activity
            actiadap.UpdateEndTimeAndPostActByActID(rowprepost.postStart, rowprepost.postID, rowprepost.PreID)
            'set postactivity preactivityid to preactivityid
            actiadap.UpdateStartTimeAndPreActID(rowprepost.postStart, rowprepost.PreID, rowprepost.postID)
        End If

        ' delete target activity
        actiadap.DeleteActivity(hdnActID.Value)
        GridView1.DataBind()

    End Sub

    Protected Sub ODSEditAct_Inserting(sender As Object, e As ObjectDataSourceMethodEventArgs) Handles ODSEditAct.Inserting


        e.Cancel = True

        Dim txtstart As TextBox = dvActEdit.FindControl("txtStartTime")
        Dim txtend As TextBox = dvActEdit.FindControl("txtEndTime")
        Dim txtPre As TextBox = dvActEdit.FindControl("txtPreAct")
        Dim txtPost As TextBox = dvActEdit.FindControl("txtPostAct")


        Dim adapprepost As New ActivityTableAdapters.GetPreAndPostTableAdapter
        Dim dtprepost As New Activity.GetPreAndPostDataTable
        dtprepost = adapprepost.GetPreAndPostTimes(hdnActID.Value)
        Dim rowprepost As Activity.GetPreAndPostRow = dtprepost.Rows(0)

        If CDate(txtstart.Text) < rowprepost.currentStart Or CDate(txtend.Text) > rowprepost.postend Then
            'change preact to clicked activity for this .  Post act remains the post act of the clicked activity
            lblMessage.Text = "The new dates are greater than the end of the next lot or less than the start of the previous lot.  Please adjust them"
            e.Cancel = True
        Else


            Dim adapAct As New ActivityTableAdapters.QueriesTableAdapter

            'insert new activity
            Dim ddlAct As DropDownList = dvActEdit.FindControl("ddlActType")


            Dim ddlFormat As DropDownList = dvActEdit.FindControl("ddlFormat")
            Dim txtLotCOName As TextBox = dvActEdit.FindControl("txtLotCOName")
            Dim txtTarget As TextBox = dvActEdit.FindControl("txtTarget")

            Dim Target As Integer
            If txtTarget.Text = "" Then
                Target = Nothing

            Else
                Target = CInt(txtTarget.Text)
            End If

            Dim txtGoodProd As TextBox = dvActEdit.FindControl("txtGoodProd")

            Dim GoodProd As Integer
            If txtGoodProd.Text = "" Then
                GoodProd = 0
            Else
                GoodProd = CInt(txtGoodProd.Text)
            End If

            Dim txtWaste As TextBox = dvActEdit.FindControl("txtWaste")

            Dim Waste As Integer
            If txtWaste.Text = "" Then
                Waste = 0
            Else
                Waste = CInt(txtWaste.Text)
            End If
            Dim txtItem As TextBox = dvActEdit.FindControl("txtItem")
            Dim actid As Integer

            'Insert new activity
            adapAct.spInsertNewActivity(ddlAct.SelectedValue, DropDownList1.SelectedValue, CDate(txtstart.Text), CDate(txtend.Text), txtLotCOName.Text, _
                                    CInt(hdnActID.Value), rowprepost.postID, CInt(ddlFormat.SelectedValue), Target, GoodProd, Waste, 99999, Now(), 0, txtItem.Text, actid)




            lblMessage.Text = ""

            Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter
            'update the end time of the pre lot with the start time of the new lot, need to update preact.postact with new activity
            actiadap.UpdateEndTimeAndPostActByActID(CDate(txtstart.Text), actid, rowprepost.currentID)


            'update the startime of the next lot with the end time of the new lot, need to update postact.preact  
            actiadap.UpdateStartTimeAndPreActID(CDate(txtend.Text), actid, rowprepost.postID)

        End If
        GridView1.DataBind()
    End Sub


    Protected Sub ODSEditAct_Updating(sender As Object, e As ObjectDataSourceMethodEventArgs) Handles ODSEditAct.Updating
        Dim txtstart As TextBox = dvActEdit.FindControl("Starttimetextbox")
        Dim txtend As TextBox = dvActEdit.FindControl("Endtimetextbox")
        Dim txtPre As TextBox = dvActEdit.FindControl("PreActivitytextbox")
        Dim txtPost As TextBox = dvActEdit.FindControl("PostActivitytextbox")

        Dim adapprepost As New ActivityTableAdapters.GetPreAndPostTableAdapter
        Dim dtprepost As New Activity.GetPreAndPostDataTable
        dtprepost = adapprepost.GetPreAndPostTimes(hdnActID.Value)
        Dim rowprepost As Activity.GetPreAndPostRow = dtprepost.Rows(0)

        If CDate(txtstart.Text) < rowprepost.prestart Or CDate(txtend.Text) > rowprepost.postend Then

            lblMessage.Text = "The new dates are greater than the end of the next lot or less than the start of the previous lot.  Please adjust them"
            e.Cancel = True
        Else
            lblMessage.Text = ""

            Dim actiadap As New ActivityTableAdapters.QueriesTableAdapter
            'update the end time of the pre lot with the start time of the current lot
            actiadap.UpdateEndtimebyActivityID(txtstart.Text, txtPre.Text)
            'update the startime of the next lot with the end time of the current lot
            actiadap.UpdateStartTimeByActivityID(txtend.Text, txtPost.Text)

        End If




    End Sub

    Protected Sub dvActEdit_DataBound(sender As Object, e As EventArgs) Handles dvActEdit.DataBound

        Dim myDv As DetailsView = sender
        If myDv.CurrentMode = DetailsViewMode.Insert Then
            Dim loctxt As TextBox = myDv.FindControl("TextBoxLocID")
            loctxt.Text = DropDownList1.SelectedValue

            Dim actAdap As New ActivityTableAdapters.tblActivityTableAdapter
            Dim dtAct As New Activity.tblActivityDataTable
            dtAct = actAdap.GetDataByActivityID(hdnActID.Value)

            Dim row As Activity.tblActivityRow = dtAct.Rows(0)

            Dim starttxt As TextBox = myDv.FindControl("txtStartTime")
            starttxt.Text = row.endtime
            Dim endtxt As TextBox = myDv.FindControl("txtendtime")
            endtxt.Text = row.endtime
            Dim pretxt As TextBox = myDv.FindControl("txtPreAct")
            pretxt.Text = hdnActID.Value
            Dim posttxt As TextBox = myDv.FindControl("txtPostAct")
            posttxt.Text = row.PostActivity

        End If
        GridView1.DataBind()

    End Sub



    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim status As String = e.Row.Cells(19).Text
        If status = "Successfully extracted" Then
            e.Row.BackColor = Color.FromName("LightGreen")
        End If

    End Sub
End Class
