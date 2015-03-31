<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Top10Details.aspx.vb" Inherits="DataVisualisation_Top10Details" title="Untitled Page" %>

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
            <td>
                <h2>
                    Downtime drilldown list for Top 10 downtimes by root cause</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ODSdowntime" Width="100%" AllowSorting="True" 
                    DataKeyNames="DowntimeID">
                    <Columns>
                        <asp:BoundField DataField="Downtimestart" HeaderText="Start Time" 
                            SortExpression="Downtimestart" />
                        <asp:BoundField DataField="downtime" HeaderText="Total DT" ReadOnly="True" 
                            SortExpression="downtime" />
                        <asp:BoundField DataField="elapseddowntime" HeaderText="Elapsed DT" 
                            SortExpression="elapseddowntime" />
                        <asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                            SortExpression="RootCauseDesc" />
                        <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                            SortExpression="RemedyDescription" />
                        <asp:BoundField DataField="txtID" HeaderText="Lot / Change over" 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSdowntime" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="Top10TableAdapters.Top10byRCLocationDetailsTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="SympLocID" QueryStringField="SympLocID" 
                            Type="Int32" />
                        <asp:QueryStringParameter Name="start" QueryStringField="Starttime" 
                            Type="DateTime" />
                        <asp:QueryStringParameter Name="downtimeend" QueryStringField="Endtime" 
                            Type="DateTime" />
                        <asp:QueryStringParameter Name="rootcauselocid" QueryStringField="LocID" 
                            Type="Int32" />
                        <asp:QueryStringParameter Name="Activitytype" QueryStringField="ActType" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                Note:&nbsp; Elapsed downtime is the total downtime from start to end.&nbsp; 
                Total downtime is downtime which occured only during the shift<br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

