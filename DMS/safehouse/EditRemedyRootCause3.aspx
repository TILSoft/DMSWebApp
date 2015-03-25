<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EditRemedyRootCause.aspx.vb" Inherits="zAdministration_EditRemedyRootCause" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    Edit Remedy and Root Cause Data</h2>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" width="50%">
                Edit the Root Cause</td>
            <td style="text-align: center">
                Edit the Remedy</td>
        </tr>
        <tr>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsView1" runat="server" 
    AutoGenerateRows="False" DataKeyNames="RootCauseID" DataSourceID="ODSRootC" 
    DefaultMode="Edit" Height="50px" Width="100%">
                            <Fields>
                                <asp:BoundField DataField="RootCauseID" 
            HeaderText="Root Cause ID" InsertVisible="False" ReadOnly="True" 
            SortExpression="RootCauseID" />
                                <asp:TemplateField HeaderText="Description" 
            SortExpression="RootCauseDesc">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Height="120px" 
                    Text='<%# Bind("RootCauseDesc") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" 
                    Text='<%# Bind("RootCauseDesc") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RootCauseDesc") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SymptomID" 
            SortExpression="SymptomID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Enabled="False" 
                    Text='<%# Bind("SymptomID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" 
                    Text='<%# Bind("SymptomID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" 
                    Text='<%# Bind("SymptomID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location ID" 
            SortExpression="RootCauseLocID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Enabled="False" 
                    Text='<%# Bind("RootCauseLocID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" 
                    Text='<%# Bind("RootCauseLocID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" 
                    Text='<%# Bind("RootCauseLocID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" />
                            </Fields>
                        </asp:DetailsView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:ObjectDataSource ID="ODSRootC" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" 
                    TypeName="RootCauseRemedyTableAdapters.tblRootCauseTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_RootCauseID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RootCauseDesc" Type="String" />
                        <asp:Parameter Name="SymptomID" Type="Int32" />
                        <asp:Parameter Name="RootCauseLocID" Type="Int32" />
                        <asp:Parameter Name="Original_RootCauseID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="rootcauseID" SessionField="RCID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RootCauseDesc" Type="String" />
                        <asp:Parameter Name="SymptomID" Type="Int32" />
                        <asp:Parameter Name="RootCauseLocID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RemedyID" 
                    DataSourceID="ODSRemedy" DefaultMode="Edit" Width="100%">
                            <EditItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            Remedy ID</td>
                                        <td>
                                            <asp:Label ID="RemedyIDLabel1" runat="server" Text='<%# Eval("RemedyID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Remedy Desc</td>
                                        <td>
                                            <asp:TextBox ID="RemedyDescriptionTextBox" runat="server" Height="157px" 
                                        Text='<%# Bind("RemedyDescription") %>' TextMode="MultiLine" Width="100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Root Cause ID</td>
                                        <td>
                                            <asp:TextBox ID="RootCauseIDTextBox" runat="server" Enabled="False" 
                                        Text='<%# Bind("RootCauseID") %>' />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                RemedyDescription:
                                <asp:TextBox ID="RemedyDescriptionTextBox" runat="server" 
                            Text='<%# Bind("RemedyDescription") %>' />
                                <br />
                                RootCauseID:
                                <asp:TextBox ID="RootCauseIDTextBox" runat="server" 
                            Text='<%# Bind("RootCauseID") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                RemedyID:
                                <asp:Label ID="RemedyIDLabel" runat="server" Text='<%# Eval("RemedyID") %>' />
                                <br />
                                RemedyDescription:
                                <asp:Label ID="RemedyDescriptionLabel" runat="server" 
                            Text='<%# Bind("RemedyDescription") %>' />
                                <br />
                                RootCauseID:
                                <asp:Label ID="RootCauseIDLabel" runat="server" 
                            Text='<%# Bind("RootCauseID") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                            </ItemTemplate>
                        </asp:FormView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:ObjectDataSource ID="ODSRemedy" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" 
                    TypeName="RootCauseRemedyTableAdapters.tblRemedyTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_RemedyID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RemedyDescription" Type="String" />
                        <asp:Parameter Name="RootCauseID" Type="Int32" />
                        <asp:Parameter Name="Original_RemedyID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="remedyID" QueryStringField="Remedy" 
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RemedyDescription" Type="String" />
                        <asp:Parameter Name="RootCauseID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

