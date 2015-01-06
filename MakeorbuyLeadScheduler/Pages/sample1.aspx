<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample1.aspx.cs" Inherits="MakeorbuyLeadScheduler.sample1" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Static">1234</asp:TextBox>
    <table id="tableContent" border="1" runat="server"></table>
   
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
   
        
  <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">

</ajax:ToolkitScriptManager>  
   
        <br/>
        <ajax:ComboBox ID="ddl_projname" runat="server" AutoCompleteMode="SuggestAppend" 
            AutoPostBack="True" CaseSensitive="False" ClientIDMode="Static" 
            CssClass="dropdownstyle" DropDownStyle="DropDownList" 
            ListItemHoverCssClass="ComboBoxListItemHover" MaxLength="250" 
            servicemethod="BindClientNamedropdownF" servicepath="LeadWebservice.asmx" 
            ToolTip="Project Name">
       </ajax:ComboBox>
         
      <asp:DropDownList ID="ddl_clientname" runat="server" Width="150px"></asp:DropDownList>
       <ajax:CascadingDropDown ID="ClientNameCascading" runat="server" Category="ClientName"
        TargetControlID="ddl_clientname" LoadingText="Loading Client Name..." PromptText="Select" 
        ServiceMethod="BindClientNamedropdownF" ServicePath="LeadWebservice.asmx">
   </ajax:CascadingDropDown>

        <
    &nbsp;
   
    </div>
    </form>
</body>
</html>
