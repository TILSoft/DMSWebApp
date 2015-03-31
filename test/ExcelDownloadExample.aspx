<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ExcelDownloadExample.aspx.vb" Inherits="DataVisualisation_DowntimeSearch" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Downtime Search</h2>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3" valign="middle">
                Enter search term:&nbsp;
                <asp:TextBox ID="txtSearchTerm" runat="server"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
&nbsp;(Enter % to see all downtimes)</td>
            <td align="center" class="style3" valign="middle">
                <asp:LinkButton ID="lnkExport" runat="server">Export to Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="DowntimeID" 
                    DataSourceID="ODSDowntimeSearch">
                    <Columns>
                        <asp:BoundField DataField="DowntimeID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="DowntimeID" />
                        <asp:BoundField DataField="Rootloc" HeaderText="Rootloc" 
                            SortExpression="Rootloc" />
                        <asp:BoundField DataField="Downtimestart" HeaderText="Start Time" 
                            SortExpression="Downtimestart" />
                        <asp:BoundField DataField="Downtimeend" HeaderText="End Time" 
                            SortExpression="Downtimeend" />
                        <asp:BoundField DataField="totalDT" HeaderText="Total Downtime (mins)" 
                            SortExpression="totalDT" />
                        <asp:BoundField DataField="SymptomDesc" HeaderText="Symptom" 
                            SortExpression="SymptomDesc" />
                        <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause" 
                            SortExpression="RootCauseDesc" />
                        <asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy " 
                            SortExpression="RemedyDescription" />
                        <asp:HyperLinkField DataNavigateUrlFields="DowntimeID" 
                            DataNavigateUrlFormatString="paramsadjusted.aspx?downtimeID={0}" 
                            DataTextField="parametersAdj" HeaderText="Parameters" />
                        <asp:BoundField DataField="ActivityDesc" HeaderText="Activity" 
                            SortExpression="ActivityDesc" />
                        <asp:BoundField DataField="txtID" HeaderText="Lot No/CO number" 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="StartSign" HeaderText="Start Sign" 
                            SortExpression="StartSign" />
                        <asp:BoundField DataField="TechSign" HeaderText="Tech Sign" 
                            SortExpression="TechSign" />
                        <asp:BoundField DataField="EngSign" HeaderText="Eng Sign" 
                            SortExpression="EngSign" />
                        <asp:BoundField DataField="ExecSign" HeaderText="Exec Sign" 
                            SortExpression="ExecSign" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSDowntimeSearch" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySearch" 
                    TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearchTerm" Name="search" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

