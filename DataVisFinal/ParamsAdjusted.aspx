<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ParamsAdjusted.aspx.vb" Inherits="DataVisualisation_ParamsAdjusted" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Parameters Adjusted for a Downtime</h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>
                                            Downtime Details</h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                            DataKeyNames="DowntimeID" DataSourceID="ODSDowntime" Height="50px" Width="100%">
                                            <Fields>
                                                <asp:BoundField DataField="DowntimeID" HeaderText="DowntimeID" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="DowntimeID" />
                                                <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                                    SortExpression="Downtimestart" />
                                                <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                                                    SortExpression="Downtimeend" />
                                                <asp:BoundField DataField="totalDT" HeaderText="Total DT (mins)" 
                                                    SortExpression="totalDT" />
                                                <asp:BoundField DataField="SymptomDesc" HeaderText="SymptomDesc" 
                                                    SortExpression="SymptomDesc" />
                                                <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                                    SortExpression="RootCauseDesc" />
                                                <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                                    SortExpression="RemedyDescription" />
                                                <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                    SortExpression="LocDescription" />
                                                <asp:BoundField DataField="txtID" HeaderText="txtID" SortExpression="txtID" />
                                                <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                                    SortExpression="FormatDesc" />
                                                <asp:BoundField DataField="EngSign" HeaderText="EngSign" 
                                                    SortExpression="EngSign" />
                                                <asp:BoundField DataField="TechSign" HeaderText="TechSign" 
                                                    SortExpression="TechSign" />
                                                <asp:BoundField DataField="StartSign" HeaderText="StartSign" 
                                                    SortExpression="StartSign" />
                                                <asp:BoundField DataField="ExecSign" HeaderText="ExecSign" 
                                                    SortExpression="ExecSign" />
                                                <asp:BoundField DataField="parametersAdj" HeaderText="parametersAdj" 
                                                    ReadOnly="True" SortExpression="parametersAdj" />
                                                <asp:BoundField DataField="ActivityDesc" HeaderText="ActivityDesc" 
                                                    SortExpression="ActivityDesc" />
                                            </Fields>
                                        </asp:DetailsView>
                                        <asp:ObjectDataSource ID="ODSDowntime" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByDowntimeID" 
                                            TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="downtimeid" QueryStringField="downtimeid" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>
                                            Review Parameters Adjusted for this Downtime</h5>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSParams" 
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ParamDesc" HeaderText="ParamDesc" 
                            SortExpression="ParamDesc" />
                        <asp:BoundField DataField="ParamUnit" HeaderText="ParamUnit" 
                            SortExpression="ParamUnit" />
                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="OldValue" HeaderText="OldValue" 
                            SortExpression="OldValue" />
                        <asp:BoundField DataField="NewValue" HeaderText="NewValue" 
                            SortExpression="NewValue" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODSParams" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="Getdatabydtid" 
                    TypeName="DowntimeTableAdapters.ParamsByDowntimeTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="dtid" QueryStringField="downtimeID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

