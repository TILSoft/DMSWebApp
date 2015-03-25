<%@ Page Language="VB" MasterPageFile="~/backend.master" MaintainScrollPositionOnPostback =true AutoEventWireup="false" CodeFile="DowntimeDrilldownbyLocation.aspx.vb" Inherits="FrontEnd_DataAnalysis_DowntimeDrilldownbyLocation" title="Untitled Page" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                     
                
                
                
                
                
         
    <table class="style1">
        <tr>
            <td colspan="6">
                <h2>
                    Drill Down by location</h2>
            </td>
        </tr>
        <tr>
            <td width="30%">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
            <td>
                Start Date</td>
            <td>
                <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy hh:mm" TargetControlID="txtStartDate">
                </cc1:CalendarExtender>
            </td>
            <td>
                End Date</td>
            <td>
                <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy hh:mm" TargetControlID="txtEndDate">
                </cc1:CalendarExtender>
            </td>
            <td>
                <asp:Button ID="BtnGetData" runat="server" Text="Go" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                    DataSourceID="ODSLocID" Width="100%">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                            Enabled='<%# Eval("LocationEnabled") %>' Text='<%# Eval("LocDescription") %>' 
                            Width="80%" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODSLocID" runat="server" DeleteMethod="Delete" 
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
                        <asp:SessionParameter Name="ParentLocID" SessionField="DTLocID" Type="Int32" />
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
            <td valign="top" colspan="5" align="left">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="Downtime Chart" ID="TabPanel1">
                        <ContentTemplate><dotnetCHARTING:Chart ID="Chart1" runat="server" ChartAreaSpacing="0" 
                                DefaultCultureName="" FunnelNozzleWidthPercentage="35" HotspotMinimumSize="0" 
                                SpacingPercentage="16" SpacingPercentageNested="4" StartDateOfYear="" 
                                TempDirectory="ChartTemp" Width="600px" Use3D="True" 
                                FunnelSpacingPercentage="16"><SmartForecast Start="" 
                                    TimeSpan="00:00:00" /><DefaultElement><SmartLabel AbsolutePosition="0,0"></SmartLabel></DefaultElement><DefaultLegendBox CornerBottomRight="Cut" Padding="4"><HeaderEntry Visible="False"></HeaderEntry></DefaultLegendBox><NoDataLabel Text="No Data"></NoDataLabel><SeriesCollection><dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                                        GaugeType="Circular"><EmptyElement Color="63, 128, 128, 128"><SmartLabel AbsolutePosition="0,0"></SmartLabel></EmptyElement></dotnetCHARTING:Series><dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                                        GaugeType="Circular"><EmptyElement Color="63, 128, 128, 128"><SmartLabel AbsolutePosition="0,0"></SmartLabel></EmptyElement></dotnetCHARTING:Series></SeriesCollection><ChartArea CornerTopLeft="Square" StartDateOfYear=""><DefaultElement><DefaultSubValue><Line Length="4" /></DefaultSubValue><SmartLabel AbsolutePosition="0,0"></SmartLabel></DefaultElement><Label Font="Tahoma, 8pt"></Label><YAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes" 
                                    SpacingPercentage="0" StaticColumnWidth="100"><ScaleBreakLine Color="Gray" /><TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels><MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" /><ZeroTick><Line Length="3" /><GridLine Color="Red" /></ZeroTick><DefaultTick><Line Length="3" /><Label Text="%Value"></Label></DefaultTick><TimeIntervalAdvanced Start="" TimeSpan="00:00:00" /><Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center"></Label></YAxis><XAxis GaugeLabelMode="Default" GaugeNeedleType="One" TimeInterval="Minutes" 
                                    SpacingPercentage="100"><ScaleBreakLine Color="Gray" /><TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels><MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" /><ZeroTick><Line Length="3" /><GridLine Color="Red" /></ZeroTick><DefaultTick><Line Length="3" /><Label Text="%Value"></Label></DefaultTick><TimeIntervalAdvanced Start="" TimeSpan="00:00:00" /><Label Alignment="Center" Font="Arial, 9pt, style=Bold" LineAlignment="Center"></Label></XAxis><TitleBox Position="Left"><Label Color="97, 45, 38" Font="Tahoma, 8pt, style=Bold"></Label></TitleBox><LegendBox CornerBottomRight="Cut" Padding="4" Orientation="TopRight" 
                                    Visible="False"><HeaderEntry Visible="False"><LabelStyle Font="Arial, 8pt, style=Bold" /></HeaderEntry></LegendBox></ChartArea><TitleBox Position="Left"><Label Color="97, 45, 38" Font="Tahoma, 8pt, style=Bold"></Label></TitleBox></dotnetCHARTING:Chart>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Downtime Details">
                        <ContentTemplate><asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSDTdescByLocID"><Columns><asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                        SortExpression="Downtimestart" /><asp:BoundField DataField="totalDowntime" HeaderText="totalDowntime" 
                                        ReadOnly="True" SortExpression="totalDowntime" /><asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                        SortExpression="LocDescription" /><asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                        SortExpression="RootCauseDesc" /><asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                        SortExpression="RemedyDescription" /></Columns></asp:GridView><asp:ObjectDataSource ID="ODSDTdescByLocID" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDates" 
                                TypeName="DataAnalysisTableAdapters.DetailsBasicByLocTableAdapter"><SelectParameters><asp:SessionParameter Name="locid" SessionField="DTLocID" Type="Int32" /><asp:ControlParameter ControlID="txtEndDate" Name="downtimeend" 
                                        PropertyName="Text" Type="DateTime" /><asp:ControlParameter ControlID="txtStartDate" Name="downtimestart" 
                                        PropertyName="Text" Type="DateTime" /></SelectParameters></asp:ObjectDataSource>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    
                        <cc1:TabPanel runat="server" HeaderText="Engineering Notes" ID="TabPanel3">
                        
                        
                        
                        
                        <ContentTemplate><asp:GridView ID="GridView3" runat="server" 
                                AutoGenerateColumns="False" DataKeyNames="EngNoteID" DataSourceID="ODSEngNotes" 
                                Width="100%"><Columns><asp:BoundField DataField="LocDescription" 
                                    HeaderText="LocDescription" SortExpression="LocDescription" /><asp:BoundField DataField="Comment" HeaderText="Comment" 
                                    SortExpression="Comment" /><asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                    SortExpression="FormatDesc" /><asp:BoundField DataField="Username" HeaderText="Username" 
                                    SortExpression="Username" /><asp:BoundField DataField="NoteDate" HeaderText="NoteDate" 
                                    SortExpression="NoteDate" /></Columns></asp:GridView><asp:ObjectDataSource ID="ODSEngNotes" runat="server" 
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
            <td colspan="3" width="50%">
                <br />
            </td>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="LocID" DataSourceID="ODSDTbyParentLoc">
                    <Columns>
                        <asp:BoundField DataField="LocDescription" HeaderText="Location Description" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="TotalDowntime" HeaderText="Total Downtime" 
                            ReadOnly="True" SortExpression="TotalDowntime" />
                        <asp:BoundField DataField="LocID" HeaderText="LocID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="LocID" />
                        <asp:BoundField DataField="ParentLocID" HeaderText="ParentLocID" 
                            SortExpression="ParentLocID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSDTbyParentLoc" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                    TypeName="DataAnalysisTableAdapters.GetDTFromParentLocIDTableAdapter" 
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
                        <asp:ControlParameter ControlID="txtStartDate" Name="Starttime" 
                            PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEndDate" Name="endtime" PropertyName="Text" 
                            Type="DateTime" />
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
            <td>
                &nbsp;</td>
            <td colspan="5">
                &nbsp;</td>
        </tr>
    </table>
    
           
     
</asp:Content>

