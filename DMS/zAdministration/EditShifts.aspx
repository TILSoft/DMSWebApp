<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false"
    CodeFile="EditShifts.aspx.vb" Inherits="zAdministration_ManageShifts" Title="Untitled Page"  MaintainScrollPositionOnPostback="True" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Edit Shifts<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <table class="style1">
                    <tr>
                        <td  valign="top">
                            1. Select Location</td>
                      <td>
                            2. Select start date/time</td>
                        <td>
                            3. Select end date/time</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td  valign="top" rowspan="3">
                            <asp:TreeView ID="TreeView1" runat="server">
                                <SelectedNodeStyle BackColor="Yellow" />
                            </asp:TreeView>
                        </td>
                      <td rowspan="3" valign="top">
                            <asp:Calendar ID="cldStart" runat="server" Font-Size="X-Small" Height="160px" 
                                Width="100%">
                            </asp:Calendar>
                            <asp:TextBox ID="txtStartTime" runat="server"></asp:TextBox>
                            
                            <cc1:maskededitextender ID="MaskedEditExtender6" runat="server"
            TargetControlID="txtStartTime" 
            Mask="99/99/9999 99:99:99"
            MaskType="DateTime"
            CultureName = "en-CA"
            ErrorTooltipEnabled="True" />
                        </td>
                        <td rowspan="3" valign="top">
                            <asp:Calendar ID="cldEnd" runat="server" Font-Size="X-Small" 
                                Height="160px" Width="100%">
                            </asp:Calendar>
                            <asp:TextBox ID="txtEndTime" runat="server"></asp:TextBox>
                            
                               <cc1:maskededitextender ID="MaskedEditExtender7" runat="server"
            TargetControlID="txtEndTime" 
            Mask="99/99/9999 99:99:99"
            MaskType="DateTime"
            CultureName = "en-CA"
            ErrorTooltipEnabled="True" />
                        </td>
                        <td>
                            &nbsp;
                            <asp:Label ID="lblmessage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_getShifts" runat="server" Text="Get Shifts" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td  valign="top">
                            &nbsp;</td>
                      <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                    </td>
                    </tr>
                     
                    <tr>
                        <td colspan="4" valign="top">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="shiftid" DataSourceID="ShiftsOutputODS"
                                Width="100%" EnableModelValidation="True">
                                <PagerSettings Mode="NumericFirstLast" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" 
                                        SelectText="Edit" />
                                    <asp:BoundField DataField="shiftid" HeaderText="shiftid" InsertVisible="False" ReadOnly="True"
                                        SortExpression="shiftid" />
                                    <asp:BoundField DataField="ShiftStart" HeaderText="ShiftStart" SortExpression="ShiftStart" />
                                    <asp:BoundField DataField="ShiftEnd" HeaderText="ShiftEnd" SortExpression="ShiftEnd" />
                                    <asp:BoundField DataField="ShiftTeam" HeaderText="ShiftTeam" SortExpression="ShiftTeam" />
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ShiftsOutputODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetDataBy1EndStartStartEnd" TypeName="ShiftsTableAdapters.tblShiftsTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_shiftid" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="ShiftStart" Type="DateTime" />
                                    <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                                    <asp:Parameter Name="ShiftTeam" Type="String" />
                                    <asp:Parameter Name="Original_shiftid" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cldEnd" Name="ShiftEndDate" 
                                        PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="cldStart" Name="shiftstartdate" 
                                        PropertyName="SelectedDate" Type="DateTime" />
                                    <asp:ControlParameter ControlID="TreeView1" Name="LocID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="ShiftStart" Type="DateTime" />
                                    <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                                    <asp:Parameter Name="ShiftTeam" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                     
                    <tr>
                        <td colspan="4" valign="top">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="shiftid" 
                                DataSourceID="ODSShiftsEdit" DefaultMode="Edit" Width="50%">
                                <EditItemTemplate>
                                    <table class="style3">
                                        <tr>
                                            <td>
                                                Shift ID
                                            </td>
                                            <td>
                                                <asp:Label ID="shiftidLabel1" runat="server" Text='<%# Eval("shiftid") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Location ID</td>
                                            <td>
                                                <asp:TextBox ID="LocIDTextBox" runat="server" Enabled="False" 
                                                    Text='<%# Bind("LocID") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Shift Start</td>
                                            <td>
                                                <asp:TextBox ID="ShiftStartTextBox" runat="server" 
                                                    Text='<%# Bind("ShiftStart") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Shift End</td>
                                            <td>
                                                <asp:TextBox ID="ShiftEndTextBox" runat="server" 
                                                    Text='<%# Bind("ShiftEnd") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Shift Team</td>
                                            <td>
                                                <asp:TextBox ID="ShiftTeamTextBox" runat="server" 
                                                    Text='<%# Bind("ShiftTeam") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                    &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" 
                                        CommandName="Update" onclick="UpdateButton_Click" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    LocID:
                                    <asp:TextBox ID="LocIDTextBox" runat="server" Text='<%# Bind("LocID") %>' />
                                    <br />
                                    ShiftStart:
                                    <asp:TextBox ID="ShiftStartTextBox" runat="server" 
                                        Text='<%# Bind("ShiftStart") %>' />
                                    <br />
                                    ShiftEnd:
                                    <asp:TextBox ID="ShiftEndTextBox" runat="server" 
                                        Text='<%# Bind("ShiftEnd") %>' />
                                    <br />
                                    ShiftTeam:
                                    <asp:TextBox ID="ShiftTeamTextBox" runat="server" 
                                        Text='<%# Bind("ShiftTeam") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    shiftid:
                                    <asp:Label ID="shiftidLabel" runat="server" Text='<%# Eval("shiftid") %>' />
                                    <br />
                                    LocID:
                                    <asp:Label ID="LocIDLabel" runat="server" Text='<%# Bind("LocID") %>' />
                                    <br />
                                    ShiftStart:
                                    <asp:Label ID="ShiftStartLabel" runat="server" 
                                        Text='<%# Bind("ShiftStart") %>' />
                                    <br />
                                    ShiftEnd:
                                    <asp:Label ID="ShiftEndLabel" runat="server" Text='<%# Bind("ShiftEnd") %>' />
                                    <br />
                                    ShiftTeam:
                                    <asp:Label ID="ShiftTeamLabel" runat="server" Text='<%# Bind("ShiftTeam") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="ODSShiftsEdit" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetDataByShiftID" 
                                TypeName="ShiftsTableAdapters.tblShiftsTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_shiftid" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="ShiftStart" Type="DateTime" />
                                    <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                                    <asp:Parameter Name="ShiftTeam" Type="String" />
                                    <asp:Parameter Name="Original_shiftid" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="shiftID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="ShiftStart" Type="DateTime" />
                                    <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                                    <asp:Parameter Name="ShiftTeam" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                     
                    <tr>
                        <td colspan="4" valign="top">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
