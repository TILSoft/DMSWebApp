<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="DowntimeDetails.aspx.vb" Inherits="FrontEnd_DowntimeDetails" title="Untitled Page" %>

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
                    Downtime Details</h2>
            </td>
        </tr>
        <tr>
            <td width="20%">
                Root cause path</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="2">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="DowntimeID" DataSourceID="ODSDowntimeDetails" Height="50px" 
                    Width="100%">
                    <Fields>
                        <asp:BoundField DataField="DowntimeID" HeaderText="Downtime ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="DowntimeID" />
                        <asp:BoundField DataField="Downtimestart" HeaderText="Downtime start" 
                            SortExpression="Downtimestart" />
                        <asp:BoundField DataField="Downtimeend" HeaderText="Downtime end" 
                            SortExpression="Downtimeend" />
                        <asp:BoundField DataField="totalDT" HeaderText="Actual DT" ReadOnly="True" 
                            SortExpression="totalDT" />
                        <asp:BoundField DataField="SymptomDesc" HeaderText="Symptom Description" 
                            SortExpression="SymptomDesc" />
                        <asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause Description" 
                            SortExpression="RootCauseDesc" />
                        <asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" 
                            SortExpression="RemedyDescription" />
                        <asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location Description" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="txtID" HeaderText="Lot or CO " 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="EngSign" HeaderText="Eng Sign" 
                            SortExpression="EngSign" />
                        <asp:BoundField DataField="TechSign" HeaderText="Tech Sign" 
                            SortExpression="TechSign" />
                        <asp:BoundField DataField="StartSign" HeaderText="Start Sign" 
                            SortExpression="StartSign" />
                        <asp:BoundField DataField="ExecSign" HeaderText="Exec Sign" 
                            SortExpression="ExecSign" />
                        <asp:BoundField DataField="parametersAdj" HeaderText="Parameters Adjusted" 
                            ReadOnly="True" SortExpression="parametersAdj" />
                        <asp:BoundField DataField="ActivityDesc" HeaderText="Activity Description" 
                            SortExpression="ActivityDesc" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ODSDowntimeDetails" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByDowntimeID" 
                    TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="downtimeID" QueryStringField="downtimeid" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

