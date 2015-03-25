<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ShiftCopyWizard.aspx.vb" Inherits="zAdministration_ShiftCopyWizard" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Shift Copy Wizard</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="shiftid" 
                    DataSourceID="ShiftODS" Width="100%">
                    <PagerSettings Mode="NumericFirstLast" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="shiftid" HeaderText="shiftid" InsertVisible="False" 
                            ReadOnly="True" SortExpression="shiftid" />
                        <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID" />
                        <asp:BoundField DataField="ShiftStart" HeaderText="ShiftStart" 
                            SortExpression="ShiftStart" />
                        <asp:BoundField DataField="ShiftEnd" HeaderText="ShiftEnd" 
                            SortExpression="ShiftEnd" />
                        <asp:BoundField DataField="ShiftTeam" HeaderText="ShiftTeam" 
                            SortExpression="ShiftTeam" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ShiftODS" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" TypeName="ShiftsTableAdapters.tblShiftsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_shiftid" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="ShiftStart" Type="DateTime" />
                        <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                        <asp:Parameter Name="ShiftTeam" Type="Int32" />
                        <asp:Parameter Name="Original_shiftid" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="LocID" QueryStringField="LocID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="ShiftStart" Type="DateTime" />
                        <asp:Parameter Name="ShiftEnd" Type="DateTime" />
                        <asp:Parameter Name="ShiftTeam" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Follow the Steps in order, when done press copy</td>
            <td>
                <asp:Button ID="BtnReset" runat="server" Text="Reset All" />
            </td>
        </tr>
        <tr>
            <td>
                1. Select the first shift of the cycle
                <asp:Label ID="lblfirst" runat="server"></asp:Label>
                                    </td>
            <td>
                <asp:TextBox ID="txtfirst" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                2. Select the last shift of the cycle
                <asp:Label ID="lbllast" runat="server"></asp:Label>
                                    </td>
            <td>
                <asp:TextBox ID="txtlast" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                3. Enter the repeat period in hours (ie: 7 day repeat = 168hrs 4cycle = 216hrs)/td>
            <td>
                <asp:TextBox ID="TxtRepeatHours" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                4. Enter the number of repeat periods to copy</td>
            <td>
                <asp:TextBox ID="txtRepeats" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h2>
                    <asp:Button ID="btnCopy" runat="server" Text="Copy" OnClick = "btncopy_click" />
                   
                </h2> <asp:Label ID="lblmessage" ForeColor = "Red" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

