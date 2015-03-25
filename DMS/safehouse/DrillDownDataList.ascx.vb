
Partial Class Controls_DrillDownDataList
    Inherits System.Web.UI.UserControl
    Private _locid As Integer
    Private _initLocID As Integer
    Private _parentidstop As Integer
    Public mybtn As New LinkButton

    Public Property parentidstop() As Integer
        Get
            Return _parentidstop
        End Get
        Set(ByVal value As Integer)
            _parentidstop = value
        End Set
    End Property

    Public Property LocID() As Integer
        Get
            Return _locid
        End Get
        Set(ByVal value As Integer)
            _locid = value
        End Set
    End Property
    Public Property InitLocID() As Integer
        Get
            Return _initLocID
        End Get
        Set(ByVal value As Integer)
            _initLocID = value
        End Set
    End Property

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        _locid = e.CommandArgument
        LocODS.SelectParameters("parentlocid").DefaultValue = _locid
        getlocpath(_locid, _parentidstop)
        LocODS.Select()
        DataList1.DataBind()

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    


    End Sub





    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            LocODS.SelectParameters("parentlocid").DefaultValue = _initLocID
            DataList1.DataBind()
            '    getlocpath(_initLocID, _parentidstop)

        Else
            _locid = DataList1.SelectedValue

        End If


    End Sub

    Function getlocpath(ByVal locid As Integer, ByVal parentidstop As Integer) As String

        Dim lsitepath As String = ""
        Dim nodeval As Integer = locid

        Do Until nodeval = parentidstop

            Dim myadapter As New LocationsTableAdapters.tblLocTableAdapter
            Dim mydt As New Locations.tblLocDataTable
            mydt = myadapter.GetDataByLocID(nodeval)

            If mydt.Rows.Count > 0 Then

                Dim lnkPath As New LinkButton

                lnkPath.Text = mydt.Rows(0).Item("LocDescription") & " > "
                lnkPath.CommandArgument = mydt.Rows(0).Item("LocID")
                PHPath.Controls.Add(lnkPath)


                AddHandler lnkPath.Click, AddressOf LinkClick

                nodeval = mydt.Rows(0).Item("ParentLocID")

            Else

                Exit Function
            End If

        Loop

    End Function

    Sub LinkClick()


        '    _locid = lnkpath.commandargument

        LocODS.SelectParameters("parentlocid").DefaultValue = _locid
        LocODS.Select()
        getlocpath(_locid, _parentidstop)
        DataList1.DataBind()




    End Sub
End Class
