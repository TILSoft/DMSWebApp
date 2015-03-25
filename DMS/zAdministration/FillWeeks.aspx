<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="FillWeeks.aspx.vb" Inherits="zAdministration_FillWeeks" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Create weeks for calculations</h2>
            </td>
        </tr>
        <tr>
            <td>
                From :
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                must be a monday!!!<br />
                To&nbsp;&nbsp; :                 <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Go" />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

