<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="DowntimeSearch.aspx.vb" Inherits="DataVisualisation_DowntimeSearch" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
            <td colspan="4">
                <h2>
                    Downtime Search<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td align="left" class="style3" width="25%">
                Start Date</td>
            <td align="left" class="style3" width="25%">
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
            <td align="left" class="style3" width="25%">
                End Date</td>
            <td align="left" class="style3" width="25%">
                <asp:TextBox ID="Txtend" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtEnd">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td align="left" width="25%">
                Select Line</td>
            <td align="left" class="style3" colspan="3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSLoc" 
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
                        <asp:Parameter DefaultValue="0" Name="ParentLocID" Type="Int32" />
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
            <td align="center" valign="middle" colspan="3">
                Enter search term:&nbsp;
                <asp:TextBox ID="txtSearchTerm" runat="server"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
&nbsp;(Enter % to see all downtimes)</td>
            <td align="left" valign="middle">
                <asp:LinkButton ID="LnkExcelExport" runat="server">Export to Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="DowntimeID,RootCauseLocID" 
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
                        <asp:BoundField DataField="totalDT" HeaderText="Elapsed Downtime (mins)" 
                            SortExpression="totalDT" />
                        <asp:BoundField DataField="actualdowntime" HeaderText="Actual Downtime (mins)" 
                            SortExpression="actualdowntime" />
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
                        <asp:BoundField DataField="RootCauseLocID" HeaderText="RootCauseLocID" 
                            SortExpression="RootCauseLocID" />
                        <asp:TemplateField HeaderText="Location path"></asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSDowntimeSearch" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySearch" 
                    TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStart" Name="downtimestart" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="Txtend" Name="downtimeend" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtSearchTerm" Name="search" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="4">
                Notes:<br />
                <br />
                Elapsed downtime is the difference between the start of the downtime and the end 
                of the downtime<br />
                Actual downtime is only the downtime which coincides with a shift</td>
        </tr>
    </table>
</asp:Content>

