<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" CodeFile="EngNoteSearch.aspx.vb" Inherits="FrontEnd_DataAnalysis_EngNoteSearch" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="3">
                <h2>
                    Note Search</h2>
            </td>
        </tr>
        <tr>
            <td align="right" width="50%">
                Enter your search term here</td>
            <td>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            </td>
            <td>
                <asp:LinkButton ID="lnkExportExcel" runat="server">Export to Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" width="50%">
                Your search results</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="LocID" DataSourceID="ODSengNote" Width="100%" 
                    AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="LocDescription" HeaderText="Location" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="Comment" HeaderText="Comment" 
                            SortExpression="Comment" />
                        <asp:BoundField DataField="Username" HeaderText="User" 
                            SortExpression="Username" />
                        <asp:BoundField DataField="NoteDate" HeaderText="Date" 
                            SortExpression="NoteDate" />
                        <asp:TemplateField HeaderText="Location"></asp:TemplateField>
                        <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID" />
                    </Columns>
                    <EmptyDataTemplate>
                        There were no results for your search.
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSengNote" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByStringMatch" 
                    TypeName="EngNoteTableAdapters.EngNoteDetailsTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearch" Name="comment" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

