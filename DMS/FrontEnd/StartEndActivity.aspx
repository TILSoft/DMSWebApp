<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="StartEndActivity.aspx.vb" Inherits="FrontEnd_StartEndActivityaspx" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 20px;
        }
    p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .style3
        {
            width: 495.75pt;
            font-size: 11.0pt;
            font-family: Calibri, sans-serif;
        }
        .style4
        {
            font-family: "Times New Roman", Times, serif;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <h2>
                            Change line status</h2>
                    </td>
                </tr>
            </table>
            <table class="style1" style="border-style: double">
                <tr>
                    <td width="20%">
                        Current status</td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Status Details</td>
                    <td>
                        <asp:Panel ID="pnlLot" runat="server" Width="100%">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                DataSourceID="ODSActivity" Height="50px" Width="100%">
                                <Fields>
                                    <asp:BoundField DataField="ActivityDesc" HeaderText="Current Activity" 
                                        SortExpression="ActivityDesc" />
                                    <asp:BoundField DataField="LocDescription" HeaderText="Location" 
                                        SortExpression="LocDescription" />
                                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" 
                                        SortExpression="StartTime" />
                                    <asp:BoundField DataField="txtID" HeaderText="Activity ID" 
                                        SortExpression="txtID" />
                                    <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                                        SortExpression="FormatDesc" />
                                </Fields>
                            </asp:DetailsView>
                            <asp:ObjectDataSource ID="ODSActivity" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" 
                                TypeName="ActivityTableAdapters.LineStatusDetailsTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="LocID" SessionField="WorkstationID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Panel ID="pnlEndLot" runat="server" Visible="False">
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        Total Units Generated</td>
                                    <td>
                                        <asp:TextBox ID="txtGoodUnits" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtGoodUnits" ErrorMessage="You must enter a number" 
                                            ValidationExpression="^((\d{1,8}))$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtGoodUnits" ErrorMessage="You must enter a value"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Total Waste Generated</td>
                                    <td>
                                        <asp:TextBox ID="txtWasteUnits" runat="server" Enabled="False">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table class="style1" style="border-style: double">
                <tr>
                    <td width="20%">
                        Select the New Status</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            DataSourceID="ODSActType" DataTextField="ActivityDesc" 
                            DataValueField="ActivityTypeID" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                        <asp:ObjectDataSource ID="ODSActType" runat="server" DeleteMethod="Delete" 
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
                    <td>
                        Details for new status</td>
                    <td>
                        <asp:Panel ID="pnlStartLot" runat="server" Visible="False">
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        Format<br />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="ODSFormat" 
                                            DataTextField="FormatDesc" DataValueField="FormatID">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ODSFormat" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByLocIDandActivity" 
                                            TypeName="LocationsTableAdapters.tblFormatTableAdapter">
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
                                        Lot Number</td>
                                    <td>
                                        <asp:TextBox ID="txtLot" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtLot" ErrorMessage="You must enter a lot number"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Item Code</td>
                                    <td>
                                        <asp:TextBox ID="txtItemCode" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtItemCode" ErrorMessage="You must enter an Item code"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Target Output</td>
                                    <td>
                                        <asp:TextBox ID="txtTarget" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtTarget" ErrorMessage="You must enter a target qty"></asp:RequiredFieldValidator>
                                        &nbsp;For Packaging enter Target Blisters</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlStartChangeOver" runat="server" Visible="False">
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        Change over type</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCOlist" runat="server" DataSourceID="ODSCOtype" 
                                            DataTextField="FormatDesc" DataValueField="FormatID">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="ODSCOtype" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByLocIDandActivity" 
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
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlStartIdleTime" runat="server" Visible="False">
                            <table class="style1">
                                <tr>
                                    <td width="50%">
                                        No details required</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnChangeStatus" runat="server" Text="Submit" />
                        <asp:LinkButton ID="btnPopUpHidden" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
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
            <br />
            
               <br />
            <br />
            <table class="style1">
                <tr>
                    <td align="center" class="style3" valign="top">
                        <asp:Panel ID="pnlLogin" runat="server" BackColor="#99CCFF" Width="500px" 
                            DefaultButton="BtnSubmit">
                            <asp:UpdatePanel ID="uplogin" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table class="style4">
                                        <tr>
                                            <td colspan="2">
                                                Login</td>
                                        </tr>
                                        <tr>
                                            <td align="left" width="50%">
                                                Check the correct time</td>
                                            <td>
                                                <asp:TextBox ID="txtPopTime" runat="server" Font-Bold="True" ForeColor="Red"></asp:TextBox>
                                                <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" 
                                                    CultureName="en-CA" ErrorTooltipEnabled="True" Mask="99/99/9999 99:99:99" 
                                                    MaskType="DateTime" TargetControlID="txtPopTime" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" width="50%">
                                                Enter your username</td>
                                            <td>
                                                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Enter your password</td>
                                            <td>
                                                <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style2" colspan="2">
                                                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" />
                                                &nbsp; &nbsp;
                                                <asp:Button ID="btnCancel" runat="server" style="height: 29px" Text="Cancel" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <asp:Label ID="lbllogmess" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    DataKeyNames="ActivityID" DataSourceID="ODSActCheck" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="ActivityID" HeaderText="ID" InsertVisible="False" 
                                                            ReadOnly="True" SortExpression="ActivityID" />
                                                        <asp:BoundField DataField="txtID" HeaderText="Lot" SortExpression="txtID" />
                                                        <asp:BoundField DataField="StartTime" HeaderText="Start" 
                                                            SortExpression="StartTime" />
                                                        <asp:BoundField DataField="endtime" HeaderText="End" SortExpression="endtime" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="ODSActCheck" runat="server" 
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                                    TypeName="ActivityTableAdapters.ActivityCheckTimeTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txtPopTime" Name="chktime" PropertyName="Text" 
                                                            Type="DateTime" />
                                                        <asp:SessionParameter Name="locid" SessionField="WorkstationID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnChangeStatus" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <br />
                            <asp:LinkButton ID="btncancelHidden" runat="server"></asp:LinkButton>
                        </asp:Panel>
                        <cc1:ModalPopupExtender ID="MPELogin" runat="server" 
                            CancelControlID="btncancelHidden" PopupControlID="pnllogin" 
                            TargetControlID="btnPopUpHidden">
                        </cc1:ModalPopupExtender>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>

