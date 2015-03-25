<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="OverallLotAnalysis.aspx.vb"  MaintainScrollPositionOnPostback ="true" Inherits="FrontEnd_DataAnalysis_LotAnalysis" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../../SafeHouse/testcontrol/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 270px;
        }
        .style3
        {
            height: 312px;
        }
        .style4
        {
            height: 356px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td colspan="5">
                                        <h2>
                                            Analysis by lot</h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                    </td>
                                    <td>
                                        Start Time</td>
                                    <td>
                                        <asp:TextBox ID="txtstart" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy hh:mm:ss" TargetControlID="txtstart">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td>
                                        End Time</td>
                                    <td>
                                        <asp:TextBox ID="txtend" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy hh:mm:ss" TargetControlID="txtEnd">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2" valign="top" width="25%" rowspan="2">
                                        <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                    DataSourceID="ODSLocID" Width="100%">
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                            Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>' 
                            Width="100%" />
                                                <br />
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:ObjectDataSource ID="ODSLocID" runat="server" DeleteMethod="Delete" 
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
                                    <td colspan="4" valign="top" width="100%" class="style3">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSLots" 
                    Width="1089px" DataKeyNames="LotID">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="LotNo" HeaderText="LotNo" SortExpression="LotNo" />
                                                <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                            SortExpression="FormatDesc" />
                                                <asp:BoundField DataField="LotStartTime" HeaderText="LotStartTime" 
                            SortExpression="LotStartTime" />
                                                <asp:BoundField DataField="LotEndTime" HeaderText="LotEndTime" 
                            SortExpression="LotEndTime" />
                                                <asp:BoundField DataField="lottime" HeaderText="lottime" 
                            SortExpression="lottime" />
                                                <asp:BoundField DataField="downtime" HeaderText="downtime" 
                            SortExpression="downtime" />
                                                <asp:BoundField DataField="runtime" HeaderText="runtime" 
                            SortExpression="runtime" />
                                                <asp:BoundField DataField="theooutput" HeaderText="theooutput" 
                            SortExpression="theooutput" />
                                                <asp:BoundField DataField="actualoutput" HeaderText="actualoutput" 
                            SortExpression="actualoutput" />
                                                <asp:BoundField DataField="PerfPerc" HeaderText="PerfPerc" ReadOnly="True" 
                            SortExpression="PerfPerc" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ODSLots" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisTableAdapters.LotPerformanceDataTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="SymLocID" SessionField="LotLocID" Type="Int32" />
                                                <asp:SessionParameter Name="RcLocID" SessionField="LotRCLocID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtstart" Name="PeriodStart" 
                            PropertyName="Text" Type="DateTime" />
                                                <asp:ControlParameter ControlID="txtend" Name="PeriodEnd" PropertyName="Text" 
                            Type="DateTime" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" valign="top" width="100%" class="style4">
                                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
                    Width="100%">
                                            <cc1:TabPanel runat="server" HeaderText="Time Line" ID="TabPanel1">
                                                <ContentTemplate>
                                                    <table >
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Down time</td>
                                                            <td>
                                                                <uc1:WebUserControl ID="TimelineDT" runat="server" width = 800 colour = red/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Shift time</td>
                                                            <td>
                                                                <uc1:WebUserControl ID="timelineshift" runat="server" width="800" Colour = green />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Lot time</td>
                                                            <td>
                                                                <uc1:WebUserControl ID="Timelinelot" runat="server" width="800" Colour = orange />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TDowntime Descriptions">
                                                <HeaderTemplate>
                                                    Downtime Descriptions
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="ODSDT">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                                    SortExpression="Downtimestart" />
                                                                        <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                                                    SortExpression="Downtimeend" />
                                                                        <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                                    SortExpression="RemedyDescription" />
                                                                        <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                                    SortExpression="RootCauseDesc" />
                                                                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                    SortExpression="LocDescription" />
                                                                        <asp:BoundField DataField="SymptomDesc" HeaderText="SymptomDesc" 
                                                    SortExpression="SymptomDesc" />
                                                                        <asp:BoundField DataField="dtime" HeaderText="dtime" ReadOnly="True" 
                                                    SortExpression="dtime" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <asp:ObjectDataSource ID="ODSDT" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataBetweenDates" 
                                            TypeName="DataAnalysisTableAdapters.DetailsMediumByLocTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="locid" SessionField="LotRCLocID" Type="Int32" />
                                                                        <asp:SessionParameter Name="downtimend" SessionField="LotEndTime" 
                                                    Type="DateTime" />
                                                                        <asp:SessionParameter Name="downtimstart" SessionField="LotStartTime" 
                                                    Type="DateTime" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Performance Data">
                                                <ContentTemplate>
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                                                    DataSourceID="ODSOEE">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="DataIDname" HeaderText="DataIDname" 
                                                                            SortExpression="DataIDname" />
                                                                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <asp:ObjectDataSource ID="ODSOEE" runat="server" 
                                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                                    TypeName="DataAnalysisTableAdapters.OEEdataTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="LocID" SessionField="LotLocID" Type="Int32" />
                                                                        <asp:SessionParameter Name="RClocID" SessionField="LotRCLocID" Type="Int32" />
                                                                        <asp:SessionParameter Name="StartDate" SessionField="LotStartTime" 
                                                                            Type="DateTime" />
                                                                        <asp:SessionParameter Name="EndDate" SessionField="LotEndTime" 
                                                                            Type="DateTime" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

