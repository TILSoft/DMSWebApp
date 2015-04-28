
Partial Class zAdministration_CopyEntireLine
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        'copy all symptom locations

        copysymplocs(RadioButtonList1.SelectedValue)


        'copy all root cause locations


    End Sub

    Sub copysymplocs(ByVal locid As Integer)

        'copy base symptom location
        Dim Smaxid As Integer
        Dim Rmaxid As Integer
        Dim qadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim loclinkadap As New LocationsTableAdapters.tblLocLinkTableAdapter
        Dim locadap As New LocationsTableAdapters.tblLocTableAdapter
        Dim locdt As New Locations.tblLocDataTable

        locdt = locadap.GetDataByLocID(locid)

        For Each row As Locations.tblLocRow In locdt

            locadap.Insert(txtNewLine.Text, 1, 0, 0, True, 0, 0)
            Smaxid = qadap.MaxLocID()
            locadap.Insert(txtNewLine.Text, 0, 0, 0, True, 0, 0)
            Rmaxid = qadap.MaxLocID()
            loclinkadap.Insert(Rmaxid, Smaxid)

        Next

        symcopyloop(locid, Smaxid)

        Dim RClocid As Integer = qadap.GetRCLocIDFromSymptomLocID(locid)

        RCcopyloop(RClocid, Rmaxid)

        'create an activity for the line

        Dim actadap As New ActivityTableAdapters.tblActivityTableAdapter
        actadap.Insert(1, Smaxid, Now(), DateAdd(DateInterval.Day, 30, Now()), "StartLot", 0, 0, 0, 0, 0, 0, 0, Now(), 0, Now(), 0)
        Dim qact As New ActivityTableAdapters.QueriesTableAdapter
        Dim actid As Integer = qact.MaxActivityId

        qadap.UpdateLotStatusByLocID(actid, Smaxid)

        'create a new asset row for the copied line
        'insert a line into the asset table to keep track of the assets settings
        Dim Assetadap As New AssetTableAdapters.tblAssetTableAdapter
        Assetadap.Insert(txtNewLine.Text, Smaxid, 0, 0, 0, 0, 0, False, False, 0, "", "", "", 0, False)





    End Sub

    Sub symcopyloop(ByVal locid As Integer, ByVal NewID As Integer)

        Dim locadap As New LocationsTableAdapters.tblLocTableAdapter
        Dim locdt As New Locations.tblLocDataTable
        Dim sympadap As New LocationsTableAdapters.tblSymptomTableAdapter
        Dim sympdt As New Locations.tblSymptomDataTable

        Dim maxadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim maxid As Integer

        locdt = locadap.GetDataByParentLocID(locid)

        For Each row As Locations.tblLocRow In locdt

            locadap.Insert(row.LocDescription, NewID, 0, 0, row.LocationEnabled, 0, 0)
            maxid = maxadap.MaxLocID()

            'copy the symptoms for this location

            sympdt = sympadap.GetDataByLocID(row.LocID)

            For Each symrow As Locations.tblSymptomRow In sympdt

                Dim symptomDesc As String
                If IsDBNull(symrow.SymptomDesc) Then
                    symptomDesc = ""
                Else
                    symptomDesc = symrow.SymptomDesc
                End If

                sympadap.Insert(symptomDesc, maxid, symrow.DTType, symrow.SymptomEnabled, symrow.SymptomQuickClose)

            Next
            symcopyloop(row.LocID, maxid)
        Next


    End Sub

    Sub RCcopyloop(ByVal locid As Integer, ByVal NewID As Integer)

        Dim locadap As New LocationsTableAdapters.tblLocTableAdapter
        Dim locdt As New Locations.tblLocDataTable

        Dim paramadap As New LocationsTableAdapters.tblParamTableAdapter
        Dim paramdt As New Locations.tblParamDataTable

        Dim maxadap As New LocationsTableAdapters.QueriesTableAdapter
        Dim maxid As Integer

        locdt = locadap.GetDataByParentLocID(locid)

        For Each row As Locations.tblLocRow In locdt

            locadap.Insert(row.LocDescription, NewID, 0, 0, row.LocationEnabled, 0, 0)
            maxid = maxadap.MaxLocID()

            'copy the parameters over

            paramdt = paramadap.GetDataByLocID(row.LocID)

            For Each paramrow As Locations.tblParamRow In paramdt

                Dim paramUnit As String

                If IsDBNull(paramrow.ParamUnit) Then
                    paramUnit = ""
                Else
                    paramUnit = paramrow.ParamUnit
                End If


                paramadap.Insert(paramrow.ParamDesc, paramUnit, maxid, paramrow.ParamEnabled)
            Next

            RCcopyloop(row.LocID, maxid)

        Next


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If

    End Sub
End Class
