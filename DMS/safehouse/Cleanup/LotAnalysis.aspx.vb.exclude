Imports dotnetCHARTING
Partial Class FrontEnd_DataAnalysis_LotAnalysis
    Inherits System.Web.UI.Page
    Public SC As New SeriesCollection

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged


    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                If e.Row.Cells(1).Text = "&nbsp;" Then
                    e.Row.Cells(1).Text = 0
                End If

                If e.Row.Cells(2).Text = "&nbsp;" Then
                    e.Row.Cells(2).Text = 0
                End If

                Dim Perf As Integer = e.Row.Cells(4).Text * 100 / ((e.Row.Cells(1).Text - e.Row.Cells(2).Text) * e.Row.Cells(3).Text)
                Dim Avail As Integer = (e.Row.Cells(1).Text - e.Row.Cells(2).Text) * 100 / e.Row.Cells(1).Text
                Dim OEE As Integer = Perf * Avail / 100

                e.Row.Cells(6).Text = Perf

                e.Row.Cells(7).Text = Avail

                e.Row.Cells(8).Text = OEE

                Dim s As New Series

                Dim ele1 As New Element
                Dim ele2 As New Element
                Dim ele3 As New Element

                'ele1.Name = e.Row.Cells(0).Text
                'ele1.YValue = e.Row.Cells(6).Text
                'ele1.Color = Drawing.Color.Blue
                's.Elements.Add(ele1)

                'ele2.Name = e.Row.Cells(0).Text
                'ele2.YValue = e.Row.Cells(7).Text
                'ele2.Color = Drawing.Color.Red
                's.Elements.Add(ele2)

                ele3.Name = e.Row.Cells(0).Text
                ele3.YValue = e.Row.Cells(8).Text
                ele3.Color = Drawing.Color.Green
                s.Elements.Add(ele3)
                SC.Add(s)

            End If

        Catch ex As Exception

            Dim hlp As New Helpers
            hlp.InsertError(ex.Message, Right(ex.StackTrace, 400), 1)

        End Try



    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView1.DataBind()
        Chart1.SeriesCollection.Add(SC)


    End Sub
End Class
