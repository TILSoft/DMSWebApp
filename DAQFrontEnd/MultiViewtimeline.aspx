
<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="MultiViewtimeline.aspx.vb" Inherits="Controls_DAQtimelinetester" title="DMS MultiLine View" %>

<%@ Register src="~/Controls/DAQTimeline.ascx" tagname="DAQTimeline" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
         <ContentTemplate>
             <table class="style1">
                 <tr>
                     <td>
                         <h2>
                             DMS Packaging MultiLine View</h2>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             <asp:Timer ID="Timer1" runat="server" Interval="30000">
                             </asp:Timer>
                             BL1</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline1" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             BL2</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline2" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             BL3</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline3" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                     </td>
                 </tr>
                   <tr>
                     <td>
                         <h3>
                             BL4</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline4" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                     </td>
                 </tr>
         </ContentTemplate>
     </asp:UpdatePanel>
     <br />
</asp:Content>
