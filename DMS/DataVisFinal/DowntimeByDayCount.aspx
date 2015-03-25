<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="DowntimeByDayCount.aspx.vb" Inherits="DataVisFinal_WeeklyCount" title="Untitled Page" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="3">
                <h2>
                    Daily Downtime Count</h2>
            </td>
        </tr>
        <tr>
            <td>
                Select Line</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSLoc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
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
                        <asp:Parameter DefaultValue="0" Name="ParentLocID" Type="Int32" />
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
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="3" width="100%">
                <dotnetCHARTING:Chart ID="ChtDailyDowntime" runat="server" Width="650px">
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
    </table>
</asp:Content>

