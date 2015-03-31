<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="WaterFallOEEbyLine.aspx.vb" Inherits="DataVisualisation_OEEbyLine" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="4">
                <h2>
                    OEE by week
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
        </tr>
        </table>
 <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >--%>
        
    
    
    <table class="style1">
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODSOEEMaster" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="OEEtableadapters.OEEMasterByWeekTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="ActType" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStart" Name="wkStartDate" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="wkEndDate" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
                        <asp:Button ID="btnGetOEEdata" runat="server" Text="Get OEE Data" />
                
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
   <ProgressTemplate >
    This may take a while...                                      ...keep your knickers on
    
   </ProgressTemplate>
    </asp:UpdateProgress> 
    
    
    
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ODSOEEMaster" Width="100%" DataKeyNames="WeekStart,WeekEnd">
                    <Columns>
                        <asp:BoundField DataField="WeekStart" HeaderText="WeekStart" 
                            SortExpression="WeekStart" DataFormatString="{0:d}" HtmlEncode="False" />
                        <asp:BoundField DataField="WeekEnd" HeaderText="WeekEnd" 
                            SortExpression="WeekEnd" DataFormatString="{0:d}" HtmlEncode="False" />
                        <asp:BoundField DataField="ShiftTime" HeaderText="Shift Time (mins)" ReadOnly="True" 
                            SortExpression="ShiftTime" />
                        <asp:BoundField DataField="LotTime" HeaderText="Lot Time (mins)" ReadOnly="True" 
                            SortExpression="LotTime" />
                        <asp:BoundField DataField="Downtime" HeaderText="Lot Downtime (mins)" ReadOnly="True" 
                            SortExpression="Downtime" />
                        <asp:BoundField DataField="ChangeOverTime" HeaderText="Change Over Time (mins)" 
                            SortExpression="ChangeOverTime" />
                        <asp:BoundField DataField="Changeoverdowntime" 
                            HeaderText="Change over downtime (mins) " SortExpression="Changeoverdowntime" />
                        <asp:BoundField DataField="cAvailability" HeaderText="Availability" 
                            ReadOnly="True" SortExpression="cAvailability" />
                        <asp:BoundField DataField="TheoreticalUnitsProduced" 
                            HeaderText="Theoretical Units" ReadOnly="True" 
                            SortExpression="TheoreticalUnitsProduced" />
                        <asp:BoundField DataField="ActualUnitsProduced" 
                            HeaderText="Actual Units" ReadOnly="True" 
                            SortExpression="ActualUnitsProduced" />
                        <asp:BoundField DataField="cPerformance" HeaderText="Performance" 
                            ReadOnly="True" SortExpression="cPerformance" />
                        <asp:BoundField DataField="ActualWasteProduced" 
                            HeaderText="Waste Units" ReadOnly="True" 
                            SortExpression="ActualWasteProduced" />
                        <asp:BoundField DataField="cQuality" HeaderText="Quality" ReadOnly="True" 
                            SortExpression="cQuality" />
                        <asp:BoundField DataField="cOEE" HeaderText="OEE1" 
                            SortExpression="cOEE" ReadOnly="True" />
                        <asp:BoundField DataField="standardchangeovertime" 
                            HeaderText="Std. changeover time" SortExpression="standardchangeovertime" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                    </td>
        </tr>
        <tr>
            <td>
                                    <dotnetCHARTING:Chart runat="server" SpacingPercentage="0" 
                    HotspotMinimumSize="0" SpacingPercentageNested="4" 
                    FunnelNozzleWidthPercentage="35" DefaultCultureName="" 
                    TempDirectory="Charttemp" Width="800px" StartDateOfYear="" 
                    ID="chartOEE" DrillDownIntoSeries="False">
<SmartForecast Start="" TimeSpan="00:00:00"></SmartForecast>

<DefaultElement>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<DefaultLegendBox Padding="4" CornerBottomRight="Cut">
<HeaderEntry Visible="False"></HeaderEntry>
</DefaultLegendBox>

<NoDataLabel Text="No Data"></NoDataLabel>

<ChartArea StartDateOfYear="" CornerTopLeft="Square">
<DefaultElement>
<DefaultSubValue>
<Line Length="4"></Line>
</DefaultSubValue>

<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<Label Font="Tahoma, 8pt"></Label>

<YAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00"></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>

<GridLine Color="Red"></GridLine>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start="" TimeSpan="00:00:00"></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</YAxis>

<XAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00"></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>

<GridLine Color="Red"></GridLine>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start="" TimeSpan="00:00:00"></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</XAxis>

<TitleBox Position="Left">
<Label Font="Tahoma, 8pt, style=Bold" Color="97, 45, 38"></Label>
</TitleBox>

<LegendBox Padding="4" Orientation="TopRight" CornerBottomRight="Cut">
<HeaderEntry Visible="False">
<LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
</HeaderEntry>
</LegendBox>
</ChartArea>

<TitleBox Position="Left">
<Label Font="Tahoma, 8pt, style=Bold" Color="97, 45, 38"></Label>
</TitleBox>
</dotnetCHARTING:Chart>

                                </td>
        </tr>
        </table>
        
        
    </ContentTemplate>

    </asp:UpdatePanel>
  
</asp:Content>

