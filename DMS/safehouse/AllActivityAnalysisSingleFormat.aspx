<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false" CodeFile="AllActivityAnalysisSingleFormat.aspx.vb" Inherits="FrontEnd_DataVisualisation_AllActiivtyAnalysis" title="Untitled Page" %>

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
                    All Activity Analysis</h2>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                Start time</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                                          <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server"
            TargetControlID="txtStart" 
            Mask="99/99/9999 99:99:99"
            MaskType="DateTime"
            CultureName = "en-CA"
            ErrorTooltipEnabled="True" />
                                        
            </td>
            <td>
                End time</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                                          <cc1:MaskedEditExtender ID="MaskedEditExtender7" runat="server"
            TargetControlID="txtEnd" 
            Mask="99/99/9999 99:99:99"
            MaskType="DateTime"
            CultureName = "en-CA"
            ErrorTooltipEnabled="True" />
                                        
                                    </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select a line</td>
            <td colspan="3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select Activity</td>
            <td colspan="3">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                    DataSourceID="ODSActivity" DataTextField="ActivityDesc" 
                    DataValueField="ActivityTypeID" AutoPostBack="True" 
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
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select Format</td>
            <td colspan="3">
                <asp:DropDownList ID="ddlFormat" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSformat" DataTextField="FormatDesc" DataValueField="FormatID">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSformat" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByLocIDandActivityAll" 
                    TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
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
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList2" Name="activityType" 
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
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                        <HeaderTemplate>
                            Overview
                        </HeaderTemplate>
                    <ContentTemplate >
                    
                        <table class="style1">
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
                                      View stats for this format</td>
                              </tr>
                              <tr>
                                  <td align="center">
                                      <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                          DataSourceID="ODSStats" Height="50px" Width="50%">
                                          <Fields>
                                              <asp:BoundField DataField="avgtime" HeaderText="avgtime" ReadOnly="True" 
                                                  SortExpression="avgtime" />
                                              <asp:BoundField DataField="maxtime" HeaderText="maxtime" ReadOnly="True" 
                                                  SortExpression="maxtime" />
                                              <asp:BoundField DataField="mintime" HeaderText="mintime" ReadOnly="True" 
                                                  SortExpression="mintime" />
                                              <asp:BoundField DataField="stddev" HeaderText="stddev" ReadOnly="True" 
                                                  SortExpression="stddev" />
                                          </Fields>
                                      </asp:DetailsView>
                                      <asp:ObjectDataSource ID="ODSStats" runat="server" 
                                          OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                          TypeName="PerformanceAnalysisTableAdapters.ActivityStatsTableAdapter">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="RadioButtonList2" Name="activitytype" 
                                                  PropertyName="SelectedValue" Type="Int32" />
                                              <asp:ControlParameter ControlID="ddlFormat" Name="format" 
                                                  PropertyName="SelectedValue" Type="Int32" />
                                              <asp:ControlParameter ControlID="RadioButtonList1" Name="LocIDSymp" 
                                                  PropertyName="SelectedValue" Type="Int32" />
                                              <asp:ControlParameter ControlID="txtStart" Name="startime" PropertyName="Text" 
                                                  Type="DateTime" />
                                              <asp:ControlParameter ControlID="txtEnd" Name="endtime" PropertyName="Text" 
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
        <tr>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

