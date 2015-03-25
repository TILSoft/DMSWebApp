<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TimelineAnalysis.aspx.vb" Inherits="Controls_DAQtimelinetester" %>
<%@ Register src="~/controls/DAQTimeline.ascx" tagname="DAQTimeline" tagprefix="uc1" %>



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
            <td colspan="4">
                <h2>
                    Timeline Analysis
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Start Time</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
            </td>
            <td>
                End time</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Select Line</td>
            <td colspan="2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="odsLoc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="odsLoc" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByParentLocID" 
                    TypeName="LocationsTableAdapters.tblLocTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_LocID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocDescription" Type="String" />
                        <asp:Parameter Name="ParentLocID" Type="Int32" />
                        <asp:Parameter Name="DowntimeID" Type="Int32" />
                        <asp:Parameter Name="LotStatus" Type="Int32" />
                        <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                        <asp:Parameter Name="LocationStatus" Type="Int32" />
                        <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                        <asp:Parameter Name="Original_LocID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="ParentLocID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LocDescription" Type="String" />
                        <asp:Parameter Name="ParentLocID" Type="Int32" />
                        <asp:Parameter Name="DowntimeID" Type="Int32" />
                        <asp:Parameter Name="LotStatus" Type="Int32" />
                        <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                        <asp:Parameter Name="LocationStatus" Type="Int32" />
                        <asp:Parameter Name="ChangeOverStatus" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnGo" runat="server" Text="Go" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
    
    <uc1:DAQTimeline ID="DAQTimeline1" runat="server" filesToHold="10" lvlHeight="50"
                                width="1000" />
                                
 
 
            </td>
        </tr>
        <tr>
            <td colspan="4">
<asp:GridView 
                                ID="gvDowntime" runat="server" 
        AutoGenerateColumns="False" DataSourceID="odsDowntimeForLine"
                                Width="950px" AllowSorting="True"><Columns>
        <asp:BoundField 
                                    DataField="Downtimestart" HeaderText="DT Start" 
                                    SortExpression="Downtimestart" />
        <asp:BoundField DataField="dtime" 
                                    HeaderText="DT (secs)" ReadOnly="True" 
            SortExpression="dtime" />
        <asp:BoundField DataField="dtimeMins" DataFormatString="{0:F2}" 
            HeaderText="DT (mins)" SortExpression="dtimeMins" />
        <asp:BoundField 
                                    DataField="SymptomDesc" HeaderText="Symptom" 
            SortExpression="SymptomDesc" />
        <asp:BoundField 
                                    DataField="RootCauseDesc" HeaderText="Root Cause" 
                                    SortExpression="RootCauseDesc" />
        <asp:BoundField DataField="LocDescription" 
                                    HeaderText="Location" 
            SortExpression="LocDescription" />
        <asp:BoundField 
                                    DataField="RemedyDescription" HeaderText="Remedy" 
                                    SortExpression="RemedyDescription" /></Columns>
    <EmptyDataTemplate>There is no downtime for this period.
                                </EmptyDataTemplate>
                                </asp:GridView>
        <asp:ObjectDataSource ID="odsDowntimeForLine" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" 
        TypeName="DataAnalysisTableAdapters.DowntimeWShomeTableAdapter"><SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="locid" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtEnd" Name="downtimeend" PropertyName="Text" 
                    Type="DateTime" />
                <asp:ControlParameter ControlID="txtStart" Name="downtimestart" 
                    PropertyName="Text" Type="DateTime" />
            </SelectParameters></asp:ObjectDataSource>
                            
                            
            </td>
        </tr>
    </table>
                                
 
 
    </form>
</body>
</html>
