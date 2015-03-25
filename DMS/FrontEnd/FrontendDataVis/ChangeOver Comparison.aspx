<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" MaintainScrollPositionOnPostback ="true" CodeFile="ChangeOver Comparison.aspx.vb" Inherits="FrontEnd_DataVisualisation_AllActiivtyAnalysis" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

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
                    Change over comparison</h2>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td width="25%">
                        Start time</td>
                    <td>
                        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        End time</td>
                    <td>
                        <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Select a line</td>
                    <td colspan="3">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
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
                    <td>
                        Show Shift</td>
                    <td colspan="3">
                        <asp:CheckBox ID="cboxShowShift" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Change over type</td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddlformat" runat="server" DataSourceID="ODSCOformat" 
                            DataTextField="FormatDesc" DataValueField="FormatID">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ODSCOformat" runat="server" DeleteMethod="Delete" 
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetDataByLocIDandActivity" 
                            TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_FormatID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FormatDesc" Type="String" />
                                <asp:Parameter Name="LocID" Type="Int32" />
                                <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                <asp:Parameter Name="StdTime" Type="Int32" />
                                <asp:Parameter Name="ActivityType" Type="Int32" />
                                <asp:Parameter Name="Original_FormatID" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter DefaultValue="2" Name="activityType" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FormatDesc" Type="String" />
                                <asp:Parameter Name="LocID" Type="Int32" />
                                <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                <asp:Parameter Name="StdTime" Type="Int32" />
                                <asp:Parameter Name="ActivityType" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
   
            </td>
        </tr>
        </table>
   
    <table class="style1">
        <tr>
            <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                        <dotnetCHARTING:Chart runat="server" SpacingPercentage="0" 
                            HotspotMinimumSize="0" SpacingPercentageNested="4" 
                            FunnelNozzleWidthPercentage="35" DefaultCultureName="" 
                            TempDirectory="Charttemp" Width="800px" Use3D="True" StartDateOfYear="" 
                            ID="ActivityChart" Height="600px">
                            <SmartForecast Start="" TimeSpan="00:00:00">
                            </SmartForecast>
                            <DefaultElement>
                                <SmartLabel AbsolutePosition="0,0">
                                </SmartLabel>
                            </DefaultElement>
                            <DefaultLegendBox Padding="4" CornerBottomRight="Cut">
                                <HeaderEntry Visible="False">
                                </HeaderEntry>
                            </DefaultLegendBox>
                            <NoDataLabel Text="No Data">
                            </NoDataLabel>
                            <ChartArea StartDateOfYear="" CornerTopLeft="Square">
                                <DefaultElement>
                                    <DefaultSubValue>
                                        <Line Length="4">
                                        </Line>
                                    </DefaultSubValue>
                                    <SmartLabel AbsolutePosition="0,0">
                                    </SmartLabel>
                                </DefaultElement>
                                <Label Font="Tahoma, 8pt">
                                </Label>
                                <YAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes">
                                    <ScaleBreakLine Color="Gray">
                                    </ScaleBreakLine>
                                    <TimeScaleLabels MaximumRangeRows="4">
                                    </TimeScaleLabels>
                                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00">
                                    </MinorTimeIntervalAdvanced>
                                    <ZeroTick>
                                        <Line Length="3">
                                        </Line>
                                        <GridLine Color="Red">
                                        </GridLine>
                                    </ZeroTick>
                                    <DefaultTick>
                                        <Line Length="3">
                                        </Line>
                                        <Label Text="%Value">
                                        </Label>
                                    </DefaultTick>
                                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00">
                                    </TimeIntervalAdvanced>
                                    <Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold">
                                    </Label>
                                </YAxis>
                                <XAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes">
                                    <ScaleBreakLine Color="Gray">
                                    </ScaleBreakLine>
                                    <TimeScaleLabels MaximumRangeRows="4">
                                    </TimeScaleLabels>
                                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00">
                                    </MinorTimeIntervalAdvanced>
                                    <ZeroTick>
                                        <Line Length="3">
                                        </Line>
                                        <GridLine Color="Red">
                                        </GridLine>
                                    </ZeroTick>
                                    <DefaultTick>
                                        <Line Length="3">
                                        </Line>
                                        <Label Text="%Value">
                                        </Label>
                                    </DefaultTick>
                                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00">
                                    </TimeIntervalAdvanced>
                                    <Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold">
                                    </Label>
                                </XAxis>
                                <TitleBox Position="Left">
                                    <Label Font="Tahoma, 8pt, style=Bold" Color="97, 45, 38">
                                    </Label>
                                </TitleBox>
                                <LegendBox Padding="4" Orientation="TopRight" CornerBottomRight="Cut">
                                    <HeaderEntry Visible="False">
                                        <LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
                                    </HeaderEntry>
                                </LegendBox>
                            </ChartArea>
                            <TitleBox Position="Left">
                                <Label Font="Tahoma, 8pt, style=Bold" Color="97, 45, 38">
                                </Label>
                            </TitleBox>
                        </dotnetCHARTING:Chart>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Notes on report<br />
                1) Shows all activities which start in the time range<br />
                2) Does not truncate the activities<br />
                3) OEE calc as per the weekly OEE calculation but on a per lot basis</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

