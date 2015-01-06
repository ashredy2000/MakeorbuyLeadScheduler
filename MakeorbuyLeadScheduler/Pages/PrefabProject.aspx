<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage2.Master" AutoEventWireup="true" CodeBehind="PrefabProject.aspx.cs" Inherits="MakeorbuyLeadScheduler.Pages.PrefabProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
        .style8
        {
            height: 22px;
        }
    .style10
    {
        height: 22px;
    }
    .style11
    {
        height: 30px;
    }
    .style12
    {
        height: 29px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" language="JavaScript">
    $(function () {
        $("#txt_date").datepicker({ dateFormat: 'dd/mm/yy', maxDate: new Date, minDate: new Date(1990, 6, 12) });
        $("#txt_startdate").datepicker({ dateFormat: 'dd/mm/yy', minDate: new Date(1990, 6, 12) });
    });
          </script>
          <script type="text/javascript" language="JavaScript">
              function confirmmessage() {
                  alert('Data Successfully updated');
                  window.location = "PrefabLeadEntry.aspx";
              }
              function confirmsubmit() {
                  var yes = window.confirm("Your data is ready for submission!!,Click ok to continue");
                  if (yes) {
                      return true;
                  }
                  else {
                      return false;
                  }
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
                                    Text="Project Details"></asp:Label>
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
                            <td>
                                &nbsp;</td>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td align="left">
                            <strong>
                            <asp:Label ID="Label52" runat="server" CssClass="lblstyle" 
                                Text="Project No"></asp:Label>
                            </strong>
                                        </td>
                                        <td align="left">
                            <strong>
                            <asp:Label ID="lbl_slNo" runat="server" CssClass="lblstyle"></asp:Label>
                            </strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table align="right">
                                    <tr>
                                        <td>
                            <strong>
                            <asp:Label ID="Label53" runat="server" CssClass="lblstyle" 
                                Text="Date"></asp:Label>
                            </strong>
                                        </td>
                                        <td>
                                <asp:TextBox ID="txt_date" runat="server" Width="150px" CssClass="textboxstyle" 
                                                ClientIDMode="Static" AutoPostBack="True" placeholder="dd/mm/yyyy"
                                                ontextchanged="txt_date_TextChanged"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txt_date" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                </td>
                            <td class="style10">
                                </td>
                            <td class="style10">
                                </td>
                            <td class="style10">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label66" runat="server" CssClass="lblstyle" 
                                Text="Project Name"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="lbl_projname" runat="server" CssClass="lblstyle"></asp:Label>
                            </strong>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label61" runat="server" CssClass="lblstyle" 
                                Text="Description of Project"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_Descr" runat="server" Width="350px" TextMode="MultiLine" 
                                    CssClass="textboxstyle"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_Descr" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style12">
                                </td>
                            <td align="left" class="style12">
                            <strong>
                            <asp:Label ID="Label54" runat="server" CssClass="lblstyle" 
                                Text="Start Date"></asp:Label>
                            </strong>
                            </td>
                            <td align="left" class="style12">
                                <asp:TextBox ID="txt_startdate" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_startdate" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="style12">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label68" runat="server" CssClass="lblstyle" 
                                Text="End Date"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_enddate" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txt_enddate" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                </td>
                            <td align="left" class="style10">
                                </td>
                            <td align="left" class="style10">
                                </td>
                            <td class="style10">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label55" runat="server" CssClass="lblstyle" 
                                Text="Payments Terms"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_companyname" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style10">
                                </td>
                            <td align="left" class="style10">
                                </td>
                            <td align="left" class="style10">
                                </td>
                            <td class="style10">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label56" runat="server" CssClass="lblstyle" 
                                Text="Other Terms and Conditions"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_location" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="height: 22px">
                                </td>
                            <td align="left" style="height: 22px">
                                </td>
                            <td align="left" style="height: 22px">
                                </td>
                            <td style="height: 22px">
                                </td>
                        </tr>
                        <tr>
                            <td align="center" class="style11">
                                </td>
                            <td align="center" colspan="2" class="style11">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                                    onclick="btn_submit_Click" ValidationGroup="submit" 
                                    onclientclick="return confirmsubmit();" />
                            </td>
                            <td align="center" class="style11">
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
