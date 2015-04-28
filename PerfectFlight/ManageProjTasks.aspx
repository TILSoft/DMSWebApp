<%@ Page Language="VB" MasterPageFile="~/backend.master"  MaintainScrollPositionOnPostback ="true"  AutoEventWireup="false" CodeFile="ManageProjTasks.aspx.vb" Inherits="Application_ManageProjTasks" title="Untitled Page" %>

<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../Controls/ChartControl.ascx" tagname="ChartControl" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 200px;
            border-style: solid;
            border-width: 2px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <table class="style1">
        <tr>
            <td colspan="9">
                <h3>
                    Manage Project Tasks</h3>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="PFID" DataSourceID="odsProj" Height="50px" Width="75%">
                    <Fields>
                        <asp:BoundField DataField="PFID" HeaderText="PFID" 
                            SortExpression="PFID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="PFName" HeaderText="PFName" 
                            SortExpression="PFName" />
                        <asp:BoundField DataField="PFComment" HeaderText="PFComment" 
                            SortExpression="PFComment" />
                        <asp:BoundField DataField="FormatID" HeaderText="FormatID" 
                            SortExpression="FormatID" />
                        <asp:BoundField DataField="PFStatus" HeaderText="PFStatus" 
                            SortExpression="PFStatus" />
                        <asp:BoundField DataField="PFStartDate" HeaderText="PFStartDate" 
                            SortExpression="PFStartDate" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="odsProj" runat="server" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataBy" 
                    TypeName="PefectFlightTableAdapters.tblPFHeaderTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pfid" QueryStringField="ProjID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                Add new task</td>
        </tr>
        <tr>
            <td style="width: 0" width="10%">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</td>
            <td style="width: 25px" width="50px">
                Insert After</td>
            <td width="200px">
                Description</td>
            <td colspan="2">
                Precedent</td>
            <td>
                Task Duration (mins)</td>
            <td>
                Responsible</td>
            <td>
                Fixed start</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlListOrder" runat="server" DataSourceID="odstasksrevers" 
                    DataTextField="TaskOrder" DataValueField="TaskOrder">
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtTaskName" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlPrecedent" runat="server" DataSourceID="odstasksrevers" 
                    DataTextField="TaskOrder" DataValueField="TaskOrder">
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtDuration" runat="server" Width="44px"></asp:TextBox>
                <asp:CheckBox ID="cbElap" runat="server" Text="ED" />
            </td>
            <td>
                <asp:DropDownList ID="ddlResp" runat="server" 
                                                        SelectedValue='<%# bind("Taskresp") %>' 
                                                        >
                    <asp:ListItem Value="1">Tech 1</asp:ListItem>
                    <asp:ListItem Value="2">Tech 2</asp:ListItem>
                    <asp:ListItem Value="3">Tech 3</asp:ListItem>
                    <asp:ListItem Value="4">Tech 4</asp:ListItem>
                    <asp:ListItem Value="5">Tech 5</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:CheckBox ID="cbFixedStart" runat="server" AutoPostBack="True" />
                <asp:TextBox ID="txtFixedStart" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                                TargetControlID="txtfixedstart" 
                    Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
            </td>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="Insert Task" />
                </td>
        </tr>
        <tr>
            <td colspan="9">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    Width="100%">
                    <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                    <ContentTemplate >
                    
                    
                        <asp:GridView ID="gvTasks" runat="server" AllowSorting="True" 
                            AutoGenerateColumns="False" DataKeyNames="TaskID" DataSourceID="odsTasks" 
                            Width="100%">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True">
                                    <ItemStyle Width="50px" />
                                </asp:CommandField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandArgument='<%# Eval("TaskID") %>' Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TaskOrder" HeaderText="Task ID" 
                                    SortExpression="TaskOrder">
                                    <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TaskName" HeaderText="Description" 
                                    SortExpression="TaskName">
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TaskPrecedent" HeaderText="Precedent" 
                                    SortExpression="TaskPrecedent" />
                                <asp:BoundField DataField="TaskDuration" HeaderText="Duration" 
                                    SortExpression="TaskDuration" />
                                <asp:CheckBoxField DataField="TaskElapsedDays" HeaderText="ED" 
                                    SortExpression="TaskElapsedDays" />
                                <asp:BoundField DataField="TaskResp" HeaderText="Responsible" 
                                    SortExpression="TaskResp" />
                                <asp:CheckBoxField DataField="TaskFixedStart" HeaderText="FS" 
                                    SortExpression="TaskFixedStart" />
                                <asp:BoundField DataField="TaskStartDate" DataFormatString="{0:hh:mm:ss}" 
                                    HeaderText="Start Date" HtmlEncode="False" 
                                    SortExpression="TaskStartDate" />
                                <asp:BoundField DataField="TaskEndDate" DataFormatString="{0:hh:mm:ss}" 
                                    HeaderText="End Date" HtmlEncode="False" SortExpression="TaskEndDate" />
                            </Columns>
                        </asp:GridView>
                    
                    
                    </ContentTemplate>
                    </cc1:TabPanel>
                    
                     <cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
                    <ContentTemplate >
                    
                    
                        <br />
                        <uc1:ChartControl ID="ChartControl1" runat="server" BGcolor="White" 
                            gridlinecolor="Silver" height="600" txtColor="Black" width="400" 
                            XTickMarks="5" />
                        <br />
                    
                    
                    </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                Review all tasks for this Project<asp:ObjectDataSource ID="odsTasks" 
                    runat="server" DeleteMethod="Delete" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
                    TypeName="PefectFlightTableAdapters.tblPFTasksTableAdapter" 
                    InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_TaskID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PFID" Type="Int32" />
                        <asp:Parameter Name="TaskName" Type="String" />
                        <asp:Parameter Name="TaskResp" Type="String" />
                        <asp:Parameter Name="TaskPrecedent" Type="Int32" />
                        <asp:Parameter Name="TaskOrder" Type="Int32" />
                        <asp:Parameter Name="TaskStartDate" Type="DateTime" />
                        <asp:Parameter Name="TaskEndDate" Type="DateTime" />
                        <asp:Parameter Name="TaskStatus" Type="Int32" />
                        <asp:Parameter Name="TaskPercentComplete" Type="Int32" />
                        <asp:Parameter Name="TaskDuration" Type="Int32" />
                        <asp:Parameter Name="TaskElapsedDays" Type="Boolean" />
                        <asp:Parameter Name="TaskFixedStart" Type="Boolean" />
                        <asp:Parameter Name="Original_TaskID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pfid" QueryStringField="ProjID" 
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PFID" Type="Int32" />
                        <asp:Parameter Name="TaskName" Type="String" />
                        <asp:Parameter Name="TaskResp" Type="String" />
                        <asp:Parameter Name="TaskPrecedent" Type="Int32" />
                        <asp:Parameter Name="TaskOrder" Type="Int32" />
                        <asp:Parameter Name="TaskStartDate" Type="DateTime" />
                        <asp:Parameter Name="TaskEndDate" Type="DateTime" />
                        <asp:Parameter Name="TaskStatus" Type="Int32" />
                        <asp:Parameter Name="TaskPercentComplete" Type="Int32" />
                        <asp:Parameter Name="TaskDuration" Type="Int32" />
                        <asp:Parameter Name="TaskElapsedDays" Type="Boolean" />
                        <asp:Parameter Name="TaskFixedStart" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odstasksrevers" runat="server" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetData" 
                    TypeName="PefectFlightTableAdapters.TaskOrderWithZeroTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pfid" QueryStringField="ProjID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
                    PopupControlID="pnlEdit" TargetControlID="lnkHdnMPE1">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="pnlEdit" runat="server" BackColor="#FFFF99" Width="400px">
                    <table class="style2" width="400px">
                        <tr>
                            <td>
                                Edit Task</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:FormView ID="fvEdit" runat="server" 
                DataKeyNames="TaskID" DataSourceID="odsTaskEdit" DefaultMode="Edit" Width="400px">
                                    <EditItemTemplate>
                                        &nbsp;<table class="style1">
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="TaskIDLabel1" runat="server" Text='<%# Eval("TaskID") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Task Name</td>
                                                <td>
                                                    <asp:TextBox ID="TaskNameTextBox" runat="server" 
                                                        Text='<%# Bind("TaskName") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Responsible</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlUser" runat="server" 
                                                        SelectedValue='<%# bind("Taskresp") %>' 
                                                        >
                                                        <asp:ListItem Value="1">Tech 1</asp:ListItem>
                                                        <asp:ListItem Value="2">Tech 2</asp:ListItem>
                                                        <asp:ListItem Value="3">Tech 3</asp:ListItem>
                                                        <asp:ListItem Value="4">Tech 4</asp:ListItem>
                                                        <asp:ListItem Value="5">Tech 5</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Precedent</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlEditPrecedent" runat="server" 
                                                        DataSourceID="odstasksrevers" DataTextField="TaskOrder" 
                                                        DataValueField="TaskOrder" SelectedValue='<%# bind("TaskPrecedent") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Move Before task</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlEditOrder" runat="server" 
                                                        DataSourceID="odstasksrevers" DataTextField="TaskOrder" 
                                                        DataValueField="TaskOrder" SelectedValue='<%# bind("TaskOrder") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Duration</td>
                                                <td>
                                                    <asp:TextBox ID="TaskDurationTextBox" runat="server" 
                                                        Text='<%# Bind("TaskDuration") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Elapsed days</td>
                                                <td>
                                                    <asp:CheckBox ID="TaskElapsedDaysCheckBox" runat="server" 
                                                        Checked='<%# Bind("TaskElapsedDays") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Fixed Start</td>
                                                <td>
                                                    <asp:CheckBox ID="cbEditFS" runat="server" 
                                                        Checked='<%# Bind("TaskFixedStart") %>' />
                                                    <asp:TextBox ID="txtEditFS" runat="server" Text='<%# Bind("TaskStartDate") %>'></asp:TextBox>
                                                    <br />
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" 
                                                        TargetControlID="txteditFS">
                                                    </cc1:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                        CommandName="Update" onclick="UpdateButton_Click" Text="Update" />
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                        CommandName="Cancel" Text="Cancel" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        TaskName:
                                        <asp:TextBox ID="TaskNameTextBox0" runat="server" 
                                            Text='<%# Bind("TaskName") %>' />
                                        <br />
                                        TaskResp:
                                        <asp:TextBox ID="TaskRespTextBox" runat="server" 
                                            Text='<%# Bind("TaskResp") %>' />
                                        <br />
                                        TaskPrecedent:
                                        <asp:TextBox ID="TaskPrecedentTextBox" runat="server" 
                                            Text='<%# Bind("TaskPrecedent") %>' />
                                        <br />
                                        TaskOrder:
                                        <asp:TextBox ID="TaskOrderTextBox" runat="server" 
                                            Text='<%# Bind("TaskOrder") %>' />
                                        <br />
                                        TaskElapsedDays:
                                        <asp:CheckBox ID="TaskElapsedDaysCheckBox0" runat="server" 
                                            Checked='<%# Bind("TaskElapsedDays") %>' />
                                        <br />
                                        TaskDuration:
                                        <asp:TextBox ID="TaskDurationTextBox0" runat="server" 
                                            Text='<%# Bind("TaskDuration") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        TaskID:
                                        <asp:Label ID="TaskIDLabel" runat="server" Text='<%# Eval("TaskID") %>' />
                                        <br />
                                        TaskName:
                                        <asp:Label ID="TaskNameLabel" runat="server" Text='<%# Bind("TaskName") %>' />
                                        <br />
                                        TaskResp:
                                        <asp:Label ID="TaskRespLabel" runat="server" Text='<%# Bind("TaskResp") %>' />
                                        <br />
                                        TaskPrecedent:
                                        <asp:Label ID="TaskPrecedentLabel" runat="server" 
                                            Text='<%# Bind("TaskPrecedent") %>' />
                                        <br />
                                        TaskOrder:
                                        <asp:Label ID="TaskOrderLabel" runat="server" Text='<%# Bind("TaskOrder") %>' />
                                        <br />
                                        TaskElapsedDays:
                                        <asp:CheckBox ID="TaskElapsedDaysCheckBox1" runat="server" 
                                            Checked='<%# Bind("TaskElapsedDays") %>' Enabled="false" />
                                        <br />
                                        TaskDuration:
                                        <asp:Label ID="TaskDurationLabel" runat="server" 
                                            Text='<%# Bind("TaskDuration") %>' />
                                        <br />
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" />
                                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" />
                                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" />
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="odsTaskEdit" runat="server" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" 
                                    TypeName="PefectFlightTableAdapters.EditTaskTableAdapter" 
                                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_TaskID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="TaskName" Type="String" />
                                        <asp:Parameter Name="TaskResp" Type="String" />
                                        <asp:Parameter Name="TaskPrecedent" Type="Int32" />
                                        <asp:Parameter Name="TaskOrder" Type="Int32" />
                                        <asp:Parameter Name="TaskElapsedDays" Type="Boolean" />
                                        <asp:Parameter Name="TaskDuration" Type="Int32" />
                                        <asp:Parameter Name="TaskFixedStart" Type="Boolean" />
                                        <asp:Parameter Name="TaskStartDate" Type="DateTime" />
                                        <asp:Parameter Name="Original_TaskID" Type="Int32" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:Parameter Name="taskId" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="TaskName" Type="String" />
                                        <asp:Parameter Name="TaskResp" Type="String" />
                                        <asp:Parameter Name="TaskPrecedent" Type="Int32" />
                                        <asp:Parameter Name="TaskOrder" Type="Int32" />
                                        <asp:Parameter Name="TaskElapsedDays" Type="Boolean" />
                                        <asp:Parameter Name="TaskDuration" Type="Int32" />
                                        <asp:Parameter Name="TaskFixedStart" Type="Boolean" />
                                        <asp:Parameter Name="TaskStartDate" Type="DateTime" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:LinkButton ID="lnkHdnMPE1" runat="server"></asp:LinkButton>
                <br />
            </td>
            <td colspan="5">
                <asp:Panel ID="pnlerror" runat="server" Height="200px" 
                    Width="400px" BackColor="Red">
                    Message:<table class="style1">
                        <tr>
                            <td>
                                <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnOK" runat="server" Text="OK" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="9">
                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
                    PopupControlID="pnlError" TargetControlID="lnkHdnMPE1">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>

