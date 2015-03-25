<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="MachineAnalysisByMonth.aspx.vb" Inherits="FrontEnd_DataAnalysis_MachineAnalysisByMonth" title="Untitled Page" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
                            RepeatDirection="Horizontal" Width="111px">
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
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="ODSOEEbyMCbyMonth">
                            <Columns>
                                <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" 
                                    SortExpression="Month" />
                                <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                                    SortExpression="ShiftTime" />
                                <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                                    SortExpression="LotTime" />
                                <asp:BoundField DataField="COTime" HeaderText="COTime" ReadOnly="True" 
                                    SortExpression="COTime" />
                                <asp:BoundField DataField="lotDT" HeaderText="lotDT" ReadOnly="True" 
                                    SortExpression="lotDT" />
                                <asp:BoundField DataField="CODT" HeaderText="CODT" ReadOnly="True" 
                                    SortExpression="CODT" />
                                <asp:BoundField DataField="AvgPerf" HeaderText="AvgPerf" ReadOnly="True" 
                                    SortExpression="AvgPerf" />
                                <asp:BoundField DataField="Availability" HeaderText="Availability" 
                                    ReadOnly="True" SortExpression="Availability" />
                                <asp:BoundField DataField="OEE" HeaderText="OEE" ReadOnly="True" 
                                    SortExpression="OEE" />
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODSOEEbyMCbyMonth" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="DataAnalysisOverallTableAdapters.OEEbyMonthForAMachineTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="" Name="LocID" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                updating...
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>

