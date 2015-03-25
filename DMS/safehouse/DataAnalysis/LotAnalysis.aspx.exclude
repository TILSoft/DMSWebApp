<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="LotAnalysis.aspx.vb" Inherits="FrontEnd_DataAnalysis_LotAnalysis" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<%@ Register src="../../Controls/TimeLine.ascx" tagname="TimeLine" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >
                    
                <table class="style1">
        <tr>
            <td colspan="6">
              
                <h2>
                    Analysis by Lot</h2>
              
            </td>
        </tr>
        <tr>
            <td width="10%">
                Select Machine</td>
            <td colspan="5">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSLoc" DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
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
            <td>
                Select Lot</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ODSLots" 
                    DataTextField="LotNo" DataValueField="LotID" AutoPostBack="True">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="ODSLots" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByLocID" 
                    TypeName="lotsChangeOversTableAdapters.tblLotTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_LotID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LotStartTime" Type="DateTime" />
                        <asp:Parameter Name="LotEndTime" Type="DateTime" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="LotNo" Type="String" />
                        <asp:Parameter Name="UnitsProduced" Type="Int32" />
                        <asp:Parameter Name="WasteProduced" Type="Decimal" />
                        <asp:Parameter Name="LotStatus" Type="Int32" />
                        <asp:Parameter Name="EquipLocNo" Type="Int32" />
                        <asp:Parameter Name="TechnologistSign" Type="Int32" />
                        <asp:Parameter Name="SignTime" Type="DateTime" />
                        <asp:Parameter Name="TechnologistSignEnd" Type="Int32" />
                        <asp:Parameter Name="EndSignTime" Type="DateTime" />
                        <asp:Parameter Name="Original_LotID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="equiplocno" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LotStartTime" Type="DateTime" />
                        <asp:Parameter Name="LotEndTime" Type="DateTime" />
                        <asp:Parameter Name="Format" Type="Int32" />
                        <asp:Parameter Name="LotNo" Type="String" />
                        <asp:Parameter Name="UnitsProduced" Type="Int32" />
                        <asp:Parameter Name="WasteProduced" Type="Decimal" />
                        <asp:Parameter Name="LotStatus" Type="Int32" />
                        <asp:Parameter Name="EquipLocNo" Type="Int32" />
                        <asp:Parameter Name="TechnologistSign" Type="Int32" />
                        <asp:Parameter Name="SignTime" Type="DateTime" />
                        <asp:Parameter Name="TechnologistSignEnd" Type="Int32" />
                        <asp:Parameter Name="EndSignTime" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                Start time</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                End time</td>
            <td>
                <asp:TextBox ID="txtEnd" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="5">
                            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
                                Width="100%">
                                
                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Lot Details">
                               <ContentTemplate >
                               
                                
                               
                               
                               
                                   <table class="style1">
                                       <tr>
                                           <td>
                                               Lot Details</td>
                                       </tr>
                                       <tr>
                                           <td align="center">
                                               <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                                                   DataSourceID="ODSLotDetails" Height="50px" Width="50%">
                                                   <Fields>
                                                       <asp:BoundField DataField="LotNo" HeaderText="LotNo" SortExpression="LotNo" />
                                                       <asp:BoundField DataField="FormatDesc" HeaderText="FormatDesc" 
                                                           SortExpression="FormatDesc" />
                                                       <asp:BoundField DataField="LotStartTime" HeaderText="LotStartTime" 
                                                           SortExpression="LotStartTime" />
                                                       <asp:BoundField DataField="LotEndTime" HeaderText="LotEndTime" 
                                                           SortExpression="LotEndTime" />
                                                       <asp:BoundField DataField="UnitsProduced" HeaderText="UnitsProduced" 
                                                           SortExpression="UnitsProduced" />
                                                       <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                           SortExpression="LocDescription" />
                                                   </Fields>
                                               </asp:DetailsView>
                                               <asp:ObjectDataSource ID="ODSLotDetails" runat="server" 
                                                   OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLot" 
                                                   TypeName="lotsChangeOversTableAdapters.tblLotDetailsTableAdapter">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="DropDownList1" Name="lotid" 
                                                           PropertyName="SelectedValue" Type="Int32" />
                                                   </SelectParameters>
                                               </asp:ObjectDataSource>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               &nbsp;</td>
                                       </tr>
                                       <tr>
                                           <td>
                                               &nbsp;</td>
                                       </tr>
                                   </table>
                               
                                
                               
                               
                               
                               </ContentTemplate> 
                               
                                
                                
                                </cc1:TabPanel>
                                
                                  <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Downtime">
                                      <ContentTemplate>
                                          <table class="style1">
                                              <tr>
                                                  <td>
                                                      All downtime for lot</td>
                                              </tr>
                                              <tr>
                                                  <td align="center">
                                                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                          DataSourceID="ODSDTDesc" Width="100%">
                                                          <Columns>
                                                              <asp:BoundField DataField="Downtimestart" HeaderText="Downtimestart" 
                                                                  SortExpression="Downtimestart" />
                                                              <asp:BoundField DataField="Downtimeend" HeaderText="Downtimeend" 
                                                                  SortExpression="Downtimeend" />
                                                              <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                                                                  SortExpression="RemedyDescription" />
                                                              <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                                                                  SortExpression="RootCauseDesc" />
                                                              <asp:BoundField DataField="LocDescription" HeaderText="LocDescription" 
                                                                  SortExpression="LocDescription" />
                                                              <asp:BoundField DataField="SymptomDesc" HeaderText="SymptomDesc" 
                                                                  SortExpression="SymptomDesc" />
                                                              <asp:BoundField DataField="dtime" HeaderText="dtime" ReadOnly="True" 
                                                                  SortExpression="dtime" />
                                                          </Columns>
                                                      </asp:GridView>
                                                      <asp:ObjectDataSource ID="ODSDTDesc" runat="server" 
                                                          OldValuesParameterFormatString="original_{0}" 
                                                          SelectMethod="GetDataBetweenDates" 
                                                          TypeName="DataAnalysisTableAdapters.DetailsMediumByLocTableAdapter">
                                                          <SelectParameters>
                                                              <asp:Parameter Name="locid" Type="Int32" />
                                                              <asp:ControlParameter ControlID="txtEnd" DefaultValue="" Name="downtimend" 
                                                                  PropertyName="Text" Type="DateTime" />
                                                              <asp:ControlParameter ControlID="txtStart" DefaultValue="" Name="downtimstart" 
                                                                  PropertyName="Text" Type="DateTime" />
                                                          </SelectParameters>
                                                      </asp:ObjectDataSource>
                                                  </td>
                                                  <tr>
                                                      <td>
                                                          &nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                          &nbsp;</td>
                                                  </tr>
                                              </tr>
                                          </table>
                                      </ContentTemplate>
                               
                                
                                
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Time Line">
                                    <ContentTemplate>
                                        <table >
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Downtime</td>
                                                <td>
                                                    <uc1:TimeLine ID="DTTimeLine" runat="server" width = "800" colour = "red" ShowDateTime="True"   />
                                                                                             </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Lot time</td>
                                                <td>
                                                   <uc1:TimeLine ID="LotTimeline" runat="server" width = "800" colour = "Orange" 
                                                        ShowDateTime="True"   />
                                                       </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Shfit time</td>
                                                <td>
                                                    <uc1:TimeLine ID="ShiftTimeLine" runat="server" width = "800" colour = "Green" 
                                                        ShowDateTime="True"   />
                                                       </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Performance Statistics">
                                           <ContentTemplate>
                                        <table width="100%" >
                                            <tr>
                                                <td colspan="2" align="center">
                                                    Performance Data for lot</td>
                                            </tr>
                                            <tr>
                                                <td width="10%" colspan="2" align="center">
                                                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                                                        DataSourceID="ODSPerfData" Height="50px" Width="125px">
                                                        <Fields>
                                                            <asp:BoundField DataField="LotNo" HeaderText="LotNo" SortExpression="LotNo" />
                                                            <asp:BoundField DataField="ShiftTime" HeaderText="ShiftTime" ReadOnly="True" 
                                                                SortExpression="ShiftTime" />
                                                            <asp:BoundField DataField="LotTime" HeaderText="LotTime" ReadOnly="True" 
                                                                SortExpression="LotTime" />
                                                            <asp:BoundField DataField="lotDT" HeaderText="lotDT" ReadOnly="True" 
                                                                SortExpression="lotDT" />
                                                            <asp:BoundField DataField="LottimeMinusDT" HeaderText="LottimeMinusDT" 
                                                                ReadOnly="True" SortExpression="LottimeMinusDT" />
                                                            <asp:BoundField DataField="OperationRatePerMin" 
                                                                HeaderText="OperationRatePerMin" SortExpression="OperationRatePerMin" />
                                                            <asp:BoundField DataField="TheoreticalUnits" HeaderText="TheoreticalUnits" 
                                                                ReadOnly="True" SortExpression="TheoreticalUnits" />
                                                            <asp:BoundField DataField="UnitsProduced" HeaderText="UnitsProduced" 
                                                                SortExpression="UnitsProduced" />
                                                            <asp:BoundField DataField="WasteProduced" HeaderText="WasteProduced" 
                                                                SortExpression="WasteProduced" />
                                                            <asp:BoundField DataField="Availability" HeaderText="Availability" 
                                                                ReadOnly="True" SortExpression="Availability" />
                                                            <asp:BoundField DataField="Performance" HeaderText="Performance" 
                                                                ReadOnly="True" SortExpression="Performance" />
                                                            <asp:BoundField DataField="Quality" HeaderText="Quality" ReadOnly="True" 
                                                                SortExpression="Quality" />
                                                            <asp:BoundField DataField="OEE" HeaderText="OEE" ReadOnly="True" 
                                                                SortExpression="OEE" />
                                                        </Fields>
                                                    </asp:DetailsView>
                                                    <asp:ObjectDataSource ID="ODSPerfData" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByLotID" 
                                                        TypeName="DataAnalysisOverallTableAdapters.LotPerformanceDataTableAdapter">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="RadioButtonList1" Name="EquipLocNo" 
                                                                PropertyName="SelectedValue" Type="Int32" />
                                                            <asp:ControlParameter ControlID="DropDownList1" Name="Lotid" 
                                                                PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                             
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                
                                
                                
                                
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </td>
                    </tr>
    </table>
    
    
    </ContentTemplate>
    
    </asp:UpdatePanel>
                

</asp:Content>

