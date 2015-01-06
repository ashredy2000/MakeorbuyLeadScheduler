<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="FFELeadFollowup.aspx.cs" Inherits="MakeorbuyLeadScheduler.FFE.FFELeadFollowup" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style11
        {
            height: 22px;
        }
        .style12
        {
            height: 22px;
            width: 20px;
        }
        .style13
        {
            width: 20px;
        }
        .style14
        {
            width: 510px;
        }
        .style15
        {
            height: 22px;
            width: 510px;
        }
        .style16
        {
            width: 53px;
        }
        .style17
        {
            height: 22px;
            width: 53px;
        }
     .dhtmlgoodies_contentBox{
		border:1px solid #317082;
		height:0px;
		visibility:hidden;
		position:absolute;
		background-color:#E2EBED;
		overflow:hidden;
		padding:2px;
		width:250px;
				
	}
	.dhtmlgoodies_content{
		position:relative;		
		font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;
		width:100%;
		font-size:0.8em;
		
	}
	  .a3
        {
            font-family:Verdana;    
    font-size:medium;
   color:#6f6f6f;   
    text-decoration:none;
    
    
        }
        .a3:hover
        {
            text-decoration:underline;
        }
	
        #dhtmlgoodies_control
    {
        height: 22px;
    }
	
        </style>
      <script type="text/javascript">
          /************************************************************************************************************
          (C) www.dhtmlgoodies.com, September 2005
	
          This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.	
	
          Terms of use:
          See http://www.dhtmlgoodies.com/index.html?page=termsOfUse
	
          Thank you!
	
          www.dhtmlgoodies.com
          Alf Magne Kalleland
	
          ************************************************************************************************************/

          var slideDownInitHeight = new Array();
          var slidedown_direction = new Array();

          var slidedownActive = false;
          var contentHeight = false;
          var slidedownSpeed = 3; 	// Higher value = faster script
          var slidedownTimer = 7; // Lower value = faster script
          function slidedown_showHide(boxId) {
              if (!slidedown_direction[boxId]) slidedown_direction[boxId] = 1;
              if (!slideDownInitHeight[boxId]) slideDownInitHeight[boxId] = 0;

              if (slideDownInitHeight[boxId] == 0) slidedown_direction[boxId] = slidedownSpeed; else slidedown_direction[boxId] = slidedownSpeed * -1;

              slidedownContentBox = document.getElementById(boxId);
              var subDivs = slidedownContentBox.getElementsByTagName('DIV');
              for (var no = 0; no < subDivs.length; no++) {
                  if (subDivs[no].className == 'dhtmlgoodies_content') slidedownContent = subDivs[no];
              }

              contentHeight = slidedownContent.offsetHeight;

              slidedownContentBox.style.visibility = 'visible';
              slidedownActive = true;
              slidedown_showHide_start(slidedownContentBox, slidedownContent);
          }
          function slidedown_showHide_start(slidedownContentBox, slidedownContent) {

              if (!slidedownActive) return;
              slideDownInitHeight[slidedownContentBox.id] = slideDownInitHeight[slidedownContentBox.id] / 1 + slidedown_direction[slidedownContentBox.id];
              if (slideDownInitHeight[slidedownContentBox.id] <= 0) {
                  slidedownActive = false;
                  slidedownContentBox.style.visibility = 'hidden';
                  slideDownInitHeight[slidedownContentBox.id] = 0;
              }
              if (slideDownInitHeight[slidedownContentBox.id] > contentHeight) {
                  slidedownActive = false;
              }
              slidedownContentBox.style.height = slideDownInitHeight[slidedownContentBox.id] + 'px';
              slidedownContent.style.top = slideDownInitHeight[slidedownContentBox.id] - contentHeight + 'px';

              setTimeout('slidedown_showHide_start(document.getElementById("' + slidedownContentBox.id + '"),document.getElementById("' + slidedownContent.id + '"))', slidedownTimer); // Choose a lower value than 10 to make the script move faster
          }

          function setSlideDownSpeed(newSpeed) {
              slidedownSpeed = newSpeed;

          }
	</script>	
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
                  window.location = "FFELeadFollowup.aspx";
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
                                    Text="FFE Leads Follow Up"></asp:Label>
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
        ServiceMethod="BindClientNamedropdownF" ServicePath="LeadWebservice.asmx">
       </ajax:CascadingDropDown><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddl_clientname" CssClass="style34" 
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                            ValidationGroup="submit">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="style108">
                                                <asp:LinkButton ID="LinkButton4" runat="server" 
                                                    PostBackUrl="~/Pages/FFELeadHistory.aspx">History</asp:LinkButton>
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
                            <asp:Label ID="Label55" runat="server" CssClass="lblstyle" 
                                Text="Company Name" Visible="False"></asp:Label>
                            </strong>
                            </td>
                            <td colspan="2" align="left">
                            <strong>
                            <asp:Label ID="lbl_companyname" runat="server" CssClass="lblstyle" Visible="False"></asp:Label>
                            </strong>
                            </td>
                            <td>
                                &nbsp;</td>
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
                                <asp:DropDownList ID="ddl_nextfollowup" runat="server" Width="150px">
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
                                    placeholder="dd/mm/yyyy"            ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
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
                            <td align="center">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                                    onclientclick="return confirmsubmit();" onclick="btn_submit_Click" 
                                    ValidationGroup="submit" />
                            </td>
                            <td align="left" colspan="2">
                                &nbsp;</td>
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
                                <div id="dhtmlgoodies_control" class="linkbuttonstyle"><a href="#"  
                               onclick="slidedown_showHide('box1');return false;" class="a3">Final Follow up</a></div>
	<!--<div class="dhtmlgoodies_contentBox" id="box1">
		<div class="dhtmlgoodies_content" id="subBox1">
			
			 slide down content goes here -->
              <table align="left" style="width: 994px">
                                    <tr>
                                        <td class="style12">
                                            &nbsp;</td>
                                        <td class="style14">
                                            &nbsp;</td>
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
        ServiceMethod="BindClientNamedropdownF2" ServicePath="LeadWebservice.asmx">
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
                ServiceMethod="BindLeadNodropdownF2" ServicePath="LeadWebservice.asmx">
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
                                </table>
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

