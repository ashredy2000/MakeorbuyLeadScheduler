<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="RetailHosingLeadHistory.aspx.cs" Inherits="MakeorbuyLeadScheduler.Retail_Housing.RetailHosingLeadHistory" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        gridviewScroll();
    });
    function gridviewScroll() {
        $('#<%=GridView1.ClientID%>').gridviewScroll({
            width: 1000
        });
    }
    function alertmessage() {
        alert('No Data Found');
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
                            <td align="center" class="style103">
                                </td>
                            <td align="center" colspan="2" class="style103">
                    <asp:Label ID="Label1" runat="server" 
                        style="font-size: xx-large; font-family: Verdana; color: #6f6f6f;" 
                                    Text="Retail Housing Leads History"></asp:Label>
                            </td>
                            <td align="center" class="style103">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

</ajax:ToolkitScriptManager> &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label65" runat="server" style="font-size: small" 
                                                Text="Client Name"></asp:Label>
                                        </td>
                                        <td>
                                       
                                              <asp:DropDownList ID="ddl_clientname" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ClientNameCascading" runat="server" Category="ClientName"
        TargetControlID="ddl_clientname" LoadingText="Loading Client Name..." PromptText="Select" 
        ServiceMethod="BindClientNamedropdownR" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddl_clientname" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label66" runat="server" style="font-size: small" Text="Lead No"></asp:Label>
                                        </td>
                                        <td>
                                             <asp:DropDownList ID="ddl_leadno" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ddlLeadNoCascading" runat="server" 
                Category="storey" TargetControlID="ddl_leadno" ParentControlID="ddl_clientname"
                LoadingText="Loading Lead No..." PromptText="Select" 
                ServiceMethod="BindLeadNodropdownR" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="ddl_leadno" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_view" runat="server" onclick="btn_view_Click" Text="View" 
                                                ValidationGroup="submit" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
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
                                    CellPadding="4" ForeColor="Black" GridLines="Vertical" Visible="False" 
                                    HorizontalAlign="Left" Caption="Follow up History" CaptionAlign="Top">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Date of Follow Up" HeaderText="Date of Follow Up" />
                                        <asp:BoundField DataField="Follow Up By" HeaderText="Follow Up By" />
                                        <asp:BoundField DataField="Follow Up Type" HeaderText="Follow Up Type" />
                                        <asp:BoundField DataField="Point To Note / MOM" 
                                            HeaderText="Point To Note / MOM" />
                                        <asp:BoundField DataField="Next Follow Up Type" 
                                            HeaderText="Next Follow Up Type" />
                                        <asp:BoundField DataField="Next Follow Up Date" 
                                            HeaderText="Next Follow Up Date" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" HorizontalAlign="Left" VerticalAlign="Top" />
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
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="2">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                    Caption="Details of Document Submission" CaptionAlign="Top" CellPadding="4" 
                                    ForeColor="Black" GridLines="Vertical" Visible="False">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Doc No" HeaderText="Doc No" />
                                        <asp:BoundField DataField="Doc Name" HeaderText="Doc Name" />
                                        <asp:BoundField DataField="Date of Submission" 
                                            HeaderText="Date of Submission" />
                                        <asp:BoundField DataField="Vide" HeaderText="Vide" />
                                        <asp:BoundField DataField="From Whom" HeaderText="From Whom (if Email)" />
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
                                </asp:GridView>&nbsp;</td>
                            <td align="center">
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
                    </table></div>
</asp:Content>


