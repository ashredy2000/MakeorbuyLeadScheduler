using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeorbuyLeadScheduler
{
    public partial class Contentpage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //document.getElementById('textbox1').value
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage.aspx?id=" + ((TextBox)Master.FindControl("txtMasterBox1")).Text);
        }
    }
}