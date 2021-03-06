﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PrefabLeadSummary.aspx.cs" Inherits="MakeorbuyLeadScheduler.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll();
    });
    function gridviewScroll() {
        $('#<%=GridView1.ClientID%>').gridviewScroll({
            width: 1000,
            height:5000
        });
    } 
     
</script>
    <div id="childdiv">   
<table align="center" class="tablestyle" >
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="2">
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
                                    Text="Prefab Leads Report"></asp:Label>
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
                                    AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditButton="True" 
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="4" 
                                    ForeColor="Black" GridLines="Vertical" Width="900px" 
                                    onrowcancelingedit="GridView1_RowCancelingEdit" 
                                    onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
                                    onsorting="GridView1_Sorting">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Lead No" HeaderText="Lead No" 
                                            SortExpression="Lead No" ReadOnly="True" />
                                        <asp:BoundField DataField="Lead Date" HeaderText="Lead Date" 
                                            SortExpression="Lead Date" ReadOnly="True" />
                                        <asp:BoundField DataField="Client Name" HeaderText="Client Name" 
                                            SortExpression="Client Name" ReadOnly="True" />
                                        <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" 
                                            ReadOnly="True" SortExpression="ProjectName" />
                                        <asp:BoundField DataField="Company Name" HeaderText="Company Name" 
                                            SortExpression="Company Name" ReadOnly="True" />
                                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                        <asp:BoundField DataField="ContactPerson" HeaderText="ContactPerson" />
                                        <asp:BoundField DataField="Mobile Number" HeaderText="Mobile Number" SortExpression="Mobile Number" />
                                        <asp:BoundField DataField="Land Line Number" HeaderText="Land Line Number" SortExpression="Land Line Number" />
                                        <asp:BoundField DataField="Email ID" HeaderText="Email ID" SortExpression="Email ID" />
                                        <asp:BoundField DataField="Descripton" HeaderText="Descripton" SortExpression="Descripton" />
                                        <asp:BoundField DataField="Costruction Start Date" HeaderText="Costruction Start Date" SortExpression="Costruction Start Date" />
                                        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                        <asp:BoundField DataField="Owned By" HeaderText="Owned By" SortExpression="Owned By" ReadOnly="True" />
                                        
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
                                <asp:Button ID="btn_update" runat="server" onclick="btn_update_Click" 
                                    Text="Update to Database" Visible="False" />
                            </td>
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
    </div>
</asp:Content>
