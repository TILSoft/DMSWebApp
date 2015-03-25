<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" MaintainScrollPositionOnPostback ="true" AutoEventWireup="false" CodeFile="DowntimeDrilldownbyLocation.aspx.vb" Inherits="FrontEnd_DataAnalysis_DowntimeDrilldownbyLocation" title="Untitled Page" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
           
        }
        .style4
        {
            width: 100%;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                     
                
                
                
                
                
         
    <table class="style1" align="center">
        <tr>
            <td colspan="3">
                <h2>
                    Drill Down by location</h2>
            </td>
        </tr>
        <tr>
            <td>
                Start Date</td>
            <td colspan="2">
                <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStartDate">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>
                End Date</td>
            <td colspan="2">
                <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtEndDate">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Select line</td>
            <td colspan="2" class="style3">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="ODSLoc" 
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
                Select Activity</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSAct" DataTextField="ActivityDesc" 
                    DataValueField="ActivityTypeID" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSAct" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="ActivityTableAdapters.tblActivityTypeTableAdapter" 
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
            <td>
                <asp:Button ID="Button1" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td>
                Path</td>
            <td colspan="2">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="3">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                    Width="100%" Height="600px">
                    <cc1:TabPanel runat="server" HeaderText="Downtime Chart"  ID="TabPanel1">
                        <ContentTemplate>
                            <table class="style4">
                                <tr>
                                    <td align="center">
                                        <dotnetCHARTING:Chart ID="Chart1" runat="server" ChartAreaSpacing="0" 
                                            DefaultCultureName="" FunnelNozzleWidthPercentage="35" 
                                            FunnelSpacingPercentage="16" Height="600px" HotspotMinimumSize="0" 
                                            SpacingPercentage="16" SpacingPercentageNested="4" StartDateOfYear="" 
                                            TempDirectory="ChartTemp" Use3D="True" Width="800px">
                                            <SmartForecast Start="" TimeSpan="00:00:00" />
                                            <DefaultElement>
                                                <SmartLabel AbsolutePosition="0,0">
                                                </SmartLabel>
                                            </DefaultElement>
                                            <DefaultLegendBox CornerBottomRight="Cut" Padding="4">
                                                <HeaderEntry Visible="False">
                                                </HeaderEntry>
                                            </DefaultLegendBox>
                                            <NoDataLabel Text="No Data">
                                            </NoDataLabel>
                                            <SeriesCollection>
                                                <dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                                                    GaugeType="Circular">
                                                    <EmptyElement Color="63, 128, 128, 128">
                                                        <SmartLabel AbsolutePosition="0,0">
                                                        </SmartLabel>
                                                    </EmptyElement>
                                                </dotnetCHARTING:Series>
                                                <dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                                                    GaugeType="Circular">
                                                    <EmptyElement Color="63, 128, 128, 128">
                                                        <SmartLabel AbsolutePosition="0,0">
                                                        </SmartLabel>
                                                    </EmptyElement>
                                                </dotnetCHARTING:Series>
                                            </SeriesCollection>
                                            <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                                                <DefaultElement>
                                                    <DefaultSubValue>
                                                        <Line Length="4" />
                                                    </DefaultSubValue>
                                                    <SmartLabel AbsolutePosition="0,0">
                                                    </SmartLabel>
                                                </DefaultElement>
                                                <Label Font="Tahoma, 8pt">
                                                </Label>
                                                <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SpacingPercentage="0" 
                                                    StaticColumnWidth="100" TimeInterval="Minutes">
                                                    <ScaleBreakLine Color="Gray" />
                                                    <TimeScaleLabels MaximumRangeRows="4">
                                                    </TimeScaleLabels>
                                                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                    <ZeroTick>
                                                        <Line Length="3" />
                                                    </ZeroTick>
                                                    <DefaultTick>
                                                        <Line Length="3" />
                                                        <Label Text="%Value">
                                                        </Label>
                                                    </DefaultTick>
                                                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                    </Label>
                                                </YAxis>
                                                <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SpacingPercentage="100" 
                                                    TimeInterval="Minutes">
                                                    <ScaleBreakLine Color="Gray" />
                                                    <TimeScaleLabels MaximumRangeRows="4">
                                                    </TimeScaleLabels>
                                                    <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                    <ZeroTick>
                                                        <Line Length="3" />
                                                    </ZeroTick>
                                                    <DefaultTick>
                                                        <Line Length="3" />
                                                        <Label Text="%Value">
                                                        </Label>
                                                    </DefaultTick>
                                                    <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                    </Label>
                                                </XAxis>
                                                <TitleBox Position="Left">
                                                    <Label Color="97, 45, 38" Font="Tahoma, 8pt, style=Bold">
                                                    </Label>
                                                </TitleBox>
                                                <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4" 
                                                    Visible="False">
                                                    <HeaderEntry Visible="False">
                                                        <LabelStyle Font="Arial, 8pt, style=Bold" />
                                                    </HeaderEntry>
                                                </LegendBox>
                                            </ChartArea>
                                            <TitleBox Position="Left">
                                                <Label Color="97, 45, 38" Font="Tahoma, 8pt, style=Bold">
                                                </Label>
                                            </TitleBox>
                                        </dotnetCHARTING:Chart>
                                    </td>
                                </tr>
                            </table>
                            </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Downtime Details">
                        <ContentTemplate><asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataSourceID="ODSDTdescByLocID" Width="100%"><Columns>
                                <asp:BoundField DataField="Downtimestart" HeaderText="Downtime start" 
                                        SortExpression="Downtimestart" /><asp:BoundField 
                                    DataField="Downtimeend" HeaderText="Downtime end" 
                                    SortExpression="Downtimeend" /><asp:BoundField 
                                    DataField="SymptomDesc" HeaderText="Symptom Description" 
                                    SortExpression="SymptomDesc" />
                                <asp:BoundField 
                                    DataField="LocDescription" HeaderText="Root Cause Location" 
                                        SortExpression="LocDescription" />
                                <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause Description" 
                                        SortExpression="RootCauseDesc" />
                                <asp:BoundField 
                                    DataField="RemedyDescription" HeaderText="Remedy Description" 
                                        SortExpression="RemedyDescription" />
                                <asp:BoundField 
                                    DataField="totalDowntime" HeaderText="Elapsed DT" ReadOnly="True" 
                                    SortExpression="totalDowntime" />
                                <asp:BoundField DataField="ShiftDowntime" 
                                    HeaderText="Actual DT" ReadOnly="True" SortExpression="ShiftDowntime" /></Columns><EmptyDataTemplate>There are no downtimes for this selection</EmptyDataTemplate></asp:GridView><asp:ObjectDataSource 
                                ID="ODSDTdescByLocID" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDates" 
                                TypeName="DowntimeAnalysisTableAdapters.DetailsBasicByLocTableAdapter"><SelectParameters><asp:SessionParameter Name="locid" SessionField="DTLocID" Type="Int32" /><asp:ControlParameter 
                                        ControlID="RadioButtonList2" Name="MachineLocID" PropertyName="SelectedValue" 
                                        Type="Int32" /><asp:ControlParameter ControlID="txtEndDate" Name="downtimeend" 
                                        PropertyName="Text" Type="DateTime" /><asp:ControlParameter ControlID="txtStartDate" Name="downtimestart" 
                                        PropertyName="Text" Type="DateTime" /><asp:ControlParameter 
                                        ControlID="RadioButtonList1" Name="activitytype" PropertyName="SelectedValue" 
                                        Type="String" /></SelectParameters></asp:ObjectDataSource><br />note:&#160; total downtime may differ from downtime chart as downtime in this table is selected on the basis that it starts in the period defined.&#160; Hence it may overlap the period defined.</ContentTemplate>
                    </cc1:TabPanel>
                    
                        <cc1:TabPanel runat="server" HeaderText="Engineering Notes" ID="TabPanel3">
                        
                        
                        
                        
                        <ContentTemplate>
                            <asp:GridView ID="GridView3" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="EngNoteID" DataSourceID="ODSEngNotes" 
                                Width="100%" AllowPaging="True" AllowSorting="True"><Columns>
                                    <asp:BoundField DataField="LocDescription" 
                                    HeaderText="Note Location Description" SortExpression="LocDescription" /><asp:BoundField DataField="Comment" HeaderText="Comment" 
                                    SortExpression="Comment" />
                                    <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                                    SortExpression="FormatDesc" /><asp:BoundField DataField="Username" HeaderText="Username" 
                                    SortExpression="Username" />
                                    <asp:BoundField DataField="NoteDate" HeaderText="Date" 
                                    SortExpression="NoteDate" /></Columns><EmptyDataTemplate>There are no engineering notes entered for this location</EmptyDataTemplate></asp:GridView><asp:ObjectDataSource ID="ODSEngNotes" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="EngNoteTableAdapters.EngNoteDetailsTableAdapter"><SelectParameters><asp:SessionParameter 
                                        Name="locid" SessionField="DTLocID" Type="Int32" /><asp:ControlParameter ControlID="txtStartDate" Name="startdate" 
                                        PropertyName="Text" Type="DateTime" /><asp:ControlParameter ControlID="txtEndDate" Name="enddate" PropertyName="Text" 
                                        Type="DateTime" /></SelectParameters></asp:ObjectDataSource>
                    </ContentTemplate>
                    </cc1:TabPanel>
                        
               
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td colspan="3" width="50%" align="center" valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="ODSDTbyParentLoc" AllowSorting="True" DataKeyNames="LocID">
                    <Columns>
                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="TotalDowntime" HeaderText="TotalDowntime" 
                            ReadOnly="True" SortExpression="TotalDowntime" />
                        <asp:BoundField DataField="LocID" HeaderText="LocID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="LocID" />
                        <asp:BoundField DataField="ParentLocID" HeaderText="ParentLocID" 
                            SortExpression="ParentLocID" />
                        <asp:BoundField DataField="DowntimeCount" HeaderText="DowntimeCount" 
                            ReadOnly="True" SortExpression="DowntimeCount" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSDTbyParentLoc" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DowntimeAnalysisTableAdapters.tblLocTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_LocID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocDescription" Type="String" />
                        <asp:Parameter Name="ParentLocID" Type="Int32" />
                        <asp:Parameter Name="Original_LocID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList2" Name="MachineLocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStartDate" Name="Starttime" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndDate" Name="endtime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="%" 
                            Name="activityID" PropertyName="SelectedValue" Type="String" />
                        <asp:SessionParameter Name="ParentLocID" SessionField="DTLocID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LocDescription" Type="String" />
                        <asp:Parameter Name="ParentLocID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                note for report:&nbsp; this report only shows the downtime that occured during a 
                shift.&nbsp; If a downtime was started in one shift and finished in the next 
                with a non shift period in between then only the downtime which coincided with a 
                shift is calculated here.</td>
        </tr>
    </table>
    
           
     
</asp:Content>

