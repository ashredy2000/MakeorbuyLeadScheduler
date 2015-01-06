<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample2.aspx.cs" Inherits="MakeorbuyLeadScheduler.sample2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                   <asp:TemplateField HeaderText="AMT">
                        <ItemTemplate>
                        <asp:Label ID="lbl_amt" runat="server" Text="1"   ToolTip="Amount"></asp:Label>                            
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Right" />
                        <FooterTemplate>
                            <asp:Label ID="lblsum" runat="server" Text=""   />
                        </FooterTemplate>
                         </asp:TemplateField>
                    <asp:TemplateField HeaderText="VAL">
                        <ItemTemplate>
                        <asp:TextBox ID="txt_spec" runat="server"   ToolTip="Value"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txt_spec"
                                ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Right" />
                        <FooterTemplate>
                            <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" ValidationGroup="submit" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" />
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
        </p>
        <div id="boxId">
                                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Button" />
                                    <br />
                                    <asp:GridView ID="GridView2" runat="server">
                                    </asp:GridView>
                                    <br />
                                    </div></div>
    </form>
</body>
</html>
