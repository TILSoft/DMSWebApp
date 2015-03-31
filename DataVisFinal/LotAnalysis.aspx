<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false"
    CodeFile="LotAnalysis.aspx.vb" Inherits="FrontEnd_DataVisualisation_LotAnalysis"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnetCHARTING" %>
<%@ Register src="../Controls/TimeLine2.ascx" tagname="TimeLine" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Analysis By Activity Item</h2>
            </td>
        </tr>
        <tr>
            <td width="20%">
                Select Line
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="ODSLoc"
                    DataTextField="LocDescription" DataValueField="LocID" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSLoc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
            <td width="20%">
                Select Activity</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSActivities" DataTextField="ActivityDesc" 
                    DataValueField="ActivityTypeID" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSActivities" runat="server" DeleteMethod="Delete" 
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
        </tr>
        <tr>
            <td width="20%">
                Select&nbsp; instance</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ODSlot" DataTextField="txtID"
                    DataValueField="ActivityID" AutoPostBack="True">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSlot" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ActivityTableAdapters.LotNosWithActivityIDsTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList2" DefaultValue="" 
                            Name="Activitytype" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="" Name="locid" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="txtID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="lblActID" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="Summary Availability Chart" ID="TabPanel1">
                        <ContentTemplate>
                            <table >
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td align="center">
                                        <dotnetCHARTING:Chart ID="OEEChart" runat="server" DefaultCultureName="" FunnelNozzleWidthPercentage="35"
                                            HotspotMinimumSize="0" SpacingPercentage="0" SpacingPercentageNested="4" StartDateOfYear=""
                                            TempDirectory="charttemp" Width="800px">
                                            <SmartForecast Start="" />
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
                                                <YAxis GaugeLabelMode="Default" GaugeNeedleType="One">
                                                    <ScaleBreakLine Color="Gray" />
                                                    <TimeScaleLabels MaximumRangeRows="4">
                                                    </TimeScaleLabels>
                                                    <MinorTimeIntervalAdvanced Start="" />
                                                    <ZeroTick>
                                                        <Line Length="3" />
                                                        <GridLine Color="Red" />
                                                    </ZeroTick>
                                                    <DefaultTick>
                                                        <Line Length="3" />
                                                        <Label Text="%Value">
                                                        </Label>
                                                    </DefaultTick>
                                                    <TimeIntervalAdvanced Start="" />
                                                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                    </Label>
                                                </YAxis>
                                                <XAxis GaugeLabelMode="Default" GaugeNeedleType="One">
                                                    <ScaleBreakLine Color="Gray" />
                                                    <TimeScaleLabels MaximumRangeRows="4">
                                                    </TimeScaleLabels>
                                                    <MinorTimeIntervalAdvanced Start="" />
                                                    <ZeroTick>
                                                        <Line Length="3" />
                                                        <GridLine Color="Red" />
                                                    </ZeroTick>
                                                    <DefaultTick>
                                                        <Line Length="3" />
                                                        <Label Text="%Value">
                                                        </Label>
                                                    </DefaultTick>
                                                    <TimeIntervalAdvanced Start="" />
                                                    <Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center">
                                                    </Label>
                                                </XAxis>
                                                <TitleBox Position="Left">
                                                    <Label Color="97, 45, 38" Font="Tahoma, 8pt, style=Bold">
                                                    </Label>
                                                </TitleBox>
                                                <LegendBox CornerBottomRight="Cut" Padding="4" Position="Top">
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
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Lot Data" ID="TabPanel2">
                       
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        Lot Data</td>
                                    <td>
                                        OEE for lot</td>
                                </tr>
                                <tr>
                                    <td align="center" width="50%">
                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                            DataKeyNames="ActivityID" DataSourceID="ODSActivityDetails" Height="50px" 
                                            Width="100%">
                                            <Fields>
                                                <asp:BoundField DataField="ActivityID" HeaderText="ActivityID" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="ActivityID" />
                                                <asp:BoundField DataField="ActivityDesc" HeaderText="ActivityDesc" 
                                                    SortExpression="ActivityDesc" />
                                                <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                    SortExpression="LocDescription" />
                                                <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                                    SortExpression="FormatDesc" />
                                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                                                    SortExpression="StartTime" />
                                                <asp:BoundField DataField="endtime" HeaderText="endtime" 
                                                    SortExpression="endtime" />
                                                <asp:BoundField DataField="txtID" HeaderText="txtID" SortExpression="txtID" />
                                                <asp:BoundField DataField="GoodProduct" HeaderText="GoodProduct" 
                                                    SortExpression="GoodProduct" />
                                                <asp:BoundField DataField="TargetOutput" HeaderText="TargetOutput" 
                                                    SortExpression="TargetOutput" />
                                                <asp:BoundField DataField="Waste" HeaderText="Waste" SortExpression="Waste" />
                                                <asp:BoundField DataField="startsign" HeaderText="startsign" 
                                                    SortExpression="startsign" />
                                                <asp:BoundField DataField="endsign" HeaderText="endsign" 
                                                    SortExpression="endsign" />
                                                <asp:BoundField DataField="StartSignTime" HeaderText="StartSignTime" 
                                                    SortExpression="StartSignTime" />
                                                <asp:BoundField DataField="EndSigntime" HeaderText="EndSigntime" 
                                                    SortExpression="EndSigntime" />
                                            </Fields>
                                        </asp:DetailsView>
                                        <asp:ObjectDataSource ID="ODSActivityDetails" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataActivityID" 
                                            TypeName="ActivityTableAdapters.ActivityDetailTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblActID" Name="ActivityID" 
                                                    PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td align="center" valign="top" width="50%">
                                        <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" 
                                            DataSourceID="ODSOEE0" Height="50px" Width="100%">
                                            <Fields>
                                                <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                                                    SortExpression="ShiftTime" />
                                                <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                                                    SortExpression="LotTime" />
                                                <asp:BoundField DataField="Downtime" HeaderText="Downtime" ReadOnly="True" 
                                                    SortExpression="Downtime" />
                                                <asp:BoundField DataField="cAvailability" HeaderText="cAvailability" 
                                                    ReadOnly="True" SortExpression="cAvailability" />
                                                <asp:BoundField DataField="TheoreticalUnitsProduced" 
                                                    HeaderText="TheoreticalUnitsProduced" ReadOnly="True" 
                                                    SortExpression="TheoreticalUnitsProduced" />
                                                <asp:BoundField DataField="ActualUnitsProduced" 
                                                    HeaderText="ActualUnitsProduced" ReadOnly="True" 
                                                    SortExpression="ActualUnitsProduced" />
                                                <asp:BoundField DataField="cPerformance" HeaderText="cPerformance" 
                                                    ReadOnly="True" SortExpression="cPerformance" />
                                                <asp:BoundField DataField="ActualWasteProduced" 
                                                    HeaderText="ActualWasteProduced" ReadOnly="True" 
                                                    SortExpression="ActualWasteProduced" />
                                                <asp:BoundField DataField="cQuality" HeaderText="cQuality" ReadOnly="True" 
                                                    SortExpression="cQuality" />
                                                <asp:BoundField DataField="cOEE" HeaderText="cOEE" ReadOnly="True" 
                                                    SortExpression="cOEE" />
                                                <asp:BoundField DataField="txtID" HeaderText="txtID" SortExpression="txtID" />
                                            </Fields>
                                        </asp:DetailsView>
                                        <asp:ObjectDataSource ID="ODSOEE0" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="OEETableAdapters.OEEByActivityTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblActID" Name="activityid" 
                                                    PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel3">
                        <HeaderTemplate>
                            Time line
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="style1">
                                <tr >
                                    <td width="10%" height="50px">
                                        Downtime
                                    </td>
                                    <td width="850px">
                                    
                                   
                                        <uc1:timeline id="WUCDT" runat="server" colour="red" showdatetime="false" 
                                            width="800" />
                                    </td>
                                </tr>
                                <tr >
                                    <td height="50px">
                                        Lot/CO
                                    </td>
                                    <td width="850px">
                                        <uc1:timeline id="WUCLot" runat="server" colour="Blue" showdatetime="false" 
                                            width="800" />
                                    </td>
                                </tr>
                                <tr >
                                    <td>
                                        Shift
                                    </td>
                                    <td width="850px">
                                        <uc1:timeline id="WUCShift" runat="server" colour="Green" showdatetime="true" 
                                            width="800" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    
                         <cc1:TabPanel runat="server" HeaderText="Performance Data" ID="TabPanel4">
                         
                         
                         <ContentTemplate >
                         
                         
                         
                         
                         
                             <table >
                                 <tr>
                                     <td width="100%">
                                         &nbsp;</td>
                                 </tr>
                                 <tr>
                                     <td align="center">
                                         &nbsp;</td>
                                 </tr>
                             </table>
                         
                         
                         
                         
                         
                         </ContentTemplate>
                      
                         
                         
                         
                         
                         </cc1:TabPanel>
              
                    
                    
                </cc1:TabContainer>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
