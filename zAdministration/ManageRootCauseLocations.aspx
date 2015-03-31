<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false"
    CodeFile="ManageRootCauseLocations.aspx.vb" Inherits="zAdministration_ManageSymptomLocations"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 25%;
           
        }
   
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <table class="style1">
        <tr>
            <td class="style4" valign="top" colspan="2">
                <h2>
                    Root Cause locations and parameters</h2>
            </td>
        </tr>
        <tr>
            <td valign="top" style="width: 25%">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TreeView ID="TreeView1" runat="server">
                            <SelectedNodeStyle BackColor="Yellow" />
                        </asp:TreeView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td valign="top" class="style3">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <cc1:TabContainer ID="TabContainer1" runat="server" 
    ActiveTabIndex="1"
                    Width="100%">
                            <cc1:TabPanel runat="server" HeaderText="Manage Locations" ID="TabPanel1"><ContentTemplate><asp:FormView ID="FormView1" runat="server" DataKeyNames="LocID" DataSourceID="ObjectDataSource1"
                                DefaultMode="Insert"><EditItemTemplate><table class="style1"><tr><td width="50%" colspan="2"><h5>Edit A Location</h5></td></tr><tr><td width="50%">Location ID</td><td><asp:Label ID="LocIDLabel1" runat="server" Text='<%# Eval("LocID") %>' /></td></tr><tr><td>Description</td><td><asp:TextBox ID="LocDescriptionTextBox" runat="server" 
                                                            Text='<%# Bind("LocDescription") %>' Width="450px" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter a description" ControlToValidate="locdescriptiontextbox"></asp:RequiredFieldValidator></td></tr><tr><td>Parent ID</td><td><asp:TextBox ID="ParentLocIDTextBox" runat="server" Enabled="False" 
                                                            Text='<%# Bind("ParentLocID") %>' /></td></tr><tr><td>Downtime&#160; Type</td><td><asp:TextBox ID="DowntimeIDTextBox" runat="server" 
                                                            Text='<%# Bind("DowntimeID") %>' /></td></tr><tr><td>Lot Status</td><td><asp:TextBox ID="LotStatusTextBox" runat="server" Enabled="False" 
                                                            Text='<%# Bind("LotStatus") %>' /></td></tr><tr><td>Enabled</td><td><asp:CheckBox ID="LocationEnabledCheckBox" runat="server" 
                                                            Checked='<%# Bind("LocationEnabled") %>' /></td></tr><tr><td>Location Status</td><td><asp:TextBox ID="LocationStatusTextBox" runat="server" 
                                                            Text='<%# Bind("LocationStatus") %>' /></td></tr></table><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />&#160;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" /><br /><br /><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton></EditItemTemplate><InsertItemTemplate><table class="style1"><tr><td colspan="2"><h5>Insert a New Location</h5></td></tr><tr><td>Description</td><td><asp:TextBox ID="LocDescriptionTextBox" runat="server" 
                                                            Text='<%# Bind("LocDescription") %>' Width="450px" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter a description" ControlToValidate="locdescriptiontextbox"></asp:RequiredFieldValidator></td></tr><tr><td>Downtime&#160; Type</td><td><asp:TextBox ID="DowntimeIDTextBox" runat="server" 
                                                            Text='<%# Bind("DowntimeID") %>' Enabled="False" /></td></tr><tr><td>Lot Status</td><td><asp:TextBox ID="LotStatusTextBox" runat="server" Enabled="False" 
                                                            Text='<%# Bind("LotStatus") %>' /></td></tr><tr><td>Enabled</td><td><asp:CheckBox ID="LocationEnabledCheckBox" runat="server" 
                                                            Checked='<%# Bind("LocationEnabled") %>' /></td></tr><tr><td>Location Status</td><td><asp:TextBox ID="LocationStatusTextBox" runat="server" 
                                                            Text='<%# Bind("LocationStatus") %>' Enabled="False" /></td></tr></table><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" onclick="InsertButton_Click" />&#160;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" /><br /><br /><asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click"></asp:LinkButton></InsertItemTemplate><ItemTemplate>LocID: <asp:Label ID="LocIDLabel" runat="server" Text='<%# Eval("LocID") %>' /><br />LocDescription: <asp:Label ID="LocDescriptionLabel" runat="server" Text='<%# Bind("LocDescription") %>' /><br />ParentLocID: <asp:Label ID="ParentLocIDLabel" runat="server" Text='<%# Bind("ParentLocID") %>' /><br />DowntimeID: <asp:Label ID="DowntimeIDLabel" runat="server" Text='<%# Bind("DowntimeID") %>' /><br />LotStatus: <asp:Label ID="LotStatusLabel" runat="server" Text='<%# Bind("LotStatus") %>' /><br />LocationEnabled: <asp:CheckBox ID="LocationEnabledCheckBox" runat="server" Checked='<%# Bind("LocationEnabled") %>'
                                        Enabled="false" /><br />LocationStatus: <asp:Label ID="LocationStatusLabel" runat="server" Text='<%# Bind("LocationStatus") %>' /><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />&#160;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" />&#160;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" /></ItemTemplate></asp:FormView><asp:LinkButton ID="lnkRCLocationAdd" runat="server">Insert a new Root Cause location</asp:LinkButton><br /><br /><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID"
                                TypeName="LocationsTableAdapters.tblLocTableAdapter" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_LocID" Type="Int32" /></DeleteParameters><InsertParameters><asp:Parameter Name="LocDescription" Type="String" /><asp:Parameter Name="ParentLocID" Type="Int32" /><asp:Parameter Name="DowntimeID" Type="Int32" /><asp:Parameter Name="LotStatus" Type="Int32" /><asp:Parameter Name="LocationEnabled" Type="Boolean" /><asp:Parameter Name="LocationStatus" Type="Int32" /><asp:Parameter Name="ChangeOverStatus" Type="Int32" /></InsertParameters><SelectParameters><asp:ControlParameter ControlID="TreeView1" DefaultValue="" Name="locid" 
                                                PropertyName="SelectedValue" Type="Int32" /></SelectParameters><UpdateParameters><asp:Parameter Name="LocDescription" Type="String" /><asp:Parameter Name="ParentLocID" Type="Int32" /><asp:Parameter Name="DowntimeID" Type="Int32" /><asp:Parameter Name="LotStatus" Type="Int32" /><asp:Parameter Name="LocationEnabled" Type="Boolean" /><asp:Parameter Name="LocationStatus" Type="Int32" /><asp:Parameter Name="ChangeOverStatus" Type="Int32" /><asp:Parameter Name="Original_LocID" Type="Int32" /></UpdateParameters></asp:ObjectDataSource></ContentTemplate></cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Parameters for Location"><ContentTemplate><table class="style1"><tr><td><h5>Review this locations Parameters (For equipment only)</h5></td></tr><tr><td><asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ParamId" 
                                                    DataSourceID="ObjectDataSource2" Width="100%"><Columns><asp:CommandField ShowSelectButton="True" SelectText="Edit" /><asp:BoundField DataField="ParamDesc" HeaderText="Description " 
                                                            SortExpression="ParamDesc" /><asp:BoundField DataField="ParamUnit" HeaderText="Unit " 
                                                            SortExpression="ParamUnit" /><asp:CheckBoxField DataField="ParamEnabled" HeaderText="Enabled" 
                                                            SortExpression="ParamEnabled" /></Columns><EmptyDataTemplate>There are no Parameters for this location</EmptyDataTemplate></asp:GridView><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" 
                                                    TypeName="LocationsTableAdapters.tblParamTableAdapter"><SelectParameters><asp:ControlParameter ControlID="TreeView1" Name="locationId" 
                                                            PropertyName="SelectedValue" Type="Int32" /></SelectParameters></asp:ObjectDataSource></td></tr><tr><td><h5>&#160;</h5></td></tr><tr><td><asp:FormView ID="FormView2" runat="server" DataKeyNames="ParamId" 
                                                    DataSourceID="ObjectDataSource3" DefaultMode="Insert"><EditItemTemplate><table class="style1"><tr><td colspan="2"><h5>Edit Parameter</h5></td></tr><tr><td style="width: 50%">Param ID</td><td><asp:Label ID="ParamIdLabel1" runat="server" Text='<%# Eval("ParamId") %>' /></td></tr><tr><td>Description</td><td><asp:TextBox ID="ParamDescTextBox" runat="server" 
                                                                        Text='<%# Bind("ParamDesc") %>' /></td></tr><tr><td>Unit</td><td><asp:TextBox ID="ParamUnitTextBox" runat="server" 
                                                                        Text='<%# Bind("ParamUnit") %>' /></td></tr><tr><td>Location ID</td><td><asp:TextBox ID="LocationIDTextBox" runat="server" ReadOnly="True" 
                                                                        Text='<%# Bind("LocationID") %>' /></td></tr><tr><td>Enabled</td><td><asp:CheckBox ID="ParamEnabledCheckBox" runat="server" 
                                                                        Checked='<%# Bind("ParamEnabled") %>' /></td></tr><tr><td>&#160;</td></tr></table><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                            CommandName="Update" Text="Update" />&#160;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" /></EditItemTemplate><InsertItemTemplate ><table class="style1"><tr><td colspan="2"><h5>Insert a new parameter</h5></td></tr><tr><td>Description</td><td><asp:TextBox ID="ParamDescTextBox" runat="server" 
                                                                        Text='<%# Bind("ParamDesc") %>' /></td></tr><tr><td>Unit</td><td><asp:TextBox ID="ParamUnitTextBox" runat="server" 
                                                                        Text='<%# Bind("ParamUnit") %>' />
                                        <br />
                                        </td></tr><tr><td>Enabled</td><td><asp:CheckBox ID="ParamEnabledCheckBox" runat="server" 
                                                                        Checked='<%# Bind("ParamEnabled") %>' /></td></tr><tr><td>&#160;</td></tr></table><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="Insert" onclick="InsertButton_Click1" />&#160;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" /></InsertItemTemplate><ItemTemplate>ParamId: <asp:Label ID="ParamIdLabel" runat="server" Text='<%# Eval("ParamId") %>' /><br />ParamDesc: <asp:Label ID="ParamDescLabel" runat="server" 
                                                            Text='<%# Bind("ParamDesc") %>' /><br />ParamUnit: <asp:Label ID="ParamUnitLabel" runat="server" Text='<%# Bind("ParamUnit") %>' /><br />LocationID: <asp:Label ID="LocationIDLabel" runat="server" 
                                                            Text='<%# Bind("LocationID") %>' /><br />ParamEnabled: <asp:CheckBox ID="ParamEnabledCheckBox" runat="server" 
                                                            Checked='<%# Bind("ParamEnabled") %>' Enabled="false" /><br /></ItemTemplate></asp:FormView><asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Insert New Parameter</asp:LinkButton><br /></td></tr><tr><td><asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParamId" 
                                                    TypeName="LocationsTableAdapters.tblParamTableAdapter" 
                                                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_ParamId" Type="Int32" /></DeleteParameters><UpdateParameters><asp:Parameter Name="ParamDesc" Type="String" /><asp:Parameter Name="ParamUnit" Type="String" /><asp:Parameter Name="LocationID" Type="Int32" /><asp:Parameter Name="ParamEnabled" Type="Boolean" /><asp:Parameter Name="Original_ParamId" Type="Int32" /></UpdateParameters><SelectParameters><asp:ControlParameter ControlID="GridView1" Name="ParamId" 
                                                            PropertyName="SelectedValue" Type="Int32" /></SelectParameters><InsertParameters><asp:Parameter Name="ParamDesc" Type="String" /><asp:Parameter Name="ParamUnit" Type="String" /><asp:Parameter Name="LocationID" Type="Int32" /><asp:Parameter Name="ParamEnabled" Type="Boolean" /></InsertParameters></asp:ObjectDataSource></td></tr></table></ContentTemplate></cc1:TabPanel>
                        </cc1:TabContainer>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="TreeView1" 
                            EventName="SelectedNodeChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
        </table>
</asp:Content>
