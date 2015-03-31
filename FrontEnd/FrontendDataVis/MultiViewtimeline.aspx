<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MultiViewtimeline.aspx.vb" Inherits="Controls_DAQtimelinetester" %>
<%@ Register src="../../Controls/DAQTimeline.ascx" tagname="DAQTimeline" tagprefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <table class="style1">
        <tr>
            <td>
                BL1</td>
        </tr>
        <tr>
            <td>
    
    <uc1:DAQTimeline ID="DAQTimeline1" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                                
            </td>
        </tr>
        <tr>
            <td>
                BL2</td>
        </tr>
        <tr>
            <td>
                                
    <uc1:DAQTimeline ID="DAQTimeline2" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                                
            </td>
        </tr>
        <tr>
            <td>
                BL3</td>
        </tr>
        <tr>
            <td>
                                
    <uc1:DAQTimeline ID="DAQTimeline3" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                                
 
 
            </td>
        </tr>
    </table>
                                
 
 
    </form>
</body>
</html>
