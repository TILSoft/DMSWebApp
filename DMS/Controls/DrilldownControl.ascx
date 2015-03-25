<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DrilldownControl.ascx.vb" Inherits="Controls_DrilldownControl" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<table class="style1">
    <tr>
        <td>
            <asp:DataList ID="SympPath" runat="server" DataSourceID="ODSLocPath" 
                RepeatDirection="Horizontal">
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" 
                        CommandArgument='<%# Eval("Locid") %>' Text='<%# Eval("Locdesc") %>'></asp:LinkButton>
                    &nbsp;&gt;<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODSLocPath" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="LocationsTableAdapters.GetAllLocsToBaseTableAdapter">
                <SelectParameters>
                    <asp:Parameter Name="StartLoc" Type="Int32" />
                    <asp:Parameter Name="EndLoc" Type="Int32" DefaultValue="1" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td>
         <div style="Height:300px; Width:450px; Overflow:Auto">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                DataSourceID="ODSympLoc" Width="100%">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("LocID") %>' Text='<%# Eval("LocDescription") %>' 
                        Visible='<%# Eval("LocationEnabled") %>' Width="100%" />
                </ItemTemplate>
            </asp:DataList>
            </div>
            
            <asp:ObjectDataSource ID="ODSympLoc" runat="server" DeleteMethod="Delete" 
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
                    <asp:Parameter Name="ParentLocID" Type="Int32" />
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
</table>
