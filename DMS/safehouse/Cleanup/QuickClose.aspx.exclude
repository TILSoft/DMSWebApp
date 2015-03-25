<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false"
    CodeFile="QuickClose.aspx.vb" Inherits="FrontEnd_RootCauseReview" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 385px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="DTEnd.js" type="text/javascript"></script>

    <br />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <h2>
                            Downtime Quick Close</h2>
                    </td>
                </tr>
            </table>
            <table class="style1" style="border-style: double">
                <tr>
                    <td width="15%">
                        Symptom Location
                    </td>
                    <td>
                        <asp:Label ID="lblSympLocation" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Symptom Description
                    </td>
                    <td>
                        <asp:Label ID="lblSymptomDesc" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Downtime Start
                    </td>
                    <td>
                        <asp:Label ID="lblDowntimeStart" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="style1" style="border-style: double">
                        <tr>
                            <td class="style2" valign="top">
                                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                   <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Close Downtime"><ContentTemplate>
<table class="style1"><tr><td>
        <asp:Button ID="btnCloseDT" runat="server" Text="Close Downtime" 
        ValidationGroup="2" Width="200px" />

<br /><asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

</td><td>&#160;<br />&#160;&#160;</td>
    <td colspan="2"><asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" DataSourceID="ODSRCRem" Height="50px" Width="100%"><Fields>
<asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause Description" 
                SortExpression="RootCauseDesc">
<HeaderStyle Width="20%"></HeaderStyle>
            
            
            
            

</asp:BoundField>
<asp:BoundField DataField="LocDescription" HeaderText="Root Cause location" 
                SortExpression="LocDescription"></asp:BoundField>
<asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" 
                SortExpression="RemedyDescription"></asp:BoundField>
        </Fields>
        
        
        
        
        
        </asp:DetailsView>

<asp:ObjectDataSource ID="ODSRCRem" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRemedyID" 
            TypeName="RootCauseRemedyTableAdapters.RCRemDetailsBySympTableAdapter"><SelectParameters>
<asp:QueryStringParameter Name="remedyID" QueryStringField="RemedyID" Type="Int32"></asp:QueryStringParameter>
    </SelectParameters>
    
    
    
    
        
        </asp:ObjectDataSource>

</td></tr>
    <tr><td valign="top" width="50%">&#160;</td></tr><tr>
        <td width="50%" rowspan="2" valign="top">&nbsp;</td></tr>
    <tr><td align="center">
        <asp:Panel 
                                            ID="pnlLogin" runat="server" BackColor="#99CCFF" DefaultButton="btnlogok"><asp:UpdatePanel ID="upLogin" runat="server"><ContentTemplate><table class="style1"><tr><td colspan="2">Close this downtime </td></tr><tr><td width="50%">Check the end time is correct </td><td><asp:TextBox ID="TxtPopTime" runat="server" ForeColor="#FF3300"></asp:TextBox><cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" 
                                                                   CultureName="en-CA" ErrorTooltipEnabled="True" Mask="99/99/9999 99:99:99" 
                                                                   MaskType="DateTime" TargetControlID="txtPopTime" /></td></tr><tr><td colspan="2"><asp:Panel ID="pnlTech" runat="server"><table class="style1"><tr><td colspan="2">Technologist Login </td></tr><tr><td>Enter your username </td><td><asp:TextBox ID="txtTechUser" runat="server"></asp:TextBox></td></tr><tr><td>Enter your password </td><td><asp:TextBox ID="txtTechPass" runat="server" TextMode="Password"></asp:TextBox></td></tr></table></asp:Panel></td></tr><tr><td colspan="2"><asp:Panel ID="pnlEng" runat="server"><table class="style1"><tr><td colspan="2">Engineer Login </td></tr><tr><td>Enter your username </td><td><asp:TextBox ID="txtEngUserName" runat="server"></asp:TextBox></td></tr><tr><td>Enter your password </td><td><asp:TextBox ID="txtEngPass" runat="server" TextMode="Password"></asp:TextBox></td></tr></table></asp:Panel></td></tr><tr><td colspan="2"><asp:Panel ID="pnlExec" runat="server"><table class="style1"><tr><td colspan="2">Executive Login </td></tr><tr><td>Enter your username </td><td><asp:TextBox ID="txtExecUserName" runat="server"></asp:TextBox></td></tr><tr><td>Enter your password </td><td><asp:TextBox ID="txtExecPass" runat="server" TextMode="Password"></asp:TextBox></td></tr></table></asp:Panel></td></tr><tr><td colspan="2"><asp:Button ID="btnLogOk" runat="server" Text="Submit" />
                                           &nbsp;&nbsp; <asp:Button ID="btnLogCancel" runat="server" Text="Cancel" /></td></tr><tr><td colspan="2"><asp:Label ID="lblLogMsg" runat="server"></asp:Label><asp:GridView 
                                                ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                DataKeyNames="DowntimeID" DataSourceID="ODSDowntimeChecker" Visible="False" 
                                                Width="100%"><Columns><asp:BoundField DataField="DowntimeID" 
                                                    HeaderText="DowntimeID" InsertVisible="False" ReadOnly="True" 
                                                    SortExpression="DowntimeID" />
                                                <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                                    SortExpression="Downtimestart" />
                                                <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                                                    SortExpression="Downtimeend" />
                                                <asp:BoundField DataField="SymptomDesc" HeaderText="SymptomDesc" 
                                                    SortExpression="SymptomDesc" />
                                            </Columns>
                                            </asp:GridView><asp:ObjectDataSource ID="ODSDowntimeChecker" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                SelectMethod="GetDataByStartAndEnd" 
                                                TypeName="DowntimeTableAdapters.DowntimeCheckerTableAdapter"><SelectParameters><asp:SessionParameter 
                                                        Name="SympLocid" SessionField="workstationID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="TxtPopTime" Name="chkEndtime" 
                                                        PropertyName="Text" Type="DateTime" />
                                                    <asp:ControlParameter ControlID="lblDowntimeStart" Name="chkStartTime" 
                                                        PropertyName="Text" Type="DateTime" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <br />
                                            </td></tr></table></ContentTemplate><Triggers><asp:AsyncPostBackTrigger ControlID="btnCloseDT" EventName="Click" /></Triggers></asp:UpdatePanel><asp:LinkButton ID="btnCancelHidden" runat="server"></asp:LinkButton></asp:Panel>
<cc1:ModalPopupExtender ID="MPELogin" runat="server" 
                                           CancelControlID="btnCancelHidden" DynamicServicePath="" Enabled="True" 
                                           PopupControlID="pnlLogin" TargetControlID="btnPopUpHidden"></cc1:ModalPopupExtender>
<asp:LinkButton ID="btnPopUpHidden" runat="server"></asp:LinkButton>
<br /></td></tr></table>
                                    
                                    
                                    
                                    
                                    
                                    
                                    </ContentTemplate>
</cc1:TabPanel>
                                </cc1:TabContainer>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
