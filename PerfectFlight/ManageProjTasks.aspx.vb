Imports dotnetCHARTING
Partial Class Application_ManageProjTasks
    Inherits System.Web.UI.Page
    Public seriesColl As New Series


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim prec As Integer
        Dim taskadap As New PefectFlightTableAdapters.QueriesTableAdapter

        UpdateTaskOrderAndPrecendentAfterInsert()

        If cbFixedStart.Checked = True Then
            prec = 0
        Else
            prec = ddlPrecedent.SelectedValue
        End If


        Dim fsdate As DateTime

        If txtFixedStart.Text = "" Then

            fsDate = Now()
        Else
            fsdate = CDate(txtFixedStart.Text)

        End If

        taskadap.InsertTask(Request.QueryString("projid"), TxtTaskName.Text, ddlResp.SelectedValue, prec, ddlListOrder.SelectedValue + 1, 10, TxtDuration.Text, cbElap.Checked, cbFixedStart.Checked, fsdate)


        Dim calc As New Calculator
        Dim calcRet As String = calc.DateCalculator(Request.QueryString("projid"))
        If Not calcRet = "0" Then
            lblmessage.Text = calcRet
            ModalPopupExtender2.Show()
        End If

        drawChart()

        gvTasks.DataBind()
        ddlListOrder.DataBind()
        ddlPrecedent.DataBind()

    End Sub


    Sub UpdateTaskOrderAndPrecendentAfterEdit(ByVal taskid As Integer, ByVal taskorder As Integer)


        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable

        taskDT = taskadap.GetDataBy(Request.QueryString("ProjID"))

        For Each row As PefectFlight.tblPFTasksRow In taskDT

            If Not row.TaskID = taskid Then
                If row.TaskOrder >= taskorder Then
                    row.TaskOrder = row.TaskOrder + 1
                End If
            End If

            If row.TaskPrecedent >= taskorder Then
                row.TaskPrecedent = row.TaskPrecedent + 1
            End If

        Next

        taskadap.Update(taskDT)
        drawChart()


    End Sub



    Sub UpdateTaskOrderAndPrecendentAfterInsert()


        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable

        taskDT = taskadap.GetDataBy(Request.QueryString("ProjID"))

        For Each row As PefectFlight.tblPFTasksRow In taskDT


            If row.TaskOrder > ddlListOrder.SelectedValue Then
                row.TaskOrder = row.TaskOrder + 1
            End If

            If row.TaskPrecedent > ddlListOrder.SelectedValue Then
                row.TaskPrecedent = row.TaskPrecedent + 1
            End If

        Next

        taskadap.Update(taskDT)
        drawChart()


    End Sub


    Protected Sub gvTasks_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvTasks.RowCommand
        If Not e.CommandName = "Delete" Then
            Dim taskid As Integer = e.CommandArgument
            odsTaskEdit.SelectParameters("taskid").DefaultValue = taskid
            ModalPopupExtender1.Show()
        End If
    End Sub

    Protected Sub gvTasks_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvTasks.RowDeleted
        If Not Page.IsPostBack Then
            Dim calc As New Calculator
            Dim calcRet As String = calc.DateCalculator(Request.QueryString("projid"))
            If Not calcRet = "0" Then
                lblmessage.Text = calcRet
                ModalPopupExtender2.Show()
            End If
        End If
        drawChart()

    End Sub
    Protected Sub gvTasks_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvTasks.RowDeleting
        Dim deletedtaskid As Integer = gvTasks.DataKeys(e.RowIndex).Value

        'get tasks precendent and order before deletion
        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskdt As New PefectFlight.tblPFTasksDataTable
        taskdt = taskadap.GetDataByTaskID(deletedtaskid)
        Dim row As PefectFlight.tblPFTasksRow = taskdt.Rows(0)

        UpdateTaskOrderAndPrecendentAfterDelete(row.TaskPrecedent, row.TaskOrder)

    End Sub

    Sub UpdateTaskOrderAndPrecendentAfterDelete(ByVal delprecedent As Integer, ByVal delorder As Integer)

        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable

        taskDT = taskadap.GetDataBy(Request.QueryString("ProjID"))

        For Each row As PefectFlight.tblPFTasksRow In taskDT

            If row.TaskPrecedent = delorder Then
                row.TaskPrecedent = delprecedent
            End If

        Next

        For Each row As PefectFlight.tblPFTasksRow In taskDT

            If row.TaskOrder > delorder Then
                row.TaskOrder = row.TaskOrder - 1

            End If

            If row.TaskPrecedent > delorder Then
                row.TaskPrecedent = row.TaskPrecedent - 1
            End If

        Next

        taskadap.Update(taskDT)
        Dim calc As New Calculator
        calc.DateCalculator(Request.QueryString("projid"))
        drawChart()

        ddlPrecedent.DataBind()
        ddlListOrder.DataBind()


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtFixedStart.Enabled = False

        If Not Page.IsPostBack Then

            Dim calc As New Calculator
            Dim calcRet As String = calc.DateCalculator(Request.QueryString("projid"))

            If Not calcRet = "0" Then
                lblmessage.Text = calcRet
                ModalPopupExtender2.Show()
            End If

            'allow the edit form view to bind to the first task so it can populate with the 0 for the precedent task
            'Dim mintaskadap As New PefectFlightTableAdapters.QueriesTableAdapter
            'If Not IsDBNull(mintaskadap.mintaskid(Request.QueryString("projid"))) Then
            '    odsTaskEdit.SelectParameters("taskid").DefaultValue = mintaskadap.mintaskid(Request.QueryString("projid"))
            'End If




        Else

        End If
        drawChart()


    End Sub

    Sub drawChart()

        seriesColl.Elements.Clear()

        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable

        taskDT = taskadap.GetDataBy(Request.QueryString("ProjID"))

        For Each row As PefectFlight.tblPFTasksRow In taskDT

            Dim ele As New Element
            ele.YDateTimeStart = row.TaskStartDate
            ele.YDateTime = row.TaskEndDate
            ele.Name = row.TaskName
            Dim anno As New Annotation
            anno.Label.Text = row.TaskResp
            ele.Annotation = anno

            seriesColl.Elements.Add(ele)

        Next

        'ganttChart.Title = "Project Gantt Chart"

        'ganttChart.SeriesCollection.Add(seriesColl)


        Dim chtAdap As New PefectFlightTableAdapters.ChartTasksTableAdapter
        Dim chtdt As New PefectFlight.ChartTasksDataTable
        chtdt = chtAdap.GetData(Request.QueryString("Projid"))

        ChartControl1.chtdatatable = chtdt

    End Sub
    Protected Sub odsTaskEdit_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles odsTaskEdit.Updated

        Dim calc As New Calculator
        Dim calcRet As String = calc.DateCalculator(Request.QueryString("projid"))
       
        gvTasks.DataBind()
        drawChart()
    End Sub

 


  

 
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'updateing a task

        '1 check that the new update doesnt cause any loops
        Dim ddlorder As DropDownList = fvEdit.Row.FindControl("ddleditorder")
        Dim ddlprecedent As DropDownList = fvEdit.FindControl("ddlEditPrecedent")

        Dim calc As New Calculator
        Dim retval As String
        retval = calc.checkForLoopsOnEditWithUpdate(Request.QueryString("projid"), fvEdit.DataKey.Value, ddlprecedent.SelectedValue, ddlorder.SelectedValue)

        If Not retval = "0" Then
            Dim lnkbtn As LinkButton = fvEdit.FindControl("UpdateButton")
            lnkbtn.CommandName = "Cancel"
            lblmessage.Text = retval
            ModalPopupExtender2.Show()
        Else

            calc.DateCalculator(Request.QueryString("projid"))
            gvTasks.DataBind()
            drawChart()

        End If

        'taken out as not required and also blocking updates of other task information




    End Sub

 
    Protected Sub cbFixedStart_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbFixedStart.CheckedChanged
        If cbFixedStart.Checked = True Then
            txtFixedStart.Enabled = True
        Else
            txtFixedStart.Enabled = False

        End If
    End Sub

    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click

        ModalPopupExtender2.Hide()


    End Sub
End Class
