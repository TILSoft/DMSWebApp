<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="AssetManagement.aspx.vb" Inherits="zAdministration_AssetManagement" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Asset Settings</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                Select Line</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="ODSLoc" runat="server" DeleteMethod="Delete" 
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
                Edit Details</td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="AssetID" DataSourceID="ODSAsset" Height="50px" Width="50%" 
                    DefaultMode="Edit">
                    <Fields>
                        <asp:BoundField DataField="AssetID" 
                            HeaderText="AssetID" SortExpression="AssetID" InsertVisible="False" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="LocID" HeaderText="LocID" 
                            SortExpression="LocID" />
                        <asp:CheckBoxField DataField="DAQHomePage" HeaderText="DAQHomePage" 
                            SortExpression="DAQHomePage" />
                        <asp:BoundField DataField="SuperShortStopPeriod" 
                            HeaderText="SuperShortStopPeriod" SortExpression="SuperShortStopPeriod" />
                        <asp:BoundField DataField="NominatedShortStopRemID" 
                            HeaderText="NominatedShortStopRemID" 
                            SortExpression="NominatedShortStopRemID" />
                        <asp:BoundField DataField="ShortStopPeriod" 
                            HeaderText="ShortStopPeriod" 
                            SortExpression="ShortStopPeriod" />
                        <asp:BoundField DataField="NominatedShortStopSympID" 
                            HeaderText="NominatedShortStopSympID" 
                            SortExpression="NominatedShortStopSympID" />
                        <asp:BoundField DataField="EmailPeriod" HeaderText="EmailPeriod" 
                            SortExpression="EmailPeriod" />
                        <asp:BoundField DataField="ExecSignPeriod" HeaderText="ExecSignPeriod" 
                            SortExpression="ExecSignPeriod" />
                        <asp:CheckBoxField DataField="ConcatenateDowntime" 
                            HeaderText="ConcatenateDowntime" SortExpression="ConcatenateDowntime" />
                        <asp:CheckBoxField DataField="BlanketClose" HeaderText="BlanketClose" 
                            SortExpression="BlanketClose" />
                        <asp:TemplateField HeaderText="OutputCalcType" SortExpression="OutputCalcType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("OutputCalcType") %>'>
                                    <asp:ListItem Value="0">None</asp:ListItem>
                                    <asp:ListItem Value="1">Oracle</asp:ListItem>
                                    <asp:ListItem Value="2">SQL</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OutputCalcType") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("OutputCalcType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OutputConnString" 
                            SortExpression="OutputConnString">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="100px" 
                                    Text='<%# Bind("OutputConnString") %>' TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("OutputConnString") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("OutputConnString") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OutputSQL" SortExpression="OutputSQL">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="100px" 
                                    Text='<%# Bind("OutputSQL") %>' TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OutputSQL") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("OutputSQL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OutputSQLvar1" SortExpression="OutputSQLvar1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OutputSQLvar1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OutputSQLvar1") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("OutputSQLvar1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:UpdatePanel ID="upOutputTest" runat="server">
                    <ContentTemplate>
                        Test output batchid:<asp:TextBox ID="txtOutputTest" runat="server"></asp:TextBox>
                        <asp:Button ID="btnOutputTest" runat="server" Text="Test " />
                        <asp:Label ID="lblOutputTest" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:ObjectDataSource ID="ODSAsset" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" 
                    TypeName="AssetTableAdapters.tblAssetTableAdapter" InsertMethod="Insert" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_AssetID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="ShortStopPeriod" Type="Int32" />
                        <asp:Parameter Name="EmailPeriod" Type="Int32" />
                        <asp:Parameter Name="NominatedShortStopRemID" Type="Int32" />
                        <asp:Parameter Name="NominatedShortStopSympID" Type="Int32" />
                        <asp:Parameter Name="ExecSignPeriod" Type="Int32" />
                        <asp:Parameter Name="ConcatenateDowntime" Type="Boolean" />
                        <asp:Parameter Name="BlanketClose" Type="Boolean" />
                        <asp:Parameter Name="OutputCalcType" Type="Int32" />
                        <asp:Parameter Name="OutputConnString" Type="String" />
                        <asp:Parameter Name="OutputSQL" Type="String" />
                        <asp:Parameter Name="OutputSQLvar1" Type="String" />
                        <asp:Parameter Name="SuperShortStopPeriod" Type="Int32" />
                        <asp:Parameter Name="DAQHomePage" Type="Boolean" />
                        <asp:Parameter Name="Original_AssetID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="ShortStopPeriod" Type="Int32" />
                        <asp:Parameter Name="EmailPeriod" Type="Int32" />
                        <asp:Parameter Name="NominatedShortStopRemID" Type="Int32" />
                        <asp:Parameter Name="NominatedShortStopSympID" Type="Int32" />
                        <asp:Parameter Name="ExecSignPeriod" Type="Int32" />
                        <asp:Parameter Name="ConcatenateDowntime" Type="Boolean" />
                        <asp:Parameter Name="BlanketClose" Type="Boolean" />
                        <asp:Parameter Name="OutputCalcType" Type="Int32" />
                        <asp:Parameter Name="OutputConnString" Type="String" />
                        <asp:Parameter Name="OutputSQL" Type="String" />
                        <asp:Parameter Name="OutputSQLvar1" Type="String" />
                        <asp:Parameter Name="SuperShortStopPeriod" Type="Int32" />
                        <asp:Parameter Name="DAQHomePage" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

