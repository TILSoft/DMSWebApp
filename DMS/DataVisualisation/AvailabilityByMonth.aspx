<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false" CodeFile="AvailabilityByMonth.aspx.vb" Inherits="FrontEnd_DataVisualisation_AvailabilityByMonth" title="Untitled Page" %>

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
            <td colspan="6">
                <h2>
                    Availability Analysis by Machine<cc1:ToolkitScriptManager 
                        ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Select Machine
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" 
                    DataValueField="LocID" RepeatDirection="Horizontal">
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
            <td>
                Start Time</td>
            <td>
                <asp:TextBox ID="txtstart" runat="server"></asp:TextBox>
            </td>
            <td>
                End Time</td>
            <td>
                <asp:TextBox ID="txtend" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                    <ContentTemplate >
                    
                    
                        <table class="style1">
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <dotnetCHARTING:Chart ID="ChartAvail" runat="server" Width="1000px"><SmartForecast 
                                        Start=""></SmartForecast><DefaultLegendBox CornerBottomRight="Cut" 
                                        Padding="4"><HeaderEntry Visible="False"></HeaderEntry></DefaultLegendBox><ChartArea 
                                        CornerTopLeft="Square" StartDateOfYear=""><DefaultElement><DefaultSubValue><Line 
                                        Length="4" /></DefaultSubValue><SmartLabel AbsolutePosition="0,0"></SmartLabel></DefaultElement><Label 
                                        Font="Tahoma, 8pt"></Label><YAxis GaugeLabelMode="Default" 
                                        GaugeNeedleType="One"><ScaleBreakLine Color="Gray"></ScaleBreakLine><TimeScaleLabels 
                                        MaximumRangeRows="4"></TimeScaleLabels><MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced><ZeroTick><Line 
                                        Length="3"></Line></ZeroTick><DefaultTick><Line Length="3"></Line><Label 
                                        Text="%Value"></Label></DefaultTick><TimeIntervalAdvanced Start=""></TimeIntervalAdvanced><Label 
                                        Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center"></Label></YAxis><XAxis 
                                        GaugeLabelMode="Default" GaugeNeedleType="One"><ScaleBreakLine Color="Gray"></ScaleBreakLine><TimeScaleLabels 
                                        MaximumRangeRows="4"></TimeScaleLabels><MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced><ZeroTick><Line 
                                        Length="3"></Line></ZeroTick><DefaultTick><Line Length="3"></Line><Label 
                                        Text="%Value"></Label></DefaultTick><TimeIntervalAdvanced Start=""></TimeIntervalAdvanced><Label 
                                        Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center"></Label></XAxis><TitleBox 
                                        Position="Left"><Label Color="Black"></Label></TitleBox><LegendBox 
                                        CornerBottomRight="Cut" Padding="4" Position="Top"><HeaderEntry Name="Name" 
                                        SortOrder="-1" Value="Value" Visible="False"></HeaderEntry></LegendBox></ChartArea><DefaultElement><SmartLabel 
                                        AbsolutePosition="0,0"></SmartLabel></DefaultElement><TitleBox 
                                        Position="Left"><Label Color="Black"></Label></TitleBox></dotnetCHARTING:Chart>
                                </td>
                            </tr>
                        </table>
                    
                    
                    </ContentTemplate>
                    
                    
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="ODSAvailAnalysis" Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="shifttime" HeaderText="shifttime" ReadOnly="True" 
                                                    SortExpression="shifttime" />
                                                <asp:BoundField DataField="Lottime" HeaderText="Lottime" ReadOnly="True" 
                                                    SortExpression="Lottime" />
                                                <asp:BoundField DataField="Changetime" HeaderText="Changetime" ReadOnly="True" 
                                                    SortExpression="Changetime" />
                                                <asp:BoundField DataField="IdleTime" HeaderText="IdleTime" ReadOnly="True" 
                                                    SortExpression="IdleTime" />
                                                <asp:BoundField DataField="Lotdowntime" HeaderText="Lotdowntime" 
                                                    ReadOnly="True" SortExpression="Lotdowntime" />
                                                <asp:BoundField DataField="ChangeDowntime" HeaderText="ChangeDowntime" 
                                                    ReadOnly="True" SortExpression="ChangeDowntime" />
                                                <asp:BoundField DataField="IdleDowntime" HeaderText="IdleDowntime" 
                                                    ReadOnly="True" SortExpression="IdleDowntime" />
                                                <asp:BoundField DataField="LottimeMinusLotdowntime" 
                                                    HeaderText="LottimeMinusLotdowntime" ReadOnly="True" 
                                                    SortExpression="LottimeMinusLotdowntime" />
                                                <asp:BoundField DataField="ChangetimeMinusChangedowntime" 
                                                    HeaderText="ChangetimeMinusChangedowntime" ReadOnly="True" 
                                                    SortExpression="ChangetimeMinusChangedowntime" />
                                                <asp:BoundField DataField="IdletimeMinusIdledowntime" 
                                                    HeaderText="IdletimeMinusIdledowntime" ReadOnly="True" 
                                                    SortExpression="IdletimeMinusIdledowntime" />
                                                <asp:BoundField DataField="Availability" HeaderText="Availability" 
                                                    ReadOnly="True" SortExpression="Availability" />
                                                <asp:BoundField DataField="UnAccountedTime" HeaderText="UnAccountedTime" 
                                                    ReadOnly="True" SortExpression="UnAccountedTime" />
                                                <asp:BoundField DataField="year" HeaderText="year" ReadOnly="True" 
                                                    SortExpression="year" />
                                                <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" 
                                                    SortExpression="Month" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ODSAvailAnalysis" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="PerformanceAnalysisTableAdapters.AvailabilityByMCbyMonthTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="RadioButtonList1" Name="lociD" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtstart" Name="start" PropertyName="Text" 
                                                    Type="DateTime" />
                                                <asp:ControlParameter ControlID="txtend" Name="_end" PropertyName="Text" 
                                                    Type="DateTime" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>

