
Partial Class Controls_DrilldownControl
    Inherits System.Web.UI.UserControl
    Private _locid As Integer
    Private _EndLocID As Integer
    Public Event ControlClicked(ByVal sender As Object, ByVal e As DataListCommandEventArgs)

#Region "Properties"
    Public Property locID() As Integer
        Get
            locID = _locid
        End Get
        Set(ByVal value As Integer)
            _locid = value
        End Set
    End Property
    Public Property EndLocID() As Integer
        Get
            EndLocID = _EndLocID
        End Get
        Set(ByVal value As Integer)
            _EndLocID = value
        End Set
    End Property
#End Region

    Public Sub DrillDataBind()

        DataList1.DataBind()
        SympPath.DataBind()

    End Sub
    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        locID = e.CommandArgument
        ODSLocPath.SelectParameters("StartLoc").DefaultValue = _locid
        ODSympLoc.SelectParameters("ParentLocID").DefaultValue = _locid
        DataList1.DataBind()
        SympPath.DataBind()
        RaiseEvent ControlClicked(source, e)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ODSLocPath.SelectParameters("StartLoc").DefaultValue = _locid
            '   ODSLocPath.SelectParameters("EndLoc").DefaultValue = _EndLocID
            ODSympLoc.SelectParameters("ParentLocID").DefaultValue = _locid
            DataList1.DataBind()
            SympPath.DataBind()
        End If

        'ODSLocPath.SelectParameters("EndLoc").DefaultValue = _EndLocID


    End Sub

    Protected Sub SympPath_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles SympPath.ItemCommand
        _locid = e.CommandArgument
        ODSLocPath.SelectParameters("StartLoc").DefaultValue = _locid
        ODSympLoc.SelectParameters("ParentLocID").DefaultValue = _locid
        DataList1.DataBind()
        SympPath.DataBind()
        RaiseEvent ControlClicked(source, e)
    End Sub

    Public Sub refDataBind()

        ODSLocPath.SelectParameters("StartLoc").DefaultValue = _locid
        ODSLocPath.SelectParameters("EndLoc").DefaultValue = _locid
        ODSympLoc.SelectParameters("ParentLocID").DefaultValue = _locid
        DataList1.DataBind()
        SympPath.DataBind()

    End Sub


End Class
