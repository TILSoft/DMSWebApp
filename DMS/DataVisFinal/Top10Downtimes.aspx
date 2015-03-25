<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false"
    CodeFile="Top10Downtimes.aspx.vb" Inherits="FrontEnd_DataVisualisation_Top10Downtimes"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnetCHARTING" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td colspan="6">
                <h2>
                    Top 10 downtimes<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Start time
            </td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
            <td>
                End time
            </td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                </cc1:CalendarExtender>
            </td>
            <td>
                <asp:Label ID="lblRCId" runat="server" ForeColor="White"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select line</td>
            <td colspan="5">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSloc"
                    DataTextField="LocDescription" DataValueField="LocID" Style="height: 28px; width: 111px"
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSloc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
                Select Activity
            </td>
            <td colspan="5">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="ODSActtype"
                    DataTextField="ActivityDesc" DataValueField="ActivityTypeID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSActtype" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ActivityTableAdapters.tblActivityTypeTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActivityDesc" Type="String" />
                        <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                        <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActivityTypeID" Type="Int32" />
                        <asp:Parameter Name="ActivityDesc" Type="String" />
                        <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="5">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                            <table class="style1" __designer:mapid="129">
                                <tr __designer:mapid="12a">
                                    <td __designer:mapid="12b">
                                        Top 10 downtimes by root cause location
                                    </td>
                                </tr>
                                <tr __designer:mapid="12c">
                                    <td __designer:mapid="12d">

                                        <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Top10TableAdapters.Top10byRCLocationTableAdapter" ID="ODStop10RC"><SelectParameters>
<asp:ControlParameter ControlID="lblRCId" PropertyName="Text" Name="RClocid" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="RadioButtonList1" PropertyName="SelectedValue" Name="SympLocID" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtStart" PropertyName="Text" Name="start" Type="DateTime"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtEnd" PropertyName="Text" Name="downtimeend" Type="DateTime"></asp:ControlParameter>
<asp:ControlParameter ControlID="RadioButtonList2" PropertyName="SelectedValue" DefaultValue="%" Name="Activitytype" Type="String"></asp:ControlParameter>
</SelectParameters>
</asp:ObjectDataSource>

                                        <asp:GridView runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="LocID" DataSourceID="ODStop10RC" Width="100%" ID="GridView2"><Columns>
<asp:BoundField DataField="trimdt" HeaderText="Downtime " ReadOnly="True" SortExpression="trimdt"></asp:BoundField>
<asp:BoundField DataField="LocDescription" HeaderText="Loc Description" SortExpression="LocDescription"></asp:BoundField>
<asp:BoundField DataField="LocID" HeaderText="Loc ID" ReadOnly="True" InsertVisible="False" SortExpression="LocID"></asp:BoundField>
<asp:TemplateField HeaderText="Location Path"></asp:TemplateField>
</Columns>
</asp:GridView>

                                    </td>
                                </tr>
                                <tr __designer:mapid="130">
                                    <td __designer:mapid="131">
                                        <dotnetCHARTING:Chart runat="server" SpacingPercentage="16" HotspotMinimumSize="0" SpacingPercentageNested="4" FunnelNozzleWidthPercentage="35" FunnelSpacingPercentage="16" ChartAreaSpacing="0" DefaultCultureName="" TempDirectory="ChartTemp" Width="600px" Use3D="True" StartDateOfYear="" ID="Chart2">
<SmartForecast Start="" TimeSpan="00:00:00"></SmartForecast>

<DefaultElement>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<DefaultLegendBox Padding="4" CornerBottomRight="Cut">
<HeaderEntry Visible="False"></HeaderEntry>
</DefaultLegendBox>

<NoDataLabel Text="No Data"></NoDataLabel>
<SeriesCollection>
<dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" GaugeType="Circular">
<EmptyElement Color="63, 128, 128, 128">
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</EmptyElement>
</dotnetCHARTING:Series>
<dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" GaugeType="Circular">
<EmptyElement Color="63, 128, 128, 128">
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</EmptyElement>
</dotnetCHARTING:Series>
</SeriesCollection>

<ChartArea StartDateOfYear="" CornerTopLeft="Square">
<DefaultElement>
<DefaultSubValue>
<Line Length="4"></Line>
</DefaultSubValue>

<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<Label Font="Tahoma, 8pt"></Label>

<YAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes" SpacingPercentage="0" StaticColumnWidth="100">
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

<XAxis GaugeNeedleType="One" GaugeLabelMode="Default" TimeInterval="Minutes" SpacingPercentage="100">
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

<LegendBox Padding="4" Orientation="TopRight" Visible="False" CornerBottomRight="Cut">
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
                                <tr __designer:mapid="133">
                                    <td __designer:mapid="134">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
