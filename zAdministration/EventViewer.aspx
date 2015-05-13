<%@ Page Title="" Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EventViewer.aspx.vb" Inherits="zAdministration_EventViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="odsEventList" EnableModelValidation="True">
    <Columns>
        <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
        <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
        <asp:BoundField DataField="EventEndtime" HeaderText="EventEndtime" SortExpression="EventEndtime" />
        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" SortExpression="LocDescription" />
        <asp:ButtonField CommandName="xDelete" Text="Delete" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsEventList" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DAQEventsTableAdapters.RunningEventListTableAdapter"></asp:ObjectDataSource>
</asp:Content>

