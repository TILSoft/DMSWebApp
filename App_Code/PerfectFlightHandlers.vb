Imports Microsoft.VisualBasic

Public Class PerfectFlightHandlers

    Dim db As New PFLinqDataContext

    Sub CopyPFtoExecuteTable(ByVal Activityid As Integer, ByVal ExecuteStart As DateTime)


        'get the PFID from the activityID

        Dim PFID = From format In db.tblFormats Join activity In db.tblActivities _
                    On format.FormatID Equals activity.Format _
                    Where activity.ActivityID = Activityid _
                    Select (format.PFID)

        'get the PFID into a variable
        Dim intPFID As Integer = PFID.First

        'Select all the tasks for that PerfectFlight

        'insert into execute table and adjust times based on start time
        'start with the 0 precedent tasks then recursively loop to add all tasks to the task execute table

        Dim pfExeTasks = From pfTasks In db.tblPFTasks Where pfTasks.PFID = intPFID And pfTasks.TaskPrecedent = 0

        For Each task In pfExeTasks

            Call InsertToExecute(task.TaskID, ExecuteStart, Activityid, intPFID)

        Next


    End Sub

    Sub InsertToExecute(ByVal taskID As Integer, ByVal TaskStart As DateTime, ByVal ActivityID As Integer, ByVal intPFID As Integer)

        Dim pfExeTasks = From pfTasks In db.tblPFTasks Where pfTasks.TaskID = taskID

        For Each exeTask In pfExeTasks

            Dim task As New tblPFTasksExecute
            task.ActivityID = ActivityID
            task.PFID = exeTask.PFID
            task.TaskDuration = exeTask.TaskDuration
            task.TaskStartDate = TaskStart
            task.TaskEndDate = DateAdd(DateInterval.Minute, CInt(exeTask.TaskDuration), TaskStart)
            task.TaskName = exeTask.TaskName
            task.TaskOrder = exeTask.TaskOrder
            task.TaskID = exeTask.TaskID
            task.TaskPrecedent = exeTask.TaskPrecedent
            task.TaskResp = exeTask.TaskResp

            db.tblPFTasksExecutes.InsertOnSubmit(task)
            db.SubmitChanges()


            Dim pfNewExeTasks = From pfTasks In db.tblPFTasks Where pfTasks.PFID = intPFID And pfTasks.TaskPrecedent = task.TaskOrder

            For Each newTask In pfNewExeTasks

                Call InsertToExecute(newTask.TaskID, task.TaskEndDate, ActivityID, intPFID)

            Next


        Next

    End Sub

End Class
