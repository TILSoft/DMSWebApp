<%@ Page Language="VB" MasterPageFile="~/frontend.master" AutoEventWireup="false" CodeFile="DowntimeReport.aspx.vb" Inherits="FrontEnd_FrontendDataVis_DowntimeReport" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
         
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Downtime by lot</h2>
            </td>
        </tr>
        <tr>
            <td align="left" width="25%">
                Select Line</td>
            <td align="left" class="style3">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSLoc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
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
            <td align="left" width="25%">
                Lot Number</td>
            <td align="left" class="style3">
                <asp:DropDownList ID="ddlLot" runat="server" AutoPostBack="True" 
                    DataSourceID="odsLots" DataTextField="txtID" DataValueField="ActivityID" 
                    Height="19px" Width="87px">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsLots" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="ActivityTableAdapters.LotNosWithActivityIDsTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="txtID" Type="String" />
                        <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Activitytype" Type="Int32" />
                        <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="" Name="locid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="txtID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                <asp:GridView runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                    DataKeyNames="DowntimeID" DataSourceID="ODSDowntimeSearch" Width="600px" 
                    ID="GridView1">
                    <Columns>
                        <asp:BoundField DataField="Downtimestart" HeaderText="Downtime start" 
                            SortExpression="Downtimestart"></asp:BoundField>
                        <asp:BoundField DataField="Downtimeend" HeaderText="Downtime end" 
                            SortExpression="Downtimeend"></asp:BoundField>
                        <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCause Description" 
                            SortExpression="RootCauseDesc"></asp:BoundField>
                        <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" 
                            SortExpression="RemedyDescription"></asp:BoundField>
                        <asp:BoundField DataField="TechSign" HeaderText="End Sign" 
                            SortExpression="TechSign"></asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        There is no downtime for your selection
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByActivityIDNoSS" 
                    TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter" 
                    ID="ODSDowntimeSearch">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlLot" PropertyName="SelectedValue" 
                            Name="activityID" Type="Int32"></asp:ControlParameter>
                        <asp:Parameter DefaultValue="1" Name="downtimeType" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                Signed<br />
                <br />
                <br />
                <br />
                ------------------------------<br />
                Production Exec<br />
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


