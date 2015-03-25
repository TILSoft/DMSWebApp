<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="AvailabilityLossAnalysisByMonth.aspx.vb" Inherits="FrontEnd_DataAnalysis_LossAnalysisByMonth" title="Untitled Page" %>
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
            <td colspan="2">
                <h2>
                    Availability Breakdown By Month By Machine</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSloc" DataTextField="LocDescription" 
                    DataValueField="LocID" RepeatDirection="Horizontal">
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <dotnetCHARTING:Chart ID="LossAnalysisChart" runat="server" Use3D="True" 
                    Width="900px">
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
            <td colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ODSLossAnalysis">
                    <Columns>
                        <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                            SortExpression="ShiftTime" />
                        <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                            SortExpression="LotTime" />
                        <asp:BoundField DataField="lotDT" HeaderText="lotDT" ReadOnly="True" 
                            SortExpression="lotDT" />
                        <asp:BoundField DataField="AvgPerf" HeaderText="AvgPerf" ReadOnly="True" 
                            SortExpression="AvgPerf" />
                        <asp:BoundField DataField="Month" HeaderText="Month" 
                            ReadOnly="True" SortExpression="Month" />
                        <asp:BoundField DataField="COTime" HeaderText="COTime" ReadOnly="True" 
                            SortExpression="COTime" />
                        <asp:BoundField DataField="CODT" HeaderText="CODT" ReadOnly="True" 
                            SortExpression="CODT" />
                        <asp:BoundField DataField="IdleTime" HeaderText="IdleTime" ReadOnly="True" 
                            SortExpression="IdleTime" />
                        <asp:BoundField DataField="IdleDT" HeaderText="IdleDT" ReadOnly="True" 
                            SortExpression="IdleDT" />
                        <asp:BoundField DataField="COtimeMinusCODT" HeaderText="COtimeMinusCODT" 
                            ReadOnly="True" SortExpression="COtimeMinusCODT" />
                        <asp:BoundField DataField="LottimeMinusLotDT" HeaderText="LottimeMinusLotDT" ReadOnly="True" 
                            SortExpression="LottimeMinusLotDT" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSLossAnalysis" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataAnalysisOverallTableAdapters.AvailabilityLossAnalysisByMonthTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

