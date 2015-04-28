<%@ Page Language="VB" MasterPageFile="~/backend.master" AutoEventWireup="false" CodeFile="CreateProject.aspx.vb" Inherits="Application_CreateProject" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>





    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <table class="style1">
                <tr>
                    <td>
                        <h3>
                            Create project</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PFID" 
                            DataSourceID="odsCreateProj" Width="75%" DefaultMode="Insert">
                            <EditItemTemplate>
                                PFID:
                                <asp:Label ID="PFIDLabel1" runat="server" Text='<%# Eval("PFID") %>' />
                                <br />
                                PFName:
                                <asp:TextBox ID="PFNameTextBox" runat="server" 
                                    Text='<%# Bind("PFName") %>' />
                                <br />
                                PFComment:
                                <asp:TextBox ID="PFCommentTextBox" runat="server" 
                                    Text='<%# Bind("PFComment") %>' />
                                <br />
                                FormatID:
                                <asp:TextBox ID="FormatIDTextBox" runat="server" 
                                    Text='<%# Bind("FormatID") %>' />
                                <br />
                                PFStatus:
                                <asp:TextBox ID="PFStatusTextBox" runat="server" 
                                    Text='<%# Bind("PFStatus") %>' />
                                <br />
                                PFStartDate:
                                <asp:TextBox ID="PFStartDateTextBox" runat="server" 
                                    Text='<%# Bind("PFStartDate") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                PFName:
                                <asp:TextBox ID="PFNameTextBox" runat="server" Text='<%# Bind("PFName") %>' />
                                <br />
                                PFComment:
                                <asp:TextBox ID="PFCommentTextBox" runat="server" 
                                    Text='<%# Bind("PFComment") %>' />
                                <br />
                                FormatID:
                                <asp:TextBox ID="FormatIDTextBox" runat="server" 
                                    Text='<%# Bind("FormatID") %>' />
                                <br />
                                PFStatus:
                                <asp:TextBox ID="PFStatusTextBox" runat="server" 
                                    Text='<%# Bind("PFStatus") %>' />
                                <br />
                                PFStartDate:
                                <asp:TextBox ID="PFStartDateTextBox" runat="server" 
                                    Text='<%# Bind("PFStartDate") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                PFID:
                                <asp:Label ID="PFIDLabel" runat="server" Text='<%# Eval("PFID") %>' />
                                <br />
                                PFName:
                                <asp:Label ID="PFNameLabel" runat="server" Text='<%# Bind("PFName") %>' />
                                <br />
                                PFComment:
                                <asp:Label ID="PFCommentLabel" runat="server" 
                                    Text='<%# Bind("PFComment") %>' />
                                <br />
                                FormatID:
                                <asp:Label ID="FormatIDLabel" runat="server" 
                                    Text='<%# Bind("FormatID") %>' />
                                <br />
                                PFStatus:
                                <asp:Label ID="PFStatusLabel" runat="server" 
                                    Text='<%# Bind("PFStatus") %>' />
                                <br />
                                PFStartDate:
                                <asp:Label ID="PFStartDateLabel" runat="server" 
                                    Text='<%# Bind("PFStartDate") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="odsCreateProj" runat="server" DeleteMethod="Delete" 
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetData" TypeName="PefectFlightTableAdapters.tblPFHeaderTableAdapter" 
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_PFID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PFName" Type="String" />
                                <asp:Parameter Name="PFComment" Type="String" />
                                <asp:Parameter Name="FormatID" Type="Int32" />
                                <asp:Parameter Name="PFStatus" Type="Int32" />
                                <asp:Parameter Name="PFStartDate" Type="DateTime" />
                                <asp:Parameter Name="Original_PFID" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="PFName" Type="String" />
                                <asp:Parameter Name="PFComment" Type="String" />
                                <asp:Parameter Name="FormatID" Type="Int32" />
                                <asp:Parameter Name="PFStatus" Type="Int32" />
                                <asp:Parameter Name="PFStartDate" Type="DateTime" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PFID" 
                            DataSourceID="odsProjects">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="PFID" HeaderText="PFID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="PFID" />
                                <asp:BoundField DataField="PFName" HeaderText="PFName" 
                                    SortExpression="PFName" />
                                <asp:BoundField DataField="PFComment" HeaderText="PFComment" 
                                    SortExpression="PFComment" />
                                <asp:BoundField DataField="FormatID" HeaderText="FormatID" 
                                    SortExpression="FormatID" />
                                <asp:BoundField DataField="PFStatus" HeaderText="PFStatus" 
                                    SortExpression="PFStatus" />
                                <asp:BoundField DataField="PFStartDate" HeaderText="PFStartDate" 
                                    SortExpression="PFStartDate" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsProjects" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="PefectFlightTableAdapters.tblPFHeaderTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>

