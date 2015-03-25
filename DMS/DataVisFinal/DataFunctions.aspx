<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" MaintainScrollPositionOnPostback ="true" CodeFile="DataFunctions.aspx.vb" Inherits="FrontEnd_DataVisualisation_AllActiivtyAnalysis" title="Untitled Page" %>

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
            <td>
                <h2>
                    Data Functions</h2>
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
                    <td width="25%">
                        Start time</td>
                    <td>
                        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        End time</td>
                    <td>
                        <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                            Format="dd/MM/yyyy 00:00:00" TargetControlID="txtend">
                        </cc1:CalendarExtender>
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
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
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
                    <td colspan="4">
                        <b>The following is a list of data determinable from the start, end date and 
                        Line </b></td>
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
            <td colspan="2" align="left" valign="top">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataSourceID="ODSDataFunctions" Height="50px" Width="50%">
                            <Fields>
                                <asp:BoundField DataField="fnShifttime#LocID#Start#end" 
                                    HeaderText="fnShifttime#LocID#Start#end" ReadOnly="True" 
                                    SortExpression="fnShifttime#LocID#Start#end" />
                                <asp:BoundField DataField="LotTimeFnActivityTime#LocID#Start#End#ActivityType" 
                                    HeaderText="LotTimeFnActivityTime#LocID#Start#End#ActivityType" ReadOnly="True" 
                                    SortExpression="LotTimeFnActivityTime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="ChangeOverTimeFnActivityTime#LocID#Start#End#ActivityType" 
                                    HeaderText="ChangeOverTimeFnActivityTime#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="ChangeOverTimeFnActivityTime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="IdleTimeFnActivityTime#LocID#Start#End#ActivityType" 
                                    HeaderText="IdleTimeFnActivityTime#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="IdleTimeFnActivityTime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="LotDownTimeFnDowntime#LocID#Start#End#ActivityType" 
                                    HeaderText="LotDownTimeFnDowntime#LocID#Start#End#ActivityType" ReadOnly="True" 
                                    SortExpression="LotDownTimeFnDowntime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="ChangeOverDownTimeFnDowntime#LocID#Start#End#ActivityType" 
                                    HeaderText="ChangeOverDownTimeFnDowntime#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="ChangeOverDownTimeFnDowntime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="IdleDownTimeFnDowntime#LocID#Start#End#ActivityType" 
                                    HeaderText="IdleDownTimeFnDowntime#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="IdleDownTimeFnDowntime#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="ActualUnitsProducedFnActualUnitsProduced#LocID#Start#End#ActivityType" 
                                    HeaderText="ActualUnitsProducedFnActualUnitsProduced#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="ActualUnitsProducedFnActualUnitsProduced#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="actualWasteProdcuedFnActualWasteProduced#LocID#Start#End#ActivityType" 
                                    HeaderText="actualWasteProdcuedFnActualWasteProduced#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="actualWasteProdcuedFnActualWasteProduced#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="FnTheoreticalUnitsProduced#LocID#Start#End#ActivityType" 
                                    HeaderText="FnTheoreticalUnitsProduced#LocID#Start#End#ActivityType" 
                                    ReadOnly="True" 
                                    SortExpression="FnTheoreticalUnitsProduced#LocID#Start#End#ActivityType" />
                                <asp:BoundField DataField="FnStandardChangeOverTime#LocID#Start#End" 
                                    HeaderText="FnStandardChangeOverTime#LocID#Start#End" ReadOnly="True" 
                                    SortExpression="FnStandardChangeOverTime#LocID#Start#End" />
                                <asp:BoundField DataField="LotDowntimeCountFnDowntimeCount#locid#start#end#activitytype" 
                                    HeaderText="LotDowntimeCountFnDowntimeCount#locid#start#end#activitytype" 
                                    ReadOnly="True" 
                                    SortExpression="LotDowntimeCountFnDowntimeCount#locid#start#end#activitytype" />
                                <asp:BoundField DataField="LotDownTimeShortStopOnly#LocID#STart#End#ActivityID#DowntimeType" 
                                    HeaderText="LotDownTimeShortStopOnly#LocID#STart#End#ActivityID#DowntimeType" 
                                    ReadOnly="True" 
                                    SortExpression="LotDownTimeShortStopOnly#LocID#STart#End#ActivityID#DowntimeType" />
                                <asp:BoundField DataField="ShortStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" 
                                    HeaderText="ShortStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" 
                                    ReadOnly="True" 
                                    SortExpression="ShortStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" />
                                <asp:BoundField DataField="NormalStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" 
                                    HeaderText="NormalStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" 
                                    ReadOnly="True" 
                                    SortExpression="NormalStopDowntimeFnDowntimeByDowntimeTypeTrimByShiftOnly#locid#start#end#activitytype#downtimetype" />
                                <asp:BoundField DataField="AverageFormatRate#averageformatrate#locid#start#end#activitytype" 
                                    HeaderText="AverageFormatRate#averageformatrate#locid#start#end#activitytype" 
                                    ReadOnly="True" 
                                    SortExpression="AverageFormatRate#averageformatrate#locid#start#end#activitytype" />
                                <asp:BoundField DataField="FnEfficientTime#locid#start#end#activitytype" 
                                    HeaderText="FnEfficientTime#locid#start#end#activitytype" 
                                    SortExpression="FnEfficientTime#locid#start#end#activitytype" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:ObjectDataSource ID="ODSDataFunctions" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="DataFunctionsTableAdapters.DataFunctionsTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtStart" Name="Start" PropertyName="Text" 
                                    Type="DateTime" />
                                <asp:ControlParameter ControlID="txtEnd" Name="_end" PropertyName="Text" 
                                    Type="DateTime" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" width="50%">
                <b>By addition of a root cause location the following data is determinable</b></td>
        </tr>
        <tr>
            <td width="50%">
                                    <asp:DataList ID="DataList1" runat="server" 
                    DataKeyField="LocID" DataSourceID="LocODS"
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnLoc" runat="server" CommandArgument='<%# Eval("LocID") %>' Font-Size="X-Small"
                                                Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>'
                                                Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="LocODS" runat="server" DeleteMethod="Delete"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentLocID"
                                        TypeName="LocationsTableAdapters.tblLocTableAdapter">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ParentLocID" SessionField="DatabtnLocID" 
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
            <td valign="top" width="50%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="50%">
                Root Cause location ID:&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" 
                    style="margin-left: 0px"></asp:TextBox>
            </td>
            <td valign="top" width="50%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    DataSourceID="ODSFunctions2" Height="50px" Width="50%">
                    <Fields>
                        <asp:BoundField DataField="LotDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" 
                            HeaderText="LotDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" 
                            ReadOnly="True" 
                            SortExpression="LotDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" />
                        <asp:BoundField DataField="ChangeOverDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" 
                            HeaderText="ChangeOverDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" 
                            ReadOnly="True" 
                            SortExpression="ChangeOverDowntimeForRootCauseLocationFnDowntimeForDowntimeDrillDownByLocation#LocID#RCLocID#start#end#activitytype" />
                        <asp:BoundField DataField="DowntimeForRootCauseLocationFnDowntimeTrimByShiftOnlyDrilldown#LocID#RCLocID#start#end" 
                            HeaderText="DowntimeForRootCauseLocationFnDowntimeTrimByShiftOnlyDrilldown#LocID#RCLocID#start#end" 
                            ReadOnly="True" 
                            SortExpression="DowntimeForRootCauseLocationFnDowntimeTrimByShiftOnlyDrilldown#LocID#RCLocID#start#end" />
                        <asp:BoundField DataField="LotDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" 
                            HeaderText="LotDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" 
                            ReadOnly="True" 
                            SortExpression="LotDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" />
                        <asp:BoundField DataField="ChangeOverDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" 
                            HeaderText="ChangeOverDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" 
                            ReadOnly="True" 
                            SortExpression="ChangeOverDowntimeCountFndowntimecountdrilldown#RCLocID#start#end#activitytype" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSFunctions2" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataFunctionsTableAdapters.DataFunctions2TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="TextBox1" Name="RCLocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtStart" Name="start" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="_end" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>From Root Cause location only the following data is determinable</b></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                    DataSourceID="ODSFunctions3" Height="50px" Width="50%">
                    <Fields>
                        <asp:BoundField DataField="FnGetRootLocDescription#LocID#RootLocIDStop" 
                            HeaderText="FnGetRootLocDescription#LocID#RootLocIDStop" ReadOnly="True" 
                            SortExpression="FnGetRootLocDescription#LocID#RootLocIDStop" />
                        <asp:BoundField DataField="GetRootLocID#LocID#RootLocIDStop" 
                            HeaderText="GetRootLocID#LocID#RootLocIDStop" ReadOnly="True" 
                            SortExpression="GetRootLocID#LocID#RootLocIDStop" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSFunctions3" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataFunctionsTableAdapters.DataFunctions3TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="LocID" PropertyName="Text" 
                            Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="RootLocIDStop" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>From an individual downtime the following data is determinable</b></td>
        </tr>
        <tr>
            <td colspan="2">
                Downtime ID:<asp:DropDownList ID="DropDownList1" runat="server" 
                    AutoPostBack="True" DataSourceID="ODSDowntime" DataTextField="DowntimeID" 
                    DataValueField="DowntimeID">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSDowntime" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" TypeName="DowntimeTableAdapters.tbldowntimeTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_DowntimeID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Downtimestart" Type="DateTime" />
                        <asp:Parameter Name="Downtimeend" Type="DateTime" />
                        <asp:Parameter Name="RemedyID" Type="Int32" />
                        <asp:Parameter Name="DowntimeComment" Type="String" />
                        <asp:Parameter Name="DowntimeType" Type="Int32" />
                        <asp:Parameter Name="tempSymptomID" Type="Int32" />
                        <asp:Parameter Name="tempSymptomLoc" Type="Int32" />
                        <asp:Parameter Name="DowntimeFormat" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotID" Type="Int32" />
                        <asp:Parameter Name="DowntimeCOID" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotNo" Type="String" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="EndSignTech" Type="Int32" />
                        <asp:Parameter Name="EndSignEng" Type="Int32" />
                        <asp:Parameter Name="EndSignExec" Type="Int32" />
                        <asp:Parameter Name="Original_DowntimeID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Downtimestart" Type="DateTime" />
                        <asp:Parameter Name="Downtimeend" Type="DateTime" />
                        <asp:Parameter Name="RemedyID" Type="Int32" />
                        <asp:Parameter Name="DowntimeComment" Type="String" />
                        <asp:Parameter Name="DowntimeType" Type="Int32" />
                        <asp:Parameter Name="tempSymptomID" Type="Int32" />
                        <asp:Parameter Name="tempSymptomLoc" Type="Int32" />
                        <asp:Parameter Name="DowntimeFormat" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotID" Type="Int32" />
                        <asp:Parameter Name="DowntimeCOID" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotNo" Type="String" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="EndSignTech" Type="Int32" />
                        <asp:Parameter Name="EndSignEng" Type="Int32" />
                        <asp:Parameter Name="EndSignExec" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                From<asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" 
                    DataSourceID="ODSFunctions4" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="TrimmedDowntimeByDowntimeIDFnIndividualDowntimeTrim#downtimeID" 
                            HeaderText="TrimmedDowntimeByDowntimeIDFnIndividualDowntimeTrim#downtimeID" 
                            ReadOnly="True" 
                            SortExpression="TrimmedDowntimeByDowntimeIDFnIndividualDowntimeTrim#downtimeID" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSFunctions4" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataFunctionsTableAdapters.DataFunctions4TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="downtimeID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                From an activity id the following fucntions are available</td>
        </tr>
        <tr>
            <td colspan="2">
                Select activity:
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSActivities" DataTextField="txtID" DataValueField="ActivityID">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSActivities" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" TypeName="ActivityTableAdapters.tblActivityTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActivityType" Type="Int32" />
                        <asp:Parameter Name="LocIDSymp" Type="Int32" />
                        <asp:Parameter Name="StartTime" Type="DateTime" />
                        <asp:Parameter Name="endtime" Type="DateTime" />
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="PreActivity" Type="Int32" />
                        <asp:Parameter Name="PostActivity" Type="Int32" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="GoodProduct" Type="Decimal" />
                        <asp:Parameter Name="TargetOutput" Type="Decimal" />
                        <asp:Parameter Name="Waste" Type="Decimal" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="StartSignTime" Type="DateTime" />
                        <asp:Parameter Name="EndSign" Type="Int32" />
                        <asp:Parameter Name="EndSigntime" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" 
                    DataSourceID="ODSFunctions5" Height="50px" Width="100%">
                    <Fields>
                        <asp:BoundField DataField="Shifts" HeaderText="shiftsforactivity(activityid)" 
                            ReadOnly="True" SortExpression="Shifts" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSFunctions5" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataFunctionsTableAdapters.DataFunctions5TableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="activityid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

