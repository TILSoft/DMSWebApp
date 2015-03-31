Imports System.Data.SqlClient
Imports Oracle.DataAccess.Client
Imports Oracle.DataAccess.Types
Partial Class zAdministration_AssetManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hlp As New Helpers
        If hlp.checkloginstatus(User.Identity.Name, 4) <= 0 Then
            Response.Redirect("AccessDenied.aspx")
        End If
    End Sub

    Protected Sub btnOutputTest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOutputTest.Click
        UpdateOutputValue()

    End Sub
    Sub UpdateOutputValue()

        Try
            Dim output As Object
            Dim adapAsset As New AssetTableAdapters.tblAssetTableAdapter
            Dim dtAsset As New Asset.tblAssetDataTable
            Dim AppendText As String



            'need to get the workstation ID not the asset id to select the appropriate one
            dtAsset = adapAsset.GetDataBy(CInt(RadioButtonList1.SelectedValue))

            Dim dtrow As Asset.tblAssetRow = dtAsset.Rows(0)
            Dim locadap As New LocationsTableAdapters.QueriesTableAdapter

            If IsDBNull(dtrow.OutputSQLvar1) Then
                AppendText = ""
            Else
                AppendText = dtrow.OutputSQLvar1
            End If

            Select Case dtrow.OutputCalcType

                Case 1 'Oracle connection

                    Dim oraConnString As String = dtrow.OutputConnString
                    Dim oraconn As New OracleConnection(oraConnString)

                    oraconn.Open()

                    Dim oraCmd As New OracleCommand

                    Dim sqlText As String = dtrow.OutputSQL
                    sqlText = findandreplaceVar(sqlText)

                    oraCmd.CommandText = sqlText
                    oraCmd.Connection = oraconn

                    Dim OraAdap As New OracleDataAdapter
                    Dim OraRead As OracleDataReader

                    OraRead = oraCmd.ExecuteReader

                    While OraRead.Read()
                        If Not OraRead.IsDBNull(0) Then

                            output = OraRead.GetDecimal(0)
                            lblOutputTest.Text = output & " " & AppendText

                        Else
                            lblOutputTest.Text = "Null"
                        End If

                    End While

                    oraconn.Close()



                Case 2 'SQL connection
                    Dim sqlconn As New SqlConnection
                    sqlconn.ConnectionString = dtrow.OutputConnString

                    sqlconn.Open()

                    Dim sqlText As String = dtrow.OutputSQL

                    sqlText = findandreplaceVar(sqlText)

                    Dim sqlcomm As New SqlCommand
                    sqlcomm.CommandText = sqlText
                    sqlcomm.Connection = sqlconn


                    Dim reader As SqlDataReader
                    reader = sqlcomm.ExecuteReader()

                    While reader.Read()

                        If reader.IsDBNull(0) Then
                            lblOutputTest.Text = "Null"
                        Else


                            output = reader.GetValue(0)
                            lblOutputTest.Text = CInt(output) & " " & AppendText

                        End If


                    End While

                    sqlconn.Close()



                Case 3 'DDE to excel connection


            End Select
        Catch ex As Exception
            lblOutputTest.Text = ex.Message

        End Try


    End Sub


    Function findandreplaceVar(ByVal sqltext As String) As String

        Dim newSQLtext As String
        Dim txtindex As Integer = sqltext.IndexOf("[batchid]")

        If txtindex > -1 Then
            newSQLtext = sqltext.Replace("[batchid]", txtOutputTest.Text)
            Return newSQLtext
        Else
            Return sqltext

        End If

    End Function

End Class
