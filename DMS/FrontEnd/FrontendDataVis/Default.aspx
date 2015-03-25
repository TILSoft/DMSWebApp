<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="FrontEnd_FrontendDataVis_Default" title="Untitled Page" %>

<%@ Register src="../../Controls/DAQTimeline.ascx" tagname="DAQTimeline" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DAQTimeline ID="DAQTimeline1" runat="server" />
</asp:Content>

