<%@ Page Language="VB" MasterPageFile="~/Backend.master" AutoEventWireup="false" CodeFile="ShortStopManager.aspx.vb" Inherits="zAdministration_Default" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 185px;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="2" class="style4">
                <h2>
                    Short Stop Management<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" 
                        runat="server">
                    </cc1:ToolkitScriptManager>
                </h2>
            </td>
        </tr>
        <tr>
            <td>
                Select your line</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    DataSourceID="odsLines" DataTextField="LocDescription" DataValueField="LocID" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:ObjectDataSource ID="odsLines" runat="server" DeleteMethod="Delete" 
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
            <td colspan="2">
                Short Stops for line</td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <asp:UpdatePanel ID="upSSgrid" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="RemedyID" 
                    DataSourceID="odsShortStops">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Upload" />
                                <asp:ButtonField CommandName="View" Text="View" />
                                <asp:ButtonField CommandName="Colour" Text="Colour" />
                                <asp:BoundField DataField="LocID" HeaderText="LocID" SortExpression="LocID" />
                                <asp:BoundField DataField="RootCauseDesc" HeaderText="RootCauseDesc" 
                            SortExpression="RootCauseDesc" />
                                <asp:BoundField DataField="RemedyDescription" HeaderText="RemedyDescription" 
                            SortExpression="RemedyDescription" />
                                <asp:BoundField DataField="SSButtonColour" 
                            HeaderText="SSButtonColour" SortExpression="SSButtonColour" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:ObjectDataSource ID="odsShortStops" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DowntimeTableAdapters.ShortStopDescByLineTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="Locid" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <cc1:ModalPopupExtender ID="mpeImageUpload" runat="server" 
                    TargetControlID="lnkHidden" PopupControlID="pnlimageupload">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <asp:Panel ID="pnlImageUpload" runat="server" BackColor="#999999" Width="600px">
                    <table class="style1" width="600">
                        <tr>
                            <td>
                                Image upload panel</td>
                            <td style="text-align: right">
                                <asp:LinkButton ID="lnkViewclose0" runat="server">Close</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Enter instruction for user when image is displayed<br />
                                <asp:TextBox ID="txtImageTitle" runat="server" Width="588px">Please select the 
                                location where the location of the root cause</asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Select image to upload<br />
                                <asp:FileUpload ID="FUimage" runat="server" />
                                <br />
                                <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                                <br />
                                <asp:Button ID="btnUploadImage" runat="server" Text="Upload" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="lnkhidden" runat="server"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style5">
                <asp:Panel ID="pnlImageReview" runat="server" BackColor="#999999" Width="700px">
                    <asp:UpdatePanel ID="upimagereview" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table class="style1" width="600">
                                <tr>
                                    <td>
                                        Short Stop Image review panel</td>
                                    <td align="right">
                                        <asp:LinkButton ID="lnkViewclose" runat="server">Close</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:ImageMap ID="ImageMap1" runat="server">
                                        </asp:ImageMap>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <cc1:ModalPopupExtender ID="mpeImageReview" runat="server" 
                    PopupControlID="pnlImageReview" TargetControlID="Lnkhidden1">
                </cc1:ModalPopupExtender>
                <asp:LinkButton ID="lnkhidden1" runat="server"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlAddColour" runat="server" BackColor="#999999" Width="200px">
                    
                    
                    <asp:UpdatePanel ID="upColourAdd" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table class="style1" width="600">
                                <tr>
                                    <td>
                                        Add colour to button</td>
                                    <td align="right">
                                        <asp:LinkButton ID="lnkViewclose1" runat="server">Close</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Label ID="lblRemedyID" runat="server"></asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Value="Red">Red</asp:ListItem>
                                            <asp:ListItem>Green</asp:ListItem>
                                            <asp:ListItem>Blue</asp:ListItem>
                                            <asp:ListItem>Purple</asp:ListItem>
                                            <asp:ListItem>Pink</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSSColour" runat="server" Text="Add" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    
                    
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="lnkhidden2" runat="server"></asp:LinkButton>
                <br />
                <cc1:ModalPopupExtender ID="mpeColourChange" runat="server" 
                    PopupControlID="pnlAddColour" TargetControlID="Lnkhidden2">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>

