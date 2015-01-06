<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="FFEDocumentSubmission.aspx.cs" Inherits="MakeorbuyLeadScheduler.Pages.DocumentSubmitEntry" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" language="JavaScript">
    $(function () {
        $("#txt_date").datepicker({ dateFormat: 'dd/mm/yy', maxDate: new Date, minDate: new Date(1990, 6, 12) });
        
    });
          </script>
          <script type="text/javascript" language="JavaScript">
              function confirmmessage() {
                  alert('Data Successfully updated');
                  window.location = "PrefabDocSubmission.aspx";
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
              function alertmessage() {
                  alert('Sender name is required!!!');
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
                                    Text="Document Submission"></asp:Label>
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
                                 <asp:DropDownList ID="ddl_clientname" runat="server" Width="248px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ClientNameCascading" runat="server" Category="ClientName"
        TargetControlID="ddl_clientname" LoadingText="Loading Client Name..." PromptText="Select" 
        ServiceMethod="BindClientNamedropdownF" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddl_clientname" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="style108">
                                                &nbsp;</td>
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
                                <asp:DropDownList ID="ddl_leadno" runat="server" Width="248px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ddlLeadNoCascading" runat="server" 
                Category="storey" TargetControlID="ddl_leadno" ParentControlID="ddl_clientname"
                LoadingText="Loading Lead No..." PromptText="Select" 
                ServiceMethod="BindLeadNodropdownF" ServicePath="LeadWebservice.asmx">
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
                            <td>
                                &nbsp;</td>
                            <td align="left">
                            <strong>
                            <asp:Label ID="Label71" runat="server" CssClass="lblstyle" 
                                Text="Doc No"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="txt_docno" runat="server" Width="250px" CssClass="textboxstyle" 
                                                ClientIDMode="Static"></asp:TextBox>
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
                                Text="Doc Name"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                                <asp:TextBox ID="txt_docname" runat="server" Width="250px" CssClass="textboxstyle" 
                                                ClientIDMode="Static"></asp:TextBox>
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
                                Text="Date of Submission"></asp:Label>
                            </strong>
                                        </td>
                            <td colspan="2" class="style107" align="left">
                                <asp:TextBox ID="txt_date" runat="server" Width="250px" CssClass="textboxstyle" 
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
                            <asp:Label ID="Label76" runat="server" CssClass="lblstyle" 
                                Text="Vide"></asp:Label>
                            </strong>
                            </td>
                            <td class="style106" colspan="2" align="left">
                                <asp:DropDownList ID="ddl_vide" runat="server" 
                                    Width="248px">
                                    <asp:ListItem>Email</asp:ListItem>
                                    <asp:ListItem>Courier</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td class="style106">
                                &nbsp;</td>
                            <td class="style106" align="left">
                            <strong>
                            <asp:Label ID="Label77" runat="server" CssClass="lblstyle" 
                                Text="From Whom (If Email )"></asp:Label>
                            </strong>
                            </td>
                            <td class="style106" colspan="2" align="left">
                                <asp:TextBox ID="txt_fromwhom" runat="server" Width="250px" CssClass="textboxstyle" 
                                                ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
                            </td>
                            <td class="style106">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style106">
                                </td>
                            <td class="style106" align="left">
                                &nbsp;</td>
                            <td class="style106" colspan="2" align="left">
                                &nbsp;</td>
                            <td class="style106">
                                </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="3">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                                    onclientclick="return confirmsubmit();" onclick="btn_submit_Click" 
                                    ValidationGroup="submit" />
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
                            <td align="center" class="style11">
                                </td>
                            <td align="left" colspan="3">
	<!--<div class="dhtmlgoodies_contentBox" id="box1">
		<div class="dhtmlgoodies_content" id="subBox1">
			
			 slide down content goes here -->
                          <!-- End slide down content -->
		<!--</div>
	</div>

<script type="text/javascript">
    setSlideDownSpeed(4);
</script>-->
               
            </td>
                            <td align="center" class="style11">
                                </td>
                        </tr>
                        <tr>
                            <td align="center" class="style11" colspan="5">
                              
                                </td>
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
                        </table>
                        </div>
</asp:Content>
