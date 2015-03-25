<%@ Page Language="VB" MasterPageFile="~/wshome.master" AutoEventWireup="false" CodeFile="WSHome.aspx.vb"
    Inherits="FrontEnd_WSHome" Title="DMS Home" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnetCHARTING" %>
<%@ Register Src="../controls/timeline.ascx" TagName="WebUserControl" TagPrefix="uc1" %>
<%@ Register Src="../Controls/TimeLine2.ascx" TagName="TimeLine2" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <table class="style1">
        <tr>
            <td width="30%">
                <h2>
                    WorkStation Home</h2>
            </td>
            <td align="right">
                <asp:LinkButton ID="lnkAllLines" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px">Lines List</asp:LinkButton>
                &nbsp;&nbsp;
                &nbsp;&nbsp;
                &nbsp;&nbsp;
                </td>
            <td align="right">
                <asp:Menu ID="Menu1" runat="server" BorderStyle="Solid" BorderWidth="2px">
                    <Items>
                        <asp:MenuItem Text="Data Analysis" Value="Data Analysis">
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/DowntimeDrilldownbyLocation.aspx"
                                Text="Downtime by Location" Value="Downtime by Location"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/Top10Downtimes.aspx" Text="Top 10 Downtimes"
                                Value="Top 10 Downtimes"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/OEEbyLine.aspx" Text="OEE"
                                Value="OEE"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/DowntimeEngNoteSearch.aspx"
                                Text="Downtime EngNote Search" Value="Downtime EngNote Search"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/ChangeOver Comparison.aspx"
                                Text="Change over comparison" Value="Change over comparison"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table class="style1" style="border-style: double">
                <tr>
                    <td width="15%">
                        <b>Work Station</b>
                    </td>
                    <td width="35%" colspan="2">
                        <asp:Label ID="lblWorkStation" runat="server"></asp:Label>
                        <asp:Label ID="lblWorkstationID" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td width="15%">
                        <b>Date/Time</b>
                    </td>
                    <td width="35%">
                        <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbltxtID" runat="server" Style="font-weight: 700"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblLot" runat="server"></asp:Label>
                    </td>
                    <td align="right">
                        &nbsp;
                    </td>
                    <td>
                        <b>Shift No</b>
                    </td>
                    <td>
                        Team:
                        <asp:Label ID="lblShift" runat="server"></asp:Label>
                        &nbsp;Start :
                        <asp:Label ID="lblShiftStart" runat="server"></asp:Label>
                        &nbsp;End :
                        <asp:Label ID="lblShiftEnd" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="border-bottom-style: double; border-bottom-color: #0000FF">
                    <td>
                        <b>Format</b>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblFormat" runat="server"></asp:Label>
                    </td>
                    <td>
                        <b>Line Status</b>
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="border-bottom-style: double; border-bottom-color: #0000FF">
                    <td>
                        <b>Downtime Status</b>
                    </td>
                    <td colspan="4">
                        <asp:Label ID="lblDowntimeStatus" runat="server"></asp:Label>
                        <asp:Literal ID="litDT" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table class="style1" style="border-style: double">
        <tr>
            <td valign="top" width="50%">
                <br />
                <table class="style2">
                    <tr>
                        <td>
                            Review stats for shift
                            <asp:Label runat="server" ForeColor="White" ID="lblQueryEnd"></asp:Label>
                            &nbsp;<asp:Label runat="server" ForeColor="White" ID="lblQueryStart"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                ID="rblSelectQuery">
                                <asp:ListItem Value="1">Shift</asp:ListItem>
                                <asp:ListItem Value="2">Last 24 hrs</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" Height="500px"
                                Width="100%">
                                <cc1:TabPanel runat="server" HeaderText="Downtime for shift" ID="TabPanel1">
                                    <ContentTemplate>
                                        <table class="style2">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DowntimeODS"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" SortExpression="Downtimestart" />
                                                            <asp:BoundField DataField="dtime" HeaderText="duration (mins)" ReadOnly="True" SortExpression="dtime" />
                                                            <asp:BoundField DataField="SymptomDesc" HeaderText="Symptom" SortExpression="SymptomDesc" />
                                                            <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause" SortExpression="RootCauseDesc" />
                                                            <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy" SortExpression="RemedyDescription" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ObjectDataSource ID="DowntimeODS" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetDataBetweenDates" TypeName="DataAnalysisTableAdapters.DetailsMediumByLocTableAdapter">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="locid" SessionField="RCworkstationID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="lblQueryEnd" Name="downtimend" PropertyName="Text"
                                                                Type="DateTime" />
                                                            <asp:ControlParameter ControlID="lblQueryStart" Name="downtimstart" PropertyName="Text"
                                                                Type="DateTime" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Stats for shift">
                                    <ContentTemplate>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    Chart
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <dotnetCHARTING:Chart ID="OEEChart" runat="server" DefaultCultureName="" FunnelNozzleWidthPercentage="35"
                                                        HotspotMinimumSize="0" SpacingPercentage="0" SpacingPercentageNested="4" StartDateOfYear=""
                                                        TempDirectory="charttemp" Width="500px">
                                                        <SmartForecast Start="" TimeSpan="00:00:00" />
                                                        <DefaultElement>
                                                            <SmartLabel AbsolutePosition="0,0">
                                                            </SmartLabel>
                                                        </DefaultElement>
                                                        <DefaultLegendBox CornerBottomRight="Cut" Padding="4">
                                                            <HeaderEntry Visible="False">
                                                            </HeaderEntry>
                                                        </DefaultLegendBox>
                                                        <NoDataLabel Text="No Data">
                                                        </NoDataLabel>
                                                        <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                                                            <DefaultElement>
                                                                <DefaultSubValue>
                                                                    <Line Length="4" />
                                                                </DefaultSubValue>
                                                                <SmartLabel AbsolutePosition="0,0">
                                                                </SmartLabel>
                                                            </DefaultElement>
                                                            <Label Font="Tahoma, 8pt">
                                                            </Label>
                                                            <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes">
                                                                <ScaleBreakLine Color="Gray" />
                                                                <TimeScaleLabels MaximumRangeRows="4">
                                                                </TimeScaleLabels>
                                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                <ZeroTick>
                                                                    <Line Length="3" />
                                                                </ZeroTick>
                                                                <DefaultTick>
                                                                    <Line Length="3" />
                                                                    <Label Text="%Value">
                                                                    </Label>
                                                                </DefaultTick>
                                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                                </Label>
                                                            </YAxis>
                                                            <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes">
                                                                <ScaleBreakLine Color="Gray" />
                                                                <TimeScaleLabels MaximumRangeRows="4">
                                                                </TimeScaleLabels>
                                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                <ZeroTick>
                                                                    <Line Length="3" />
                                                                </ZeroTick>
                                                                <DefaultTick>
                                                                    <Line Length="3" />
                                                                    <Label Text="%Value">
                                                                    </Label>
                                                                </DefaultTick>
                                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                                </Label>
                                                            </XAxis>
                                                            <TitleBox Position="Left">
                                                                <Label Color="Black">
                                                                </Label>
                                                            </TitleBox>
                                                            <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4" Visible="False">
                                                                <HeaderEntry Name="Name" SortOrder="-1" Value="Value" Visible="False">
                                                                    <LabelStyle Font="Arial, 8pt, style=Bold" />
                                                                </HeaderEntry>
                                                            </LegendBox>
                                                        </ChartArea>
                                                        <TitleBox Position="Left">
                                                            <Label Color="Black">
                                                            </Label>
                                                        </TitleBox>
                                                    </dotnetCHARTING:Chart>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabPanel3" HeaderText="Time Line">
                                    <ContentTemplate>
                                        <table class="style1">
                                            <tr height="50px">
                                                <td>
                                                    Downtime
                                                </td>
                                                <td>
                                                    <uc2:TimeLine2 ID="WUCDT" runat="server" Width="800"></uc2:TimeLine2>
                                                </td>
                                            </tr>
                                            <tr height="50px">
                                                <td>Lot/CO 
                                                </td>
                                                <td>
                                                   <uc2:TimeLine2 ID="WUCLot" runat="server" Width="800"></uc2:TimeLine2>
                                                </td>
                                            </tr>
                                            <tr height="50px">
                                                <td>Shift 
                                                </td>
                                                <td>
                                                    <uc2:TimeLine2 ID="WUCShift" runat="server" Width="800"></uc2:TimeLine2>
                                                </td>
                                            </tr>
                                            <tr height="50px">
                                                <td colspan="2">
                                                    <table class="style2">
                                                        <tr>
                                                            <td align="center" colspan="2" width="20%">
                                                                Time line Colour Key
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style4" colspan="2" width="20%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="Red" width="20%">
                                                                &#160;&#160;
                                                            </td>
                                                            <td>
                                                                Downtime
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="Blue">
                                                                &#160;&#160;
                                                            </td>
                                                            <td>
                                                                Lot time
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#660066">
                                                                &#160;&#160;
                                                            </td>
                                                            <td>
                                                                Change over time
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#006600">
                                                                &#160;&#160;
                                                            </td>
                                                            <td>
                                                                Shift time
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabPanel4" HeaderText="Blister Count">
                                    <ContentTemplate>
                                        <br />
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    Enter current blister count for this lot to calculate performance
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBlisterCount" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BtnBlisterCount" runat="server" Text="Go" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ActivityID"
                                                        DataSourceID="ODSLotPerfData" Height="50px" Width="100%">
                                                        <FieldHeaderStyle HorizontalAlign="Left" />
                                                        <Fields>
                                                            <asp:BoundField DataField="ActivityID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                                SortExpression="ActivityID" />
                                                            <asp:BoundField DataField="txtID" HeaderText="Lot No" SortExpression="txtID" />
                                                            <asp:BoundField DataField="activitytime" HeaderText="Lot time" ReadOnly="True" SortExpression="activitytime" />
                                                            <asp:BoundField DataField="downtime" HeaderText="Lot downtime" ReadOnly="True" SortExpression="downtime" />
                                                            <asp:BoundField DataField="StartTime" HeaderText="Lot Start time" SortExpression="StartTime" />
                                                            <asp:BoundField DataField="endtime" HeaderText="Lot End time" SortExpression="endtime" />
                                                            <asp:BoundField DataField="FormatDesc" HeaderText="Format" SortExpression="FormatDesc" />
                                                            <asp:BoundField DataField="OperationRatePerMin" HeaderText="Format Rate" SortExpression="OperationRatePerMin" />
                                                            <asp:BoundField DataField="GoodProduct" HeaderText="Good Product" SortExpression="GoodProduct" />
                                                            <asp:BoundField DataField="TargetOutput" HeaderText="Target Output" SortExpression="TargetOutput" />
                                                            <asp:BoundField DataField="Waste" HeaderText="Waste" SortExpression="Waste" />
                                                            <asp:BoundField DataField="runningTime" HeaderText="Running Time" ReadOnly="True"
                                                                SortExpression="runningTime" />
                                                            <asp:BoundField DataField="TheoreticalUnits" HeaderText="Theoretical Units" ReadOnly="True"
                                                                SortExpression="TheoreticalUnits" />
                                                            <asp:BoundField DataField="Availability" HeaderText="Availability" ReadOnly="True"
                                                                SortExpression="Availability" />
                                                            <asp:BoundField DataField="Performance" HeaderText="Performance" ReadOnly="True"
                                                                SortExpression="Performance" DataFormatString="{0:00.0}" />
                                                            <asp:BoundField DataField="Quality" HeaderText="Quality" ReadOnly="True" SortExpression="Quality" />
                                                            <asp:BoundField DataField="OEE" HeaderText="OEE" ReadOnly="True" SortExpression="OEE" />
                                                        </Fields>
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <RowStyle HorizontalAlign="Left" />
                                                    </asp:DetailsView>
                                                    <asp:ObjectDataSource ID="ODSLotPerfData" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="PerformanceAnalysisTableAdapters.LotOEEDataTableAdapter">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="1" Name="activitytype" Type="Int32" />
                                                            <asp:SessionParameter DefaultValue="" Name="ActivityID" SessionField="ActivityID"
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table class="style1" style="border-style: double">
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="right">
                <asp:LinkButton ID="LinkButton3" runat="server" BorderStyle="Solid" BorderWidth="1px">Admin</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
