<%@ Page Language="VB" MasterPageFile="~/wshome.master" AutoEventWireup="false" CodeFile="WSHome2.aspx.vb"
    Inherits="FrontEnd_WSHome" Title="DMS Home" MaintainScrollPositionOnPostback ="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnetCHARTING" %>
<%@ Register Src="../controls/timeline.ascx" TagName="WebUserControl" TagPrefix="uc1" %>
<%@ Register Src="../Controls/TimeLine2.ascx" TagName="TimeLine2" TagPrefix="uc2" %>

<%@ Register src="../Controls/MANTimeline.ascx" tagname="MANTimeline" tagprefix="uc4" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 25px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <table class="style1">
        <tr>
            <td width="30%">
                <h2>
                    WorkStation Home</h2>
            </td>
            <td align="right">
                &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px">Eng Website</asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" BorderStyle="Solid" BorderWidth="1px">Engineering Note</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lnkChangePass" runat="server" BorderStyle="Solid" BorderWidth="1px">Change Password</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lnkChangePass0" runat="server" BorderStyle="Solid" BorderWidth="1px">Review Remedies</asp:LinkButton>
            </td>
            <td align="right">
                      <asp:Menu ID="Menu2" runat="server" BorderStyle="Solid" BorderWidth="1px">
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
                </asp:Menu>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table class="style1" style="border-style: double">
                <tr>
                    <td width="15%">
                        <b>Work Station</b>
                    </td>
                    <td width="35%" colspan="2">
                        <asp:Label ID="lblWorkStation" runat="server"></asp:Label>
                        <asp:Label ID="lblWorkstationID" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td width="15%">
                        <b>Date/Time</b>
                    </td>
                    <td width="35%">
                        <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbltxtID" runat="server" Style="font-weight: 700"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblLot" runat="server"></asp:Label>
                        &nbsp;<asp:LinkButton ID="lnkComm" runat="server" BorderWidth="1px" 
                            Font-Size="XX-Small">Comment</asp:LinkButton>
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="LinkButton1" runat="server" BorderStyle="Solid" BorderWidth="1px">Start/End 
                        Lot/CO</asp:LinkButton>
                    </td>
                    <td>
                        <b>Shift No</b>
                    </td>
                    <td>
                        Team:
                        <asp:Label ID="lblShift" runat="server"></asp:Label>
                        &nbsp;Start :
                        <asp:Label ID="lblShiftStart" runat="server"></asp:Label>
                        &nbsp;End :
                        <asp:Label ID="lblShiftEnd" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="border-bottom-style: double; border-bottom-color: #0000FF">
                    <td>
                        <b>Format</b>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblFormat" runat="server"></asp:Label>
                    </td>
                    <td>
                        <b>Line Status</b>
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="border-bottom-style: double; border-bottom-color: #0000FF">
                    <td>
                        <b>Downtime Status</b>
                    </td>
                    <td colspan="4">
                        <asp:Label ID="lblDowntimeStatus" runat="server"></asp:Label>
                        <asp:Literal ID="litDT" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table class="style1" style="border-style: double">
        <tr>
            <td valign="top" width="50%">
             <asp:UpdatePanel ID="UptimeLine" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="border-style: none" width="100%">
                            <tr>
                                <td valign="top">
                                    <asp:TextBox ID="txtSliderHandle" runat="server"></asp:TextBox>
                                    <cc1:SliderExtender ID="SliderExtender1" runat="server" 
                                        TargetControlID="txtSliderHandle">
                                    </cc1:SliderExtender>
                                </td>
                                <td valign="top">
                                    Timeline Duration</td>
                                <td valign="top">
                                    <asp:DropDownList ID="ddlTimeLineSpan" runat="server">
                                        <asp:ListItem>0.5</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3" valign="bottom">
                                    <uc4:MANTimeline ID="DAQTimeline1" runat="server" Click_enabled="True" 
                                        filesToHold="10" lvlHeight="50" width="1000" />
                                </td>
                            </tr>
                        </table>
                         </ContentTemplate>
                         </asp:UpdatePanel> 
                         
                        
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="border-style: none" width="100%">
                            <tr>
                                <td valign="top">
                                    1. Select Symptom Location
                                </td>
                                <td>
                                    2. Select Symptom description
                                </td>
                                <td width="50%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td valign="top" width="25%">
                                    <strong>
                                    <asp:Literal ID="litPath" runat="server"></asp:Literal>
                                    </strong>
                                    <br />
                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                                        DataSourceID="LocODS" Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnLoc" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                                                Font-Size="X-Small" Text='<%# Eval("LocDescription") %>' 
                                                Visible='<%# Eval("LocationEnabled") %>' Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="LocODS" runat="server" DeleteMethod="Delete" 
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
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ParentLocID" SessionField="btnLocID" Type="Int32" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="LocDescription" Type="String" />
                                            <asp:Parameter Name="ParentLocID" Type="Int32" />
                                            <asp:Parameter Name="DowntimeID" Type="Int32" />
                                            <asp:Parameter Name="LotStatus" Type="Int32" />
                                            <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                            <asp:Parameter Name="LocationStatus" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td align="center" valign="top" width="25%">
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    <asp:DataList ID="DataList2" runat="server" DataKeyField="LocID" 
                                        DataSourceID="SymptomODS" Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnSymp" runat="server" 
                                                CommandArgument='<%# Eval("SymptomID") %>' Font-Size="X-Small" 
                                                Text='<%# Eval("SymptomDesc") %>' Visible='<%# Eval("SymptomEnabled") %>' 
                                                Width="100%" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <h4>
                                        <asp:LinkButton ID="dtLinkButton" runat="server" BorderStyle="Double" 
                                            ForeColor="#33CC33" Style="text-align: center" Visible="False"></asp:LinkButton>
                                        <asp:ObjectDataSource ID="SymptomODS" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByLocID" 
                                            TypeName="LocationsTableAdapters.tblSymptomTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="LocID" SessionField="btnLocID" Type="Int32" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </h4>
                                </td>
                                <td align="center" valign="top" width="25%">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
      
        </tr>
    </table>
    <p>
    </p>
    <table class="style1" style="border-style: double">
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlLogin" runat="server" Width="650px" BackColor="#66CCFF">
                    <asp:UpdatePanel ID="upLogin" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td align="center">
                                        Start the downtime
                                    </td>
                                </tr>
                            </table>
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        Check the time is correct
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPopTime" runat="server" ForeColor="#FF3300" Font-Bold="True"></asp:TextBox>
                                        <br />
                                        <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" TargetControlID="txtPopTime"
                                            Mask="99/99/9999 99:99:99" MaskType="DateTime" CultureName="en-CA" ErrorTooltipEnabled="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        Enter User Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Enter Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="style3" colspan="2">
                                        <asp:Button ID="btnOK" runat="server" Text="Submit" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lbllogMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ActivityID"
                                            DataSourceID="ODSActCheck" Visible="False">
                                            <Columns>
                                                <asp:BoundField DataField="ActivityID" HeaderText="Activity ID" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="ActivityID" />
                                                <asp:BoundField DataField="ActivityDesc" HeaderText="Activity Description" 
                                                    SortExpression="ActivityDesc" />
                                                <asp:BoundField DataField="StartTime" HeaderText="Start Time" 
                                                    SortExpression="StartTime" />
                                                <asp:BoundField DataField="endtime" HeaderText="End time" 
                                                    SortExpression="endtime" />
                                                <asp:BoundField DataField="txtID" HeaderText="Lot or CO ID" 
                                                    SortExpression="txtID" />
                                                <asp:BoundField DataField="LocDescription" HeaderText="Location Description" 
                                                    SortExpression="LocDescription" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ODSActCheck" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="DowntimeTableAdapters.DowntimeActivityCheckTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtPopTime" Name="dtstart" PropertyName="Text" Type="DateTime" />
                                                <asp:SessionParameter Name="locid" SessionField="WorkstationID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DataList2" EventName="ItemCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:LinkButton ID="btnCancelHidden" runat="server"></asp:LinkButton>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Panel ID="pnlComment" runat="server" BackColor="#33CCFF" Width="650px">
                    <table class="style2">
                        <tr>
                            <td colspan="2">
                                Add you comment to the batch or changeover</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnCommSubmit" runat="server" Text="Submit" />
                            </td>
                            <td>
                                <asp:Button ID="btnCommCancel" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAuthenticate" runat="server" BackColor="#33CCFF" Width="650px">
                    <table class="style2">
                        <tr>
                            <td align="center" colspan="2">
                                Authentication
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter User Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtSHUser" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter Password
                            </td>
                            <td>
                                <asp:TextBox ID="txtSHPass" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lblSHMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSHOK" runat="server" Text="Submit" />
                            </td>
                            <td align="center">
                                <asp:Button ID="btnSHCancel" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lnkShowPopHidden" runat="server"></asp:LinkButton>
                <cc1:ModalPopupExtender ID="MPELogin" runat="server" CancelControlID="btnCancelHidden"
                    PopupControlID="pnlLogin" TargetControlID="lnkShowPopHidden">
                </cc1:ModalPopupExtender>
                <asp:LinkButton ID="lnkCommPopHidden" runat="server"></asp:LinkButton>
                <br />
                <cc1:ModalPopupExtender ID="MPEComment" runat="server"
                    PopupControlID="pnlComment" TargetControlID="lnkCommPopHidden">
                </cc1:ModalPopupExtender>
                <asp:LinkButton ID="lnkShowAuthenticate" runat="server"></asp:LinkButton>
                <cc1:ModalPopupExtender ID="MPEAuthenticate" runat="server"
                    PopupControlID="pnlAuthenticate" TargetControlID="lnkshowauthenticate">
                </cc1:ModalPopupExtender>
            </td>
            <td align="right">
                <asp:LinkButton ID="LinkButton3" runat="server" BorderStyle="Solid" BorderWidth="1px">Admin</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
