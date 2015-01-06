<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Lead Status Report.aspx.cs" Inherits="MakeorbuyLeadScheduler.Pages.Lead_Status_Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="childdiv">   
<table align="center" class="tablestyle" >
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="right" colspan="2">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="2">
                    <asp:Label ID="Label1" runat="server" 
                        style="font-size: xx-large; font-family: Verdana; color: #6f6f6f;" 
                                    Text="Leads Status Report"></asp:Label>
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style102">
                                </td>
                            <td class="style102" colspan="2">
                                <asp:GridView ID="GridView1" runat="server" 
                                    AllowSorting="True" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="4" 
                                    ForeColor="Black" GridLines="Vertical" Width="900px" 
                                    DataSourceID="SqlDataSource1">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="SlNo" HeaderText="Sl No" InsertVisible="False" />
                                        <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                                        <asp:BoundField DataField="LeadNo" HeaderText="Lead No" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:BoundField DataField="Catagory" HeaderText="Catagory" />
                                        <asp:BoundField DataField="ReasonforBidding" HeaderText="Reason for Loss" />
                                        
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                             
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:makeorbuyConnectionString %>" 
                                    ProviderName="<%$ ConnectionStrings:makeorbuyConnectionString.ProviderName %>" 
                                    SelectCommand="SELECT SlNo, ClientName, LeadNo, Status, Catagory, ReasonforBidding FROM makeorbuy.LeadStatusReport">
                                </asp:SqlDataSource>
                             
                            </td>
                            <td class="style102">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style103" colspan="4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="2">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
    </div></asp:Content>
