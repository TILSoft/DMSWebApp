<%@ Page Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false" CodeFile="popDTstart.aspx.vb" Inherits="FrontEnd_popDTstart" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 450px;
            height: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <script src="DTstartClose.js" type="text/javascript"></script>
            <table class="style1">
                <tr>
                    <td colspan="2">
                        <h2 style="text-align: center">
                            Start a downtime
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td width="50%">
                        Confirm Downtime Start time</td>
                    <td>
                        <asp:TextBox ID="TxtTime" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter your Username</td>
                    <td>
                        <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Enter your Password</td>
                    <td>
                        <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server">0</asp:TextBox>
                        <br />
                    </td>
                    <td>
                        <asp:Button ID="btnAccept" runat="server" Text="Start Downtime" />
                    </td>
                </tr>
            </table>
              
        </ContentTemplate>
</asp:UpdatePanel>

  
    
    </asp:Content>

