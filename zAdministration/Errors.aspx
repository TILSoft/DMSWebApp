<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="Errors.aspx.vb" Inherits="zAdministration_Errors" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            <h2>
                Errors</h2>
        </td>
    </tr>
    <tr>
        <td width="100%">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" DataKeyNames="ErrorID" DataSourceID="ODSErrors" 
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="ErrorID" HeaderText="ErrorID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ErrorID" />
                    <asp:BoundField DataField="ErrorDesc" HeaderText="ErrorDesc" 
                        SortExpression="ErrorDesc" />
                    <asp:BoundField DataField="ErrorDescII" HeaderText="ErrorDescII" 
                        SortExpression="ErrorDescII" />
                    <asp:BoundField DataField="ErrorValue" HeaderText="ErrorValue" 
                        SortExpression="ErrorValue" />
                    <asp:BoundField DataField="ErrorDatetime" HeaderText="ErrorDatetime" 
                        SortExpression="ErrorDatetime" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ODSErrors" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="ErrorHandlingTableAdapters.tblErrorTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ErrorID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ErrorDesc" Type="String" />
                    <asp:Parameter Name="ErrorDescII" Type="String" />
                    <asp:Parameter Name="ErrorValue" Type="Int32" />
                    <asp:Parameter Name="ErrorDatetime" Type="DateTime" />
                    <asp:Parameter Name="Original_ErrorID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ErrorDesc" Type="String" />
                    <asp:Parameter Name="ErrorDescII" Type="String" />
                    <asp:Parameter Name="ErrorValue" Type="Int32" />
                    <asp:Parameter Name="ErrorDatetime" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
</asp:Content>

