﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="MakeorbuyLeadScheduler.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AutoComplete Box with jQuery</title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>  
	<script type="text/javascript">
	    $(document).ready(function () {
	        SearchText();
	    });
	    function SearchText() {
	        $(".autosuggest").autocomplete({
	            source: function (request, response) {
	                $.ajax({
	                    type: "POST",
	                    contentType: "application/json; charset=utf-8",
	                    url: "Default.aspx/GetAutoCompleteData",
	                    data: "{'username':'" + document.getElementById('txtSearch').value + "'}",
	                    dataType: "json",
	                    success: function (data) {
	                        response(data.d);
	                    },
	                    error: function (result) {
	                        alert("Error");
	                    }
	                });
	            }
	        });
	    }
	</script>
</head>
<body>
    <form id="form1" runat="server">
   <div class="demo">
<div class="ui-widget">
    <label for="tbAuto">Enter UserName: </label>
   <input type="text" id="txtSearch" class="autosuggest" />
</div>
    </form>
</body>
</html>

</asp:Content>
