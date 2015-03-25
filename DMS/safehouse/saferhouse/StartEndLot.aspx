<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false"
    CodeFile="StartEndLot.aspx.vb" Inherits="FrontEnd_StartEndLot" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
           
        }
        .style2
        {
        }
        .style3
        {
          
        }
        .style4
        {
            width: 100%;
        }
       
        
        .style5
        {
            height: 23px;
        }
       
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Start/End a lot &amp; Start/End a Change Over<cc1:ToolkitScriptManager 
                        ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        </table>
    <table class="style1" style="border-style: double">
        <tr>
            <td class="style2" width="25%">
                &nbsp;</td>
            <td class="style2" width="25%">
                Current Line Status
            </td>
            <td class="style2" width="25%">
                <asp:Label ID="lblLineStatus" runat="server"></asp:Label>
            </td>
            <td class="style2" width="25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" width="25%">
                </td>
            <td class="style5" width="25%">
            </td>
            <td class="style5" width="25%">
            </td>
            <td class="style5" width="25%">
                </td>
        </tr>
        <tr>
            <td class="style2" width="25%">
                &nbsp;</td>
            <td class="style2" width="25%">
                Current Details<asp:LinkButton ID="btnPopUpHidden" runat="server"></asp:LinkButton>
            </td>
            <td class="style2" width="25%">
                &nbsp;
                <asp:DetailsView ID="DetailsLot" runat="server" AutoGenerateRows="False" DataSourceID="LotDetailsODS"
                    Height="50px" Width="100%" DataKeyNames="LotID">
                    <Fields>
                        <asp:BoundField DataField="LotNo" HeaderText="LotNo" SortExpression="LotNo" />
                        <asp:BoundField DataField="LotStartTime" HeaderText="LotStartTime" 
                            SortExpression="LotStartTime" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" SortExpression="FormatDesc" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="LotDetailsODS" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetLotDataByLocID" TypeName="lotsChangeOversTableAdapters.LotDataByLocTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="LocID" SessionField="WorkstationID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:DetailsView ID="DetailsChangeOver" runat="server" AutoGenerateRows="False" DataSourceID="COdetailsODS"
                    Height="50px" Width="100%" DataKeyNames="ChangeOverID">
                    <Fields>
                        <asp:BoundField DataField="Starttime" HeaderText="Starttime" SortExpression="Starttime" />
                        <asp:BoundField DataField="PreLot" HeaderText="PreLot" SortExpression="PreLot" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="PreForm" HeaderText="PreForm" SortExpression="PreForm" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="COdetailsODS" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="lotsChangeOversTableAdapters.ChangeOverByLocTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="Locid" SessionField="WorkstationID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td class="style2" width="25%">
                &nbsp;
                </td>
        </tr>
        </table>
    <table class="style1" style="border-style: double">
        <tr>
            <td class="style3" valign="top" align="center">
                <asp:Panel ID="pnlStartLot" runat="server" Width="50%">
                    <table class="style1">
                        <tr>
                            <td width="50%" align="left">
                                Lot Number
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtLotNumber" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                Format
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="FormatODS" DataTextField="FormatDesc"
                                    DataValueField="FormatID">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="FormatODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblFormatTableAdapter"
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
                                        <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="LocID" SessionField="WorkStationID" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="FormatDesc" Type="String" />
                                        <asp:Parameter Name="LocID" Type="Int32" />
                                        <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                        <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                        <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                Target Output
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTarget" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlEndLot" runat="server" Width="50%">
                    <table class="style1">
                        <tr>
                            <td width="50%" align="left">
                                Total good product
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtGoodUnits" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                Change Over Type
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCOtype" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                           <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style4" valign="top" align="center">
                                <asp:Button ID="btnStartLot" runat="server" />
            </td>
        </tr>
        </table>
    <p>
    </p>
    <table class="style1">
        <tr>
            <td class="style3" valign="top" align="center">
                <asp:Panel ID="pnlLogin" runat="server" Width="400px" BackColor="#99CCFF">
                    <asp:UpdatePanel ID="uplogin" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table class="style4">
                                <tr>
                                    <td colspan="2">
                                        Login</td>
                                </tr>
                                <tr>
                                    <td width="50%" align="left">
                                        Check the correct time</td>
                                    <td>
                                        <asp:TextBox ID="txtPopTime" runat="server" Font-Bold="True" ForeColor="Red"></asp:TextBox>
                                        
                                        <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server"
            TargetControlID="txtPopTime" 
            Mask="99/99/9999 99:99:99"
            MaskType="DateTime"
            CultureName = "en-CA"
            ErrorTooltipEnabled="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%" align="left">
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
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" style="height: 29px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lbllogmess" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnStartLot" EventName="Click" />
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
</asp:Content>
