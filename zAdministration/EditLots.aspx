<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EditLots.aspx.vb" Inherits="zAdministration_EditLots" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 67px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Edit Activities</h2>
            </td>
        </tr>
        <tr>
            <td width="10%" class="style2">
                Select the line</td>
            <td class="style2" width="100%">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="ODSloc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSloc" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByParentLocID" 
                    TypeName="LocationsTableAdapters.tblLocTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_LocID" Type="Int32" />
                    </DeleteParameters>
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
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="ParentLocID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LocDescription" Type="String" />
                        <asp:Parameter Name="ParentLocID" Type="Int32" />
                        <asp:Parameter Name="DowntimeID" Type="Int32" />
                        <asp:Parameter Name="LotStatus" Type="Int32" />
                        <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                        <asp:Parameter Name="LocationStatus" Type="Int32" />
                        <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="10%" class="style2">
                Select the Activity Type</td>
            <td class="style2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSActType" DataTextField="ActivityDesc" 
                    DataValueField="ActivityTypeID" RepeatDirection="Horizontal" 
                    BorderStyle="None" CellPadding="0" CellSpacing="10" Width="100%">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSActType" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="ActivityTableAdapters.tblActivityTypeTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActivityDesc" Type="String" />
                        <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                        <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActivityTypeID" Type="Int32" />
                        <asp:Parameter Name="ActivityDesc" Type="String" />
                        <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="Button1" runat="server" Text="Go" />
            </td>
        </tr>
        <tr>
            <td width="10%">
                Select the lot to edit</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ODSlots" 
                    DataTextField="txtID" DataValueField="ActivityID" AutoPostBack="True">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSlots" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByActivityTypeAndLocID" 
                    TypeName="ActivityTableAdapters.tblActivityTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="activitytype" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList2" Name="LocIDSymp" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ActivityID" 
                    DataSourceID="ODSActivityEdit" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    Activity ID</td>
                                <td>
                                    <asp:Label ID="ActivityIDLabel1" runat="server" enabled = "false"
                                        Text='<%# Eval("ActivityID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Activity type</td>
                                <td>
                                    <asp:TextBox ID="ActivityTypeTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("ActivityType") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Location ID</td>
                                <td>
                                    <asp:TextBox ID="LocIDSympTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("LocIDSymp") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Start Time</td>
                                <td>
                                    <asp:TextBox ID="StartTimeTextBox" runat="server" 
                                        Text='<%# Bind("StartTime") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Time</td>
                                <td>
                                    <asp:TextBox ID="endtimeTextBox" runat="server" Text='<%# Bind("endtime") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Details</td>
                                <td>
                                    <asp:TextBox ID="txtIDTextBox" runat="server" Text='<%# Bind("txtID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   Pre Activity ID</td>
                                <td>
                                    <asp:TextBox ID="PreActivityTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("PreActivity") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Post Activity ID</td>
                                <td>
                                    <asp:TextBox ID="PostActivityTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("PostActivity") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Format</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ODSFormat" 
                                        DataTextField="FormatDesc" DataValueField="FormatID" 
                                        SelectedValue='<%# Bind("Format") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ODSFormat" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataBylocIDAll" 
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
                                            <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="RadioButtonList2" Name="locid" 
                                                PropertyName="SelectedValue" Type="Int32" />
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
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Good Product</td>
                                <td>
                                    <asp:TextBox ID="GoodProductTextBox" runat="server" 
                                        Text='<%# Bind("GoodProduct") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Target Output</td>
                                <td>
                                    <asp:TextBox ID="TargetOutputTextBox" runat="server" 
                                        Text='<%# Bind("TargetOutput") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Waste Product</td>
                                <td>
                                    <asp:TextBox ID="WasteTextBox" runat="server" Text='<%# Bind("Waste") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Start Sign</td>
                                <td>
                                    <asp:TextBox ID="StartSignTextBox" runat="server"   enabled = "false"
                                        Text='<%# Bind("StartSign") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Start Sign Time</td>
                                <td>
                                    <asp:TextBox ID="StartSignTimeTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("StartSignTime") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Sign</td>
                                <td>
                                    <asp:TextBox ID="EndSignTextBox" runat="server" Text='<%# Bind("EndSign") %>' enabled = "false"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Sign time II</td>
                                <td>
                                    <asp:TextBox ID="EndSigntimeTextBox" runat="server" enabled = "false"
                                        Text='<%# Bind("EndSigntime") %>' />
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" onclick="UpdateButton_Click" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ActivityType:
                        <asp:TextBox ID="ActivityTypeTextBox" runat="server" 
                            Text='<%# Bind("ActivityType") %>' />
                        <br />
                        LocIDSymp:
                        <asp:TextBox ID="LocIDSympTextBox" runat="server" 
                            Text='<%# Bind("LocIDSymp") %>' />
                        <br />
                        StartTime:
                        <asp:TextBox ID="StartTimeTextBox" runat="server" 
                            Text='<%# Bind("StartTime") %>' />
                        <br />
                        endtime:
                        <asp:TextBox ID="endtimeTextBox" runat="server" Text='<%# Bind("endtime") %>' />
                        <br />
                        txtID:
                        <asp:TextBox ID="txtIDTextBox" runat="server" Text='<%# Bind("txtID") %>' />
                        <br />
                        PreActivity:
                        <asp:TextBox ID="PreActivityTextBox" runat="server" 
                            Text='<%# Bind("PreActivity") %>' />
                        <br />
                        PostActivity:
                        <asp:TextBox ID="PostActivityTextBox" runat="server" 
                            Text='<%# Bind("PostActivity") %>' />
                        <br />
                        Format:
                        <asp:TextBox ID="FormatTextBox" runat="server" Text='<%# Bind("Format") %>' />
                        <br />
                        GoodProduct:
                        <asp:TextBox ID="GoodProductTextBox" runat="server" 
                            Text='<%# Bind("GoodProduct") %>' />
                        <br />
                        TargetOutput:
                        <asp:TextBox ID="TargetOutputTextBox" runat="server" 
                            Text='<%# Bind("TargetOutput") %>' />
                        <br />
                        Waste:
                        <asp:TextBox ID="WasteTextBox" runat="server" Text='<%# Bind("Waste") %>' />
                        <br />
                        StartSign:
                        <asp:TextBox ID="StartSignTextBox" runat="server" 
                            Text='<%# Bind("StartSign") %>' />
                        <br />
                        StartSignTime:
                        <asp:TextBox ID="StartSignTimeTextBox" runat="server" 
                            Text='<%# Bind("StartSignTime") %>' />
                        <br />
                        EndSign:
                        <asp:TextBox ID="EndSignTextBox" runat="server" Text='<%# Bind("EndSign") %>' />
                        <br />
                        StartEndtime:
                        <asp:TextBox ID="StartEndtimeTextBox" runat="server" 
                            Text='<%# Bind("StartEndtime") %>' />
                        <br />
                        EndSigntime:
                        <asp:TextBox ID="EndSigntimeTextBox" runat="server" 
                            Text='<%# Bind("EndSigntime") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ActivityID:
                        <asp:Label ID="ActivityIDLabel" runat="server" 
                            Text='<%# Eval("ActivityID") %>' />
                        <br />
                        ActivityType:
                        <asp:Label ID="ActivityTypeLabel" runat="server" 
                            Text='<%# Bind("ActivityType") %>' />
                        <br />
                        LocIDSymp:
                        <asp:Label ID="LocIDSympLabel" runat="server" Text='<%# Bind("LocIDSymp") %>' />
                        <br />
                        StartTime:
                        <asp:Label ID="StartTimeLabel" runat="server" Text='<%# Bind("StartTime") %>' />
                        <br />
                        endtime:
                        <asp:Label ID="endtimeLabel" runat="server" Text='<%# Bind("endtime") %>' />
                        <br />
                        txtID:
                        <asp:Label ID="txtIDLabel" runat="server" Text='<%# Bind("txtID") %>' />
                        <br />
                        PreActivity:
                        <asp:Label ID="PreActivityLabel" runat="server" 
                            Text='<%# Bind("PreActivity") %>' />
                        <br />
                        PostActivity:
                        <asp:Label ID="PostActivityLabel" runat="server" 
                            Text='<%# Bind("PostActivity") %>' />
                        <br />
                        Format:
                        <asp:Label ID="FormatLabel" runat="server" Text='<%# Bind("Format") %>' />
                        <br />
                        GoodProduct:
                        <asp:Label ID="GoodProductLabel" runat="server" 
                            Text='<%# Bind("GoodProduct") %>' />
                        <br />
                        TargetOutput:
                        <asp:Label ID="TargetOutputLabel" runat="server" 
                            Text='<%# Bind("TargetOutput") %>' />
                        <br />
                        Waste:
                        <asp:Label ID="WasteLabel" runat="server" Text='<%# Bind("Waste") %>' />
                        <br />
                        StartSign:
                        <asp:Label ID="StartSignLabel" runat="server" Text='<%# Bind("StartSign") %>' />
                        <br />
                        StartSignTime:
                        <asp:Label ID="StartSignTimeLabel" runat="server" 
                            Text='<%# Bind("StartSignTime") %>' />
                        <br />
                        EndSign:
                        <asp:Label ID="EndSignLabel" runat="server" Text='<%# Bind("EndSign") %>' />
                        <br />
                        StartEndtime:
                        <asp:Label ID="StartEndtimeLabel" runat="server" 
                            Text='<%# Bind("StartEndtime") %>' />
                        <br />
                        EndSigntime:
                        <asp:Label ID="EndSigntimeLabel" runat="server" 
                            Text='<%# Bind("EndSigntime") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ODSActivityEdit" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByActivityID" 
                    TypeName="ActivityTableAdapters.tblActivityTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ActivityID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

