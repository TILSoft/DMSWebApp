<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="OEEPyramidByMachineByMonth.aspx.vb" Inherits="FrontEnd_DataAnalysis_Default" title="Untitled Page" %>
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
        <td colspan="3">
            <h2>
                OEE Pyramid by Month</h2>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            Select the machine :
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                DataSourceID="ODSLOC" DataTextField="LocDescription" DataValueField="LocID" 
                RepeatDirection="Horizontal">
            </asp:RadioButtonList>
            <asp:ObjectDataSource ID="ODSLOC" runat="server" DeleteMethod="Delete" 
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
        <td colspan="3">
            OEE</td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <dotnetCHARTING:Chart ID="ChartOEE" runat="server" Width="900px">
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
        <td width="33%">
            Availability</td>
        <td width="33%">
            Performance</td>
        <td width="33%">
            Quality</td>
    </tr>
    <tr>
        <td align="center">
            <dotnetCHARTING:Chart ID="chartAvail" runat="server" Width="400px">
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
<HeaderEntry Name="Name" Value="Value" Visible="False" SortOrder="-1">
<LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
    </HeaderEntry>
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
        <td align="center">
            <dotnetCHARTING:Chart ID="ChartPerf" runat="server" style="width: 14px" 
                Width="400px">
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
<HeaderEntry Name="Name" Value="Value" Visible="False" SortOrder="-1">
<LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
    </HeaderEntry>
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
        <td align="center">
            <dotnetCHARTING:Chart ID="ChartQual" runat="server" Width="400px">
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
<HeaderEntry Name="Name" Value="Value" Visible="False" SortOrder="-1">
<LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
    </HeaderEntry>
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
        <td align="center" colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ODSOEE">
                <Columns>
                    <asp:BoundField DataField="Month" HeaderText="Month" 
                        ReadOnly="True" SortExpression="Month" />
                    <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                        SortExpression="ShiftTime" />
                    <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                        SortExpression="LotTime" />
                    <asp:BoundField DataField="lotDT" HeaderText="lotDT" ReadOnly="True" 
                        SortExpression="lotDT" />
                    <asp:BoundField DataField="AvgPerf" HeaderText="AvgPerf" ReadOnly="True" 
                        SortExpression="AvgPerf" />
                    <asp:BoundField DataField="Availability" HeaderText="Availability" 
                        ReadOnly="True" SortExpression="Availability" />
                    <asp:BoundField DataField="OEE" HeaderText="OEE" ReadOnly="True" 
                        SortExpression="OEE" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ODSOEE" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DataAnalysisOverallTableAdapters.OEEbyMonthForAMachineTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
</asp:Content>

