<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="MultiLineOEEDateGroup.aspx.vb" Inherits="FrontEnd_FrontendDataVis_MultiLine1" title="Untitled Page" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
    
        
        
        <br />
        <table class="style1" width="100%">
            <tr>
                <td colspan="2">
                    <h2>
                        Multiline/OEE report</h2>
                </td>
            </tr>
            <tr>
                <td colspan="2">
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
                <td>
                    Enter Start Time</td>
                <td>
        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter End Time</td>
                <td>
        <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Select Period</td>
                <td>
                    <asp:DropDownList ID="ddlPeriod" runat="server">
                        <asp:ListItem>Month</asp:ListItem>
                        <asp:ListItem>Week</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Adjust Period (Manual adjustment to allow period to match)</td>
                <td>
                    <asp:TextBox ID="txtAdjPeriod" runat="server" Width="33px">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
        <asp:Button ID="btnGetData" runat="server" Text="Get Data" />
                </td>
            </tr>
            <tr>
                <td>
                    Select appropriate formats</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:CheckBoxList ID="cblLines" runat="server" DataSourceID="odsLocations" 
                        DataTextField="LocDescription" DataValueField="LocID">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    
        
        
        <asp:ObjectDataSource ID="odsLocations" runat="server" DeleteMethod="Delete" 
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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="periodid" DataSourceID="odsOEE">
            <Columns>
                <asp:BoundField DataField="periodid" HeaderText="periodid" 
                    InsertVisible="False" ReadOnly="True" SortExpression="periodid" />
                <asp:BoundField DataField="periodstart" HeaderText="periodstart" 
                    SortExpression="periodstart" />
                <asp:BoundField DataField="efficienttime" HeaderText="efficienttime" 
                    ReadOnly="True" SortExpression="efficienttime" />
                <asp:BoundField DataField="shifttime" HeaderText="shifttime" ReadOnly="True" 
                    SortExpression="shifttime" />
                <asp:BoundField DataField="EfficientOEE" HeaderText="EfficientOEE" 
                    ReadOnly="True" SortExpression="EfficientOEE" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsOEE" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="OEETableAdapters.EfficientTimeOEEMultiLineTableAdapter" 
        UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_periodid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="periodstart" Type="DateTime" />
                <asp:Parameter Name="Original_periodid" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Label3" Name="locString" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="txtStart" Name="PeriodStart" 
                    PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtEnd" Name="PeriodEnd" PropertyName="Text" 
                    Type="DateTime" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="periodstart" Type="DateTime" />
            </InsertParameters>
    </asp:ObjectDataSource>
        <p>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        </p>

</asp:Content>

