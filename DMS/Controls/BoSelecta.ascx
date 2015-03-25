<%@ Control Language="VB" AutoEventWireup="false" CodeFile="BoSelecta.ascx.vb" Inherits="Controls_BoSelecta" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<table class="style1">
    <tr>
        <td>
            Line</td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Formats</td>
        <td>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="odsFormats" 
                DataTextField="FormatDesc" DataValueField="FormatID">
            </asp:CheckBoxList>
            <asp:ObjectDataSource ID="odsFormats" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetDataByLocIDandActivity" 
                TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FormatDesc" Type="String" />
                    <asp:Parameter Name="LocID" Type="Int32" />
                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                    <asp:Parameter Name="StdTime" Type="Int32" />
                    <asp:Parameter Name="ActivityType" Type="Int32" />
                    <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                    <asp:Parameter Name="FormatLongDescription" Type="String" />
                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter Name="locid" Type="Int32" />
                    <asp:Parameter Name="activityType" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="FormatDesc" Type="String" />
                    <asp:Parameter Name="LocID" Type="Int32" />
                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                    <asp:Parameter Name="StdTime" Type="Int32" />
                    <asp:Parameter Name="ActivityType" Type="Int32" />
                    <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                    <asp:Parameter Name="FormatLongDescription" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
