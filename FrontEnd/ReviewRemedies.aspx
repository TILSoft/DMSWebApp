<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="ReviewRemedies.aspx.vb" Inherits="FrontEnd_ReviewRemedies" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Review Remedies for Symptoms</h2>
            </td>
        </tr>
        <tr>
            <td width="50%">
                1.&nbsp; Select the symptom location you are interested in
            </td>
            <td>
                2.&nbsp; Select the Symptom you are interested in </td>
        </tr>
        <tr>
            <td width="50%">
                <asp:Literal ID="litSympPath" runat="server"></asp:Literal>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                    DataSourceID="ODSSympLoc" Width="100%">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                            Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>' 
                            Width="100%" height = 100%/>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODSSympLoc" runat="server" DeleteMethod="Delete" 
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
                        <asp:SessionParameter DefaultValue="1" Name="ParentLocID" 
                            SessionField="RemSympLocID" Type="Int32" />
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
            <td>
                <asp:DataList ID="DataList2" runat="server" DataKeyField="LocID" 
                    DataSourceID="ODSSymp" Width="100%">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("SymptomID") %>' 
                            Text='<%# Eval("SymptomDesc") %>' Visible='<%# Eval("SymptomEnabled") %>' 
                            Width="100%" height = 100% Enabled='<%# Eval("SymptomEnabled") %>'/>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODSSymp" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByLocID" 
                    TypeName="LocationsTableAdapters.tblSymptomTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SymptomDesc" Type="String" />
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="DTType" Type="Int32" />
                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                        <asp:Parameter Name="Original_SymptomID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="LocID" SessionField="RemSympLocID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SymptomDesc" Type="String" />
                        <asp:Parameter Name="LocID" Type="Int32" />
                        <asp:Parameter Name="DTType" Type="Int32" />
                        <asp:Parameter Name="SymptomEnabled" Type="Boolean" />
                        <asp:Parameter Name="SymptomQuickClose" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                3.&nbsp; Review the root cause, location and remedy for the symptom you have 
                chosen</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="RootCauseLocID" DataSourceID="ODSRemedies" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause Description" 
                            SortExpression="RootCauseDesc" />
                        <asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" 
                            SortExpression="RemedyDescription" />
                        <asp:BoundField DataField="Downtimestart" HeaderText="Date " 
                            SortExpression="Downtimestart" />
                        <asp:TemplateField HeaderText="Root Cause Path"></asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        There are no remedies entered for this symptom.&nbsp; Please select another one
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSRemedies" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDatabySympID" 
                    TypeName="RootCauseRemedyTableAdapters.RCRemDetailsBySympTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="symptomID" SessionField="sympid" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
    </table>
</asp:Content>

