<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="MakeorbuyLeadScheduler.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    var pagePath = window.location.pathname;
    $(function () {

        $("#" + "<%=txtCountry.ClientID %>").autocomplete(
                     {
                         source: function (request, response) {

                             $.ajax({
                                 url: pagePath + "/GetCountry",
                                 data: "{ 'id': '" + request.term + "'}",
                                 dataType: "json",
                                 type: "POST",
                                 contentType: "application/json; charset=utf-8",
                                 dataFilter: function (data) { return data; },
                                 success: function (data) {

                                     if (data.d.length == 0)
                                         $("#spCountry").show();
                                     else
                                         $("#spCountry").hide();

                                     response($.map(data.d, function (item) {
                                         {
                                             value = item.Name + " : " + item.ID;
                                             return value;
                                         }
                                     }))
                                 },
                                 error: function (XMLHttpRequest, callStatus, errorThrown) {
                                     //alert(callStatus);
                                 }
                             });
                         },
                         minLength: 1,
                         select: function (event, ui) {
                             var str = ui.item.label.split(":");
                             $("#" + "<%=txtCountry.ClientID %>").val(str[0]);
                             $("#" + "<%=txtCountryID.ClientID %>").val(str[1]);
                             $("#" + "<%=btnCountry.ClientID %>").click();
                         }
                     });
    });

    $(function () {
        $("#" + "<%=txtState.ClientID %>").autocomplete(
                              {
                                  source: function (request, response) {

                                      $.ajax({
                                          url: pagePath + "/GetState",
                                          data: "{ 'id': '" + request.term + "','country' :' " + $("#" + "<%=txtCountryID.ClientID %>").val() + "'}",
                                          dataType: "json",
                                          type: "POST",
                                          contentType: "application/json; charset=utf-8",
                                          dataFilter: function (data) { return data; },
                                          success: function (data) {

                                              if (data.d.length == 0)
                                                  $("#spState").show();
                                              else
                                                  $("#spState").hide();
                                              response($.map(data.d, function (item) {
                                                  {
                                                      value = item.Name + " : " + item.ID;
                                                      return value;
                                                  }
                                              }))
                                          },
                                          error: function (XMLHttpRequest, callStatus, errorThrown) {
                                              //                             alert(callStatus);
                                          }
                                      });
                                  },
                                  minLength: 1,
                                  select: function (event, ui) {
                                      var str = ui.item.label.split(":");
                                      $("#" + "<%=txtState.ClientID %>").val(str[0]);
                                      $("#" + "<%=txtStateID.ClientID %>").val(str[1]);
                                      $("#" + "<%=btnState.ClientID %>").click();
                                  }
                              });
    });

    $(function () {
        $("#" + "<%=txtCity.ClientID %>").autocomplete(
                                       {
                                           source: function (request, response) {

                                               $.ajax({
                                                   url: pagePath + "/GetCity",
                                                   data: "{ 'id': '" + request.term + "','state' :' " + $("#" + "<%=txtStateID.ClientID %>").val() + "'}",
                                                   dataType: "json",
                                                   type: "POST",
                                                   contentType: "application/json; charset=utf-8",
                                                   dataFilter: function (data) { return data; },
                                                   success: function (data) {

                                                       if (data.d.length == 0)
                                                           $("#spCity").show();
                                                       else
                                                           $("#spCity").hide();
                                                       response($.map(data.d, function (item) {
                                                           {
                                                               value = item.Name + " : " + item.ID;
                                                               return value;
                                                           }
                                                       }))
                                                   },
                                                   error: function (XMLHttpRequest, callStatus, errorThrown) {
                                                       //                             alert(callStatus);
                                                   }
                                               });
                                           },
                                           minLength: 1,
                                           select: function (event, ui) {
                                               var str = ui.item.label.split(":");
                                               $("#" + "<%=txtCity.ClientID %>").val(str[0]);
                                               $("#" + "<%=txtCityID.ClientID %>").val(str[1]);
                                               $("#" + "<%=btnCity.ClientID %>").click();
                                           }
                                       });
    });

    function Validate() {
        var retVal = true;
        if ($("#spCountry").is(":visible") ||
            $("#spSatate").is(":visible") ||
            $("#spCity").is(":visible"))
            retVal = false;
        if ($("#" + "").val() == "" ||
         $("#" + "").val() == "" ||
         $("#" + "").val() == "")
            retVal = false;
        if (!retVal)
            alert("Enter Valid Data");
        return retVal;
    }


    </script>


    <div id="dvManualAdjustmentPreparer" style="width: 100%;">
        <fieldset>
            <legend>Search</legend>
            <table style="font-size: 10px; background: #F2F2F2; width: 90%">
               
                
                <tr runat="server" id="trCountry" visible="true">
                    <td>
                        <asp:Label runat="server" ID="lblCountry" Text="Select Country" Width="150px"></asp:Label>
                    </td>
                    <td>
                        <div style="float: left;">
                            <asp:TextBox ID="txtCountry" runat="server" Width="250px" Font-Size="10px" class="autosuggest" />
                            <span id="spCountry" style="display:none;color:Red;">No Data Found</span>
                            <div style="display: none">
                            <asp:Button ID="btnCountry" runat="server" Width="250px" Font-Size="10px" OnClick="btnCountry_Click" />
                            <asp:TextBox  ID="txtCountryID" runat="server"  />
                        </div>
                        </div>             
                    </td>
                </tr>
                
                <tr runat="server" id="trState" visible="false">
                    <td style="width: 20%">
                        <asp:Label runat="server" ID="lblState" Text="Select State" Width="150px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server" Width="250px" Font-Size="10px" class="autosuggest" />
			<span id="spState" style="display:none;color:Red;">No Data Found</span> 
                       <div style="display: none">
                            <asp:Button ID="btnState" runat="server" Width="250px" Font-Size="10px" OnClick="btnState_Click" />
                            <asp:TextBox  ID="txtStateID" runat="server"  />
                        </div>
                    </td>
                </tr>
                
                <tr runat="server" id="trCity" visible="false">
                    <td style="width: 20%">
                        <asp:Label runat="server" ID="lblCity" Text="Select City" Width="150px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Width="250px" Font-Size="10px" class="autosuggest" />
                	<span id="spCity" style="display:none;color:Red;">No Data Found</span>     
                 <div id="divSerach" runat="server" style="display: none">
                            <asp:Button ID="imgbtnSearchByNettingSet" Text="Search"
                                Height="20px" runat="server" OnClick="btnSearch_Click" OnClientClick="return Validate();"  />
                              
                        </div>
                        <div style="display: none">
                        <asp:Button ID="btnCity" runat="server" Width="250px" Font-Size="10px" OnClick="btnCity_Click" />
                           
                          <asp:TextBox  ID="txtCityID" runat="server"  />
                        </div>
                    </td>
                </tr>
                
                
            </table>
        </fieldset>
        <div style="padding-top: 5px;">
            &nbsp;</div>
 
                <div style="padding-top: 5px;">
                    &nbsp;</div>
                <div id="divGridSection2Container" style="width: 100%; height: 400px; overflow-x: hidden;
                    overflow: auto;">
                    <asp:GridView ID="GridViewNotional" runat="server" AutoGenerateColumns="true" AlternatingRowStyle-CssClass="altRowStyle"
                        RowStyle-CssClass="rowStyle" BorderWidth="2px" Width="98%" GridLines="Both">
                        <HeaderStyle BackColor="#E5EBF2" Font-Bold="True" />
             
                    </asp:GridView>
                </div>
   
    </div>
</asp:Content>
