Imports Microsoft.VisualBasic

Public Class Calculator

    Function DateCalculator(ByVal projid As Integer) As String
        'Get project start date or 0 precedent start date
        Try

            Dim projadap As New PefectFlightTableAdapters.QueriesTableAdapter
            Dim projstartdate As DateTime
            'Get all data for a project
            Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
            Dim taskDT As New PefectFlight.tblPFTasksDataTable
            Dim LoopChk As New ArrayList

            Dim days(100, 3) As Integer

            taskDT = taskadap.GetDataBy(projid)

            For Each row As PefectFlight.tblPFTasksRow In taskDT

                LoopChk.Clear()

                Dim WorkingDaysToStart As Integer = 0

                'set DTrow(0) = current task
                Dim DTrow As Array = taskDT.Select("TaskID=" & row.TaskID)
                Dim i As Integer = 0


                Do Until DTrow(0).TaskPrecedent = 0 Or DTrow(0).taskfixedstart = True

                    i = i + 1

                    If LoopChk.Contains(DTrow(0).TaskOrder) Then

                        Throw New ArgumentException("You have a looped precedent at step " & DTrow(0).TaskOrder)

                    End If

                    LoopChk.Add(row.TaskOrder)

                    'calc number of working days back to 0 precedent
                    DTrow = taskDT.Select("Taskorder=" & DTrow(0).TaskPrecedent)

                    'add days and elapsed status to the days array so we can calculate backwards from the start of the project to the start of the task in question
                    'tjhis works backwards from the current task to the 0 precedent so the data is in reverse in the array

                    days(i, 1) = DTrow(0).taskduration

                    If DTrow(0).taskelapseddays = False Then
                        days(i, 2) = 0
                    Else
                        days(i, 2) = 1
                    End If


                Loop

                If DTrow(0).taskfixedstart = True Then
                    projstartdate = DTrow(0).taskstartdate
                Else
                    projstartdate = projadap.GetPFStartTime(projid)
                End If

                'adjust days from days array to give the correct number of days to task start time
                Dim startdate As DateTime = projstartdate
                Dim enddate As DateTime = projstartdate

                Do Until i < 1
                      'if a day is elapsed just add the number of days
                    enddate = DateAdd(DateInterval.Minute, days(i, 1), startdate)
                      startdate = enddate
                    'work backwards through the array as the highest number will be the 0 precedent and is where the calculation should start
                    i = i - 1
                Loop



                'adjust working days from project start to allow for weekends and non working days

                row.TaskStartDate = enddate

             
                row.TaskEndDate = DateAdd(DateInterval.Minute, row.TaskDuration, row.TaskStartDate)


            Next

            taskadap.Update(taskDT)

            ' set end date of project

            Return 0


        Catch ex As Exception

            Return ex.Message

        End Try




    End Function





    Function checkForLoops(ByVal projid As Integer, ByVal taskid As Integer, ByVal taskprecedent As Integer) As String

        Dim projadap As New PefectFlightTableAdapters.QueriesTableAdapter
        Dim projstartdate As DateTime = projadap.GetPFStartTime(projid)

        'Get all data for a project
        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable
        Dim LoopChk As New ArrayList

        'clear the datatable from last use
        taskDT.Clear()

        'fill the data table
        taskDT = taskadap.GetDataBy(projid)


        'set the precedent of the row to be updated to the new precedent, the value is not updated yet
        Dim myrow As PefectFlight.tblPFTasksRow
        myrow = taskDT.Rows.Find(taskid)
        myrow.TaskPrecedent = taskprecedent

        'check each row in taskDT for conflicts
        For Each row As PefectFlight.tblPFTasksRow In taskDT

            LoopChk.Clear()

            'set DTrow(0) = current task
            Dim DTrow As Array = taskDT.Select("TaskID=" & row.TaskID)


            Do Until DTrow(0).TaskPrecedent = 0

                If LoopChk.Contains(DTrow(0).TaskOrder) Then

                    Return "Sorry, changing the precedent will cause a looped tasks situation, please choose another precedent.  Task ID: " & DTrow(0).TaskOrder

                End If

                LoopChk.Add(row.TaskOrder)
                DTrow = taskDT.Select("Taskorder=" & DTrow(0).TaskPrecedent)

            Loop


        Next


        Return 0



    End Function

    Function checkForLoopsOnEditWithUpdate(ByVal projid As Integer, ByVal taskid As Integer, ByVal taskprecedent As Integer, ByVal taskorder As Integer) As String

        Dim projadap As New PefectFlightTableAdapters.QueriesTableAdapter
        Dim projstartdate As DateTime = projadap.GetPFStartTime(projid)

        'Get all data for a project
        Dim taskadap As New PefectFlightTableAdapters.tblPFTasksTableAdapter
        Dim taskDT As New PefectFlight.tblPFTasksDataTable
        Dim LoopChk As New ArrayList

        'clear the datatable from last use
        taskDT.Clear()

        'fill the data table
        taskDT = taskadap.GetDataBy(projid)


        'set the precedent of the row to be updated to the new precedent, the value is not updated yet
        Dim editrow As PefectFlight.tblPFTasksRow
        editrow = taskDT.Rows.Find(taskid)
        Dim oldtaskorder As Integer = editrow.TaskOrder
        editrow.TaskPrecedent = taskprecedent
        editrow.TaskOrder = taskorder

        'update all the other rows as required


        For Each row As PefectFlight.tblPFTasksRow In taskDT

            If Not row.TaskID = taskid Then
                If row.TaskOrder >= taskorder And row.TaskOrder < oldtaskorder Then
                    row.TaskOrder = row.TaskOrder + 1
                End If
            End If

            If row.TaskPrecedent >= taskorder And row.TaskPrecedent < oldtaskorder Then
                row.TaskPrecedent = row.TaskPrecedent + 1
            End If

        Next

        'check each row in taskDT for conflicts
        For Each chkrow As PefectFlight.tblPFTasksRow In taskDT

            LoopChk.Clear()

            'set DTrow(0) = current task
            Dim DTrow As Array = taskDT.Select("TaskID=" & chkrow.TaskID)


            Do Until DTrow(0).TaskPrecedent = 0

                If LoopChk.Contains(DTrow(0).TaskOrder) Then

                    Return "Sorry, changing the precedent will cause a looped tasks situation, please choose another precedent.  Task ID: " & DTrow(0).TaskOrder

                End If

                LoopChk.Add(chkrow.TaskOrder)
                DTrow = taskDT.Select("Taskorder=" & DTrow(0).TaskPrecedent)

            Loop


        Next

        taskadap.Update(taskDT)
        Return 0



    End Function


End Class


