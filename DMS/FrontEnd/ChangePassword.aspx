<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="FrontEnd_ChangePassword" title="Untitled Page" %>

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
            <td colspan="2">
                <h2>
                    Change Password</h2>
            </td>
        </tr>
        <tr>
            <td width="50%">
                Enter user name</td>
            <td>
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Enter old Password</td>
            <td>
                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Enter new Password</td>
            <td>
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Repeat new Password</td>
            <td>
                <asp:TextBox ID="txtNewPass2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmessage" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td>
                <asp:Button ID="BtnChangePass" runat="server" Text="Change" />
            </td>
        </tr>
    </table>
</asp:Content>

