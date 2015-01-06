using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeorbuyLeadScheduler.Pages
{
    public partial class Lead_Status_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}