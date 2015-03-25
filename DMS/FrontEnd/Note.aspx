<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Note.aspx.vb" Inherits="FrontEnd_Note" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 25px;
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
                            Make an Engineering Note</h2>
                    </td>
                    <td align="right">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="50%">
                        Select the location</td>
                    <td>
                        Select format<asp:Label ID="lblRootSympLocID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFormat" runat="server" 
                                DataSourceID="FormatsODS" DataTextField="FormatDesc" 
                            DataValueField="FormatID">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="FormatsODS" runat="server" 
                                DeleteMethod="Delete" InsertMethod="Insert" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" 
                                TypeName="LocationsTableAdapters.tblFormatTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_FormatID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FormatDesc" Type="String" />
                                <asp:Parameter Name="LocID" Type="Int32" />
                                <asp:Parameter Name="OperationRatePerMin" 
                                        Type="Decimal" />
                                <asp:Parameter Name="OperatiionRateBatch" 
                                        Type="Decimal" />
                                <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                <asp:Parameter Name="Original_FormatID" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:Parameter Name="LocID" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FormatDesc" Type="String" />
                                <asp:Parameter Name="LocID" Type="Int32" />
                                <asp:Parameter Name="OperationRatePerMin" 
                                        Type="Decimal" />
                                <asp:Parameter Name="OperatiionRateBatch" 
                                        Type="Decimal" />
                                <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                                DataSourceID="LocIDDS" Width="100%">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                                        Enabled='<%# Eval("LocationEnabled") %>' Text='<%# Eval("LocDescription") %>' 
                                        Width="80%" />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="LocIDDS" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetDataByParentLocID" 
                                TypeName="LocationsTableAdapters.tblLocTableAdapter" 
                            UpdateMethod="Update">
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
                                <asp:SessionParameter DefaultValue="0" Name="ParentLocID" 
                                        SessionField="ENLocID" Type="Int32" />
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
                    <td valign="top">
                        <asp:TextBox ID="txtNote" runat="server" Height="188px" 
                                TextMode="MultiLine" Width="614px"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnSave" runat="server" Text="Save Note" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="lbtnHiddenPopUp" runat="server"></asp:LinkButton>
             <cc1:ModalPopupExtender ID="MPELogin" runat="server" 
            CancelControlID="lbtnCancelHidden" 
            PopupControlID="LogInPanel" TargetControlID="lbtnHiddenPopUp">
        </cc1:ModalPopupExtender>
            <asp:Panel ID="LogInPanel" runat="server" BackColor="#66FFCC" Width="500px">
                <asp:UpdatePanel ID="upLogin" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td align="center" colspan="2">
                                    Engineering Login</td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Check time and date</td>
                                <td>
                                    <asp:TextBox ID="txtTimeDate" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    Enter your username</td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Enter your Password</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnOK" runat="server" Text="Submit" />
                                </td>
                                <td align="center">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <asp:LinkButton ID="lbtnCancelHidden" runat="server"></asp:LinkButton>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <table width="100%" >
    <tr><td>
        &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    
    <tr><td>
        &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    
    <tr><td>
       
    </td>
        <td>
            &nbsp;</td>
    </tr>
    
    </table>
    
    
    <br />
</asp:Content>

