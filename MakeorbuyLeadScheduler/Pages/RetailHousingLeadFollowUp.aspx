<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="RetailHousingLeadFollowUp.aspx.cs" Inherits="MakeorbuyLeadScheduler.Retail_Housing.RetailHousingLeadFollowUp" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style8
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" language="JavaScript">
     $(function () {
         $("#txt_date").datepicker({ dateFormat: 'dd/mm/yy', maxDate: new Date, minDate: new Date(1990, 6, 12) });
         $("#txt_followupdate").datepicker({ dateFormat: 'dd/mm/yy', minDate: new Date(1990, 6, 12) });
     });
          </script>
          <script type="text/javascript" language="JavaScript">
              function confirmmessage() {
                  alert('Data Successfully updated');
                  window.location = "RetailHousingLeadFollowUp.aspx";
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
                            <td align="center" colspan="3">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="3">
                    <asp:Label ID="Label1" runat="server" 
                        style="font-size: xx-large; font-family: Verdana; color: #6f6f6f;" 
                                    Text="Retail Housing Leads Follow Up"></asp:Label>
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                 <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

</ajax:ToolkitScriptManager>  &nbsp;</td>
                            <td colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style108">
                                </td>
                            <td class="style108" align="left">
                            <strong>
                            <asp:Label ID="Label52" runat="server" CssClass="lblstyle" 
                                Text="Client Name"></asp:Label>
                            </strong>
                            </td>
                            <td class="style108" align="left">
                                 <asp:DropDownList ID="ddl_clientname" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ClientNameCascading" runat="server" Category="ClientName"
        TargetControlID="ddl_clientname" LoadingText="Loading Client Name..." PromptText="Select" 
        ServiceMethod="BindClientNamedropdownR" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddl_clientname" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="style108">
                                                <asp:LinkButton ID="LinkButton4" runat="server" 
                                                    PostBackUrl="~/Pages/RetailHosingLeadHistory.aspx">History</asp:LinkButton>
                            </td>
                            <td class="style108">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label70" runat="server" CssClass="lblstyle" 
                                Text="Lead No"></asp:Label>
                            </strong>
                            </td>
                            <td align="left">
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
                                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8">
                                </td>
                            <td align="left" class="style8">
                            <strong>
                            <asp:Label ID="Label55" runat="server" CssClass="lblstyle" 
                                Text="Company Name" Visible="False"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left" class="style8">
                            <strong>
                            <asp:Label ID="lbl_companyname" runat="server" CssClass="lblstyle" Visible="False"></asp:Label>
                            </strong>
                            </td>
                            <td class="style8">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                </td>
                            <td class="style106" align="left">
                                FOLLOW UP -1</td>
                            <td class="style106" colspan="2" align="left">
                                </td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                </td>
                            <td class="style106" align="left">
                                </td>
                            <td class="style106" colspan="2" align="left">
                                </td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label71" runat="server" CssClass="lblstyle" 
                                Text="Follow Up By"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="txt_followupby" runat="server" Width="150px" CssClass="textboxstyle" 
                                                ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label66" runat="server" CssClass="lblstyle" 
                                Text="Follow Up Type"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                                <asp:DropDownList ID="ddl_followupbyType" runat="server" 
                                    Width="148px">
                                    <asp:ListItem>Telephone Call</asp:ListItem>
                                    <asp:ListItem>Meeting</asp:ListItem>
                                    <asp:ListItem>Email</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style107">
                                </td>
                            <td class="style107" align="left">
                            <strong>
                            <asp:Label ID="Label53" runat="server" CssClass="lblstyle" 
                                Text="Date"></asp:Label>
                            </strong>
                                        </td>
                            <td colspan="2" class="style107" align="left">
                                <asp:TextBox ID="txt_date" runat="server" Width="150px" CssClass="textboxstyle" 
                                 placeholder="dd/mm/yyyy"               ClientIDMode="Static"></asp:TextBox>
                                        </td>
                            <td class="style107">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                </td>
                            <td class="style106" align="left">
                            <strong>
                            <asp:Label ID="Label62" runat="server" CssClass="lblstyle" 
                                Text="Attachment (if any)"></asp:Label>
                            </strong>
                            </td>
                            <td class="style106" colspan="2" align="left">
                                &nbsp;</td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                &nbsp;</td>
                            <td class="style106" align="left">
                    <asp:FileUpload ID="inpAttachment" runat="server" />

                                <asp:LinkButton ID="lnkbtn_attachment1" runat="server" 
                                    onclick="lnkbtn_attachment1_Click" style="font-size: small">Submit</asp:LinkButton>
                            </td>
                            <td class="style106" colspan="2" align="left">
                            <strong>
                            <asp:Label ID="lbl_attachment1" runat="server" CssClass="lblstyle"></asp:Label>
                            </strong>
                                <asp:LinkButton ID="lnkbtn_attachmentremove1" runat="server" 
                                    onclick="lnkbtn_attachmentremove1_Click" style="font-size: small" 
                                    Visible="False">Remove</asp:LinkButton>
                            </td>
                            <td class="style106">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style106">
                                </td>
                            <td class="style106" align="left">
                    <asp:FileUpload ID="inpAttachment0" runat="server" />

                                <asp:LinkButton ID="lnkbtn_attachment2" runat="server" 
                                    onclick="lnkbtn_attachment2_Click" style="font-size: small">Submit</asp:LinkButton>
                            </td>
                            <td class="style106" colspan="2" align="left">
                            <strong>
                            <asp:Label ID="lbl_attachment2" runat="server" CssClass="lblstyle"></asp:Label>
                            </strong>
                                <asp:LinkButton ID="lnkbtn_attachmentremove2" runat="server" 
                                    onclick="lnkbtn_attachmentremove2_Click" style="font-size: small" 
                                    Visible="False">Remove</asp:LinkButton>
                            </td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                &nbsp;</td>
                            <td class="style106" align="left">
                                &nbsp;</td>
                            <td class="style106" colspan="2" align="left">
                                &nbsp;</td>
                            <td class="style106">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label61" runat="server" CssClass="lblstyle" 
                                Text="Points to Note /MOM"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txt_Descr" runat="server" Width="550px" TextMode="MultiLine" 
                                    CssClass="textboxstyle" Height="151px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td colspan="3" align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" colspan="2">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                Next Follow Up</td>
                            <td colspan="2" align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td colspan="2" align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label69" runat="server" CssClass="lblstyle" 
                                Text="Follow Up Type"></asp:Label>
                            </strong>
                            </td>
                            <td align="left" colspan="2">
                                <asp:DropDownList ID="ddl_nextfollowup" runat="server">
                                    <asp:ListItem>Telephone Call</asp:ListItem>
                                    <asp:ListItem>Meeting</asp:ListItem>
                                    <asp:ListItem>Submission</asp:ListItem>
                                    <asp:ListItem>Negotiation</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label67" runat="server" CssClass="lblstyle" 
                                Text="Date"></asp:Label>
                            </strong>
                                        </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="txt_followupdate" runat="server" Width="150px" CssClass="textboxstyle" 
                                    placeholder="dd/mm/yyyy"            ClientIDMode="Static"></asp:TextBox>
                                        </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label68" runat="server" CssClass="lblstyle" 
                                Text="Set Reminder"></asp:Label>
                            </strong>
                            </td>
                            <td align="left" colspan="2">
                                <asp:RadioButton ID="RadioButton1" runat="server" style="font-size: small" 
                                    Text="Yes" GroupName="Group1" />
                                <asp:RadioButton ID="RadioButton2" runat="server" style="font-size: small" 
                                    Text="No" GroupName="Group1" />
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" colspan="2">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style109" width="70">
                                </td>
                            <td align="left" class="style109" colspan="3">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                                    onclientclick="return confirmsubmit();" onclick="btn_submit_Click" 
                                    ValidationGroup="submit" />
                            </td>
                            <td align="center" class="style109" width="70px">
                                </td>
                        </tr>
                        <tr>
                            <td align="center" class="style109" width="70">
                                &nbsp;</td>
                            <td align="left" class="style109" colspan="3">
                               <table align="left" style="width: 994px">
                                    <tr>
                                        <td class="style12">
                                            &nbsp;</td>
                                        <td class="style14" align="left">
                                            Final Follow Up</td>
                                        <td class="style16">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                            &nbsp;</td>
                                        <td align="left" class="style14">
                            <strong>
                            <asp:Label ID="Label74" runat="server" CssClass="lblstyle" 
                                Text="Client Name"></asp:Label>
                            </strong>
                                        </td>
                                        <td align="left" class="style16">
                                 <asp:DropDownList ID="ddl_clientname0" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ddl_clientname0_CascadingDropDown" runat="server" Category="ClientName"
        TargetControlID="ddl_clientname0" LoadingText="Loading Client Name..." PromptText="Select" 
        ServiceMethod="BindClientNamedropdownR2" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown>
                                        </td>
                                        <td class="style11">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td align="left" class="style14">
                            <strong>
                            <asp:Label ID="Label75" runat="server" CssClass="lblstyle" 
                                Text="Lead No"></asp:Label>
                            </strong>
                                        </td>
                                        <td align="left" class="style16">
                                <asp:DropDownList ID="ddl_leadno0" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ddl_leadno0_CascadingDropDown" runat="server" 
                Category="storey" TargetControlID="ddl_leadno0" ParentControlID="ddl_clientname0"
                LoadingText="Loading Lead No..." PromptText="Select" 
                ServiceMethod="BindLeadNodropdownR2" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown> 
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td align="left" class="style14">
                            <strong>
                            <asp:Label ID="Label73" runat="server" CssClass="lblstyle" 
                                Text="Bidding Strategy"></asp:Label>
                            </strong>
                                        </td>
                                        <td align="left" class="style16">
                                <asp:DropDownList ID="ddl_bidding" runat="server" Width="150px">
                                    <asp:ListItem>Win</asp:ListItem>
                                    <asp:ListItem>Loss</asp:ListItem>
                                </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td align="left" class="style14">
                            <strong>
                            <asp:Label ID="Label72" runat="server" CssClass="lblstyle" 
                                Text="Reason for Drop (if fails)"></asp:Label>
                            </strong>
                                        </td>
                                        <td align="left" class="style16">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td align="left" colspan="2">
                                <asp:TextBox ID="txt_Bidding" runat="server" Width="550px" TextMode="MultiLine" 
                                    CssClass="textboxstyle" Height="151px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style12">
                                        </td>
                                        <td class="style15">
                                        </td>
                                        <td class="style17">
                                        </td>
                                        <td class="style11">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style13">
                                            &nbsp;</td>
                                        <td align="left" colspan="2">
                                <asp:Button ID="btn_submit0" runat="server" Text="Submit" 
                                    onclientclick="return confirmsubmit();" onclick="btn_submit0_Click" 
                                    ValidationGroup="submit" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table></td>
                            <td align="center" class="style109" width="70px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="3">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
</div>
</asp:Content>

