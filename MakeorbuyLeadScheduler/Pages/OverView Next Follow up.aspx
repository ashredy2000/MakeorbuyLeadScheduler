<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OverView Next Follow up.aspx.cs" Inherits="MakeorbuyLeadScheduler.Pages.OverView_Next_Follow_up" %>
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
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="4" 
                                    ForeColor="Black" GridLines="Vertical" Width="900px" 
                                    DataSourceID="SqlDataSource1">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Sl_No" HeaderText="Sl No" InsertVisible="False" 
                                            SortExpression="Sl_No" />
                                        <asp:BoundField DataField="ClientName" HeaderText="Client Name" 
                                            SortExpression="ClientName" />
                                        <asp:BoundField DataField="LeadNo" HeaderText="Lead No" 
                                            SortExpression="LeadNo" />
                                        <asp:BoundField DataField="Catagory" HeaderText="Catagory" 
                                            SortExpression="Catagory" />
                                        <asp:BoundField DataField="Date_ofEntry" DataFormatString="{0:d}" 
                                            HeaderText="Date of Entry" SortExpression="Date_ofEntry" />
                                        <asp:BoundField DataField="NextFollowUpType" HeaderText="Next Followup Type" 
                                            SortExpression="NextFollowUpType" />
                                        
                                        <asp:BoundField DataField="NextFollowUp_Date" HeaderText="Next Follow up Date" 
                                            DataFormatString="{0:d}" SortExpression="NextFollowUp_Date" />
                                        
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
                                    SelectCommand="SELECT Sl_No, ClientName, CompanyName, LeadNo, NextFollowUp_Date, NextFollowUpType, Catagory, Date_ofEntry FROM makeorbuy.Mob_Lead_FollowUp">
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

