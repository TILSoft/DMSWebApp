<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" ValidateRequest="false" CodeFile="EditRemedy.aspx.vb" Inherits="zAdministration_EditRemedy" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="ODSRem" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="RootCauseRemedyTableAdapters.tblRemedyTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_RemedyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RemedyDescription" Type="String" />
            <asp:Parameter Name="RootCauseID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Remedy" Name="remedyID" Type="Int32">
            </asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RemedyDescription" Type="String"></asp:Parameter>
            <asp:Parameter Name="RootCauseID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Original_RemedyID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Edit Remedy</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="RemedyID" DataSourceID="ODSRem" DefaultMode="Edit" Height="50px" 
                    Width="100%">
                    <Fields>
                        <asp:BoundField DataField="RemedyID" HeaderText="RemedyID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="RemedyID" />
                        <asp:TemplateField HeaderText="RemedyDescription" 
                            SortExpression="RemedyDescription">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="99px" 
                                    Text='<%# Bind("RemedyDescription") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("RemedyDescription") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RemedyDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RootCauseID" SortExpression="RootCauseID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="False" 
                                    Text='<%# Bind("RootCauseID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RootCauseID") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("RootCauseID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:LinkButton ID="lnkRC" runat="server">Edit Root Cause</asp:LinkButton>
            </td>
        </tr>
    </table>
    <br />
   
</asp:Content>

