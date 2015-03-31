<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EditRemedyRootcause.aspx.vb" Inherits="zAdministration_EditRemedyRootcause2" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%--<%@ Register assembly="System.Web.Extensions, Version=3.6.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc2" %>
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                    Edit Root Cause</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="RootCauseID" DataSourceID="ODSRootCause" DefaultMode="Edit" 
                    Height="50px" Width="100%">
                    <Fields>
                        <asp:BoundField DataField="RootCauseID" HeaderText="RootCauseID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="RootCauseID" />
                        <asp:TemplateField HeaderText="RootCauseDesc" SortExpression="RootCauseDesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="60" Rows="5" 
                                    Text='<%# Bind("RootCauseDesc") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RootCauseDesc") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RootCauseDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SymptomID" SortExpression="SymptomID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="True" 
                                    Text='<%# Bind("SymptomID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SymptomID") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SymptomID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RootCauseLocID" SortExpression="RootCauseLocID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Enabled="False" 
                                    Text='<%# Bind("RootCauseLocID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RootCauseLocID") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("RootCauseLocID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSRootCause" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" 
                    SelectMethod="GetDataByRCID" 
                    TypeName="RootCauseRemedyTableAdapters.tblRootCauseTake2TableAdapter" 
                    UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_RootCauseID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RootCauseDesc" Type="String" />
                        <asp:Parameter Name="SymptomID" Type="Int32" />
                        <asp:Parameter Name="RootCauseLocID" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter SessionField="EditRCID" Name="rootcauseID" Type="Int32">
                        </asp:SessionParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RootCauseDesc" Type="String"></asp:Parameter>
                        <asp:Parameter Name="SymptomID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="RootCauseLocID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Original_RootCauseID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="50%" colspan="2">
                Root cause location path =
                <asp:Label ID="lblpath" runat="server"></asp:Label>
                                    </td>
        </tr>
        <tr>
            <td width="50%">
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td width="50%">
                Select a new root cause location</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td width="50%">
                1. Select Root Cause location</td>
            <td>
                2. Update Root cause id box</td>
        </tr>
        <tr>
            <td colspan="2" width="50%">
                <asp:Literal ID="litpath" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td rowspan="2" valign="top" width="50%">
                                    <asp:DataList ID="DataList1" runat="server" 
                    DataKeyField="LocID" DataSourceID="LocODS"
                                Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnLoc" runat="server" CommandArgument='<%# Eval("LocID") %>' Font-Size="X-Small"
                                        Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>'
                                        Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="LocODS" runat="server" DeleteMethod="Delete"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentLocID"
                                TypeName="LocationsTableAdapters.tblLocTableAdapter">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ParentLocID" SessionField="editbtnLocID" 
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
            </td>
            <td align="center" valign="top" width="50%">
                <asp:Button ID="BtnUpdateRCLoc" runat="server" 
                    Text="Update Root Cause, does not save!" />
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" width="50%">
                3. Dont forget to click the update button on the form to ensure the new root 
                cause is saved!!</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="lnkEditRem" runat="server">Edit Remedy</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

