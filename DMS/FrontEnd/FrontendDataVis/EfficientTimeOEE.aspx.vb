Imports dotnetCHARTING
Partial Class DataVisualisation_OEEbyLine
    Inherits System.Web.UI.Page
    Dim seriesOEE As New dotnetCHARTING.Series
    Dim seriesDTR As New dotnetCHARTING.Series

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtEnd.Text = Now()
            txtStart.Text = DateAdd(DateInterval.Month, -1, Now())
        End If

        seriesOEE.Type = SeriesType.Line
        seriesOEE.Name = "OEE"
        seriesDTR.Type = SeriesType.Line
        seriesDTR.Name = "Downtime Rate"
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        chartOEE.SeriesCollection.Add(seriesOEE)
        chartOEE.SeriesCollection.Add(seriesDTR)
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            If cbDTR.Checked = True Then

                Dim eleDTR As New dotnetCHARTING.Element
                If e.Row.Cells(7).Text = "&nbsp;" Then
                Else

                    eleDTR.YValue = CInt(e.Row.Cells(7).Text)
                    eleDTR.Name = e.Row.Cells(0).Text
                    seriesDTR.AddElements(eleDTR)

                End If
            End If


            If cbOEE.Checked = True Then

                Dim eleOEE As New dotnetCHARTING.Element
                If e.Row.Cells(6).Text = "&nbsp;" Then
                Else

                    eleOEE.YValue = CInt(e.Row.Cells(6).Text)
                    eleOEE.Name = e.Row.Cells(0).Text
                    seriesOEE.AddElements(eleOEE)

                End If
            End If
        End If

    End Sub


    Protected Sub BtnGetData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnGetData.Click
        If DropDownList1.SelectedValue = "Months" Then

            OdsOEE.SelectMethod = "byMonth"
        End If


        GridView1.DataBind()

    End Sub


End Class
