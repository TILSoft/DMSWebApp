<%@ Page Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false" CodeFile="popDTEnd.aspx.vb" Inherits="FrontEnd_popDTstart" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 450px;
            height: 47px;
        }
        .style2
        {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <script src="DTEndClose.js" type="text/javascript"></script>
            <table class="style1">
                <tr>
                    <td colspan="2">
                        <h2 style="text-align: center">
                            End a Downtime
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        Confirm Downtime End time</td>
                    <td>
                        <asp:TextBox ID="TxtTime" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
              
            <asp:Panel ID="pnlTech" runat="server">
                <table class="style1">
                    <tr>
                        <td colspan="2" align="center">
                            Technologist Sign</td>
                    </tr>
                    <tr>
                        <td>
                            Enter Tech Username</td>
                        <td>
                            <asp:TextBox ID="TxtTechUser" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter your Password</td>
                        <td>
                            <asp:TextBox ID="txtTechPass" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlEng" runat="server">
                <table class="style1">
                    <tr>
                        <td colspan="2" align="center">
                            Engineer Sign</td>
                    </tr>
                    <tr>
                        <td>
                            Enter your Username</td>
                        <td>
                            <asp:TextBox ID="TxtEngUser" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Enter your Password</td>
                        <td>
                            <asp:TextBox ID="txtEngPass" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlExec" runat="server">
                <table class="style1">
                    <tr>
                        <td class="style2" colspan="2" align="center">
                            Executive Sign</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Enter your Username</td>
                        <td class="style2">
                            <asp:TextBox ID="TxtExecUser" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            Enter your Password</td>
                        <td>
                            <asp:TextBox ID="txtExecPass" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table class="style1">
                <tr>
                    <td width="50%">
                        <asp:TextBox ID="txtTechUserID" runat="server" Width="38px">0</asp:TextBox>
                        <asp:TextBox ID="txtEngUserID" runat="server" Width="38px">0</asp:TextBox>
                        <asp:TextBox ID="txtExecUserID" runat="server" Width="38px">0</asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnAccept" runat="server" Text="End Downtime" />
                    </td>
                </tr>
            </table>
              
        </ContentTemplate>
</asp:UpdatePanel>

  
    
    </asp:Content>

