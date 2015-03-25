<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ManageUsers.aspx.vb" Inherits="zAdministration_ManageUsers" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Manage Users</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="UsersODS" DataTextField="Username" DataValueField="Useridno" 
                    Width="100%">
                </asp:DropDownList>
            </td>
            <td width="50%">
                Edit User Details or Add New User</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="UsersODS" 
                    PageSize="20">
                    <Columns>
                        <asp:BoundField DataField="Useridno" HeaderText="Useridno" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Useridno" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Superior" HeaderText="Superior" 
                            SortExpression="Superior" />
                        <asp:BoundField DataField="DeptDesc" HeaderText="DeptDesc" 
                            SortExpression="DeptDesc" />
                        <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" 
                            SortExpression="UserLevel" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="UsersODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="UsersTableAdapters.UserDetailsTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td valign="top" width="50%">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="Useridno" DataSourceID="UserEditODS" DefaultMode="Edit" 
                    Width="100%">
                    <Fields>
                        <asp:BoundField DataField="Useridno" HeaderText="Useridno" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Useridno" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" />
                        <asp:TemplateField HeaderText="Password" SortExpression="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>' 
                                    Visible="False"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:TemplateField HeaderText="SuperiorID" SortExpression="SuperiorID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SuperiorODS" 
                                    DataTextField="Username" DataValueField="Useridno" 
                                    SelectedValue='<%# Bind("SuperiorID") %>' Width="100%">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="SuperiorODS" runat="server" DeleteMethod="Delete" 
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" TypeName="UsersTableAdapters.tblUserTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Username" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                                        <asp:Parameter Name="Dept" Type="Int32" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
                                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Username" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                                        <asp:Parameter Name="Dept" Type="Int32" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                               <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SuperiorODS" 
                                    DataTextField="Username" DataValueField="Useridno" 
                                    SelectedValue='<%# Bind("SuperiorID") %>' Width="100%">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="SuperiorODS" runat="server" DeleteMethod="Delete" 
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" TypeName="UsersTableAdapters.tblUserTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Username" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                                        <asp:Parameter Name="Dept" Type="Int32" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
                                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Username" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                                        <asp:Parameter Name="Dept" Type="Int32" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>   </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SuperiorID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LastLogin" HeaderText="LastLogin" 
                            SortExpression="LastLogin" />
                        <asp:TemplateField HeaderText="Dept" SortExpression="Dept">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DeptODS" 
                                    DataTextField="DeptDesc" DataValueField="DeptID" 
                                    SelectedValue='<%# Bind("Dept") %>' Width="100%">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="DeptODS" runat="server" DeleteMethod="Delete" 
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" TypeName="UsersTableAdapters.tblDeptTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_DeptID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DeptDesc" Type="String" />
                                        <asp:Parameter Name="Original_DeptID" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DeptDesc" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                 <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DeptODS" 
                                    DataTextField="DeptDesc" DataValueField="DeptID" 
                                    SelectedValue='<%# Bind("Dept") %>' Width="100%">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="DeptODS" runat="server" DeleteMethod="Delete" 
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" TypeName="UsersTableAdapters.tblDeptTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_DeptID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DeptDesc" Type="String" />
                                        <asp:Parameter Name="Original_DeptID" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="DeptDesc" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource> </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Dept") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserLevel" HeaderText="UserLevel" 
                            SortExpression="UserLevel" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="lnkCreateNewUser" runat="server" 
                                    onclick="lnkCreateNewUser_Click">Create New User</asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="lnkResetPass" runat="server" onclick="lnkResetPass_Click">Reset 
                                Users Password</asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                              <%--  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Insert"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel"></asp:LinkButton>--%>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="UserEditODS" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByUserIDNo" 
                    TypeName="UsersTableAdapters.tblUserTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                        <asp:Parameter Name="Dept" Type="Int32" />
                        <asp:Parameter Name="UserLevel" Type="Int32" />
                        <asp:Parameter Name="Original_Useridno" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Useridno" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="SuperiorID" Type="Int32" />
                        <asp:Parameter Name="LastLogin" Type="DateTime" />
                        <asp:Parameter Name="Dept" Type="Int32" />
                        <asp:Parameter Name="UserLevel" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                Password reset = &quot;DMS&quot;<br />
                Levels<br />
                1 - Technologist<br />
                2 - Engineer<br />
                3-&nbsp; Executive<br />
                4-&nbsp; Admin<br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

