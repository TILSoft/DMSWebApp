<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TimeLine.ascx.vb" Inherits="controls_WebUserControl" %>

<style type="text/css">
    .style1
    {
     
    }
</style>
<table class="style1" style="border-style: none">
    <tr>
        <td colspan="2">

<asp:PlaceHolder ID="PH1" runat="server"></asp:PlaceHolder>

        </td>
    </tr>
    <tr>
        <td height="0">
            <asp:Label ID="LblStart" runat="server"></asp:Label>
        </td>
        <td align="right" height="0">
            <asp:Label ID="lblEnd" runat="server"></asp:Label>
        </td>
    </tr>
</table>


