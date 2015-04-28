<%@ Page Title="" Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="LabourUtilisationEntry.aspx.vb" Inherits="LabourUtilisation_LabourUtilisationEntry" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



   
    
    
    
 
    <table class="style1">
        <tr>
            <td colspan="2">
                <h2>
                    Labour Utilisation Data Entry</h2>
            </td>
        </tr>
        <tr>
            <td>
                Select Workcentre:
                <asp:DropDownList ID="ddlWkCtr" runat="server" AutoPostBack="True">
                    <asp:ListItem>Pack</asp:ListItem>
                    <asp:ListItem>TIL2A</asp:ListItem>
                    <asp:ListItem>TIL1</asp:ListItem>
                    <asp:ListItem>Disp</asp:ListItem>
                    <asp:ListItem>Gran</asp:ListItem>
                    <asp:ListItem>Comp</asp:ListItem>
                    <asp:ListItem>Coat/Print</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                Date/Time:
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                           &nbsp; Shift:<asp:DropDownList ID="ddlShift" runat="server">
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                    <asp:ListItem>Support</asp:ListItem>
                </asp:DropDownList>
                <asp:LinqDataSource ID="lnqLabAct" runat="server" 
                    ContextTypeName="LinqLabourDataContext" TableName="tblLabActivities">
                </asp:LinqDataSource>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td width="150px">
                            &nbsp;</td>
                        <td width="300px">
                            &nbsp;</td>
                        <td width="200px">
                            Activity</td>
                        <td width="100px">
                            No Staff</td>
                        <td width="100px">
                            Hours</td>
                        <td width="100px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DropDownList ID="ddlActivity" runat="server" DataSourceID="lnqLabAct" 
                                DataTextField="LabourActivity" DataValueField="LabourActivity">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNoStaff" runat="server" Width="90px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHours" runat="server" Width="89px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Insert" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="LinqLabourDataContext" TableName="tblLabourUtilisations" 
                    EnableInsert="True">
                </asp:LinqDataSource>
                <asp:GridView ID="gvDisplay" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="LabID" DataSourceID="lnqReport">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                        <ItemStyle Width="150px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Shift" HeaderText="Shift" SortExpression="Shift">
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Activity" HeaderText="Activity" 
                            SortExpression="Activity" >
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoStaff" HeaderText="NoStaff" 
                            SortExpression="NoStaff" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Total Hours">
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Signed" HeaderText="Signed" 
                            SortExpression="Signed" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        There is no data for this area on this date.
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:LinqDataSource ID="lnqReport" runat="server" 
                    ContextTypeName="LinqLabourDataContext" EnableDelete="True" EnableInsert="True" 
                    EnableUpdate="True" TableName="tblLabourUtilisations" Where="WkCtr == @WkCtr">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlWkCtr" Name="WkCtr" 
                            PropertyName="SelectedValue" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <table >
                    <tr>
                        <td width = "150px">
                            &nbsp;&nbsp; &nbsp;</td>
                      <td width = "200px">
                          &nbsp;</td>
                        <td width = "300px">
                          
                            &nbsp;<td width = "100px">
                          
                            &nbsp;<td width = "100px">
                             
                            &nbsp;<td width = "100px">
                               &nbsp;</td>
                    </tr>
                    <tr>
                        <td width = "100px">
                            &nbsp;</td>
                      <td width = "200px">
                          &nbsp;</td>
                        <td width = "200px">
                          
                         <td width = "100px">
                          
                           <td width = "100px">
                             
                               <b>Total:<td width = "100px">
                               <b>
                               <asp:Label ID="lblTotalHours" runat="server"></asp:Label></b></td>
                    </tr>
                    <tr>
                           <td>
                            &nbsp;</td>
                        <td>
         
                           </td>
                       <td>
              
                        </td>
                           <td>
            
                        </td>
                          <td>             </td>
                          <td>
              
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    


</asp:Content>

