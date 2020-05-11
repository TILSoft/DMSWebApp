<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EditActivities.aspx.vb" Inherits="DataVisualisation_ActivitySearch" title="Edit Activities" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
        
        }
        .style4
        {
            width: 1192px;
        }
        .style5
        {
        }
        .style6
        {
        }
        .style7
        {
        }
        .style8
        {
            width: 25%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
    <table class="style4">
        <tr>
            <td colspan="4" class="style3">
                <h2>
                    Edit Activities
                </h2>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Start Date</td>
            <td align="left" class="style6">
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtStart">
                </cc1:CalendarExtender>
            </td>
            <td class="style7" width="25%">
                End Date</td>
            <td class="style8">
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Format="dd/MM/yyyy 00:00:00" TargetControlID="txtEnd">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Line</td>
            <td align="left" class="style6" colspan="3">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID">
                </asp:DropDownList>
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
            <td class="style5" colspan="2" width="33%">
                Enter your search term</td>
            <td class="style7">
                <asp:TextBox ID="txtSearc" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            &nbsp;to select all enter %</td>
            <td class="style7" align="right">
                <asp:LinkButton ID="lnkExportExcel" runat="server">Export to Excel</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
            
               
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            
               
                <br />
              
                    
               
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="ActivityID" 
                    DataSourceID="ODSActivities" EnableModelValidation="True">
                    <Columns>
                        <asp:ButtonField CommandName="xDelete" Text="Delete" />
                        <asp:ButtonField CommandName="xEdit" HeaderText="Edit" ShowHeader="True" Text="Edit"/>

                          <asp:ButtonField CommandName="xAdd" HeaderText="Add" ShowHeader="True" Text="Add After" />

                          <asp:BoundField DataField="ActivityID" HeaderText="ID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ActivityID" />
                        <asp:BoundField DataField="ActivityDesc" HeaderText="Description" 
                            SortExpression="ActivityDesc" />
                        <asp:BoundField DataField="txtID" HeaderText="LotNo or Change over start" 
                            SortExpression="txtID" />
                        <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                            SortExpression="StartTime" />
                        <asp:BoundField DataField="endtime" HeaderText="End Time" 
                            SortExpression="endtime" />
<asp:BoundField DataField="ActualActivitytime" HeaderText="Activity time (mins)" 
                            SortExpression="ActualActivitytime"></asp:BoundField>
                        <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                            SortExpression="LocDescription" />
                        <asp:BoundField DataField="FormatDesc" HeaderText="Format" 
                            SortExpression="FormatDesc" />
                        <asp:BoundField DataField="GoodProduct" HeaderText="Good Product" 
                            SortExpression="GoodProduct" />
                        <asp:BoundField DataField="TargetOutput" HeaderText="Target Output" 
                            SortExpression="TargetOutput" />
                        <asp:BoundField DataField="Waste" HeaderText="Waste" SortExpression="Waste" />
                        <asp:BoundField DataField="Shifts" HeaderText="Shifts" 
                            SortExpression="Shifts" />
                        <asp:BoundField DataField="startsign" HeaderText="Start sign" 
                            SortExpression="startsign" />
                        <asp:BoundField DataField="StartSignTime" HeaderText="Start Sign Time" 
                            SortExpression="StartSignTime" />
                        <asp:BoundField DataField="endsign" HeaderText="End Sign" 
                            SortExpression="endsign" />
                        <asp:BoundField DataField="EndSigntime" HeaderText="End Sign time" 
                            SortExpression="EndSigntime" />
                        <asp:BoundField DataField="status" HeaderText="Status" 
                            SortExpression="status" />
                    </Columns>
                </asp:GridView>
                       
                    

                <asp:ObjectDataSource ID="ODSActivities" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByDateAndLoc" 
                    TypeName="ActivityTableAdapters.ActivityDetailTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtStart" Name="starttime" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="txtEnd" Name="endtime" PropertyName="Text" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                     
         
                <asp:Panel ID="MPEEditAdd" runat="server" BackColor="Wheat">




                    <asp:DetailsView ID="dvActEdit" runat="server" AutoGenerateRows="False" DataKeyNames="ActivityID" DataSourceID="ODSEditAct" EnableModelValidation="True" Height="50px" Width="125px">
                        <Fields>
                            <asp:TemplateField HeaderText="ActivityID" InsertVisible="False" SortExpression="ActivityID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ActivityID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ActivityID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ActivityType" SortExpression="ActivityType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ODSActType" DataTextField="ActivityDesc" DataValueField="ActivityTypeID" SelectedValue='<%# Bind("ActivityType") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:ObjectDataSource ID="ODSActType" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ActivityTableAdapters.tblActivityTypeTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ActivityTypeID" Type="Int32" />
                                            <asp:Parameter Name="ActivityDesc" Type="String" />
                                            <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ActivityDesc" Type="String" />
                                            <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                                            <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlActType" runat="server" DataSourceID="ODSActType" DataTextField="ActivityDesc" DataValueField="ActivityTypeID" SelectedValue='<%# Bind("ActivityType") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:ObjectDataSource ID="ODSActType" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ActivityTableAdapters.tblActivityTypeTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ActivityTypeID" Type="Int32" />
                                            <asp:Parameter Name="ActivityDesc" Type="String" />
                                            <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ActivityDesc" Type="String" />
                                            <asp:Parameter Name="DownTimeEnabled" Type="Boolean" />
                                            <asp:Parameter Name="Original_ActivityTypeID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ActivityType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LocIDSymp" SortExpression="LocIDSymp">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocIDSymp") %>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBoxLocID" runat="server" Text='<%# Bind("LocIDSymp") %>' Enabled="False"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("LocIDSymp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="StartTime" SortExpression="StartTime">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Starttimetextbox" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtStartTime" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="endtime" SortExpression="endtime">
                                <EditItemTemplate>
                                    <asp:TextBox ID="Endtimetextbox" runat="server" Text='<%# Bind("endtime") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtEndTime" runat="server" Text='<%# Bind("endtime") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("endtime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="txtID" SortExpression="txtID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("txtID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtLotCOName" runat="server" Text='<%# Bind("txtID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("txtID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PreActivity" SortExpression="PreActivity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="PreActivitytextbox" runat="server" Enabled="false" Text='<%# Bind("PreActivity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtPreAct" runat="server" Enabled="False" Text='<%# Bind("PreActivity") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("PreActivity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PostActivity" SortExpression="PostActivity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="PostActivitytextbox" runat="server" Enabled="false" Text='<%# Bind("PostActivity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtPostAct" runat="server" Enabled="False" Text='<%# Bind("PostActivity") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("PostActivity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Format" SortExpression="Format">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="ODSFormat" DataTextField="FormatDesc" DataValueField="FormatID" SelectedValue='<%# Bind("Format") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:ObjectDataSource ID="ODSFormat" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocIDIdletime" TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update" >
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="FormatDesc" Type="String" />
                                            <asp:Parameter Name="LocID" Type="Int32" />
                                            <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                            <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                            <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                            <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                            <asp:Parameter Name="StdTime" Type="Int32" />
                                            <asp:Parameter Name="ActivityType" Type="Int32" />
                                            <asp:Parameter Name="FormatLongDescription" Type="String" />
                                            <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="LocID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="FormatDesc" Type="String" />
                                            <asp:Parameter Name="LocID" Type="Int32" />
                                            <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                            <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                            <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                            <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                            <asp:Parameter Name="StdTime" Type="Int32" />
                                            <asp:Parameter Name="ActivityType" Type="Int32" />
                                            <asp:Parameter Name="FormatLongDescription" Type="String" />
                                            <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                            <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="ODSFormat" DataTextField="FormatDesc" DataValueField="FormatID" SelectedValue='<%# Bind("Format") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:ObjectDataSource ID="ODSFormat" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLocID" TypeName="LocationsTableAdapters.tblFormatTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="FormatDesc" Type="String" />
                                            <asp:Parameter Name="LocID" Type="Int32" />
                                            <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                            <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                            <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                            <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                            <asp:Parameter Name="StdTime" Type="Int32" />
                                            <asp:Parameter Name="ActivityType" Type="Int32" />
                                            <asp:Parameter Name="FormatLongDescription" Type="String" />
                                            <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="LocID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="FormatDesc" Type="String" />
                                            <asp:Parameter Name="LocID" Type="Int32" />
                                            <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                                            <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                                            <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                                            <asp:Parameter Name="StdPersonnel" Type="Int32" />
                                            <asp:Parameter Name="StdTime" Type="Int32" />
                                            <asp:Parameter Name="ActivityType" Type="Int32" />
                                            <asp:Parameter Name="FormatLongDescription" Type="String" />
                                            <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                                            <asp:Parameter Name="Original_FormatID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Format") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GoodProduct" SortExpression="GoodProduct">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GoodProduct") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtGoodProd" runat="server" Text='<%# Bind("GoodProduct") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("GoodProduct") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TargetOutput" SortExpression="TargetOutput">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TargetOutput") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtTarget" runat="server" Text='<%# Bind("TargetOutput") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("TargetOutput") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Waste" SortExpression="Waste">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Waste") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtWaste" runat="server" Text='<%# Bind("Waste") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Waste") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="StartSign" SortExpression="StartSign">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StartSign") %>'  Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StartSign") %>' Enabled="False"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("StartSign") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="StartSignTime" SortExpression="StartSignTime">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StartSignTime") %>'  Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StartSignTime") %>' Enabled="False"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("StartSignTime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EndSign" SortExpression="EndSign">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EndSign") %>'  Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EndSign") %>' Enabled="False"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("EndSign") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EndSigntime" SortExpression="EndSigntime">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("EndSigntime") %>'  Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("EndSigntime") %>' Enabled="False"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("EndSigntime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Itemcode" SortExpression="Itemcode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Itemcode") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtItem" runat="server" Text='<%# Bind("Itemcode") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("Itemcode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:ObjectDataSource ID="ODSEditAct" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByActivityID" TypeName="ActivityTableAdapters.tblActivityTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ActivityType" Type="Int32" />
                            <asp:Parameter Name="LocIDSymp" Type="Int32" />
                            <asp:Parameter Name="StartTime" Type="DateTime" />
                            <asp:Parameter Name="endtime" Type="DateTime" />
                            <asp:Parameter Name="txtID" Type="String" />
                            <asp:Parameter Name="PreActivity" Type="Int32" />
                            <asp:Parameter Name="PostActivity" Type="Int32" />
                            <asp:Parameter Name="Format" Type="Int32" />
                            <asp:Parameter Name="GoodProduct" Type="Decimal" />
                            <asp:Parameter Name="TargetOutput" Type="Decimal" />
                            <asp:Parameter Name="Waste" Type="Decimal" />
                            <asp:Parameter Name="StartSign" Type="Int32" />
                            <asp:Parameter Name="StartSignTime" Type="DateTime" />
                            <asp:Parameter Name="EndSign" Type="Int32" />
                            <asp:Parameter Name="EndSigntime" Type="DateTime" />
                            <asp:Parameter Name="Itemcode" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdnActID" Name="ActivityID" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ActivityType" Type="Int32" />
                            <asp:Parameter Name="LocIDSymp" Type="Int32" />
                            <asp:Parameter Name="StartTime" Type="DateTime" />
                            <asp:Parameter Name="endtime" Type="DateTime" />
                            <asp:Parameter Name="txtID" Type="String" />
                            <asp:Parameter Name="PreActivity" Type="Int32" />
                            <asp:Parameter Name="PostActivity" Type="Int32" />
                            <asp:Parameter Name="Format" Type="Int32" />
                            <asp:Parameter Name="GoodProduct" Type="Decimal" />
                            <asp:Parameter Name="TargetOutput" Type="Decimal" />
                            <asp:Parameter Name="Waste" Type="Decimal" />
                            <asp:Parameter Name="StartSign" Type="Int32" />
                            <asp:Parameter Name="StartSignTime" Type="DateTime" />
                            <asp:Parameter Name="EndSign" Type="Int32" />
                            <asp:Parameter Name="EndSigntime" Type="DateTime" />
                            <asp:Parameter Name="Itemcode" Type="String" />
                            <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:HiddenField ID="hdnActID" runat="server" />
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <br />
                </asp:Panel>
                         
                <asp:LinkButton ID="hdnMPE" runat="server"></asp:LinkButton>
               <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="MPEEditAdd" TargetControlID="hdnMPE" DropShadow="True" OkControlID="hdnMPE"></cc1:ModalPopupExtender>
            
            </td>
        </tr>
       
    </table>
              </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

