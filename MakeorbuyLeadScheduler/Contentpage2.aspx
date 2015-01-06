<%@ Page Title="" Language="C#" MasterPageFile="~/testmaster.Master" AutoEventWireup="true" CodeBehind="Contentpage2.aspx.cs" Inherits="MakeorbuyLeadScheduler.Contentpage2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>  
<script type="text/javascript">
    $(document).ready(function () {
        SearchText1();
    });
    function SearchText1() {
        $('#<%=textbox1.ClientID%>').autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "WebService1.asmx/GetAutoCompleteData",
                    data: "{'username':'" + request.term + "'}",
                    dataType: "json",
                    success: function (result) {
                        response(result.d);
                    },
                    error: function (result) {
                        
                    }
                });
            }
        });
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:TextBox ID="textbox1" runat="server" class="autosuggest" 
        ClientIDMode="Static" />
<br />
<asp:Button ID="btnadd" runat="server" Text="content1"  onclick="btnadd_Click" />
</asp:Content>
