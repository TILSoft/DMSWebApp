<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ActivitySearch.aspx.vb" Inherits="DataVisualisation_ActivitySearch" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
        
        }
        .style4
        {
            width: 1192px;
        }
        .style5
        {
        }
        .style6
        {
        }
        .style7
        {
        }
        .style8
        {
            width: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td colspan="4" class="style3">
                <h2>
                    Activity Search<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Start Date</td>
            <td align="left" class="style6">
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
            <td class="style7" width="25%">
                End Date</td>
            <td class="style8">
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtEnd">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Line</td>
            <td align="left" class="style6" colspan="3">
                <asp:RadioButtonList ID="RblLoc" runat="server" DataSourceID="ODSLoc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSLoc" runat="server" DeleteMethod="Delete" 
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
            <td class="style5" colspan="2" width="33%">
                Enter your search term</td>
            <td class="style7">
                <asp:TextBox ID="txtSearc" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            &nbsp;to select all enter %</td>
            <td class="style7" align="right">
                <asp:LinkButton ID="lnkExportExcel" runat="server">Export to Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="ActivityID" 
                    DataSourceID="ODSActivities">
                    <Columns>
                        <asp:BoundField DataField="ActivityID" HeaderText="ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ActivityID" />
                        <asp:BoundField DataField="ActivityDesc" HeaderText="Description" 
                            SortExpression="ActivityDesc" />
                        <asp:BoundField DataField="txtID" HeaderText="LotNo or Change over start" 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                            SortExpression="StartTime" />
                        <asp:BoundField DataField="endtime" HeaderText="End Time" 
                            SortExpression="endtime" />
<asp:BoundField DataField="ActualActivitytime" HeaderText="Activity time (mins)" 
                            SortExpression="ActualActivitytime"></asp:BoundField>
                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="GoodProduct" HeaderText="Good Product" 
                            SortExpression="GoodProduct" />
                        <asp:BoundField DataField="TargetOutput" HeaderText="Target Output" 
                            SortExpression="TargetOutput" />
                        <asp:BoundField DataField="Waste" HeaderText="Waste" SortExpression="Waste" />
                        <asp:BoundField DataField="Shifts" HeaderText="Shifts" 
                            SortExpression="Shifts" />
                        <asp:BoundField DataField="startsign" HeaderText="Start sign" 
                            SortExpression="startsign" />
                        <asp:BoundField DataField="StartSignTime" HeaderText="Start Sign Time" 
                            SortExpression="StartSignTime" />
                        <asp:BoundField DataField="endsign" HeaderText="End Sign" 
                            SortExpression="endsign" />
                        <asp:BoundField DataField="EndSigntime" HeaderText="End Sign time" 
                            SortExpression="EndSigntime" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSActivities" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBySearchTerm" 
                    TypeName="ActivityTableAdapters.ActivityDetailTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtStart" Name="starttime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="endtime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="RblLoc" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtSearc" Name="search" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

