Imports System.ComponentModel

Partial Class Controls_BoSelecta
    Inherits System.Web.UI.UserControl
    Private _lineID, _Formattype As Integer
    <Bindable(True)> <Browsable(True)> <Category("Data")> _
        Public Property LineID() As Integer
        Get
            Return _lineID
        End Get
        Set(ByVal value As Integer)
            _lineID = value

        End Set
    End Property
    <Bindable(True)> _
    Public Property FormatType() As Integer
        Get
            Return _Formattype
        End Get
        Set(ByVal value As Integer)
            _Formattype = value

        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LineAdap As New LocationsTableAdapters.QueriesTableAdapter
        'odsFormats.SelectParameters("LocID").DefaultValue = _lineID
        'odsFormats.SelectParameters("activityType").DefaultValue = _Formattype
        'CheckBoxList1.DataBind()
        Label1.Text = _lineID 'LineAdap.LocDescFromLocID(_lineID)
    End Sub

End Class
