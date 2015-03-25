<%@ Page EnableEventValidation="false" Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="tester.aspx.vb" Inherits="Controls_tester" title="Untitled Page" %>

<%@ Register src="DrilldownControl.ascx" tagname="DrilldownControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DrilldownControl ID="DrilldownControl1" runat="server" locID="3597" 
        Visible="True" />
    <asp:Label ID="lbltext" runat="server" Text="Label"></asp:Label>
    <br />
</asp:Content>

