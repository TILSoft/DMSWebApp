<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ConfigEdit.aspx.vb" Inherits="zAdministration_ConfigEdit" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Configuration Set up</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="ConfigID" DataSourceID="ODSConfig" 
                    Width="100%">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="ConfigID" HeaderText="ConfigID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ConfigID" />
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" 
                                    Text='<%# Bind("Description") %>' Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="value" HeaderText="value" SortExpression="value" />
                        <asp:BoundField DataField="dateval" HeaderText="dateval" 
                            SortExpression="dateval" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSConfig" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="ConfigurationTableAdapters.tblConfigTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ConfigID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="value" Type="String" />
                        <asp:Parameter Name="dateval" Type="DateTime" />
                        <asp:Parameter Name="Original_ConfigID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="value" Type="String" />
                        <asp:Parameter Name="dateval" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

