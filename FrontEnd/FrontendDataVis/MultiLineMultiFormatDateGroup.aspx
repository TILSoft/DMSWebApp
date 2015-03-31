<%@ Page Language="VB" MasterPageFile="~/FrontEnd.master" AutoEventWireup="false" CodeFile="MultiLineMultiFormatDateGroup.aspx.vb" Inherits="FrontEnd_FrontendDataVis_MultiLine1" title="Untitled Page" %>
<%@ Register assembly="dotnetCHARTING" namespace="dotnetCHARTING" tagprefix="dotnetCHARTING" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
    
        
        
        <br />
        <table class="style1" width="100%">
            <tr>
                <td colspan="2">
                    <h2>
                    Multiline/Format Selection report</h2>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dotnetCHARTING:Chart ID="ActivityChart" runat="server" Width="1000px" 
                        TempDirectory="Charttemp">
<SmartForecast Start=""></SmartForecast>

<DefaultLegendBox Padding="4" CornerBottomRight="Cut">
<HeaderEntry Visible="False"></HeaderEntry>
</DefaultLegendBox>

<ChartArea StartDateOfYear="" CornerTopLeft="Square">
<DefaultElement>
    <DefaultSubValue>
        <Line Length="4" />
    </DefaultSubValue>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<Label Font="Tahoma, 8pt"></Label>

<YAxis GaugeNeedleType="One" GaugeLabelMode="Default">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start=""></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</YAxis>

<XAxis GaugeNeedleType="One" GaugeLabelMode="Default">
<ScaleBreakLine Color="Gray"></ScaleBreakLine>

<TimeScaleLabels MaximumRangeRows="4"></TimeScaleLabels>

<MinorTimeIntervalAdvanced Start=""></MinorTimeIntervalAdvanced>

<ZeroTick>
<Line Length="3"></Line>
</ZeroTick>

<DefaultTick>
<Line Length="3"></Line>

<Label Text="%Value"></Label>
</DefaultTick>

<TimeIntervalAdvanced Start=""></TimeIntervalAdvanced>

<Label Alignment="Center" LineAlignment="Center" Font="Arial, 9pt, style=Bold"></Label>
</XAxis>

<TitleBox Position="Left">
<Label Color="Black"></Label>
</TitleBox>

<LegendBox Padding="4" Position="Top" CornerBottomRight="Cut">
<HeaderEntry Name="Name" Value="Value" Visible="False" SortOrder="-1">
<LabelStyle Font="Arial, 8pt, style=Bold"></LabelStyle>
    </HeaderEntry>
</LegendBox>
</ChartArea>

<DefaultElement>
<SmartLabel AbsolutePosition="0,0"></SmartLabel>
</DefaultElement>

<TitleBox Position="Left">
<Label Color="Black"></Label>
</TitleBox>
                    </dotnetCHARTING:Chart>
                </td>
            </tr>
            <tr>
                <td>
                    Enter Start Time</td>
                <td>
        <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Enter End Time</td>
                <td>
        <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Select Period</td>
                <td>
                    <asp:DropDownList ID="ddlPeriod" runat="server">
                        <asp:ListItem>Month</asp:ListItem>
                        <asp:ListItem>Week</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Adjust Period (Manual adjustment to allow period to match)</td>
                <td>
                    <asp:TextBox ID="txtAdjPeriod" runat="server" Width="33px">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
        <asp:Button ID="btnGetData" runat="server" Text="Get Data" />
                </td>
            </tr>
            <tr>
                <td>
                    Select appropriate formats</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
    <asp:DataList ID="dlformats" runat="server" DataSourceID="odsLocations" 
        RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("LocDescription") %>' 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("LocID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="odsformats" 
                            DataTextField="FormatDesc" DataValueField="FormatID">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:ObjectDataSource ID="odsformats" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetDataByLocIDandActivity" 
                TypeName="LocationsTableAdapters.tblFormatTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FormatDesc" Type="String" />
                    <asp:Parameter Name="LocID" Type="Int32" />
                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                    <asp:Parameter Name="StdTime" Type="Int32" />
                    <asp:Parameter Name="ActivityType" Type="Int32" />
                    <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                    <asp:Parameter Name="FormatLongDescription" Type="String" />
                    <asp:Parameter Name="Original_FormatID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="locid" PropertyName="Text" 
                        Type="Int32" />
                    <asp:Parameter DefaultValue="2" Name="activityType" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="FormatDesc" Type="String" />
                    <asp:Parameter Name="LocID" Type="Int32" />
                    <asp:Parameter Name="OperationRatePerMin" Type="Decimal" />
                    <asp:Parameter Name="OperatiionRateBatch" Type="Decimal" />
                    <asp:Parameter Name="FormatEnabled" Type="Boolean" />
                    <asp:Parameter Name="StdPersonnel" Type="Int32" />
                    <asp:Parameter Name="StdTime" Type="Int32" />
                    <asp:Parameter Name="ActivityType" Type="Int32" />
                    <asp:Parameter Name="outputMultiplier" Type="Decimal" />
                    <asp:Parameter Name="FormatLongDescription" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
        </ItemTemplate>
    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    
        
        
        <asp:ObjectDataSource ID="odsLocations" runat="server" DeleteMethod="Delete" 
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
    
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <p>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </p>

</asp:Content>

