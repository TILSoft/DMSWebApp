<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="DowntimeListTest.aspx.vb" Inherits="FrontEnd_DowntimeListTest" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                SortExpression="Downtimestart" />
            <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                SortExpression="Downtimeend" />
            <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                SortExpression="RemedyDescription" />
            <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                SortExpression="RootCauseDesc" />
            <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                SortExpression="LocDescription" />
            <asp:BoundField DataField="SymptomDesc" HeaderText="SymptomDesc" 
                SortExpression="SymptomDesc" />
            <asp:BoundField DataField="dtime" HeaderText="dtime" ReadOnly="True" 
                SortExpression="dtime" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBetweenDates" 
        TypeName="DataAnalysisTableAdapters.DetailsMediumByLocTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtLocID" Name="locid" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="txtEnd" Name="downtimend" PropertyName="Text" 
                Type="DateTime" />
            <asp:ControlParameter ControlID="txtStart" Name="downtimstart" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <table class="style1">
        <tr>
            <td>
                locid</td>
            <td>
                <asp:TextBox ID="txtLocID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Start date</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                end date</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

