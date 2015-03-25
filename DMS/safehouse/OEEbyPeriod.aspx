<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="OEEbyPeriod.aspx.vb" Inherits="FrontEnd_DataAnalysis_OEEbyPeriod" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td colspan="3">
                        <h2>
                            OEE by Period</h2>
                    </td>
                </tr>
                <tr>
                    <td width="10%" align="left" colspan="2" valign="top">
                        <table class="style1">
                            <tr>
                                <td>
                                    Select your line</td>
                                <td>
                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="LocID" 
                                        DataSourceID="LocODS" Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("LocID") %>' 
                                                Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>' 
                                                Width="100%" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="LocODS" runat="server" DeleteMethod="Delete" 
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
                                    Select Start Date</td>
                                <td>
                                    <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                        Format="dd/MM/yyyy hh:mm:ss" TargetControlID="txtStart">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select End Date</td>
                                <td>
                                    <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                                        Format="dd/MM/yyyy hh:mm:ss" TargetControlID="txtEnd">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="4" valign="top">
                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                            Height="640px" Width="100%">
                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                                <HeaderTemplate>
                                    TabPanel1
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="ODSOEE">
                                        <Columns>
                                            <asp:BoundField DataField="DataName" HeaderText="DataName" 
                                                SortExpression="DataName" />
                                            <asp:BoundField DataField="DValue" HeaderText="DValue" 
                                                SortExpression="DValue" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource ID="ODSOEE" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="DataAnalysisTableAdapters.OEEdataByPeriodTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="LocID" SessionField="OEELocID" Type="Int32" />
                                            <asp:SessionParameter Name="RClocID" SessionField="OEERCLocID" Type="Int32" />
                                            <asp:ControlParameter ControlID="txtStart" Name="PeriodStart" 
                                                PropertyName="Text" Type="DateTime" />
                                            <asp:ControlParameter ControlID="txtEnd" Name="PeriodEnd" PropertyName="Text" 
                                                Type="DateTime" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 25%" width="50%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 25%" width="50%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 25%" width="50%" height="50%">
                        &nbsp;</td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

