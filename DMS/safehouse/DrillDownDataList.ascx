<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DrillDownDataList.ascx.vb" Inherits="Controls_DrillDownDataList" %>
                                    <style type="text/css">
                                        .style1
                                        {
                                            width: 100%;
                                        }
                                    </style>
                                    <asp:ObjectDataSource ID="LocODS" 
    runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                        
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentLocID"
                                        
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
                                            <asp:Parameter Name="Original_LocID" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ParentLocID" SessionField="btnLocID" Type="Int32" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="LocDescription" Type="String" />
                                            <asp:Parameter Name="ParentLocID" Type="Int32" />
                                            <asp:Parameter Name="DowntimeID" Type="Int32" />
                                            <asp:Parameter Name="LotStatus" Type="Int32" />
                                            <asp:Parameter Name="LocationEnabled" Type="Boolean" />
                                            <asp:Parameter Name="LocationStatus" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:PlaceHolder ID="PHPath" runat="server"></asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                    <asp:DataList ID="DataList1" runat="server" 
    DataKeyField="LocID" DataSourceID="LocODS"
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Button ID="btnLoc" runat="server" CommandArgument='<%# Eval("LocID") %>' Font-Size="X-Small"
                                                Text='<%# Eval("LocDescription") %>' Visible='<%# Eval("LocationEnabled") %>'
                                                Width="100%" CausesValidation="False" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                        </td>
                                    </tr>
</table>

                                