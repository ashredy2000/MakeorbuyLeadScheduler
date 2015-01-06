<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FFELeadEntry.aspx.cs" Inherits="MakeorbuyLeadScheduler.FFE.FFELeadEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                  window.location = "FFELeadEntry.aspx";
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
                        style="font-size: xx-large; font-family: Verdana; color: #6f6f6f;" Text="FFE Leads"></asp:Label>
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
                                Text="SlNo"></asp:Label>
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
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label54" runat="server" CssClass="lblstyle" 
                                Text="Client Name "></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_clientname" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_clientname" CssClass="style34" 
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
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label66" runat="server" CssClass="lblstyle" 
                                Text="Name of Lead"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_enquiryname" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <asp:Label ID="Label55" runat="server" CssClass="lblstyle" 
                                Text="Company Name"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_companyname" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_companyname" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator></td>
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
                            <asp:Label ID="Label56" runat="server" CssClass="lblstyle" 
                                Text="Location"></asp:Label>
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
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label57" runat="server" CssClass="lblstyle" 
                                Text="Address"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_address" runat="server" Width="350px" TextMode="MultiLine" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <asp:Label ID="Label67" runat="server" CssClass="lblstyle" 
                                Text="Contact Person"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_contactperson" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <asp:Label ID="Label58" runat="server" CssClass="lblstyle" 
                                Text="Mobile No"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_mobileno" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="txt_mobileno" ErrorMessage="Only Numbers Permitted" 
                                    Operator="DataTypeCheck" style="color: #FF0000" Type="Integer"></asp:CompareValidator>
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
                            <asp:Label ID="Label59" runat="server" CssClass="lblstyle" 
                                Text="Landline No"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_landline" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToValidate="txt_landline" ErrorMessage="Only Numbers Permitted" 
                                    Operator="DataTypeCheck" style="color: #FF0000" Type="Integer"></asp:CompareValidator>
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
                            <asp:Label ID="Label60" runat="server" CssClass="lblstyle" 
                                Text="Email ID"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_emailid" runat="server" Width="350px" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                                Text="Description of Work"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_Descr" runat="server" Width="350px" TextMode="MultiLine" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <asp:Label ID="Label62" runat="server" CssClass="lblstyle" 
                                Text="Construction Start Date (proposed)"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_startdate" runat="server" Width="150px" placeholder="dd/mm/yyyy"
                                    CssClass="textboxstyle" ClientIDMode="Static"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label63" runat="server" CssClass="lblstyle" 
                                Text="Duration (proposed)"></asp:Label>
                            </strong>
                                        </td>
                            <td align="left">
                                <asp:TextBox ID="txt_duration" runat="server" Width="150px" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <asp:Label ID="Label65" runat="server" CssClass="lblstyle" 
                                Text="Owned By"></asp:Label>
                            </strong>
                                        </td>
                            <td align="left">
                                <asp:TextBox ID="txt_ownedBy" runat="server" Width="150px" 
                                    CssClass="textboxstyle"></asp:TextBox>
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
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="2">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                                    onclick="btn_submit_Click" ValidationGroup="submit" 
                                    onclientclick="return confirmsubmit();" />
                            </td>
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
                    </table>
                    </div>
</asp:Content>

