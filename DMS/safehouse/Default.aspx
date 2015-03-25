<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="safehouse_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="odsSS">
        <ItemTemplate>
            RemedyDescription:
            <asp:Label ID="RemedyDescriptionLabel" runat="server" 
                Text='<%# Eval("RemedyDescription") %>' />
            <br />
            RemedyID:
            <asp:Label ID="RemedyIDLabel" runat="server" Text='<%# Eval("RemedyID") %>' />
            <br />
            RootCauseDesc:
            <asp:Label ID="RootCauseDescLabel" runat="server" 
                Text='<%# Eval("RootCauseDesc") %>' />
            <br />
            SymptomDesc:
            <asp:Label ID="SymptomDescLabel" runat="server" 
                Text='<%# Eval("SymptomDesc") %>' />
            <br />
            SymptomID:
            <asp:Label ID="SymptomIDLabel" runat="server" Text='<%# Eval("SymptomID") %>' />
            <br />
            LocID:
            <asp:Label ID="LocIDLabel" runat="server" Text='<%# Eval("LocID") %>' />
            <br />
            rootcauselocationdesc:
            <asp:Label ID="rootcauselocationdescLabel" runat="server" 
                Text='<%# Eval("rootcauselocationdesc") %>' />
            <br />
            SSButtonColour:
            <asp:Label ID="SSButtonColourLabel" runat="server" 
                Text='<%# Eval("SSButtonColour") %>' />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" 
                BackColor='<%# System.Drawing.Color.FromName(Eval("SSButtonColour")&"") %>' 
                Text='<%# Eval("RootCauseDesc", "{0}") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="odsSS" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="RootCauseRemedyTableAdapters.RCRemedySympForDAQSSTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="856" Name="sympID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="www.google.ie">HyperLink</asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

