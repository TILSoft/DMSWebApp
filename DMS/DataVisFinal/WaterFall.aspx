<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" CodeFile="WaterFall.aspx.vb" Inherits="DataVisualisation_OEEbyLine" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" width="100%">
        <tr>
            <td colspan="4">
                <h2>
                    OEE Water Fall
                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Start Time</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
            <td>
                End Time</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                Choose line</td>
            <td colspan="3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSloc" DataTextField="LocDescription" 
                    DataValueField="LocID" RepeatDirection="Horizontal" AutoPostBack="True">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSloc" runat="server" DeleteMethod="Delete" 
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
            <td colspan="1">
                &nbsp;</td>
            <td colspan="3">
                <dotnetCHARTING:Chart ID="Chart1" runat="server" Height="600px" Width="800px">
<SmartForecast Start=""></SmartForecast>

<DefaultLegendBox Padding="4" CornerBottomRight="Cut">
<HeaderEntry Visible="False"></HeaderEntry>
</DefaultLegendBox>

<ChartArea StartDateOfYear="" CornerTopLeft="Square">
<DefaultElement>
    <DefaultSubValue>
        <Line Length="4" />
    </DefaultSubValue>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<Label Font="Tahoma, 8pt"></Label>

<YAxis GaugeNeedleType="One" GaugeLabelMode="Default">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start=""></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</YAxis>

<XAxis GaugeNeedleType="One" GaugeLabelMode="Default">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start=""></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</XAxis>

<TitleBox Position="Left">
<Label Color="Black"></Label>
</TitleBox>

<LegendBox Padding="4" Position="Top" CornerBottomRight="Cut">
<HeaderEntry Name="Name" Value="Value" Visible="False" SortOrder="-1"></HeaderEntry>
</LegendBox>
</ChartArea>

<DefaultElement>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<TitleBox Position="Left">
<Label Color="Black"></Label>
</TitleBox>
                </dotnetCHARTING:Chart>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataSourceID="OdsWaterfall" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="TotalTime" HeaderText="TotalTime" ReadOnly="True" 
                            SortExpression="TotalTime" />
                        <asp:BoundField DataField="cNonWorkingTime" HeaderText="cNonWorkingTime" 
                            ReadOnly="True" SortExpression="cNonWorkingTime" />
                        <asp:BoundField DataField="cSchedRunTime" HeaderText="cSchedRunTime" 
                            ReadOnly="True" SortExpression="cSchedRunTime" />
                        <asp:BoundField DataField="ChangeOvertime" HeaderText="ChangeOvertime" 
                            ReadOnly="True" SortExpression="ChangeOvertime" />
                        <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                            SortExpression="ShiftTime" />
                        <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                            SortExpression="LotTime" />
                        <asp:BoundField DataField="Downtime" HeaderText="Downtime" ReadOnly="True" 
                            SortExpression="Downtime" />
                        <asp:BoundField DataField="ChangeOverDowntime" HeaderText="ChangeOverDowntime" 
                            ReadOnly="True" SortExpression="ChangeOverDowntime" />
                        <asp:BoundField DataField="cBreakdownTimeLoss" HeaderText="cBreakdownTimeLoss" 
                            ReadOnly="True" SortExpression="cBreakdownTimeLoss" />
                        <asp:BoundField DataField="cAvailableTime" HeaderText="cAvailableTime" 
                            ReadOnly="True" SortExpression="cAvailableTime" />
                        <asp:BoundField DataField="ShortStopTimeLoss" HeaderText="ShortStopTimeLoss" 
                            ReadOnly="True" SortExpression="ShortStopTimeLoss" />
                        <asp:BoundField DataField="cPerformanceTimeLoss" 
                            HeaderText="cPerformanceTimeLoss" ReadOnly="True" 
                            SortExpression="cPerformanceTimeLoss" />
                        <asp:BoundField DataField="cQualityTime" HeaderText="cQualityTime" 
                            ReadOnly="True" SortExpression="cQualityTime" />
                        <asp:BoundField DataField="cWasteTimeLoss" HeaderText="cWasteTimeLoss" 
                            ReadOnly="True" SortExpression="cWasteTimeLoss" />
                        <asp:BoundField DataField="cEffectiveTime" HeaderText="cEffectiveTime" 
                            ReadOnly="True" SortExpression="cEffectiveTime" />
                        <asp:BoundField DataField="TheoreticalUnitsProduced" 
                            HeaderText="TheoreticalUnitsProduced" ReadOnly="True" 
                            SortExpression="TheoreticalUnitsProduced" />
                        <asp:BoundField DataField="ActualUnitsProduced" 
                            HeaderText="ActualUnitsProduced" ReadOnly="True" 
                            SortExpression="ActualUnitsProduced" />
                        <asp:BoundField DataField="ActualWasteProduced" 
                            HeaderText="ActualWasteProduced" ReadOnly="True" 
                            SortExpression="ActualWasteProduced" />
                        <asp:BoundField DataField="WtdAverageFormatRate" 
                            HeaderText="WtdAverageFormatRate" ReadOnly="True" 
                            SortExpression="WtdAverageFormatRate" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="OdsWaterfall" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="OEETableAdapters.OEEWaterFallTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtStart" Name="starttime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="endtime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        </table>
 <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >--%>
        
    
    
    </ContentTemplate>

    </asp:UpdatePanel>
  
</asp:Content>

