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
        .style3
        {
            height: 25px;
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
                &nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" BorderStyle="Solid" BorderWidth="1px">Engineering Note</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lnkChangePass" runat="server" BorderStyle="Solid" BorderWidth="1px">Change Password</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lnkChangePass0" runat="server" BorderStyle="Solid" BorderWidth="1px">Review Remedies</asp:LinkButton>
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
                        <asp:LinkButton ID="LinkButton1" runat="server" BorderStyle="Solid" BorderWidth="1px">Start/End Lot/CO</asp:LinkButton>
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="border-style: none" width="100%">
                            <tr>
                                <td valign="top">
                                    1. Select Symptom Location
                                </td>
                                <td>
                                    2. Select Symptom description
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" width="25%">
                                    <strong>
                                        <asp:Literal ID="litPath" runat="server"></asp:Literal>
                                    </strong>
                                    <br />
                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" DataSourceID="LocODS"
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnLoc" runat="server" CommandArgument='<%# Eval("LocID") %>' Font-Size="X-Small"
                                                Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>'
                                                Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="LocODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentLocID"
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
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ParentLocID" SessionField="btnLocID" Type="Int32" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="LocDescription" Type="String" />
                                            <asp:Parameter Name="ParentLocID" Type="Int32" />
                                            <asp:Parameter Name="DowntimeID" Type="Int32" />
                                            <asp:Parameter Name="LotStatus" Type="Int32" />
                                            <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                            <asp:Parameter Name="LocationStatus" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td valign="top" width="25%" align="center">
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    <asp:DataList ID="DataList2" runat="server" DataKeyField="LocID" DataSourceID="SymptomODS"
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnSymp" runat="server" CommandArgument='<%# Eval("SymptomID") %>'
                                                Font-Size="X-Small" Text='<%# Eval("SymptomDesc") %>' Visible='<%# Eval("SymptomEnabled") %>'
                                                Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <h4>
                                        <asp:LinkButton ID="dtLinkButton" runat="server" ForeColor="#33CC33" Visible="False"
                                            Style="text-align: center" BorderStyle="Double"></asp:LinkButton>
                                        <asp:ObjectDataSource ID="SymptomODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblSymptomTableAdapter"
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="LocID" SessionField="btnLocID" Type="Int32" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </h4>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
            <td>
                <table class="style2">
                    <tr>
                        <td>
                            3.Review stats for shift<asp:Label runat="server" ForeColor="White" ID="lblQueryEnd"></asp:Label>
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
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" Height="500px"
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
                                                </td>
                                                <td>
                                                    Downtime
                                                    <uc2:TimeLine2 ID="WUCDT" runat="server" Width="450"></uc2:TimeLine2>
                                                </td>
                                            </tr>
                                            <tr height="50px">
                                                <td>
                                                </td>
                                                <td>
                                                    Lot/CO &#160;<uc2:TimeLine2 ID="WUCLot" runat="server" Width="450"></uc2:TimeLine2>
                                                </td>
                                            </tr>
                                            <tr height="50px">
                                                <td>
                                                </td>
                                                <td>
                                                    Shift &#160;<uc2:TimeLine2 ID="WUCShift" runat="server" Width="450"></uc2:TimeLine2>
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
                                                            <td bgcolor="#006600">
                                                                &#160;&#160;
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
                                <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="Shift Handover">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td height="100%">
                                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ShiftHandoverID" DataSourceID="odsShiftHandover"
                                                        Width="100%" Height="100%">
                                                        <EditItemTemplate>
                                                            EntryTime:
                                                            <asp:TextBox ID="EntryTimeTextBox" runat="server" Text='<%# Bind("EntryTime") %>' /><br />
                                                            field1:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field1TextBox" runat="server"
                                                                Text='<%# Bind("field1") %>' /><br />
                                                            field2:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field2TextBox" runat="server"
                                                                Text='<%# Bind("field2") %>' /><br />
                                                            field3:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field3TextBox" runat="server"
                                                                Text='<%# Bind("field3") %>' /><br />
                                                            field4:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field4TextBox" runat="server"
                                                                Text='<%# Bind("field4") %>' /><br />
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                Text="Update" />&#160;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                                                    CommandName="Cancel" Text="Cancel" /></EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            Equipment:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field1TextBox" runat="server"
                                                                Text='<%# Bind("field1") %>' /><br />
                                                            Process:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field2TextBox" runat="server"
                                                                Text='<%# Bind("field2") %>' /><br />
                                                            Materials:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="4" ID="field3TextBox" runat="server"
                                                                Text='<%# Bind("field3") %>' /><br />
                                                            Other:
                                                            <asp:TextBox TextMode="MultiLine" Width="100%" Rows="2" ID="field4TextBox" runat="server"
                                                                Text='<%# Bind("field4") %>' /><br />
                                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                                Text="Insert" OnClick="InsertButton_Click" />&#160;<asp:LinkButton ID="InsertCancelButton"
                                                                    runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></InsertItemTemplate>
                                                        <ItemTemplate>
                                                            EntryTime:
                                                            <asp:Label ID="EntryTimeLabel" runat="server" Text='<%# Bind("EntryTime") %>' /><br />
                                                            <br />
                                                            Equipment:<br />
                                                            <asp:Label ID="field1Label" runat="server" Text='<%# Bind("field1") %>' /><br />
                                                            <br />
                                                            Process:
                                                            <br />
                                                            <asp:Label ID="field2Label" runat="server" Text='<%# Bind("field2") %>' /><br />
                                                            <br />
                                                            Materials:
                                                            <br />
                                                            <asp:Label ID="field3Label" runat="server" Text='<%# Bind("field3") %>' /><br />
                                                            <br />
                                                            Other:
                                                            <br />
                                                            <asp:Label ID="field4Label" runat="server" Text='<%# Bind("field4") %>' /><br />
                                                            <br />
                                                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                                                Text="New" /></ItemTemplate>
                                                    </asp:FormView>
                                                    <asp:ObjectDataSource ID="odsShiftHandover" runat="server" DeleteMethod="Delete"
                                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                                        TypeName="ShiftsTableAdapters.tblShiftHandTableAdapter" UpdateMethod="Update">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="Original_ShiftHandoverID" Type="Int32" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="LineID" Type="Int32" />
                                                            <asp:Parameter Name="UserID" Type="Int32" />
                                                            <asp:Parameter Name="EntryTime" Type="DateTime" />
                                                            <asp:Parameter Name="field1" Type="String" />
                                                            <asp:Parameter Name="field2" Type="String" />
                                                            <asp:Parameter Name="field3" Type="String" />
                                                            <asp:Parameter Name="field4" Type="String" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="lineID" SessionField="WorkstationID" Type="Int32" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="LineID" Type="Int32" />
                                                            <asp:Parameter Name="UserID" Type="Int32" />
                                                            <asp:Parameter Name="EntryTime" Type="DateTime" />
                                                            <asp:Parameter Name="field1" Type="String" />
                                                            <asp:Parameter Name="field2" Type="String" />
                                                            <asp:Parameter Name="field3" Type="String" />
                                                            <asp:Parameter Name="field4" Type="String" />
                                                            <asp:Parameter Name="Original_ShiftHandoverID" Type="Int32" />
                                                        </UpdateParameters>
                                                    </asp:ObjectDataSource>
                                                    <br />
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
    <table class="style1" style="border-style: double">
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlLogin" runat="server" Width="650px" BackColor="#66CCFF">
                    <asp:UpdatePanel ID="upLogin" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td align="center">
                                        Start the downtime
                                    </td>
                                </tr>
                            </table>
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        Check the time is correct
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPopTime" runat="server" ForeColor="#FF3300" Font-Bold="True"></asp:TextBox>
                                        <br />
                                        <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" TargetControlID="txtPopTime"
                                            Mask="99/99/9999 99:99:99" MaskType="DateTime" CultureName="en-CA" ErrorTooltipEnabled="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        Enter User Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Enter Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style3" colspan="2">
                                        <asp:Button ID="btnOK" runat="server" Text="Submit" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lbllogMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ActivityID"
                                            DataSourceID="ODSActCheck" Visible="False">
                                            <Columns>
                                                <asp:BoundField DataField="ActivityID" HeaderText="Activity ID" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="ActivityID" />
                                                <asp:BoundField DataField="ActivityDesc" HeaderText="Activity Description" SortExpression="ActivityDesc" />
                                                <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                                                <asp:BoundField DataField="endtime" HeaderText="End time" SortExpression="endtime" />
                                                <asp:BoundField DataField="txtID" HeaderText="Lot or CO ID" SortExpression="txtID" />
                                                <asp:BoundField DataField="LocDescription" HeaderText="Location Description" SortExpression="LocDescription" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ODSActCheck" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="DowntimeTableAdapters.DowntimeActivityCheckTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtPopTime" Name="dtstart" PropertyName="Text" Type="DateTime" />
                                                <asp:SessionParameter Name="locid" SessionField="WorkstationID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DataList2" EventName="ItemCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:LinkButton ID="btnCancelHidden" runat="server"></asp:LinkButton>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAuthenticate" runat="server" BackColor="#33CCFF" Width="650px">
                    <table class="style2">
                        <tr>
                            <td align="center" colspan="2">
                                Authentication
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter User Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtSHUser" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter Password
                            </td>
                            <td>
                                <asp:TextBox ID="txtSHPass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:Label ID="lblResult" runat="server">0</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lblSHMessage" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSHOK" runat="server" Text="Submit" />
                            </td>
                            <td align="center">
                                <asp:Button ID="btnSHCancel" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td align="right">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lnkShowPopHidden" runat="server"></asp:LinkButton>
                <cc1:ModalPopupExtender ID="MPELogin" runat="server" CancelControlID="btnCancelHidden"
                    PopupControlID="pnlLogin" TargetControlID="lnkShowPopHidden">
                </cc1:ModalPopupExtender>
                <cc1:ModalPopupExtender ID="MPEAuthenticate" runat="server" CancelControlID="btnCancelHidden"
                    PopupControlID="pnlAuthenticate" TargetControlID="lnkShowPopHidden">
                </cc1:ModalPopupExtender>
            </td>
            <td align="right">
                <asp:LinkButton ID="LinkButton3" runat="server" BorderStyle="Solid" BorderWidth="1px">Admin</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
