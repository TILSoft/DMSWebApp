
Partial Class Controls_tester
    Inherits System.Web.UI.Page

    Protected Sub DrilldownControl1_ControlClicked(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DrilldownControl1.ControlClicked
        lbltext.Text = DrilldownControl1.locID


        Dim st As StringBuilder = New StringBuilder()
        st.Append("<script language=javascript>")
        st.Append("var w = window.open('tester.aspx','PopUpWindowName','width=1000, height=1000, menubar=yes, resizable=yes');")
        st.Append("w.focus()")
        st.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "ActPage", st.ToString())


    End Sub
End Class
