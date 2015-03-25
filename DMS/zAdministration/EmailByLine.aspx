<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EmailByLine.aspx.vb" Inherits="zAdministration_EmailByLine" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Set up Email for line downtimes</h2>
            </td>
        </tr>
        <tr>
            <td width="20%">
                Last Good Handshake</td>
            <td>
                <asp:Label ID="lblHandShake" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="20%">
                Select line</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSloc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSloc" runat="server" DeleteMethod="Delete" 
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
            <td>
                Select User</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ODSuser" 
                    DataTextField="Username" DataValueField="Useridno">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSuser" runat="server" DeleteMethod="Delete" 
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
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="EmailLineID" 
                    DataSourceID="ODSLineEmail" Width="100%">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="EmailLineID" HeaderText="EmailLineID" 
                            SortExpression="EmailLineID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" 
                            SortExpression="Email" />
                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                            SortExpression="LocDescription" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSLineEmail" runat="server" 
                    DeleteMethod="DeleteQuery" 
                    SelectMethod="GetData" TypeName="UsersTableAdapters.LineEmailTableAdapter" 
                    >
                    <DeleteParameters>
                        <asp:Parameter Name="EmailLineID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LineSymptomID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

