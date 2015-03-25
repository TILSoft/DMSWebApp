<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" CodeFile="EfficientTimeOEE.aspx.vb" Inherits="DataVisualisation_OEEbyLine" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" width="100%">
        <tr>
            <td colspan="6">
                <h2>
                    Efficient Time
                    OEE/Downtime Rate by Period<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Start Time</td>
            <td colspan="5">
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>
                End Time</td>
            <td colspan="5">
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                Choose line</td>
            <td colspan="5">
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
        <tr>
            <td colspan="1">
                <asp:CheckBox ID="cbOEE" runat="server" Checked="True" Text="Show OEE" />
            </td>
            <td>
                <asp:CheckBox ID="cbDTR" runat="server" Text="Show DowntimeRate" />
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Weeks</asp:ListItem>
                    <asp:ListItem>Months</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="1">
                &nbsp;</td>
            <td colspan="5">
                <asp:Button ID="BtnGetData" runat="server" Text="Get Data" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                                    <dotnetCHARTING:Chart runat="server" SpacingPercentage="0" 
                    HotspotMinimumSize="0" SpacingPercentageNested="4" 
                    FunnelNozzleWidthPercentage="35" DefaultCultureName="" 
                    TempDirectory="Charttemp" Width="1200px" StartDateOfYear="" 
                    ID="chartOEE" DrillDownIntoSeries="False" Height="500px">
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
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="WeekID" DataSourceID="OdsOEE">
                    <Columns>
                        <asp:BoundField DataField="periodstart" HeaderText="periodstart" 
                            SortExpression="periodstart" />
                        <asp:BoundField DataField="shifttime" HeaderText="Shift Time" ReadOnly="True" 
                            SortExpression="shifttime" />
                        <asp:BoundField DataField="efficienttime" HeaderText="Efficient Time" 
                            ReadOnly="True" SortExpression="efficienttime" />
                        <asp:BoundField DataField="downtime" HeaderText="Downtime " ReadOnly="True" 
                            SortExpression="downtime" />
                        <asp:BoundField DataField="lottime" HeaderText="Lot Time" ReadOnly="True" 
                            SortExpression="lottime" />
                        <asp:BoundField DataField="cotime" HeaderText="Change over time" ReadOnly="True" 
                            SortExpression="cotime" />
                        <asp:BoundField DataField="OEE" HeaderText="OEE" ReadOnly="True" 
                            SortExpression="OEE" />
                        <asp:BoundField DataField="DowntimeRate" HeaderText="Downtime Rate" 
                            ReadOnly="True" SortExpression="DowntimeRate" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="OdsOEE" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="OEETableAdapters.EfficientTimeOEETableAdapter">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_WeekID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStart" Name="weekstart" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="weekend" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        </table>
 <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >--%>
        
    
    
    <table class="style1">
        </table>
        
        
    </ContentTemplate>

    </asp:UpdatePanel>
  
</asp:Content>

