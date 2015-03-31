<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="ActivityDetails.aspx.vb" Inherits="FrontEnd_ActivityDetails" title="Untitled Page" %>

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
    <table class="style1">
        <tr>
            <td>
                <h2>
                    Activity Details<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="Activity Details" ID="TabPanel1">
                    <ContentTemplate >
                    
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="ActivityID" DataSourceID="ODSActivity" Height="50px" Width="100%"><Fields><asp:BoundField DataField="ActivityID" HeaderText="Activity ID" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="ActivityID" /><asp:BoundField DataField="ActivityDesc" HeaderText="Activity Description" 
                                    SortExpression="ActivityDesc" /><asp:BoundField DataField="LocDescription" HeaderText="Location Description" 
                                    SortExpression="LocDescription" /><asp:BoundField DataField="FormatDesc" HeaderText="Format Description" 
                                    SortExpression="FormatDesc" /><asp:BoundField DataField="StartTime" HeaderText="Start Time" 
                                    SortExpression="StartTime" /><asp:BoundField DataField="endtime" HeaderText="End time" 
                                    SortExpression="endtime" /><asp:BoundField DataField="ActualActivitytime" 
                                    HeaderText="Shift Activity Time (mins)" SortExpression="ActualActivitytime" /><asp:BoundField DataField="txtID" HeaderText="Lot No / C/O start time" 
                                    SortExpression="txtID" /><asp:BoundField DataField="PreActivity" HeaderText="Pre Activity" 
                                    SortExpression="PreActivity" /><asp:BoundField DataField="PostActivity" HeaderText="Post Activity" 
                                    SortExpression="PostActivity" /><asp:BoundField DataField="GoodProduct" HeaderText="GoodProduct" 
                                    SortExpression="GoodProduct" /><asp:BoundField DataField="TargetOutput" HeaderText="Target Output" 
                                    SortExpression="TargetOutput" /><asp:BoundField DataField="Waste" HeaderText="Waste" SortExpression="Waste" /><asp:BoundField DataField="Shifts" HeaderText="Shifts" 
                                    SortExpression="Shifts" /><asp:BoundField DataField="startsign" HeaderText="Start sign" 
                                    SortExpression="startsign" /><asp:BoundField DataField="StartSignTime" HeaderText="Start Sign Time" 
                                    SortExpression="StartSignTime" /><asp:BoundField DataField="endsign" HeaderText="End sign" 
                                    SortExpression="endsign" /><asp:BoundField DataField="EndSigntime" HeaderText="End Sign Time" 
                                    SortExpression="EndSigntime" /></Fields></asp:DetailsView><br /><b>Comments for this activity</b><br /><br /><asp:DataList 
                            ID="DataList1" runat="server" DataKeyField="ActCommentID" 
                            DataSourceID="odsActComments" Width="100%"><ItemTemplate>Date: <asp:Label 
                                    ID="ActCommentDateLabel" runat="server" Text='<%# Eval("ActCommentDate") %>' /><br /><br /><asp:Label 
                                    ID="ActCommentTextLabel" runat="server" Text='<%# Eval("ActCommentText") %>' /><br /><br />___________
                            </ItemTemplate>
                        </asp:DataList><asp:ObjectDataSource ID="odsActComments" runat="server" 
                            DeleteMethod="Delete" InsertMethod="Insert" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                            TypeName="CommentsTableAdapters.tblActCommentTableAdapter" 
                            UpdateMethod="Update"><DeleteParameters><asp:Parameter Name="Original_ActCommentID" 
                                    Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ActCommentUser" Type="Int32" />
                                <asp:Parameter Name="ActCommentDate" Type="DateTime" />
                                <asp:Parameter Name="ActCommentText" Type="String" />
                                <asp:Parameter Name="ActCommentActivity" Type="Int32" />
                                <asp:Parameter Name="Original_ActCommentID" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ActivityID" QueryStringField="ActivityID" 
                                    Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ActCommentUser" Type="Int32" />
                                <asp:Parameter Name="ActCommentDate" Type="DateTime" />
                                <asp:Parameter Name="ActCommentText" Type="String" />
                                <asp:Parameter Name="ActCommentActivity" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource><br /><br /></ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Activity Downtime">
                    <ContentTemplate ><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="DowntimeID" DataSourceID="ODSDowntime"><Columns><asp:BoundField DataField="DowntimeID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="DowntimeID" /><asp:BoundField DataField="Downtimestart" HeaderText="Start" 
                                    SortExpression="Downtimestart" /><asp:BoundField DataField="Downtimeend" HeaderText="End" 
                                    SortExpression="Downtimeend" /><asp:BoundField DataField="totalDT" HeaderText="totalDT" ReadOnly="True" 
                                    SortExpression="totalDT" /><asp:BoundField DataField="actualdowntime" HeaderText="actualdowntime" 
                                    ReadOnly="True" SortExpression="actualdowntime" /><asp:BoundField DataField="SymptomDesc" HeaderText="Symptom" 
                                    SortExpression="SymptomDesc" /><asp:BoundField DataField="RootCauseDesc" HeaderText="Root Cause " 
                                    SortExpression="RootCauseDesc" /><asp:BoundField DataField="RemedyDescription" HeaderText="Remedy Description" 
                                    SortExpression="RemedyDescription" /><asp:BoundField DataField="LocDescription" HeaderText="Root Cause Location" 
                                    SortExpression="LocDescription" /><asp:BoundField DataField="txtID" HeaderText="Batch/CO ID" 
                                    SortExpression="txtID" /><asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                                    SortExpression="FormatDesc" /><asp:BoundField DataField="ActivityDesc" HeaderText="ActivityDesc" 
                                    SortExpression="ActivityDesc" /><asp:BoundField DataField="Rootloc" HeaderText="Rootloc" ReadOnly="True" 
                                    SortExpression="Rootloc" /><asp:BoundField DataField="RootCauseLocID" HeaderText="RootCauseLocID" 
                                    SortExpression="RootCauseLocID" /></Columns></asp:GridView><asp:ObjectDataSource ID="ODSDowntime" runat="server" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetDataByActivityID" 
                            TypeName="DowntimeTableAdapters.DowntimeDetailsTableAdapter"><SelectParameters><asp:QueryStringParameter Name="activityID" QueryStringField="ActivityID" 
                                    Type="Int32" /></SelectParameters></asp:ObjectDataSource>
                    </ContentTemplate>
                    
                    
                    
                    </cc1:TabPanel>
                </cc1:TabContainer>
                <asp:ObjectDataSource ID="ODSActivity" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataActivityID" 
                    TypeName="ActivityTableAdapters.ActivityDetailTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ActivityID" QueryStringField="ActivityID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

