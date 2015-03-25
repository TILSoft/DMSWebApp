<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false"
    CodeFile="RootCauseReview.aspx.vb" Inherits="FrontEnd_RootCauseReview" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../Controls/DrilldownControl.ascx" tagname="DrilldownControl" tagprefix="uc1" %>
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
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            color: #000000;
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
                            Review Root Causes and Remedies for the symptom &amp; close downtime</h2>
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
                                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                                    Width="100%">
                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Review Previous Remedies">
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        <h3>
                                                            Review Previous Remedies for this Symptom</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
                                                            AutoGenerateColumns="False" DataSourceID="RootRemODS" Width="100%">
                                                            <Columns>
                                                                <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause Description" SortExpression="RootCauseDesc" />
                                                                <asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location" SortExpression="LocDescription" />
                                                                <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" SortExpression="RemedyDescription" />
                                                                <asp:BoundField DataField="Downtimestart" HeaderText="Last Downtime" SortExpression="Downtimestart" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("RemedyID") %>'
                                                                           Visible='<%# Eval("SymptomQuickClose") %>'>Quick Close</asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                There are no previous remedies for this root cause. Please select close downtime
                                                                tab to close out your downtime</EmptyDataTemplate>
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="RootRemODS" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetDataByDowntimeID" TypeName="RootCauseRemedyTableAdapters.RootCauseReview2TableAdapter">
                                                            <SelectParameters>
                                                                <asp:QueryStringParameter Name="DowntimeID" QueryStringField="DowntimeID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                        <cc1:ModalPopupExtender ID="MPESymptom" runat="server" DynamicServicePath="" 
                                                            Enabled="True" PopupControlID="pnlnewSymptom" TargetControlID="lnkHdnPop">
                                                        </cc1:ModalPopupExtender>
                                                        <asp:LinkButton ID="lnkHdnPop" runat="server"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlNewSymptom" runat="server" BackColor="#66CCFF">
                                                            <table class="style1">
                                                                <tr>
                                                                    <td width="50%" colspan="2" class="style3">
                                                                        </h3>
                                                                        <h2 class="style4">
                                                                            Short Stop Time Expired. Enter New Symptom Location</h2>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3" colspan="2" width="50%">
                                                                        You have selected a Short stop but the time to log the downtime is greater than 
                                                                        the minimum short stop time. You must now enter a symptom location to proceed
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="50%">
                                                                        1. Select new symptom location
                                                                    </td>
                                                                    <td>
                                                                       2. Select new symptom Description</td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <uc1:DrilldownControl ID="SympLoc" runat="server"  />
                                                                    </td>
                                                                    <td valign="top">
                                                                        <asp:Label ID="lblSympID" runat="server" Visible="False"></asp:Label>
                                                                        <asp:DataList ID="DataList2" runat="server" DataKeyField="SymptomID" 
                                                                            DataSourceID="ODSSymptom" Width="100%">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="Button2" runat="server" 
                                                                                    CommandArgument='<%# Eval("SymptomID") %>' Text='<%# Eval("SymptomDesc") %>' 
                                                                                    Visible='<%# Eval("SymptomEnabled") %>' Width="100%" />
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:ObjectDataSource ID="ODSSymptom" runat="server" DeleteMethod="Delete" 
                                                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                                                            SelectMethod="GetDataByLocIDnotDTType" 
                                                                            TypeName="LocationsTableAdapters.tblSymptomTableAdapter" 
                                                                            UpdateMethod="Update">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="lblSympID" Name="LocID" PropertyName="Text" 
                                                                                    Type="Int32" />
                                                                                <asp:Parameter DefaultValue="2" Name="notDTType" Type="Int32" />
                                                                            </SelectParameters>
                                                                            <DeleteParameters>
                                                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                                            </DeleteParameters>
                                                                            <InsertParameters>
                                                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                                                <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                                            </InsertParameters>
                                                                            <UpdateParameters>
                                                                                <asp:Parameter Name="SymptomDesc" Type="String" />
                                                                                <asp:Parameter Name="LocID" Type="Int32" />
                                                                                <asp:Parameter Name="DTType" Type="Int32" />
                                                                                <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                                                                                <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                                                                                <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                                                                            </UpdateParameters>
                                                                        </asp:ObjectDataSource>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Close Downtime">
                                        <ContentTemplate>
                                            <table class="style1">
                                                <tr>
                                                    <td colspan="3">
                                                        <h3>
                                                            Close the downtime</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="50%">
                                                        1. Select the Root Cause location for this downtime
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:Label ID="lbl2" runat="server" Text="2. Enter your root cause for this downtime"
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="50%">
                                                        <asp:Literal ID="litRCPath" runat="server"></asp:Literal>
                                                    </td>
                                                    <td colspan="2">
                                                        &#160;&#160;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="11" valign="top">
                                                        <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" DataSourceID="locDS"
                                                            Width="100%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("LocID") %>'
                                                                    Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>'
                                                                    Width="80%" /></ItemTemplate>
                                                        </asp:DataList><asp:ObjectDataSource ID="locDS" runat="server" DeleteMethod="Delete"
                                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentLocID"
                                                            TypeName="LocationsTableAdapters.tblLocTableAdapter" UpdateMethod="Update">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="Original_LocID" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="LocDescription" Type="String" />
                                                                <asp:Parameter Name="ParentLocID" Type="Int32" />
                                                                <asp:Parameter Name="DowntimeID" Type="Int32" />
                                                                <asp:Parameter Name="LotStatus" Type="Int32" />
                                                                <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                                                <asp:Parameter Name="LocationStatus" Type="Int32" />
                                                                <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="ParentLocID" SessionField="btnRCLocID" Type="Int32" />
                                                            </SelectParameters>
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
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="txtRootCause" runat="server" Height="100px" TextMode="MultiLine"
                                                            ValidationGroup="1" Visible="False" Width="100%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        &#160;&#160;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="btnAcceptRC" runat="server" Text="Next -&gt;" ValidationGroup="1"
                                                            Visible="False" Width="200px" /><br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRootCause"
                                                            ErrorMessage="You must enter a root cause description" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lbl3" runat="server" Text="3. Enter the Remedy for this downtime"
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:TextBox ID="txtRemedy" runat="server" Height="100px" TextMode="MultiLine" Visible="False"
                                                            Width="100%"></asp:TextBox><br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRemedy"
                                                            ErrorMessage="You must enter a Remedy Description" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="25%">
                                                        <asp:Label ID="lbl4" runat="server" Text="4. Parameters Adjusted" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBoxList ID="cblParameters" runat="server" DataSourceID="paramODS" DataTextField="ParamDesc"
                                                            DataValueField="ParamId" Visible="False">
                                                        </asp:CheckBoxList>
                                                        <asp:Label ID="lblparamMsg" runat="server"></asp:Label><asp:ObjectDataSource ID="paramODS"
                                                            runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblParamTableAdapter"
                                                            UpdateMethod="Update">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="Original_ParamId" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="ParamDesc" Type="String" />
                                                                <asp:Parameter Name="ParamUnit" Type="String" />
                                                                <asp:Parameter Name="LocationID" Type="Int32" />
                                                                <asp:Parameter Name="ParamEnabled" Type="Boolean" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="locationId" SessionField="btnRCLocID" Type="Int32" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="ParamDesc" Type="String" />
                                                                <asp:Parameter Name="ParamUnit" Type="String" />
                                                                <asp:Parameter Name="LocationID" Type="Int32" />
                                                                <asp:Parameter Name="ParamEnabled" Type="Boolean" />
                                                                <asp:Parameter Name="Original_ParamId" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl5" runat="server" Text="5. Engineer Required" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblEngineer" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                                            Visible="False">
                                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                                            <asp:ListItem Value="0">No</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="btnCloseDT" runat="server" Text="Close Downtime" ValidationGroup="2"
                                                            Visible="False" Width="200px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        &#160;&#160;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Panel ID="pnlLogin" runat="server" BackColor="#99CCFF" DefaultButton="btnlogok">
                                                            <asp:UpdatePanel ID="upLogin" runat="server">
                                                                <ContentTemplate>
                                                                    <table class="style1">
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                Close this downtime
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                Check the end time is correct
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="TxtPopTime" runat="server" ForeColor="#FF3300" Font-Bold="True"></asp:TextBox><cc1:MaskedEditExtender
                                                                                    ID="MaskedEditExtender6" runat="server" TargetControlID="txtPopTime" Mask="99/99/9999 99:99:99"
                                                                                    MaskType="DateTime" CultureName="en-CA" ErrorTooltipEnabled="True" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Panel ID="pnlTech" runat="server">
                                                                                    <table class="style1">
                                                                                        <tr>
                                                                                            <td colspan="2">
                                                                                                Technologist Login
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your username
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtTechUser" runat="server"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your password
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtTechPass" runat="server" TextMode="Password"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Panel ID="pnlEng" runat="server">
                                                                                    <table class="style1">
                                                                                        <tr>
                                                                                            <td colspan="2">
                                                                                                Engineer Login
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your username
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtEngUserName" runat="server"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your password
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtEngPass" runat="server" TextMode="Password"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Panel ID="pnlExec" runat="server">
                                                                                    <table class="style1">
                                                                                        <tr>
                                                                                            <td colspan="2">
                                                                                                Executive Login
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your username
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtExecUserName" runat="server"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                Enter your password
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtExecPass" runat="server" TextMode="Password"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Button ID="btnLogOk" runat="server" Text="Submit" />&nbsp;&nbsp;
                                                                                <asp:Button ID="btnLogCancel" runat="server" Text="Cancel" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <asp:Label ID="lblLogMsg" runat="server" ForeColor="Red"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCloseDT" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DowntimeID"
                                                                DataSourceID="ODSDowntimeChecker" Visible="False" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundField DataField="DowntimeID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                                        SortExpression="DowntimeID" />
                                                                    <asp:BoundField DataField="Downtimestart" HeaderText="Downtime Start" SortExpression="Downtimestart" />
                                                                    <asp:BoundField DataField="Downtimeend" HeaderText="Downtime End" SortExpression="Downtimeend" />
                                                                    <asp:BoundField DataField="SymptomDesc" HeaderText="Symptom" SortExpression="SymptomDesc" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:ObjectDataSource ID="ODSDowntimeChecker" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetDataByStartAndEnd" TypeName="DowntimeTableAdapters.DowntimeCheckerTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="SympLocid" SessionField="workstationID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="TxtPopTime" Name="chkEndtime" PropertyName="Text"
                                                                        Type="DateTime" />
                                                                    <asp:ControlParameter ControlID="lblDowntimeStart" Name="chkStartTime" PropertyName="Text"
                                                                        Type="DateTime" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            <br />
                                                            <asp:LinkButton ID="btnCancelHidden" runat="server"></asp:LinkButton></asp:Panel>
                                                        <cc1:ModalPopupExtender ID="MPELogin" runat="server" CancelControlID="btnCancelHidden"
                                                            DynamicServicePath="" Enabled="True" PopupControlID="pnlLogin" TargetControlID="btnPopUpHidden">
                                                        </cc1:ModalPopupExtender>
                                                        <asp:LinkButton ID="btnPopUpHidden" runat="server"></asp:LinkButton><br />
                                                    </td>
                                                </tr>
                                            </table>
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
