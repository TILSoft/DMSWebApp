<%@ Page Language="VB" MasterPageFile="~/wshome.master" AutoEventWireup="false" CodeFile="AllLinesStatus.aspx.vb" Inherits="DataVisFinal_AllLinesStatus" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    All lines Status</h2>
            </td>
        </tr>
        <tr>
            <td>
                Current time :
                <asp:Label ID="lbltime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataSourceID="ODSLinestatus">
                    <Columns>
                        <asp:BoundField DataField="LocDescription" HeaderText="Line" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="ActivityDesc" HeaderText="Activity type" 
                            SortExpression="ActivityDesc" />
                        <asp:BoundField DataField="StartTime" HeaderText="Activity Start time" 
                            SortExpression="StartTime" />
                        <asp:BoundField DataField="txtID" HeaderText="Lot or CO ID" 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="Downtimestart" HeaderText="Downtime start" 
                            SortExpression="Downtimestart">
                            <ItemStyle ForeColor="Red" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SymptomDesc" HeaderText="Downtime Symptom" 
                            SortExpression="SymptomDesc">
                            <ItemStyle ForeColor="Red" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="ShiftStart" HeaderText="Shift Start" 
                            SortExpression="ShiftStart" />
                        <asp:BoundField DataField="ShiftEnd" HeaderText="Shift End" 
                            SortExpression="ShiftEnd" />
                        <asp:BoundField DataField="ShiftTeam" HeaderText="Shift Team" 
                            SortExpression="ShiftTeam" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSLinestatus" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="LocationsTableAdapters.AllLinesStatusTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="parentlocid" Type="Int32" />
                        <asp:ControlParameter ControlID="lbltime" DefaultValue="now()" Name="time" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

