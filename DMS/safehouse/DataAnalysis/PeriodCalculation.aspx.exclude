<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="PeriodCalculation.aspx.vb" Inherits="FrontEnd_DataAnalysis_PeriodCalculation" title="Untitled Page" %>

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
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                Start Date and time</td>
            <td>
                End Date and time</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtStartTime" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtEndTime" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnGo" runat="server" Text="Go" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="txtLocID" runat="server">92</asp:TextBox>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtRCLocID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ShiftsODS" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="SID" HeaderText="SID" SortExpression="SID" />
                        <asp:BoundField DataField="ShiftStart" HeaderText="ShiftStart" 
                            SortExpression="ShiftStart" />
                        <asp:BoundField DataField="ShiftEnd" HeaderText="ShiftEnd" 
                            SortExpression="ShiftEnd" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ShiftsODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisTableAdapters.TrimmedShiftsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLocID" Name="locID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtStartTime" Name="PeriodStart" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndTime" Name="Periodend" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LotsODS" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="LotID" HeaderText="LotID" SortExpression="LotID" />
                        <asp:BoundField DataField="SID" HeaderText="SID" SortExpression="SID" />
                        <asp:BoundField DataField="LotStartDate" HeaderText="LotStartDate" 
                            SortExpression="LotStartDate" />
                        <asp:BoundField DataField="LotEndDate" HeaderText="LotEndDate" 
                            SortExpression="LotEndDate" />
                        <asp:BoundField DataField="LotOrCO" HeaderText="LotOrCO" 
                            SortExpression="LotOrCO" />
                        <asp:BoundField DataField="LotShiftID" HeaderText="LotShiftID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="LotShiftID" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="LotsODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisTableAdapters.TrimmedLotsAndCOsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLocID" Name="LocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtStartTime" Name="StartTime" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndTime" Name="EndTime" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="downtimeODS" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="LotCODowntimeID" HeaderText="LotCODowntimeID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="LotCODowntimeID" />
                        <asp:BoundField DataField="DowntimeStart" HeaderText="DowntimeStart" 
                            SortExpression="DowntimeStart" />
                        <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                            SortExpression="Downtimeend" />
                        <asp:BoundField DataField="lotCOID" HeaderText="lotCOID" 
                            SortExpression="lotCOID" />
                        <asp:BoundField DataField="DowntimeID" HeaderText="DowntimeID" 
                            SortExpression="DowntimeID" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="downtimeODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisTableAdapters.TrimmedDowntimesTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLocID" Name="LocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtRCLocID" Name="RClocID" 
                            PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStartTime" Name="PeriodStart" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndTime" Name="PeriodEnd" 
                            PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <dotnetCHARTING:Chart ID="Chart1" runat="server" Width="1200px" Type="ComboHorizontal">
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
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="OEEODS">
                    <Columns>
                        <asp:BoundField DataField="DataIDname" HeaderText="DataIDname" 
                            SortExpression="DataIDname" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                    </Columns>
                </asp:GridView>
                <dotnetCHARTING:Chart ID="OEEchart" runat="server">
<SmartForecast Start=""></SmartForecast>

<DefaultLegendBox Padding="4" CornerBottomRight="Cut">
<HeaderEntry Visible="False"></HeaderEntry>
</DefaultLegendBox>

<ChartArea StartDateOfYear="" CornerTopLeft="Square">
<DefaultElement>
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
                <asp:ObjectDataSource ID="OEEODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisTableAdapters.OEEdataTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLocID" Name="LocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtRCLocID" Name="RClocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtStartTime" Name="StartDate" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndTime" Name="EndDate" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

