<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false" CodeFile="PeriodAnalysis.aspx.vb" Inherits="FrontEnd_DataVisualisation_PeriodAnalysis" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register src="../Controls/TimeLine2.ascx" tagname="TimeLine" tagprefix="uc1" %>

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
            <td colspan="7">
                <h2>
                    View data for a fixed period<cc1:ToolkitScriptManager 
                        ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Select Line</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" 
                    DataValueField="LocID" RepeatDirection="Horizontal" AutoPostBack="True">
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
                Start time</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                                        <cc1:MaskedEditExtender ID="MaskedEditExtender6" 
                    runat="server" TargetControlID="txtstart"
                                            Mask="99/99/9999 99:99:99" MaskType="DateTime" CultureName="en-CA" 
                                            ErrorTooltipEnabled="True" />
            </td>
            <td>
                End time</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                                        <cc1:MaskedEditExtender ID="MaskedEditExtender7" 
                    runat="server" TargetControlID="txtend"
                                            Mask="99/99/9999 99:99:99" MaskType="DateTime" CultureName="en-CA" 
                                            ErrorTooltipEnabled="True" />
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="Time Line" ID="TabPanel1">
                    <ContentTemplate ><table width = 100%><tr ><td>Downtime</td><td width="700"><uc1:TimeLine ID="WUCDT" runat="server" Colour="red" Width="600"></uc1:TimeLine></td></tr><tr ><td>Lot/CO/idle</td><td width="700"><uc1:TimeLine ID="WUClot" runat="server" colour="orange" Width="600"></uc1:TimeLine></td></tr><tr ><td>Shift</td><td width="700"><uc1:TimeLine ID="WUCShift" runat="server" colour="green" Width="600"></uc1:TimeLine></td></tr>
                        <tr>
                            <td colspan="2" width="100%">
                                <table class="style2" width="100%">
                                    <tr>
                                        <td align="center" colspan="2" width="20%">
                                            Time line Colour Key
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" colspan="2" width="20%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="Red" width="20%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            Downtime
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="Blue">
                                            &nbsp;
                                        </td>
                                        <td>
                                            Lot time
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#660066">
                                            &nbsp;
                                        </td>
                                        <td>
                                            Change over time
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#006600">
                                            &nbsp;
                                        </td>
                                        <td>
                                            Shift time
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </ContentTemplate>
                    

</cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                    
                    <HeaderTemplate>Availability Data
                    </HeaderTemplate>
                    
<ContentTemplate ><table class="style3"><tr><td colspan="2">Availability Data by machine and duration</td></tr><tr><td><asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataSourceID="ODSperf" Height="50px" Width="125px"><Fields><asp:BoundField DataField="shifttime" HeaderText="shifttime" ReadOnly="True" 
                        SortExpression="shifttime" /><asp:BoundField DataField="Lottime" HeaderText="Lottime" ReadOnly="True" 
                        SortExpression="Lottime" /><asp:BoundField DataField="Changetime" HeaderText="Changetime" ReadOnly="True" 
                        SortExpression="Changetime" /><asp:BoundField DataField="IdleTime" HeaderText="IdleTime" ReadOnly="True" 
                        SortExpression="IdleTime" /><asp:BoundField DataField="Lotdowntime" HeaderText="Lotdowntime" 
                        ReadOnly="True" SortExpression="Lotdowntime" /><asp:BoundField DataField="ChangeDowntime" HeaderText="ChangeDowntime" 
                        ReadOnly="True" SortExpression="ChangeDowntime" /><asp:BoundField DataField="IdleDowntime" HeaderText="IdleDowntime" 
                        ReadOnly="True" SortExpression="IdleDowntime" /><asp:BoundField DataField="LottimeMinusLotdowntime" 
                        HeaderText="LottimeMinusLotdowntime" ReadOnly="True" 
                        SortExpression="LottimeMinusLotdowntime" /><asp:BoundField DataField="ChangetimeMinusChangedowntime" 
                        HeaderText="ChangetimeMinusChangedowntime" ReadOnly="True" 
                        SortExpression="ChangetimeMinusChangedowntime" /><asp:BoundField DataField="IdletimeMinusIdledowntime" 
                        HeaderText="IdletimeMinusIdledowntime" ReadOnly="True" 
                        SortExpression="IdletimeMinusIdledowntime" /><asp:BoundField DataField="Availability" HeaderText="Availability" 
                        ReadOnly="True" SortExpression="Availability" /><asp:BoundField DataField="UnAccountedTime" HeaderText="UnAccountedTime" 
                        ReadOnly="True" SortExpression="UnAccountedTime" /></Fields></asp:DetailsView><asp:ObjectDataSource ID="ODSperf" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="PerformanceAnalysisTableAdapters.AvailabilityByMCbyDurationShiftTrimOnlyTableAdapter"><SelectParameters><asp:ControlParameter ControlID="RadioButtonList1" Name="lociD" 
                        PropertyName="SelectedValue" Type="Int32" /><asp:ControlParameter ControlID="txtStart" Name="StartTime" PropertyName="Text" 
                        Type="DateTime" /><asp:ControlParameter ControlID="txtEnd" Name="EndTime" PropertyName="Text" 
                        Type="DateTime" /></SelectParameters></asp:ObjectDataSource></td><td><dotnetCHARTING:Chart ID="Chart1" runat="server" ChartAreaSpacing="0" 
                DefaultCultureName="" FunnelNozzleWidthPercentage="35" 
                FunnelSpacingPercentage="16" HotspotMinimumSize="0" SpacingPercentage="16" 
                SpacingPercentageNested="4" StartDateOfYear="" TempDirectory="ChartTemp" 
                Use3D="True" Width="600px"><smartforecast start="" timespan="00:00:00"></smartforecast><defaultelement><smartlabel absoluteposition="0,0"></smartlabel></defaultelement><defaultlegendbox cornerbottomright="Cut" padding="4"><headerentry visible="False"></headerentry></defaultlegendbox><nodatalabel text="No Data"></nodatalabel><seriescollection><dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                GaugeType="Circular"><emptyelement color="63, 128, 128, 128"><smartlabel absoluteposition="0,0"></smartlabel></emptyelement></dotnetCHARTING:Series><dotnetCHARTING:Series GaugeBorderShape="Default" GaugeLinearStyle="Normal" 
                GaugeType="Circular"><emptyelement color="63, 128, 128, 128"><smartlabel absoluteposition="0,0"></smartlabel></emptyelement></dotnetCHARTING:Series></seriescollection><chartarea cornertopleft="Square" startdateofyear=""><defaultelement><defaultsubvalue><line length="4"></line></defaultsubvalue><smartlabel absoluteposition="0,0"></smartlabel></defaultelement><label font="Tahoma, 8pt"></label><yaxis gaugelabelmode="Default" gaugeneedletype="One" spacingpercentage="0" 
                staticcolumnwidth="100" timeinterval="Minutes"><scalebreakline color="Gray"></scalebreakline><timescalelabels maximumrangerows="4"></timescalelabels><minortimeintervaladvanced start="" timespan="00:00:00"></minortimeintervaladvanced><zerotick><line length="3"></line><gridline color="Red"></gridline></zerotick><defaulttick><line length="3"></line><label text="%Value"></label></defaulttick><timeintervaladvanced start="" timespan="00:00:00"></timeintervaladvanced><label alignment="Center" font="Arial, 9pt, style=Bold" linealignment="Center"></label></yaxis><xaxis gaugelabelmode="Default" gaugeneedletype="One" spacingpercentage="100" 
                timeinterval="Minutes"><scalebreakline color="Gray"></scalebreakline><timescalelabels maximumrangerows="4"></timescalelabels><minortimeintervaladvanced start="" timespan="00:00:00"></minortimeintervaladvanced><zerotick><line length="3"></line><gridline color="Red"></gridline></zerotick><defaulttick><line length="3"></line><label text="%Value"></label></defaulttick><timeintervaladvanced start="" timespan="00:00:00"></timeintervaladvanced><label alignment="Center" font="Arial, 9pt, style=Bold" linealignment="Center"></label></xaxis><titlebox position="Left"><label color="97, 45, 38" font="Tahoma, 8pt, style=Bold"></label></titlebox><legendbox cornerbottomright="Cut" orientation="TopRight" padding="4" visible="False"><headerentry visible="False"><LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle></headerentry></legendbox></chartarea><titlebox position="Left"><label color="97, 45, 38" font="Tahoma, 8pt, style=Bold"></label></titlebox></dotnetCHARTING:Chart></td></tr></table>
                    </ContentTemplate>
                    
                    
                    
</cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td colspan="7">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

