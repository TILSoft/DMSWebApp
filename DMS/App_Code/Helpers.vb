Imports Microsoft.VisualBasic

Public Class Helpers

    Public Function InsertError(ByVal desc1 As String, ByVal desc2 As String, ByVal descint As String) As Integer

        Dim ErrAdap As New ErrorHandlingTableAdapters.tblErrorTableAdapter
        Return ErrAdap.Insert(desc1, desc2, descint, Now())

    End Function

    Public Function checkForShiftCross1(ByVal startTime As DateTime, ByVal endTime As DateTime, ByVal locid As Integer) As Integer

        Dim shiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter

        Dim configadap As New ShiftsTableAdapters.QueriesTableAdapter
        Dim daysToAdd As Integer = CInt(configadap.ConfigID(2))

        'select all shifts with shift start time = starttime - daysToAdd days and endtime + dysToAdd days

        Dim shiftdt As New Shifts.tblShiftsDataTable
        shiftdt = shiftadap.GetDataByShiftStartAndEnd(DateAdd(DateInterval.Day, -daysToAdd, startTime), DateAdd(DateInterval.Hour, daysToAdd, endTime), locid)

        'need to check four scenarios
        For Each row As Shifts.tblShiftsRow In shiftdt

            'shift start is > current shift starts and shift end is < current shift end

            If row.ShiftStart >= startTime And row.ShiftEnd <= endTime Then
                Return row.shiftid
            End If

            'shift start is < current shift start and shift end is > current shift start
            If row.ShiftStart <= startTime And row.ShiftEnd >= startTime Then
                Return row.shiftid
            End If

            'shift start is < current shift end and shift end is > current shift end
            If row.ShiftStart <= endTime And row.ShiftEnd >= endTime Then
                Return row.shiftid
            End If

            'shift start is < current shift start and shift end if > current shift end
            If row.ShiftStart <= startTime And row.ShiftEnd >= endTime Then
                Return row.shiftid
            End If

        Next


        Return 0


    End Function

    Public Function checkForShiftCross(ByVal startTime As DateTime, ByVal endTime As DateTime, ByVal locid As Integer) As Integer

        Dim shiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter
        Dim shiftdt As New Shifts.tblShiftsDataTable

        shiftdt = shiftadap.GetDataBy1EndStartStartEnd(endTime, startTime, locid)

        If shiftdt.Rows.Count = 0 Then
            Return 0
        Else
            Return 1
        End If


    End Function
    Public Function checkForShiftCrossEdit(ByVal startTime As DateTime, ByVal endTime As DateTime, ByVal locid As Integer, ByVal shiftid As Integer) As Integer

        Dim shiftadap As New ShiftsTableAdapters.tblShiftsTableAdapter
        Dim shiftdt As New Shifts.tblShiftsDataTable

        shiftdt = shiftadap.GetDataBy1EndStartStartEnd(endTime, startTime, locid)

        If shiftdt.Rows.Count = 0 Then
            Return 0
        Else

            Dim i As Integer = shiftdt.Rows.Count

            For Each row As Shifts.tblShiftsRow In shiftdt

                If row.shiftid = shiftid Then
                    i = i - 1
                End If

            Next

            If i = 0 Then
                Return 0
            Else
                Return 1
            End If


        End If


    End Function
    Function getlocpath(ByVal locid As Integer, ByVal pageaddress As String) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = 0
            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then
                lsitepath = " <a href=" & pageaddress & "?Locid=" & mydt.Rows(0).Item("LocID") & ">" & mydt.Rows(0).Item("LocDescription") & "<a>  >  " & lsitepath
                nodeval = mydt.Rows(0).Item("ParentLocID")
            Else
                Exit Function
            End If

        Loop

        Return "<a href=" & pageaddress & "?Locid=0>Home<a> > " & lsitepath

    End Function
    Function getlocpath(ByVal locid As Integer, ByVal pageaddress As String, ByVal parentidstop As Integer) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = parentidstop
            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then
                lsitepath = " <a href=" & pageaddress & "?Locid=" & mydt.Rows(0).Item("LocID") & ">" & mydt.Rows(0).Item("LocDescription") & "<a>  >  " & lsitepath
                nodeval = mydt.Rows(0).Item("ParentLocID")
            Else
                Exit Function
            End If

        Loop

        Return lsitepath

    End Function
    Function getlocpathWithHome(ByVal locid As Integer, ByVal pageaddress As String, ByVal parentidstop As Integer) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = parentidstop
            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then
                lsitepath = " <a href=" & pageaddress & "?Locid=" & mydt.Rows(0).Item("LocID") & ">" & mydt.Rows(0).Item("LocDescription") & "<a>  >  " & lsitepath
                nodeval = mydt.Rows(0).Item("ParentLocID")
            Else
                Exit Function
            End If

        Loop

        Return "<a href=" & pageaddress & "?Locid=" & parentidstop & ">Home<a> > " & lsitepath

    End Function
    Function getlocpath(ByVal locid As Integer, ByVal pageaddress As String, ByVal appendage As String, ByVal parentidstop As Integer) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = parentidstop
            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then
                lsitepath = " <a href=" & pageaddress & "?Locid=" & mydt.Rows(0).Item("LocID") & appendage & ">" & mydt.Rows(0).Item("LocDescription") & "<a>  >  " & lsitepath
                nodeval = mydt.Rows(0).Item("ParentLocID")
            Else
                Exit Function
            End If

        Loop

        Return "<a href=" & pageaddress & "?Locid=" & parentidstop & appendage & ">Home<a> > " & lsitepath

    End Function


    Function getlocpathnolink(ByVal locid As Integer, ByVal FinalParentLocID As Integer) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = FinalParentLocID
            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then
                lsitepath = mydt.Rows(0).Item("LocDescription") & " > " & lsitepath
                nodeval = mydt.Rows(0).Item("ParentLocID")
            Else
                Exit Function
            End If

        Loop

        Return lsitepath

    End Function

    Function linestatus(ByVal Locid As Integer) As String

        Dim Locadap As New LocationsTableAdapters.tblLocTableAdapter
        Dim locdt As New Locations.tblLocDataTable

        locdt = Locadap.GetDataByLocID(Locid)
        Dim locrow As Locations.tblLocRow = locdt.Rows(0)

        Select Case locrow.LocationStatus
            Case 0

                Return "No Status"

            Case 1

                Return "Lot in Progress"
              

            Case 2

                Return "Changeover in Progress"
               
        End Select

    End Function


    Function FindRootLoc(ByVal locid As Integer, ByVal finalstop As Integer) As Integer

        Dim locadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim retlocid As Integer


        Do Until locid = finalstop
            retlocid = locid
            locid = locadap.ParentLocIDfromLocID(locid)

        Loop

        Return retlocid

    End Function


    Function checkloginstatus(ByVal username As String, ByVal level As Integer) As Integer

        Dim hlp As New Helpers

        Try

            Dim user As String = Right(username, Len(username) - 7)

            Dim useradap As New UsersTableAdapters.QueriesTableAdapter
            If useradap.UserNameCount(user) = 0 Then

                Return 0

            Else

                Dim userid As Integer = useradap.UserIdbyUserName(user)
                Dim userlevel As Integer = useradap.UserLevelbyIDno(userid)

                If userlevel >= level Then
                    Return userid
                End If

                Return -1

            End If

            Return 0

        Catch ex As Exception
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 0)
        End Try

    End Function



    Public Function ConfigData(ByVal configid As Integer) As Double


        Dim adapconfig As New ConfigTableAdapters.QueriesTableAdapter
        Dim cVal As Double = adapconfig.ValueFromConfigID(configid)

        Return cVal




    End Function


End Class
