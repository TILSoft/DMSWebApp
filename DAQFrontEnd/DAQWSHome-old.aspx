<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAQWSHome-old.aspx.vb" Inherits="controls_charttemp_daqTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../Controls/DAQTimeline.ascx" TagName="DAQTimeline" TagPrefix="uc1" %>
<%@ Register Src="../Controls/DrilldownControl.ascx" TagName="DrilldownControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="javascript" type="text/javascript">
//var secs
//var timerID = null
//var timerRunning = false
//var delay = 1000
//function InitializeTimer()
//{
//    // Set the length of the timer,
//    // in seconds. Your choise
//    secs = 3000
//    

//    StopTheClock()
//    StartTheTimer()
//}
//function StopTheClock()
//{
//    if(timerRunning)
//        clearTimeout(timerID)
//    timerRunning = false
//}
//function StartTheTimer()
//{
//    if (secs==0)
//    {
//        StopTheClock()

//        // Form1.Post1 is a HTML an input button
//        // on your Design form. See below.
//        
//       // Form1.post1
//        javascript:__doPostBack('upTimeLine',' ');
//        //Generate a Postback to the server
//        InitializeTimer()
//        // Start the timer again
//    }
//    else
//    {
//        secs = secs - 1
//        timerRunning = true
//        timerID = self.setTimeout("StartTheTimer()", delay)
//    }
//}

                   
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Work Station Home</title>
    <style type="text/css">
            
        
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 25px;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 375px;
        }
        .AccHeadCSS
        {
            color: #FFFFFF;
            font-weight: bold;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server" method="post">
    <div>
        <table class="style1">
            <tr>
                <td colspan="2">
                    <h1>
                        DMS 4.1
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                   </h1>
                </td>
                <td align="left" valign="top">
                      <asp:Menu ID="Menu1" runat="server" BorderStyle="Solid" BorderWidth="1px">
                          <DynamicMenuStyle BorderStyle="Solid" BorderWidth="1px" />
                    <Items>
                        <asp:MenuItem Text="Data Analysis" Value="Data Analysis">
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/DowntimeDrilldownbyLocation.aspx" 
                                Text="Downtime by Location" Value="Downtime by Location"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/Top10Downtimes.aspx" 
                                Text="Top 10 Downtimes" Value="Top 10 Downtimes"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/OEEbyLine.aspx" 
                                Text="OEE" Value="OEE"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/DowntimeEngNoteSearch.aspx" 
                                Text="Downtime EngNote Search" Value="Downtime EngNote Search"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/ChangeOver Comparison.aspx" 
                                Text="Change over comparison" Value="Change over comparison"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/ActivitySearch.aspx" 
                                Text="Activity Search" Value="Activity Search"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/DowntimeReport.aspx" 
                                Text="Downtime Report" Value="Downtime Report"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/MultilineMultiformat.aspx" 
                                Text="MultiLine CO comparison" Value="MultiLine CO comparison">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/MultilineMultiformatDateGroup.aspx" 
                                Text="Multiline CO by period" Value="Multiline CO by period"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/EfficientTimeOEE.aspx" 
                                Text="Efficient time OEE" Value="Efficient time OEE"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/FrontendDataVis/MultiLineOEEDateGroup.aspx" 
                                Text="Efficient Time OEE by Period" Value="Efficient Time OEE by Period">
                            </asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DAQFrontEnd/MultiViewtimeline.aspx" 
                                Text="MultiLine View" Value="MultiLine View"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu></td>
                <td align="left" valign="top">
                      <asp:Menu ID="Menu2" runat="server" BorderStyle="Solid" BorderWidth="2px">
                          <DynamicMenuStyle BorderStyle="Solid" BorderWidth="1px" />
                    <Items>
                        <asp:MenuItem Text="Tools" Value="Data Analysis">
                            <asp:MenuItem NavigateUrl="http://inet/engineering/Packaging%20Engineering/index.htm" 
                                Target="_blank" Text="Eng Website" Value="Eng Website"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/Note.aspx" Text="Eng Note" 
                                Value="Eng Note"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/ChangePassword.aspx" 
                                Text="Change Password" Value="Change Password"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/FrontEnd/ReviewRemedies.aspx" 
                                Text="Review Remedies" Value="Review Remedies"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/zAdministration/ManageSymptomLocations.aspx" 
                                Text="Admin" Value="Admin"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu></td>
            </tr>
            <tr>
                <td width="25%">
                    Work Station
                tion
                </td>
                <td width="25%">
                    <asp:Label ID="lblWorkStation" runat="server"></asp:Label>
                </td>
                <td width="25%">
                    Date/Time
                </td>
                <td width="25%">
                    <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTxtID" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLot" runat="server"></asp:Label>
                    <asp:LinkButton ID="lnkAddComment" runat="server" BorderStyle="Solid" 
                        BorderWidth="1px" Font-Size="X-Small">Add Comment</asp:LinkButton>
                </td>
                <td>
                    Shift
                    <td>
                        Team:
                        <asp:Label ID="lblShift" runat="server"></asp:Label>
                        &nbsp;Start :
                        <asp:Label ID="lblShiftStart" runat="server"></asp:Label>
                        &nbsp;End :
                        <asp:Label ID="lblShiftEnd" runat="server"></asp:Label>
            </tr>
            <tr>
                <td class="style2">
                    Format
                </td>
                <td class="style2">
                    <asp:Label ID="lblFormat" runat="server"></asp:Label>
                </td>
                <td class="style2">
                Line status</tr>
            <td class="style2">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </tr> 
                <tr>
                    <td>
                        Target Output</td>
                    <td>
                        <asp:Label ID="lblTargetOutput" runat="server"></asp:Label>
                    </td>
                    <td>
                        Current Output<br />
                        <asp:LinkButton ID="lnkOutputUpdate" runat="server" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Size="X-Small">Update output</asp:LinkButton>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="upOutput" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label ID="lblCurrentOutput" runat="server"></asp:Label>
                                <asp:Timer ID="tmOutput" runat="server">
                                </asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Panel ID="pnlOutputUpdate" runat="server" Visible="False">
                            Enter current output:<br />
                            <asp:TextBox ID="txtOutputUpdate" runat="server" Width="116px"></asp:TextBox>
                            <asp:Button ID="btnUpdateOutput" runat="server" Text="OK" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        Line Status
                    </td>
                    <td colspan="3">
                        <asp:Literal ID="litDT" runat="server"></asp:Literal>
                    </td>
                </tr>
        </table>
                    <table class="style3">
                        <tr>
                            <td>
                                Time Line Span (hours) :
                    <asp:DropDownList ID="ddlTimeLineSpan" runat="server" AutoPostBack="True">
                        <asp:ListItem>0.5</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                            <td>
                   
                    <asp:UpdatePanel ID="upSlider" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <cc1:SliderExtender ID="SliderExtender1" runat="server" BoundControlID="lblSlideDate" 
                                Length="500" TargetControlID="txtSliderHandle" TooltipText="{0}">
                            </cc1:SliderExtender>
                            <asp:TextBox ID="txtSliderHandle" runat="server"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                    </td>
                </tr>
            </table>
        <asp:UpdatePanel ID="upTimeLine" runat="server" 
            UpdateMode="Conditional">
                        <ContentTemplate>
        <table class="style1">
            <tr>
                <td width="25%">
                    Timeline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td width="25%" colspan="2">
                    <asp:LinkButton ID="lnkManualDowntime" runat="server">Start a 
Manual downtime (for CO use only)</asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="lbltimelinemsg" runat="server" ForeColor="Red"></asp:Label>
            </tr>
            </td> </tr>
            <tr>
                <td align="center" colspan="4" height="160">
                  <uc1:DAQTimeline ID="DAQTimeline1" runat="server" filesToHold="10" lvlHeight="50"
                           width="1000" Click_enabled="True" /> 
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Timer ID="Timer1" runat="server" Interval="3000">
                    </asp:Timer>
                           
                    </td>
                <td align="right">
                    &nbsp;</td>
                <td align="right">
                    <asp:Label ID="lblHandShake" runat="server" BackColor="Red" ForeColor="Red" 
                        Text=".."></asp:Label>
                </td>
            </tr>
        </table>      
        </ContentTemplate>
        </asp:UpdatePanel>
        
        <table class="style1">
            <tr>
                <td align="center">
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                        Width="1000px">
                        <cc1:TabPanel runat="server" HeaderText="Downtime" ID="tpDowntime">
                            <HeaderTemplate>
                                Downtime
                            
                            
                        
                            
                            
                        
                        </HeaderTemplate>
                        

<ContentTemplate >
<asp:UpdatePanel ID="upDowntime" runat="server" UpdateMode="Conditional"><ContentTemplate>
<asp:GridView 
                                ID="gvDowntime" runat="server" 
        AutoGenerateColumns="False" DataSourceID="odsDowntimeForLine"
                                Width="950px" AllowSorting="True" 
        AllowPaging="True"><Columns><asp:BoundField 
                                    DataField="Downtimestart" HeaderText="DT Start" 
                                    SortExpression="Downtimestart" /><asp:BoundField DataField="dtime" 
                                    HeaderText="DT (secs)" ReadOnly="True" SortExpression="dtime" />
        <asp:BoundField DataField="dtimeMins" DataFormatString="{0:F2}" 
            HeaderText="DT (mins)" SortExpression="dtimeMins" />
        <asp:BoundField 
                                    DataField="SymptomDesc" HeaderText="Symptom" SortExpression="SymptomDesc" /><asp:BoundField 
                                    DataField="RootCauseDesc" HeaderText="Root Cause" 
                                    SortExpression="RootCauseDesc" /><asp:BoundField DataField="LocDescription" 
                                    HeaderText="Location" SortExpression="LocDescription" /><asp:BoundField 
                                    DataField="RemedyDescription" HeaderText="Remedy" 
                                    SortExpression="RemedyDescription" 
            HtmlEncode="False" /></Columns>
    <EmptyDataTemplate>There is no downtime for this period.
                                </EmptyDataTemplate>
                                </asp:GridView>
        <asp:ObjectDataSource ID="odsDowntimeForLine" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" 
        TypeName="DataAnalysisTableAdapters.DowntimeWShomeTableAdapter"><SelectParameters>
                <asp:Parameter Name="locid" Type="Int32" />
                <asp:Parameter Name="downtimeend" Type="DateTime" />
                <asp:Parameter Name="downtimestart" Type="DateTime" /></SelectParameters></asp:ObjectDataSource>
                            
                            </ContentTemplate>
</asp:UpdatePanel>
                        

                        
                        

                        

                        
                        
                        

                        

                        
                        

                        

                        
                        
                        
                        

                        

                        
                        

                        

                        
                        
                        

                        

                        
                        

                        

                        
                        
                        
                        
                        </ContentTemplate>
                        





</cc1:TabPanel>
                             <cc1:TabPanel runat="server" HeaderText="Shift Handover" ID="tpHandover">
                                 <ContentTemplate>
<table class="style3"><tr><td>Shift Handover</td></tr><tr><td><asp:FormView ID="fvShiftHand" runat="server" DataKeyNames="ShiftHandoverID" 
                                                     DataSourceID="odsShiftHand" Width="50%"><EditItemTemplate>ShiftHandoverID: <asp:Label ID="ShiftHandoverIDLabel1" runat="server" 
                                                             Text='<%# Eval("ShiftHandoverID") %>' /><br />LineID: <asp:TextBox ID="LineIDTextBox" runat="server" Text='<%# Bind("LineID") %>' /><br />UserID: <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' /><br />EntryTime: <asp:TextBox ID="EntryTimeTextBox" runat="server" 
                                                             Text='<%# Bind("EntryTime") %>' /><br />field1: <asp:TextBox ID="field1TextBox" runat="server" Text='<%# Bind("field1") %>' /><br />field2: <asp:TextBox ID="field2TextBox" runat="server" Text='<%# Bind("field2") %>' /><br />field3: <asp:TextBox ID="field3TextBox" runat="server" Text='<%# Bind("field3") %>' /><br />field4: <asp:TextBox ID="field4TextBox" runat="server" Text='<%# Bind("field4") %>' /><br /><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                             CommandName="Update" Text="Update" />&#160;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                             CausesValidation="False" CommandName="Cancel" Text="Cancel" /></EditItemTemplate><InsertItemTemplate><table class="style3"><tr><td>Equipment:</td><td><asp:TextBox ID="field1TextBox" runat="server" Text='<%# Bind("field1") %>' 
                                                                         TextMode="MultiLine" Width="400px" /></td></tr><tr><td>Process:</td><td><asp:TextBox ID="field2TextBox" runat="server" Text='<%# Bind("field2") %>' 
                                                                         TextMode="MultiLine" Width="400px" /></td></tr><tr><td>Material:</td><td><asp:TextBox ID="field3TextBox" runat="server" Text='<%# Bind("field3") %>' 
                                                                         TextMode="MultiLine" Width="400px" /></td></tr><tr><td>Other:</td><td><asp:TextBox ID="field4TextBox" runat="server" Text='<%# Bind("field4") %>' 
                                                                         TextMode="MultiLine" Width="400px" /></td></tr><tr><td><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                                         onclick="InsertButton_Click" Text="Insert" /></td><td><asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                                         CommandName="Cancel" Text="Cancel" /></td></tr></table></InsertItemTemplate><ItemTemplate><table class="style3"><tr><td align="left">EntryTime:</td><td align="left"><asp:Label ID="EntryTimeLabel" runat="server" Text='<%# Bind("EntryTime") %>' /></td></tr><tr><td align="left">Equipment:</td><td align="left"><asp:Label ID="field1Label" runat="server" Text='<%# Bind("field1") %>' /></td></tr><tr><td align="left">Process:</td><td align="left"><asp:Label ID="field2Label" runat="server" Text='<%# Bind("field2") %>' /></td></tr><tr><td align="left">Material:</td><td align="left"><asp:Label ID="field3Label" runat="server" Text='<%# Bind("field3") %>' /></td></tr><tr><td align="left">Other:</td><td align="left"><asp:Label ID="field4Label" runat="server" Text='<%# Bind("field4") %>' /></td></tr><tr><td><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                                         CommandName="New" Text="New" /></td><td>&#160;</td></tr></table></ItemTemplate></asp:FormView></td></tr><tr><td><asp:Label ID="lblShiftHandMsg" runat="server" ForeColor="Red"></asp:Label><asp:ObjectDataSource ID="odsShiftHand" runat="server" DeleteMethod="Delete" 
                                                     InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                                     SelectMethod="GetData" TypeName="ShiftsTableAdapters.tblShiftHandTableAdapter" 
                                                     UpdateMethod="Update"><SelectParameters><asp:SessionParameter Name="lineID" SessionField="workstationID" Type="Int32" /></SelectParameters><DeleteParameters><asp:Parameter Name="Original_ShiftHandoverID" Type="Int32" /></DeleteParameters><InsertParameters><asp:Parameter Name="LineID" Type="Int32" /><asp:Parameter Name="UserID" Type="Int32" /><asp:Parameter Name="EntryTime" Type="DateTime" /><asp:Parameter Name="field1" Type="String" /><asp:Parameter Name="field2" Type="String" /><asp:Parameter Name="field3" Type="String" /><asp:Parameter Name="field4" Type="String" /></InsertParameters><UpdateParameters><asp:Parameter Name="LineID" Type="Int32" /><asp:Parameter Name="UserID" Type="Int32" /><asp:Parameter Name="EntryTime" Type="DateTime" /><asp:Parameter Name="field1" Type="String" /><asp:Parameter Name="field2" Type="String" /><asp:Parameter Name="field3" Type="String" /><asp:Parameter Name="field4" Type="String" /><asp:Parameter Name="Original_ShiftHandoverID" Type="Int32" /></UpdateParameters></asp:ObjectDataSource></td></tr><tr><td>&#160;</td></tr></table>
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                                 
                                 
                        
                                 
                                 
                        
                        
                        
                        
                        
                        </ContentTemplate>
                        





</cc1:TabPanel>
                    </cc1:TabContainer>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="pnlSymptom" runat="server" BackColor="#CCCCCC" Width="800px">
                        <asp:UpdatePanel ID="upSymp" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="style1" border="1">
                                    <tr>
                                        <td width="50%" style="width: -50%">
                                            Symptom panel
                                        </td>
                                        <td colspan="2">
                                            <asp:LinkButton ID="lnkChangeOver" runat="server">This Event is the start of a 
                                            Change Over</asp:LinkButton>
                                        </td>
                                        <td align="right" style="width: 16%">
                                            <asp:LinkButton ID="lnkMPESympClose" runat="server">Close</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Panel ID="pnlManualStartTime" runat="server" Visible="False">
                                                Start Time :
                                                <asp:TextBox ID="txtManualStart" runat="server" Font-Bold="True" 
                                                    ForeColor="#FF3300"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            Select the symptom Location here
                                        </td>
                                        <td class="style4" colspan="2">
                                            Select the Symptom
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" colspan="2" valign="top">
                                            <uc2:DrilldownControl ID="drillDownSymp" runat="server" EndLocID="1" />
                                        </td>
                                        <td class="style4" colspan="2" valign="top">
                                            <asp:DataList ID="dlSymptom" runat="server" DataKeyField="LocID" DataSourceID="SymptomODS"
                                                Width="100%">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSymp" runat="server" CommandArgument='<%# Eval("SymptomID") %>'
                                                        Font-Size="X-Small" Text='<%# Eval("SymptomDesc") %>' Visible='<%# Eval("SymptomEnabled") %>'
                                                        Width="100%" />
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:ObjectDataSource ID="SymptomODS" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblSymptomTableAdapter">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                </DeleteParameters>
                                                <SelectParameters>
                                                    <asp:Parameter Name="LocID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeSymptom" runat="server" PopupControlID="pnlSymptom"
                        TargetControlID="lnkHiddenRunEvent" DropShadow="True" OkControlID="lnkHiddenRunEvent">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenRunEvent" runat="server"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="pnlRootCause" runat="server" BackColor="#CCCCCC" Width="800px">
                        <asp:UpdatePanel ID="upRootCause" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="style1">
                                    <tr>
                                        <td width="33%">
                                            Root Cause Panel
                                        </td>
                                        <td style="width: 25%" width="50%">
                                            <asp:LinkButton ID="lnkConcatDowntime" runat="server">Select Similar downtime</asp:LinkButton>
                                        </td>
                                        <td align="right">
                                            &nbsp;
                                            <asp:LinkButton ID="btnClose" runat="server">Close</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align ="center"  >
                                            <asp:Panel ID="pnlConcatDT" runat="server" Visible="true">
                                                <uc1:DAQTimeline ID="DAQtimelineConCat" runat="server" filesToHold="10" lvlHeight="30"
                           width="700" Click_enabled="True" /> 
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Panel ID="pnlManualEndtime" runat="server" Visible="False">
                                                End time:
                                                <asp:TextBox ID="txtManualEndtime" runat="server" Font-Bold="True" 
                                                    ForeColor="#FF3300"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            Select the root cause location
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="6" valign="top" colspan="2" width="50%">
                                            <uc2:DrilldownControl ID="drilldownRootCause" runat="server" EndLocID="0" />
                                        </td>
                                        <td>
                                            Enter the root cause
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtRootCause" runat="server" Height="69px" 
                                                TextMode="MultiLine" Visible="False" Width="95%"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rfvRootCause" runat="server" 
                                                ControlToValidate="txtRootCause" ErrorMessage="You must enter a Root Cause" 
                                                ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Enter the remedy
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtRemedy" runat="server" Height="69px" TextMode="MultiLine" 
                                                Visible="False" Width="95%"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="rfvRemedy" runat="server" 
                                                ControlToValidate="txtRemedy" ErrorMessage="You must enter a Remedy" 
                                                ValidationGroup="1"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Engineer Required
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rblEngineer" runat="server" AutoPostBack="True" 
                                                RepeatDirection="Horizontal" Visible="False">
                                                <asp:ListItem Value="0">Yes</asp:ListItem>
                                                <asp:ListItem Value="1">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Panel ID="pnlTechSign" runat="server" Visible="False">
                                                <table class="style3">
                                                    <tr>
                                                        <td align="right" width="20%">
                                                            Tech user
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtTechSign" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td align="right" width="25%">
                                                            Tech Pass
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtTechPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Panel ID="pnlEngSign" runat="server" Visible="False">
                                                <table class="style3">
                                                    <tr>
                                                        <td align="right" width="20%">
                                                            Eng user
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtEngSign" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td align="right" width="25%">
                                                            Eng Pass
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtEngPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Panel ID="pnlExecSign" runat="server" Visible="False">
                                                <table class="style3">
                                                    <tr>
                                                        <td align="right" width="20%">
                                                            Exec user
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtExecSign" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td align="right" width="25%">
                                                            Exec Pass
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtExecPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Label ID="lblLoginMsg" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnRemRootCause" runat="server" Text="Submit" 
                                                ValidationGroup="1" Visible="False" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeRootCause" runat="server" PopupControlID="pnlRootCause"
                        TargetControlID="lnkHiddenNonRunEvent">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenNonRunEvent" runat="server"></asp:LinkButton>
                    <asp:Panel ID="pnlActivityChg" runat="server" BackColor="#CCCCCC" Width="800px">
                        <asp:UpdatePanel ID="upActivityChg" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="style1" border="1">
                                    <tr>
                                        <td width="50%">
                                            Activity Change
                                        </td>
                                        <td align="right" class="style4">
                                            <asp:LinkButton ID="lnkMPEActChgClose" runat="server" CausesValidation="False">Close</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:DetailsView ID="dvAct" runat="server" AutoGenerateRows="False" DataSourceID="odsActivity"
                                                Height="50px" Width="100%">
                                                <Fields>
                                                    <asp:BoundField DataField="LocDescription" HeaderText="Description" 
                                                        SortExpression="LocDescription" />
                                                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" 
                                                        SortExpression="StartTime" />
                                                    <asp:BoundField DataField="txtID" HeaderText="Activity ID" 
                                                        SortExpression="txtID" />
                                                    <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                                                        SortExpression="FormatDesc" />
                                                    <asp:BoundField DataField="ActivityDesc" HeaderText="Activity Type" 
                                                        SortExpression="ActivityDesc" />
                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:ObjectDataSource ID="odsActivity" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetDataByLocID" TypeName="ActivityTableAdapters.LineStatusDetailsTableAdapter">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="LocID" SessionField="WorkstationID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" colspan="2">
                                            <asp:Panel ID="pnlEndLot" runat="server" Visible="False">
                                                <table class="style3">
                                                    <tr>
                                                        <td>
                                                            Total Units Generated
                                                        </td>
                                                        <td valign="middle">
                                                            <asp:TextBox ID="txtUnitsGen" runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revUnitsGen" runat="server" 
                                                                ErrorMessage="You must enter an integer" 
                                                                ValidationExpression="^\d+$" ControlToValidate="txtUnitsGen"></asp:RegularExpressionValidator>
                                                            &nbsp;(For pack use blisters)</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Total Waste Generated
                                                        </td>
                                                        <td valign="middle">
                                                            <asp:TextBox ID="txtWasteGen" runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revWasteGen" runat="server" 
                                                                ControlToValidate="txtWasteGen" ErrorMessage="You must enter an integer" 
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%" colspan="2">
                                            Select the new status: &nbsp <asp:RadioButtonList ID="rblNewActivity" runat="server" 
                                                AutoPostBack="True" DataSourceID="odsActType" DataTextField="ActivityDesc" 
                                                DataValueField="ActivityTypeID" RepeatDirection="Horizontal">
                                            </asp:RadioButtonList>
                                            <asp:ObjectDataSource ID="odsActType" runat="server" DeleteMethod="Delete" 
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
                                        <td width="50%" colspan="2">
                                            <asp:Panel ID="pnlStartLot" runat="server" Visible="False">
                                                <table class="style1">
                                                    <tr>
                                                        <td width="50%">
                                                            Format<br />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="ODSFormat" DataTextField="FormatDesc"
                                                                DataValueField="FormatID">
                                                            </asp:DropDownList>
                                                            <asp:ObjectDataSource ID="ODSFormat" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetDataByLocIDandActivity" TypeName="LocationsTableAdapters.tblFormatTableAdapter">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                                </DeleteParameters>
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="LocID" SessionField="WorkstationID" Type="Int32" />
                                                                    <asp:Parameter DefaultValue="1" Name="activityType" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%">
                                                            Lot Number
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtLot" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvLot" runat="server" 
                                                                ControlToValidate="txtLot" ErrorMessage="You must enter a lot number"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%">
                                                            Item Code</td>
                                                        <td>
                                                            <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvLot0" runat="server" 
                                                                ControlToValidate="txtItem" ErrorMessage="You must enter an item code"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Target Output
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtTarget" runat="server"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revTarget" runat="server" 
                                                                ControlToValidate="txtTarget" ErrorMessage="You must enter an integer" 
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlStartChangeOver" runat="server" Visible="False">
                                                <table class="style1" >
                                                    <tr>
                                                        <td width="50%">
                                                            Change over type
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCOlist" runat="server" DataSourceID="ODSCOtype" DataTextField="FormatDesc"
                                                                DataValueField="FormatID">
                                                            </asp:DropDownList>
                                                            <asp:ObjectDataSource ID="ODSCOtype" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocIDandActivity"
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
                                                                    <asp:SessionParameter Name="locid" SessionField="WorkstationID" Type="Int32" />
                                                                    <asp:Parameter DefaultValue="2" Name="activityType" Type="Int32" />
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
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" width="50%">
                                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                                AutoGenerateColumns="False" DataKeyNames="FormatID" 
                                                                DataSourceID="odsFormatDesc" PageSize="5" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                                                        SortExpression="FormatDesc" />
                                                                    <asp:BoundField DataField="FormatLongDescription" 
                                                                        HeaderText="FormatLongDescription" SortExpression="FormatLongDescription" />
                                                                    <asp:BoundField DataField="StdPersonnel" HeaderText="StdPersonnel" 
                                                                        SortExpression="StdPersonnel" />
                                                                    <asp:BoundField DataField="StdTime" HeaderText="StdTime" 
                                                                        SortExpression="StdTime" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:ObjectDataSource ID="odsFormatDesc" runat="server" DeleteMethod="Delete" 
                                                                OldValuesParameterFormatString="original_{0}" 
                                                                SelectMethod="GetDataByLocIDandActivity" 
                                                                TypeName="LocationsTableAdapters.tblFormatTableAdapter">
                                                                <DeleteParameters>
                                                                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                                                </DeleteParameters>
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="locid" SessionField="WorkstationID" Type="Int32" />
                                                                    <asp:Parameter DefaultValue="2" Name="activityType" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlStartIdleTime" runat="server" Visible="False">
                                                <table class="style1">
                                                    <tr>
                                                        <td width="50%">
                                                            No details required
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Panel ID="pnlActChgAuthen" runat="server" Visible="False">
                                                <table class="style3">
                                                    <tr>   
                                                     <td width="25%">
                                                            User
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtActChgUser" runat="server"></asp:TextBox>
                                                        </td>
                                                         <td width="25%">
                                                            Pass
                                                        </td>
                                                        <td width="25%">
                                                            <asp:TextBox ID="txtActChgPass" runat="server" TextMode="Password"></asp:TextBox>
                                                        </td>
                                                   
                                                        <td width="25%">
                                                            <asp:Button ID="btnActChgSubmit" runat="server" Text="Submit" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="lblActChgLoginMsg" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeActivityChg" runat="server" PopupControlID="pnlActivityChg"
                        TargetControlID="lnkHiddenActivityChg" DropShadow="True">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenActivityChg" runat="server"></asp:LinkButton>
                </td>
            </tr>
        
                    
                 
                  
     
            <tr>
                <td>
                
                    
                    <asp:Panel ID="pnlShortStops" runat="server" BackColor="#CCCCCC" Width="800px">
                    <asp:UpdatePanel ID="upSSClose" runat="server" UpdateMode=Conditional>
                    <ContentTemplate >
                    
                    
                  
                        <table class="style3" width="800px">
                            <tr>
                                <td width="25%">
                                    Short Stop/Quick close Panel
                                </td>
                                <td align="left" width="25%">
                                    <asp:LinkButton ID="lblRootCauseEntry" runat="server">My Remedy is not in this 
                                        list</asp:LinkButton>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="lnkMPEShortStopClose" runat="server">Close</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3" valign="middle" width="50%">
                                    <uc1:DAQTimeline ID="DAQtimelineSSBlanket" runat="server" Click_enabled="True" 
                                        filesToHold="10" lvlHeight="30" width="700" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" valign="middle" width="50%">
                                
                               <div style="Height:225px; Width:775px; Overflow:Auto">
                                    <asp:DataList ID="dlShortStop" runat="server" DataKeyField="RemedyID" 
                                        DataSourceID="odsShortStopQuickCloses" RepeatColumns="3" 
                                        RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" 
                                                CommandArgument='<%# Eval("RemedyID") %>' Font-Size="X-Small" Height="30px" 
                                                Text='<%# Eval("RootCauseDesc") %>' ToolTip='<%# Eval("RootCauseDesc") %>' 
                                                Width="250px" Backcolor = '<%# System.Drawing.Color.FromName(Eval("SSButtonColour")&"") %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" valign="top">
                                    <asp:UpdatePanel ID="upShortStop" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvShortStop" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" DataKeyNames="RemedyID" 
                                                DataSourceID="odsShortStopQuickCloses" Width="100%" Visible="False">
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True">
                                                        <ItemStyle Width="100px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="rootcauselocationdesc" 
                                                        HeaderText="rootcauselocationdesc" SortExpression="rootcauselocationdesc">
                                                        <ItemStyle Width="230px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                                        SortExpression="RootCauseDesc">
                                                        <ItemStyle Width="230px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                                        SortExpression="RemedyDescription">
                                                        <ItemStyle Width="230px" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3" valign="top">
                                    <asp:ObjectDataSource ID="odsShortStopQuickCloses" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="RootCauseRemedyTableAdapters.RCRemedySympForDAQSSTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="sympID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                        
                          </ContentTemplate>
                    
                    </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeShortStop" runat="server" PopupControlID="pnlShortStops"
                        TargetControlID="lnkHiddenShortStop" DropShadow="True">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenShortStop" runat="server"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                       
         
                    <asp:Panel ID="pnlActComment" runat="server" BackColor="#CCCCCC" Width="800px">
                        <asp:UpdatePanel ID="upActComment" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                    <table class="style3">
                            <tr>
                                <td colspan="3">
                                    Add an activity comment</td>
                                <td align="right" colspan="3">
                                    <asp:LinkButton ID="lnkActCommentclose" runat="server">Close</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:TextBox ID="txtActComment" runat="server" 
                                        TextMode="MultiLine" Width="95%" Rows="5"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lblActCommMsg" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="25%">
                                    User</td>
                                <td width="25%">
                                    <asp:TextBox ID="txtActCommUser" runat="server"></asp:TextBox>
                                </td>
                                <td width="25%" colspan="2">
                                    Pass</td>
                                <td>
                                    <asp:TextBox ID="txtActCommentPass" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnActComment" runat="server" Text="Submit" />
                                </td>
                            </tr>
                        </table>
                      
                    </ContentTemplate> 
                    </asp:UpdatePanel>  
                    </asp:Panel>
                 
                    
                   </td>
            </tr>
            <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeActComment" runat="server" PopupControlID="pnlActComment"
                        TargetControlID="lnkHiddenActComment" DropShadow="True">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenActComment" runat="server"></asp:LinkButton>
                </td>
            </tr>
                    <tr>
                <td>
                    &nbsp;</td>
            </tr>        
                    <tr>
                <td>
                    <asp:Panel ID="pnlRCRemReview" runat="server" BackColor="#CCCCCC" 
                        Width="800px">
                        <table class="style3">
                            <tr>
                                <td width="50%">
                                    Review the previous remedies for this symptom</td>
                                <td align="right">
                                    <asp:LinkButton ID="lnkRevRemsClose" runat="server">Close</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="upRCRemReview" runat="server" UpdateMode="Conditional"  >
                                        <ContentTemplate>
                                            <asp:GridView ID="gvRCRemReview" runat="server" AutoGenerateColumns="False" 
                                                DataSourceID="odsRemReview" Width="100%" AllowPaging="True">
                                                <Columns>
                                                    <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                                        SortExpression="Downtimestart" />
                                                    <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                        SortExpression="LocDescription" />
                                                    <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                                        SortExpression="RootCauseDesc" />
                                                    <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                                        SortExpression="RemedyDescription" />
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:ObjectDataSource ID="odsRemReview" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDatabySympID" 
                                        TypeName="RootCauseRemedyTableAdapters.RCRemDetailsBySympTableAdapter">
                                        <SelectParameters>
                                            <asp:Parameter Name="symptomID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                        </td>
            </tr>        
                    <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeRCRemReview" runat="server" PopupControlID="pnlRCRemReview"
                        TargetControlID="lnkHiddenRCRemReview" DropShadow="True">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenRCRemReview" runat="server"></asp:LinkButton>
                        </td>
            </tr>        
                    <tr>
                <td>
                    &nbsp;</td>
            </tr>        
                    <tr>
                <td>
                    <asp:Panel ID="pnlSSImage" runat="server" BackColor="#CCCCCC" Width="700px">
                        <table class="style3">
                            <tr>
                                <td>
                                    <asp:Label ID="lblInstruction" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                     <asp:UpdatePanel ID="upimagebutton" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate >
                                     <asp:ImageButton ID="imgButtSSImage" runat="server" style="text-align: center" />
                                  
                                    
                                        <br />
                                        <asp:Label ID="lblRemedyID" runat="server"></asp:Label>
                                  
                                    
                                    </ContentTemplate>
                                    
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                        </td>
            </tr>        
                    <tr>
                <td>
                    <cc1:ModalPopupExtender ID="mpeSSImage" runat="server" PopupControlID="pnlSSImage"
                        TargetControlID="lnkHiddenSSImage" DropShadow="True">
                    </cc1:ModalPopupExtender>
                    <asp:LinkButton ID="lnkHiddenSSImage" runat="server"></asp:LinkButton>
                        </td>
            </tr>        
        </table>
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
