<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false" MaintainScrollPositionOnPostback ="true" CodeFile="AllActivityAnalysisMultiFormat.aspx.vb" Inherits="FrontEnd_DataVisualisation_AllActiivtyAnalysis" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    All Activity Analysis - Search by multi formats</h2>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        Start time</td>
                    <td>
                        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        End time</td>
                    <td>
                        <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select a line</td>
                    <td colspan="3">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
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
                    <td colspan="3">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                    DataSourceID="ODSActivity" DataTextField="ActivityDesc" 
                    DataValueField="ActivityTypeID" 
                    RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                        <asp:ObjectDataSource ID="ODSActivity" runat="server" DeleteMethod="Delete" 
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
                    <td valign="top">
                        Enter format search </td>
                    <td colspan="3">
                        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
                            CollapseControlID="btnCollapse" Collapsed="True" 
                    ExpandControlID="btnExpand" TargetControlID="pnlformat">
                        </cc1:CollapsiblePanelExtender>
                        <asp:TextBox ID="txtFormatSearch" runat="server"></asp:TextBox>
                        &nbsp;To select all formats enter &#39;%&#39;<br />
                        <table class="style3">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnExpand" runat="server">Show formats</asp:LinkButton>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="btnCollapse" runat="server">Hide</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnlFormat" runat="server">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="FormatID" DataSourceID="ODSformat" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                        SortExpression="FormatDesc" />
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODSformat" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetDataByFormatDescriptionSearch" 
                                TypeName="LocationsTableAdapters.tblFormatTableAdapter" 
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FormatDesc" Type="String" />
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                    <asp:Parameter Name="StdTime" Type="Int32" />
                                    <asp:Parameter Name="ActivityType" Type="Int32" />
                                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtFormatSearch" Name="formatdesc" 
                                        PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="RadioButtonList2" Name="activitytype" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="FormatDesc" Type="String" />
                                    <asp:Parameter Name="LocID" Type="Int32" />
                                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                    <asp:Parameter Name="StdTime" Type="Int32" />
                                    <asp:Parameter Name="ActivityType" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
   
            </td>
        </tr>
        </table>
   
    <table class="style1">
        <tr>
            <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                        <HeaderTemplate>
                            Comparison Chart
                        </HeaderTemplate>
                    <ContentTemplate >
                    
                        <table class="style1">
                            <tr>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <dotnetCHARTING:Chart ID="ActivityChart" runat="server" DefaultCultureName="" 
                                        FunnelNozzleWidthPercentage="35" HotspotMinimumSize="0" SpacingPercentage="0" 
                                        SpacingPercentageNested="4" StartDateOfYear="" TempDirectory="Charttemp" 
                                        Use3D="True" Width="900px">
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
                                            <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes">
                                                <ScaleBreakLine Color="Gray" />
                                                <TimeScaleLabels MaximumRangeRows="4">
                                                </TimeScaleLabels>
                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <ZeroTick>
                                                    <Line Length="3" />
                                                    <GridLine Color="Red" />
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
                                            <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes">
                                                <ScaleBreakLine Color="Gray" />
                                                <TimeScaleLabels MaximumRangeRows="4">
                                                </TimeScaleLabels>
                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                <ZeroTick>
                                                    <Line Length="3" />
                                                    <GridLine Color="Red" />
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
                                            <LegendBox CornerBottomRight="Cut" Orientation="TopRight" Padding="4">
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
                                    &nbsp;</td>
                            </tr>
                        </table>
                    
                    
                    </ContentTemplate>
                    
                    
                    </cc1:TabPanel>
                    
                      <cc1:TabPanel runat="server" HeaderText="Stats for Format" ID="TabPanel2">
                      <ContentTemplate>
                       
                      
                      
                          <table class="style1">
                              <tr>
                                  <td>
                                      View stats for this format<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                          <ContentTemplate>
                                              <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                  <ProgressTemplate>
                                                      Its coming just be patient...
                                                  </ProgressTemplate>
                                              </asp:UpdateProgress>
                                              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                  DataSourceID="ODSOee" Visible="False">
                                                  <Columns>
                                                      <asp:BoundField DataField="txtID" HeaderText="txtID" SortExpression="txtID" />
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
                                                  </Columns>
                                              </asp:GridView>
                                              <asp:Button ID="btnOEE" runat="server" Text="Show OEE Data" />
                                          </ContentTemplate>
                                      </asp:UpdatePanel>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center">
                                      <asp:ObjectDataSource ID="ODSOee" runat="server" 
                                          OldValuesParameterFormatString="original_{0}" 
                                          SelectMethod="GetDataByStartEndActivitytypeFormat" 
                                          TypeName="OEETableAdapters.OEEByActivityTableAdapter">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="txtFormatSearch" Name="formatsearch" 
                                                  PropertyName="Text" Type="String" />
                                              <asp:ControlParameter ControlID="txtStart" Name="activitystart" 
                                                  PropertyName="Text" Type="DateTime" />
                                              <asp:ControlParameter ControlID="txtEnd" Name="activityend" PropertyName="Text" 
                                                  Type="DateTime" />
                                              <asp:ControlParameter ControlID="RadioButtonList2" Name="activitytype" 
                                                  PropertyName="SelectedValue" Type="Int32" />
                                              <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                                                  PropertyName="SelectedValue" Type="Int32" />
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
        <tr>
            <td>
                Notes on report<br />
                1) Shows all activities which start in the time range<br />
                2) Does not truncate the activities<br />
                3) OEE calc as per the weekly OEE calculation but on a per lot basis</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

