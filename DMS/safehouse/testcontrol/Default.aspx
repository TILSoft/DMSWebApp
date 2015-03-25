<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="SafeHouse_testcontrol_Default" title="Untitled Page" %>

<%@ Register src="WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
                <uc1:WebUserControl ID="WUC" runat="server" Width="1200" ShowDateTime = false height = "20" Colour = "Red" />
                <uc1:WebUserControl ID="WUC3" runat="server" Width="1200" ShowDateTime = false height = "20" Colour = "Green" />
        
                <uc1:WebUserControl ID="WUC2" runat="server" Width="1200" Height = "20" Colour = "Blue" />
        
    </p>
    <p>
                &nbsp;</p>
</asp:Content>

