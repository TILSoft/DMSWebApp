<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false"
    CodeFile="ManageSymptomLocations.aspx.vb" Inherits="zAdministration_ManageSymptomLocations"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register assembly="System.Web.Extensions, Version=3.6.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc2" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 188px;
        }
        .style2
        {
            width: 50%;
            height: 657px;
        }
        .style3
        {
            height: 657px;
        }
        .style4
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style4" valign="top" colspan="2">
                <h2>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    Symptom Locations and Descriptions</h2>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top" style="width: 30%">
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
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
                            Width="100%">
                            <cc1:TabPanel runat="server" HeaderText="Manage Locations" ID="TabPanel1">
                                <ContentTemplate>
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LocID" DataSourceID="ObjectDataSource1"
                                        DefaultMode="Insert" Width="100%">
                                        <EditItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td width="50%" colspan="2">
                                                        <h5>
                                                            Edit A Location
                                                        </h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="50%">
                                                        Location ID
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LocIDLabel1" runat="server" Text='<%# Eval("LocID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Description
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LocDescriptionTextBox" runat="server" Text='<%# Bind("LocDescription") %>'
                                                            Width="450px" /><br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LocDescriptionTextBox"
                                                            ErrorMessage="You must enter a location description"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Parent ID
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ParentLocIDTextBox" runat="server" Enabled="False" Text='<%# Bind("ParentLocID") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Downtime ID
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="DowntimeIDTextBox" runat="server" Text='<%# Bind("DowntimeID") %>'
                                                            Enabled="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Lot Status
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LotStatusTextBox" runat="server" Text='<%# Bind("LotStatus") %>'
                                                            Enabled="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Enabled
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="LocationEnabledCheckBox" runat="server" Checked='<%# Bind("LocationEnabled") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Location Status
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LocationStatusTextBox" runat="server" Text='<%# Bind("LocationStatus") %>'
                                                            Enabled="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                Text="Update" OnClick="UpdateButton_Click2" />&#160;<asp:LinkButton ID="UpdateCancelButton"
                                                    runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /><br />
                                            <br />
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Insert a New Symptom Location</asp:LinkButton><br />
                                            <br />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td colspan="2">
                                                        <h5>
                                                            Insert a New Location
                                                        </h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:CheckBox ID="cboxRoot" runat="server" />&#160;Check this box to insert a root
                                                        location
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Description
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LocDescriptionTextBox" runat="server" Text='<%# Bind("LocDescription") %>'
                                                            Width="450px" /><br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LocDescriptionTextBox"
                                                            ErrorMessage="You must enter a location description"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Lot Status
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LotStatusTextBox" runat="server" Enabled="False" Text='<%# Bind("LotStatus") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Enabled
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="LocationEnabledCheckBox" runat="server" Checked='<%# Bind("LocationEnabled") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Location Status
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="LocationStatusTextBox" runat="server" Text='<%# Bind("LocationStatus") %>'
                                                            Enabled="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                Text="Insert" OnClick="InsertButton_Click" />&#160;<asp:LinkButton ID="InsertCancelButton"
                                                    runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /><br />
                                            <br />
                                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"></asp:LinkButton></InsertItemTemplate>
                                        <ItemTemplate>
                                            LocID:
                                            <asp:Label ID="LocIDLabel" runat="server" Text='<%# Eval("LocID") %>' /><br />
                                            LocDescription:
                                            <asp:Label ID="LocDescriptionLabel" runat="server" Text='<%# Bind("LocDescription") %>' /><br />
                                            ParentLocID:
                                            <asp:Label ID="ParentLocIDLabel" runat="server" Text='<%# Bind("ParentLocID") %>' /><br />
                                            DowntimeID:
                                            <asp:Label ID="DowntimeIDLabel" runat="server" Text='<%# Bind("DowntimeID") %>' /><br />
                                            LotStatus:
                                            <asp:Label ID="LotStatusLabel" runat="server" Text='<%# Bind("LotStatus") %>' /><br />
                                            LocationEnabled:
                                            <asp:CheckBox ID="LocationEnabledCheckBox" runat="server" Checked='<%# Bind("LocationEnabled") %>'
                                                Enabled="false" /><br />
                                            LocationStatus:
                                            <asp:Label ID="LocationStatusLabel" runat="server" Text='<%# Bind("LocationStatus") %>' /><br />
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" />&#160;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                                    CommandName="Delete" Text="Delete" />&#160;<asp:LinkButton ID="NewButton" runat="server"
                                                        CausesValidation="False" CommandName="New" Text="New" /></ItemTemplate>
                                    </asp:FormView>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID"
                                        TypeName="LocationsTableAdapters.tblLocTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="LocDescription" Type="String" />
                                            <asp:Parameter Name="ParentLocID" Type="Int32" />
                                            <asp:Parameter Name="DowntimeID" Type="Int32" />
                                            <asp:Parameter Name="LotStatus" Type="Int32" />
                                            <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                            <asp:Parameter Name="LocationStatus" Type="Int32" />
                                            <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="TreeView1" DefaultValue="" Name="locid" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="LocDescription" Type="String" />
                                            <asp:Parameter Name="ParentLocID" Type="Int32" />
                                            <asp:Parameter Name="DowntimeID" Type="Int32" />
                                            <asp:Parameter Name="LotStatus" Type="Int32" />
                                            <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                            <asp:Parameter Name="LocationStatus" Type="Int32" />
                                            <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Symptoms for Location">
                                <ContentTemplate>
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <h5>
                                                    Review this locations symptoms</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                                    AutoGenerateColumns="False" DataKeyNames="SymptomID" DataSourceID="ObjectDataSource2"
                                                    Width="100%" EnableModelValidation="True">
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                                                        <asp:BoundField DataField="SymptomDesc" HeaderText="Symptom" SortExpression="SymptomDesc" />
                                                        <asp:BoundField DataField="DTType" HeaderText="Down Time Type" SortExpression="DTType" />
                                                        <asp:CheckBoxField DataField="SymptomEnabled" HeaderText="Enabled" SortExpression="SymptomEnabled" />
                                                        <asp:CheckBoxField DataField="SymptomQuickClose" HeaderText="Quick Close" SortExpression="SymptomQuickClose" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        There are no Symptoms for this location</EmptyDataTemplate>
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblSymptomTableAdapter"
                                                    InsertMethod="Insert" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="SymptomDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="DTType" Type="Int32" />
                                                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="TreeView1" Name="LocID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="SymptomDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="DTType" Type="Int32" />
                                                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &#160;&#160;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>
                                                    &#160;</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FormView ID="FormView2" runat="server" DataKeyNames="SymptomID" DataSourceID="ObjectDataSource3"
                                                    DefaultMode="Insert" EnableModelValidation="True">
                                                    <EditItemTemplate>
                                                        <h5>
                                                            Edit&#160;Symptom</h5>
                                                        <table class="style1">
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    Symptom ID
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="SymptomIDLabel1" runat="server" Text='<%# Eval("SymptomID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="SymptomDescTextBox" runat="server" Text='<%# Bind("SymptomDesc") %>'
                                                                        Width="436px" /><br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Loc ID
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="LocIDTextBox" runat="server" ReadOnly="True" Text='<%# Bind("LocID") %>'
                                                                        Enabled="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    DT Type
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("DTType") %>'>
                                                                        <asp:ListItem Value="1">Normal Stop</asp:ListItem>
                                                                        <asp:ListItem Value="2">Short Stop</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="SymptomEnabledCheckBox" runat="server" Checked='<%# Bind("SymptomEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Quick Close
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="SymptomQuickCloseCheckBox" runat="server" Checked='<%# Bind("SymptomQuickClose") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &#160;
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SymptomDescTextBox"
                                                                        ErrorMessage="You must enter a symptom description" ValidationGroup="5"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                            Text="Update" ValidationGroup="5" />&#160;<asp:LinkButton ID="UpdateCancelButton"
                                                                runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /><br />
                                                        <br />
                                                        <br />
                                                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Insert New Symptom</asp:LinkButton><br />
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <table class="style1">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5>
                                                                        Insert a symptom</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="SymptomDescTextBox" runat="server" Text='<%# Bind("SymptomDesc") %>'
                                                                        Width="436px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    DT Type
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("DTType") %>'>
                                                                        <asp:ListItem Value="1">Normal Stop</asp:ListItem>
                                                                        <asp:ListItem Value="2">Short Stop</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="SymptomEnabledCheckBox" runat="server" Checked='<%# Bind("SymptomEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Quick Close
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="SymptomQuickCloseCheckBox" runat="server" Checked='<%# Bind("SymptomQuickClose") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &#160;
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SymptomDescTextBox"
                                                                        ErrorMessage="You must enter a symptom description" ValidationGroup="3"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                            OnClick="InsertButton_Click1" Text="Insert" ValidationGroup="3" />&#160;<asp:LinkButton
                                                                ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancel" /><br />
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        SymptomID:
                                                        <asp:Label ID="SymptomIDLabel" runat="server" Text='<%# Eval("SymptomID") %>' /><br />
                                                        SymptomDesc:
                                                        <asp:Label ID="SymptomDescLabel" runat="server" Text='<%# Bind("SymptomDesc") %>' /><br />
                                                        LocID:
                                                        <asp:Label ID="LocIDLabel" runat="server" Text='<%# Bind("LocID") %>' /><br />
                                                        DTType:
                                                        <asp:Label ID="DTTypeLabel" runat="server" Text='<%# Bind("DTType") %>' /><br />
                                                        SymptomEnabled:
                                                        <asp:CheckBox ID="SymptomEnabledCheckBox" runat="server" Checked='<%# Bind("SymptomEnabled") %>'
                                                            Enabled="false" /><br />
                                                        <br />
                                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                                            Text="Delete" /></ItemTemplate>
                                                </asp:FormView>
                                                DT type :&#160; 1 = unplanned, 2 = planned<br />
                                                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySymptomID"
                                                    TypeName="LocationsTableAdapters.tblSymptomTableAdapter" InsertMethod="Insert"
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="SymptomDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="DTType" Type="Int32" />
                                                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="GridView1" Name="SymptomID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="SymptomDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="DTType" Type="Int32" />
                                                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Manage Formats">
                                <ContentTemplate>
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <h5>
                                                    Review formats for this location</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="FromatGV" runat="server" AllowPaging="True" AllowSorting="True"
                                                    AutoGenerateColumns="False" DataKeyNames="FormatID" DataSourceID="formatsODS"
                                                    Width="100%" EnableModelValidation="True">
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                                                        <asp:BoundField DataField="FormatDesc" HeaderText="Description" SortExpression="FormatDesc" />
                                                        <asp:BoundField DataField="OperationRatePerMin" HeaderText="Operation Rate Per Min"
                                                            SortExpression="OperationRatePerMin" />
                                                        <asp:BoundField DataField="OperatiionRateBatch" HeaderText="Standard Batch Duration"
                                                            SortExpression="OperatiionRateBatch" />
                                                        <asp:BoundField DataField="StdEfficientTime" HeaderText="StdEfficientTime" SortExpression="StdEfficientTime" />
                                                        <asp:CheckBoxField DataField="FormatEnabled" HeaderText="Enabled" SortExpression="FormatEnabled" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        There are no formats for this location. To create one click &quot;Add new format&quot;</EmptyDataTemplate>
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="formatsODS" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetDataByLocIDandActivityAll" TypeName="LocationsTableAdapters.tblFormatTableAdapter">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="TreeView1" Name="LocID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:Parameter DefaultValue="1" Name="activityType" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FormView ID="formatsFV" runat="server" DataKeyNames="FormatID" DataSourceID="formatsEditDS"
                                                    DefaultMode="Insert" EnableModelValidation="True">
                                                    <EditItemTemplate>
                                                        <table class="style1">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5>
                                                                        Edit Format</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50%">
                                                                    ID
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="FormatIDLabel1" runat="server" Text='<%# Eval("FormatID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescTextBox" runat="server" Text='<%# Bind("FormatDesc") %>'
                                                                        Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Long Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescLongText" runat="server" Text='<%# Bind("FormatLongDescription") %>'
                                                                        TextMode="MultiLine" Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Location ID
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="LocIDTextBox" runat="server" ReadOnly="True" 
                                                                        Text='<%# Bind("LocID") %>' Enabled="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Operation rate per min
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="OperationRatePerMinTextBox" runat="server" Text='<%# Bind("OperationRatePerMin") %>' /><asp:RegularExpressionValidator
                                                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="OperationRatePerMinTextBox"
                                                                        ErrorMessage="Number must be a decimal " ValidationExpression="^((\d{1,8})\.(\d{1,3}))$"
                                                                        ValidationGroup="6"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Standard Batch time(mins)
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="OperatiionRateBatchTextBox" runat="server" Text='<%# Bind("OperatiionRateBatch") %>' /><asp:RegularExpressionValidator
                                                                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="OperatiionRateBatchTextBox"
                                                                        ErrorMessage="Number must be a decimal " ValidationExpression="^((\d{1,8})\.(\d{1,3}))$"
                                                                        ValidationGroup="6"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Output Multiplier</td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox4" runat="server" 
                                                                        Text='<%# Bind("outputMultiplier") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>SET</td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StdEfficientTime", "{0:N}") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="FormatEnabledCheckBox" runat="server" Checked='<%# Bind("FormatEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                            Text="Update" OnClick="UpdateButton_Click1" ValidationGroup="6" />&#160;<asp:LinkButton
                                                                ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancel" /><br />
                                                        <br />
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <table class="style1" style="width: 75%">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5>
                                                                        Insert a new format</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescTextBox" runat="server" Text='<%# Bind("FormatDesc") %>'
                                                                        Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Long Description</td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescLongText" runat="server" 
                                                                        Text='<%# Bind("FormatLongDescription") %>' TextMode="MultiLine" 
                                                                        Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Operation rate per min
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="OperationRatePerMinTextBox" runat="server" Text='<%# Bind("OperationRatePerMin") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Normal Batch time (do not use)
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="OperatiionRateBatchTextBox" runat="server" Text='<%# Bind("OperatiionRateBatch") %>' />
                                                                    <asp:RegularExpressionValidator
                                                                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="OperationRatePerMinTextBox"
                                                                        ErrorMessage="Number must be a decimal " ValidationExpression="^((\d{1,8})\.(\d{1,2}))$"
                                                                        ValidationGroup="1" Enabled="False"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Output multiplier</td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox4" runat="server" 
                                                                        Text='<%# Bind("outputMultiplier") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>SET</td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StdEfficientTime", "{0:N}") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="FormatEnabledCheckBox" runat="server" Checked='<%# Bind("FormatEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                            OnClick="InsertButton_Click2" Text="Insert" ValidationGroup="1" />&#160;<asp:LinkButton
                                                                ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancel" /></InsertItemTemplate>
                                                    <ItemTemplate>
                                                        FormatID:
                                                        <asp:Label ID="FormatIDLabel" runat="server" Text='<%# Eval("FormatID") %>' /><br />
                                                        FormatDesc:
                                                        <asp:Label ID="FormatDescLabel" runat="server" Text='<%# Bind("FormatDesc") %>' /><br />
                                                        LocID:
                                                        <asp:Label ID="LocIDLabel" runat="server" Text='<%# Bind("LocID") %>' /><br />
                                                        OperationRatePerMin:
                                                        <asp:Label ID="OperationRatePerMinLabel" runat="server" Text='<%# Bind("OperationRatePerMin") %>' /><br />
                                                        OperatiionRateBatch:
                                                        <asp:Label ID="OperatiionRateBatchLabel" runat="server" Text='<%# Bind("OperatiionRateBatch") %>' /><br />
                                                        FormatEnabled:
                                                        <asp:CheckBox ID="FormatEnabledCheckBox" runat="server" Checked='<%# Bind("FormatEnabled") %>'
                                                            Enabled="false" /><br />
                                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                            Text="Edit" />&nbsp;&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                                                CommandName="Delete" Text="Delete" />&nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server"
                                                                    CausesValidation="False" CommandName="New" Text="New" /></ItemTemplate>
                                                </asp:FormView>
                                                <asp:ObjectDataSource ID="formatsEditDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="LocationsTableAdapters.tblFormatTableAdapter"
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                        <asp:Parameter Name="FormatLongDescription" Type="String" />
                                                        <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                                        <asp:Parameter Name="PFID" Type="Int32" />
                                                        <asp:Parameter Name="StdEfficientTime" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="FromatGV" Name="FormatID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                        <asp:Parameter Name="FormatLongDescription" Type="String" />
                                                        <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                                        <asp:Parameter Name="PFID" Type="Int32" />
                                                        <asp:Parameter Name="StdEfficientTime" Type="Int32" />
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:ObjectDataSource>
                                                <br />
                                                <asp:LinkButton ID="lnkFormatInsert" runat="server">Insert a new format</asp:LinkButton><br />
                                                <br />
                                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &#160;&#160;
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="Change Over Types">
                                <ContentTemplate>
                                    <table class="style5" width="100%">
                                        <tr>
                                            <td>
                                                <h5>
                                                    Select your Changeover for this line</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%">
                                                <asp:ObjectDataSource ID="ODSChangeOvers" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocIDandActivityAll"
                                                    TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="TreeView1" Name="locid" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:Parameter DefaultValue="2" Name="activityType" Type="Int32" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:ObjectDataSource>
                                                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    DataKeyNames="FormatID" DataSourceID="ODSChangeOvers" AllowSorting="True" Width="100%">
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True" />
                                                        <asp:BoundField DataField="FormatID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                            SortExpression="FormatID" />
                                                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" SortExpression="FormatDesc" />
                                                        <asp:CheckBoxField DataField="FormatEnabled" HeaderText="Enabled" SortExpression="FormatEnabled" />
                                                        <asp:BoundField DataField="StdPersonnel" HeaderText="Std. Personnel" SortExpression="StdPersonnel" />
                                                        <asp:BoundField DataField="StdTime" HeaderText="Std. Time" SortExpression="StdTime" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &#160;&#160;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FormView ID="FVCOtype" runat="server" DataKeyNames="FormatID" DataSourceID="ODSChangeOverEdit"
                                                    DefaultMode="Insert" Width="100%">
                                                    <EditItemTemplate>
                                                        <table class="style5">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5>
                                                                        Edit Changeover type</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Format ID
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="FormatIDLabel1" runat="server" Text='<%# Eval("FormatID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescTextBox" runat="server" Text='<%# Bind("FormatDesc") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Long description</td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescLongText" runat="server" 
                                                                        Text='<%# Bind("FormatLongDescription") %>' TextMode="MultiLine" 
                                                                        Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Standard Personnel
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="StdPersonnelTextBox" runat="server" Text='<%# Bind("StdPersonnel") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Standard Time
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="StdTimeTextBox" runat="server" Text='<%# Bind("StdTime") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="FormatEnabledCheckBox" runat="server" Checked='<%# Bind("FormatEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &#160;&#160;
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                        OnClick="UpdateButton_Click" Text="Update" ValidationGroup="2" />&#160;&#160;<asp:LinkButton
                                                                            ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                            Text="Cancel" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <table class="style5">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5>
                                                                        Insert a new Changeover type</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Description
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FormatDesc") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Long Description</td>
                                                                <td>
                                                                    <asp:TextBox ID="FormatDescLongText" runat="server" 
                                                                        Text='<%# Bind("FormatLongDescription") %>' TextMode="MultiLine" 
                                                                        Width="450px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Standard Personnel
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StdPersonnel") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Standard Time
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StdTime") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Output Multiplier</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Enabled
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("FormatEnabled") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &#160;&#160;
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                            OnClick="InsertButton_Click4" Text="Insert" ValidationGroup="2" />&#160;<asp:LinkButton
                                                                ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancel" /></InsertItemTemplate>
                                                    <ItemTemplate>
                                                        FormatID:
                                                        <asp:Label ID="FormatIDLabel" runat="server" Text='<%# Eval("FormatID") %>' /><br />
                                                        FormatDesc:
                                                        <asp:Label ID="FormatDescLabel" runat="server" Text='<%# Bind("FormatDesc") %>' /><br />
                                                        LocID:
                                                        <asp:Label ID="LocIDLabel" runat="server" Text='<%# Bind("LocID") %>' /><br />
                                                        OperationRatePerMin:
                                                        <asp:Label ID="OperationRatePerMinLabel" runat="server" Text='<%# Bind("OperationRatePerMin") %>' /><br />
                                                        OperatiionRateBatch:
                                                        <asp:Label ID="OperatiionRateBatchLabel" runat="server" Text='<%# Bind("OperatiionRateBatch") %>' /><br />
                                                        FormatEnabled:
                                                        <asp:CheckBox ID="FormatEnabledCheckBox" runat="server" Checked='<%# Bind("FormatEnabled") %>'
                                                            Enabled="false" /><br />
                                                        StdPersonnel:
                                                        <asp:Label ID="StdPersonnelLabel" runat="server" Text='<%# Bind("StdPersonnel") %>' /><br />
                                                        StdTime:
                                                        <asp:Label ID="StdTimeLabel" runat="server" Text='<%# Bind("StdTime") %>' /><br />
                                                        ActivityType:
                                                        <asp:Label ID="ActivityTypeLabel" runat="server" Text='<%# Bind("ActivityType") %>' /><br />
                                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                            Text="Edit" />&#160;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                                                CommandName="Delete" Text="Delete" />&#160;<asp:LinkButton ID="NewButton" runat="server"
                                                                    CausesValidation="False" CommandName="New" Text="New" /></ItemTemplate>
                                                </asp:FormView>
                                                <asp:ObjectDataSource ID="ODSChangeOverEdit" runat="server" DeleteMethod="Delete"
                                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy"
                                                    TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                        <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                                        <asp:Parameter Name="FormatLongDescription" Type="String" />
                                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="GridView3" Name="FormatID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                                        <asp:Parameter Name="LocID" Type="Int32" />
                                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                                        <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                                        <asp:Parameter Name="StdTime" Type="Int32" />
                                                        <asp:Parameter Name="ActivityType" Type="Int32" />
                                                        <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                                        <asp:Parameter Name="FormatLongDescription" Type="String" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Root Cause Links">
                                <ContentTemplate>
                                    Use this table to check the symptom location has connected correctly to the root
                                    cause location Symptom locations have a parent loc id of 1, Root cause locations
                                    have a parent loc id of 0<br />
                                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGeneratColumns="False"
                                        DataSourceID="RootLinkODS" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="sympdesc" HeaderText="Symptom Location" SortExpression="sympdesc" />
                                            <asp:BoundField DataField="Rootdesc" HeaderText="Root Cause Location" SortExpression="Rootdesc" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="RootLinkODS" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="LocationsTableAdapters.tblloclinkdetailTableAdapter">
                                    </asp:ObjectDataSource>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="TreeView1" EventName="SelectedNodeChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1" valign="top" style="width: 30%">
                &nbsp;
            </td>
            <td valign="top">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
