
<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="CompressionMultiViewtimeline.aspx.vb" Inherits="Controls_DAQtimelinetester" title="DMS MultiLine View" %>

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
                             DMS Compression MultiLine View</h2>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:DropDownList ID="ddlTime" runat="server" AutoPostBack="True">
                             <asp:ListItem>1</asp:ListItem>
                             <asp:ListItem>2</asp:ListItem>
                             <asp:ListItem>3</asp:ListItem>
                             <asp:ListItem>4</asp:ListItem>
                             <asp:ListItem>5</asp:ListItem>
                             <asp:ListItem>6</asp:ListItem>
                             <asp:ListItem>7</asp:ListItem>
                             <asp:ListItem>8</asp:ListItem>
                             <asp:ListItem>9</asp:ListItem>
                             <asp:ListItem>10</asp:ListItem>
                             <asp:ListItem>11</asp:ListItem>
                             <asp:ListItem>12</asp:ListItem>
                             <asp:ListItem>13</asp:ListItem>
                             <asp:ListItem>14</asp:ListItem>
                         </asp:DropDownList>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             <asp:Timer ID="Timer1" runat="server" Interval="30000">
                             </asp:Timer>
                         </h3>
                         <h3>
                             TP1</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline1" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             TP2</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline2" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <h3>
                             TP3</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline3" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>
                   <tr>
                     <td>
                         <h3>
                             TP4</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline4" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>
                   <tr>
                     <td>
                         <h3>
                             TP5</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline5" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>
                   <tr>
                     <td>
                         <h3>
                             TP6</h3>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <uc1:DAQTimeline ID="DAQTimeline6" runat="server" filesToHold="10" lvlHeight="25"
                                width="1000" />
                     </td>
                 </tr>

         </ContentTemplate>
     </asp:UpdatePanel>
     <br />
</asp:Content>
