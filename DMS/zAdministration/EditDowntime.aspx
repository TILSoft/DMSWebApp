<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="EditDowntime.aspx.vb" Inherits="zAdministration_EditDowntime" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <h2>
                    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                    Edit Downtimes</h2>
            </td>
        </tr>
        </table>
    <asp:Panel ID="pnlSelector" runat="server">
        <table class="style1">
            <tr>
                <td width="10%">
                    Select line</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ODSloc" 
                    DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal" AutoPostBack="True">
                    </asp:RadioButtonList>
                    <asp:ObjectDataSource ID="ODSloc" runat="server" DeleteMethod="Delete" 
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
                            <asp:Parameter DefaultValue="0" Name="ParentLocID" Type="Int32" />
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
                </td>
            </tr>
            <tr>
                <td width="10%">
                    Symptom Loc</td>
                <td>
                    <asp:Label ID="lblSympLoc" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    Select Date</td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="txtdate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Button ID="Button1" runat="server" Text="OK" />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    Select your downtime start time</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="ODSDTs" DataTextField="Downtimestart" 
                    DataValueField="DowntimeID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ODSDTs" runat="server" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="DowntimeTableAdapters.DTIDbyStartDateAndLineTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadioButtonList1" Name="LocID" 
                            PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtDate" Name="dtstart" PropertyName="Text" 
                            Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
    </p>
    <table class="style1" style=" width: 100%">
        <tr>
            <td>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="DowntimeID" 
                    DataSourceID="ODSDowntimeEdit" DefaultMode="Edit">
                    <EditItemTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    Downtime ID</td>
                                <td>
                                    <asp:Label ID="DowntimeIDLabel1" runat="server" 
                                        Text='<%# Eval("DowntimeID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Downtime Start</td>
                                <td>
                                    <asp:TextBox ID="DowntimestartTextBox" runat="server" 
                                        Text='<%# Bind("Downtimestart") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Downtime End</td>
                                <td>
                                    <asp:TextBox ID="DowntimeendTextBox" runat="server" 
                                        Text='<%# Bind("Downtimeend") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Remedy</td>
                                <td>
                                  <asp:TextBox ID="RemedyIDTextBox" runat="server" enabled =false 
                                        Text='<%# Bind("RemedyID") %>' /> <br />
                                        
                                    <asp:LinkButton ID="LinkButton1" runat="server" 
                                        CommandArgument='<%# Eval("RemedyID") %>' onclick="LinkButton1_Click">Edit 
                                    Root Cause and Remedy</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Activity ID</td>
                                <td>
                                    <asp:TextBox ID="DowntimeLotIDtextbox" runat="server" Enabled="False" 
                                        Text='<%# Bind("DowntimeLotID") %>'></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Change Activity</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsActivity" 
                                        DataTextField="txtID" DataValueField="ActivityID" 
                                        SelectedValue='<%# Bind("DowntimeLotID") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odsActivity" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataByLoc" 
                                        TypeName="ActivityTableAdapters.tblActivityTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                                        </DeleteParameters>
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
                                            <asp:Parameter Name="Original_ActivityID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblSympLoc" Name="locid" PropertyName="Text" 
                                                Type="Int32" />
                                        </SelectParameters>
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
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Symptom ID</td>
                                <td>
                                    <asp:TextBox ID="TempSymptomIDTextBox" runat="server" Enabled="False" 
                                        Text='<%# Bind("TempSymptomID") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Downtime Comment</td>
                                <td>
                                    <asp:TextBox ID="DowntimeCommentTextBox" runat="server" 
                                        Text='<%# Bind("DowntimeComment") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Start Tech sign</td>
                                <td>
                                    <asp:TextBox ID="StartSignTextBox" runat="server" enabled =false 
                                        Text='<%# Bind("StartSign") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Tech sign</td>
                                <td>
                                    <asp:TextBox ID="EndSignTechTextBox" runat="server" enabled =false 
                                        Text='<%# Bind("EndSignTech") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Eng sign</td>
                                <td>
                                    <asp:TextBox ID="EndSignEngTextBox" runat="server" enabled =false 
                                        Text='<%# Bind("EndSignEng") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    End Exec Sign</td>
                                <td>
                                    <asp:TextBox ID="EndSignExecTextBox" runat="server" enabled =false 
                                        Text='<%# Bind("EndSignExec") %>' />
                                </td>
                            </tr>
                        </table>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Downtimestart:
                        <asp:TextBox ID="DowntimestartTextBox" runat="server" 
                            Text='<%# Bind("Downtimestart") %>' />
                        <br />
                        Downtimeend:
                        <asp:TextBox ID="DowntimeendTextBox" runat="server" 
                            Text='<%# Bind("Downtimeend") %>' />
                        <br />
                        RemedyID:
                        <asp:TextBox ID="RemedyIDTextBox" runat="server" 
                            Text='<%# Bind("RemedyID") %>' />
                        <br />
                        DowntimeComment:
                        <asp:TextBox ID="DowntimeCommentTextBox" runat="server" 
                            Text='<%# Bind("DowntimeComment") %>' />
                        <br />
                        DowntimeType:
                        <asp:TextBox ID="DowntimeTypeTextBox" runat="server" 
                            Text='<%# Bind("DowntimeType") %>' />
                        <br />
                        tempSymptomID:
                        <asp:TextBox ID="tempSymptomIDTextBox" runat="server" 
                            Text='<%# Bind("tempSymptomID") %>' />
                        <br />
                        tempSymptomLoc:
                        <asp:TextBox ID="tempSymptomLocTextBox" runat="server" 
                            Text='<%# Bind("tempSymptomLoc") %>' />
                        <br />
                        DowntimeFormat:
                        <asp:TextBox ID="DowntimeFormatTextBox" runat="server" 
                            Text='<%# Bind("DowntimeFormat") %>' />
                        <br />
                        DowntimeLotNo:
                        <asp:TextBox ID="DowntimeLotNoTextBox" runat="server" 
                            Text='<%# Bind("DowntimeLotNo") %>' />
                        <br />
                        StartSign:
                        <asp:TextBox ID="StartSignTextBox" runat="server" 
                            Text='<%# Bind("StartSign") %>' />
                        <br />
                        EndSignTech:
                        <asp:TextBox ID="EndSignTechTextBox" runat="server" 
                            Text='<%# Bind("EndSignTech") %>' />
                        <br />
                        EndSignEng:
                        <asp:TextBox ID="EndSignEngTextBox" runat="server" 
                            Text='<%# Bind("EndSignEng") %>' />
                        <br />
                        DowntimeLotID:
                        <asp:TextBox ID="DowntimeLotIDTextBox" runat="server" 
                            Text='<%# Bind("DowntimeLotID") %>' />
                        <br />
                        DowntimeCOID:
                        <asp:TextBox ID="DowntimeCOIDTextBox" runat="server" 
                            Text='<%# Bind("DowntimeCOID") %>' />
                        <br />
                        EndSignExec:
                        <asp:TextBox ID="EndSignExecTextBox" runat="server" 
                            Text='<%# Bind("EndSignExec") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        DowntimeID:
                        <asp:Label ID="DowntimeIDLabel" runat="server" 
                            Text='<%# Eval("DowntimeID") %>' />
                        <br />
                        Downtimestart:
                        <asp:Label ID="DowntimestartLabel" runat="server" 
                            Text='<%# Bind("Downtimestart") %>' />
                        <br />
                        Downtimeend:
                        <asp:Label ID="DowntimeendLabel" runat="server" 
                            Text='<%# Bind("Downtimeend") %>' />
                        <br />
                        RemedyID:
                        <asp:Label ID="RemedyIDLabel" runat="server" Text='<%# Bind("RemedyID") %>' />
                        <br />
                        DowntimeComment:
                        <asp:Label ID="DowntimeCommentLabel" runat="server" 
                            Text='<%# Bind("DowntimeComment") %>' />
                        <br />
                        DowntimeType:
                        <asp:Label ID="DowntimeTypeLabel" runat="server" 
                            Text='<%# Bind("DowntimeType") %>' />
                        <br />
                        tempSymptomID:
                        <asp:Label ID="tempSymptomIDLabel" runat="server" 
                            Text='<%# Bind("tempSymptomID") %>' />
                        <br />
                        tempSymptomLoc:
                        <asp:Label ID="tempSymptomLocLabel" runat="server" 
                            Text='<%# Bind("tempSymptomLoc") %>' />
                        <br />
                        DowntimeFormat:
                        <asp:Label ID="DowntimeFormatLabel" runat="server" 
                            Text='<%# Bind("DowntimeFormat") %>' />
                        <br />
                        DowntimeLotNo:
                        <asp:Label ID="DowntimeLotNoLabel" runat="server" 
                            Text='<%# Bind("DowntimeLotNo") %>' />
                        <br />
                        StartSign:
                        <asp:Label ID="StartSignLabel" runat="server" Text='<%# Bind("StartSign") %>' />
                        <br />
                        EndSignTech:
                        <asp:Label ID="EndSignTechLabel" runat="server" 
                            Text='<%# Bind("EndSignTech") %>' />
                        <br />
                        EndSignEng:
                        <asp:Label ID="EndSignEngLabel" runat="server" 
                            Text='<%# Bind("EndSignEng") %>' />
                        <br />
                        DowntimeLotID:
                        <asp:Label ID="DowntimeLotIDLabel" runat="server" 
                            Text='<%# Bind("DowntimeLotID") %>' />
                        <br />
                        DowntimeCOID:
                        <asp:Label ID="DowntimeCOIDLabel" runat="server" 
                            Text='<%# Bind("DowntimeCOID") %>' />
                        <br />
                        EndSignExec:
                        <asp:Label ID="EndSignExecLabel" runat="server" 
                            Text='<%# Bind("EndSignExec") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        There are no downtimes for the selected date and line.
                    </EmptyDataTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ODSDowntimeEdit" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByDowntimeID" TypeName="DowntimeTableAdapters.tbldowntimeTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_DowntimeID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Downtimestart" Type="DateTime" />
                        <asp:Parameter Name="Downtimeend" Type="DateTime" />
                        <asp:Parameter Name="RemedyID" Type="Int32" />
                        <asp:Parameter Name="DowntimeComment" Type="String" />
                        <asp:Parameter Name="DowntimeType" Type="Int32" />
                        <asp:Parameter Name="tempSymptomID" Type="Int32" />
                        <asp:Parameter Name="tempSymptomLoc" Type="Int32" />
                        <asp:Parameter Name="DowntimeFormat" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotID" Type="Int32" />
                        <asp:Parameter Name="DowntimeCOID" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotNo" Type="String" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="EndSignTech" Type="Int32" />
                        <asp:Parameter Name="EndSignEng" Type="Int32" />
                        <asp:Parameter Name="EndSignExec" Type="Int32" />
                        <asp:Parameter Name="Original_DowntimeID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="downtimeid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Downtimestart" Type="DateTime" />
                        <asp:Parameter Name="Downtimeend" Type="DateTime" />
                        <asp:Parameter Name="RemedyID" Type="Int32" />
                        <asp:Parameter Name="DowntimeComment" Type="String" />
                        <asp:Parameter Name="DowntimeType" Type="Int32" />
                        <asp:Parameter Name="tempSymptomID" Type="Int32" />
                        <asp:Parameter Name="tempSymptomLoc" Type="Int32" />
                        <asp:Parameter Name="DowntimeFormat" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotID" Type="Int32" />
                        <asp:Parameter Name="DowntimeCOID" Type="Int32" />
                        <asp:Parameter Name="DowntimeLotNo" Type="String" />
                        <asp:Parameter Name="StartSign" Type="Int32" />
                        <asp:Parameter Name="EndSignTech" Type="Int32" />
                        <asp:Parameter Name="EndSignEng" Type="Int32" />
                        <asp:Parameter Name="EndSignExec" Type="Int32" />
                    </InsertParameters>
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
</asp:Content>

