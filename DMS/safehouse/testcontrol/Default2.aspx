<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="SafeHouse_testcontrol_Default2" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>
    <br />
    <br />
    <asp:TextBox ID="TextBox6" runat="server" ValidationGroup="MKE" Width="180px" />
    <cc1:maskededitextender id="MaskedEditExtender6" runat="server" 
        errortooltipenabled="True" mask="99/99/9999 99:99:99" masktype="DateTime" 
        messagevalidatortip="true" onfocuscssclass="MaskedEditFocus" 
        oninvalidcssclass="MaskedEditError" targetcontrolid="TextBox6" 
        UserDateFormat="DayMonthYear" />
    <cc1:maskededitvalidator id="MaskedEditValidator6" runat="server" 
        controlextender="MaskedEditExtender6" controltovalidate="TextBox6" 
        display="Dynamic" emptyvalueblurredtext="*" 
        emptyvaluemessage="Date and time are required" invalidvalueblurredmessage="*" 
        invalidvaluemessage="Date and/or time is invalid" isvalidempty="False" 
        tooltipmessage="Input a date and time" validationgroup="MKE" />
            <br />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ValidationGroup="MKE" />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

