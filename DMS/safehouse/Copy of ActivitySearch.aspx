<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="Copy of ActivitySearch.aspx.vb" Inherits="DataVisualisation_ActivitySearch" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="4" class="style3">
                <h2>
                    Activity Search</h2>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                Enter your search term</td>
            <td>
                <asp:TextBox ID="txtSearc" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            </td>
            <td>
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
                        <asp:ControlParameter ControlID="txtSearc" Name="search" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

