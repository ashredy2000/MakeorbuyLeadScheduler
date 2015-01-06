using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeorbuyLeadScheduler
{
    public partial class ContentPage : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            Master.PropertyMasterButton1.Click += new EventHandler(PropertyMasterButton1_Click);
            ////Master.PropertyMasterButton2.Click += new EventHandler(PropertyMasterButton2_Click);
        }
        //Send text from Master Box 1 to Content Box 1
        protected void PropertyMasterButton1_Click(object sender, EventArgs e)
        {
            //use one of the options below
            //option 1. use master page public property
            txtContentBox1.Text = Master.PropertyMasterTextBox1.Text;

            //option 2. Call master page method
            txtContentBox1.Text = Master.GetMasterbox1Value();

            //option 3. use FindControl() method of Master object
            txtContentBox1.Text = ((TextBox)Master.FindControl("txtMasterBox1")).Text;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["id"];
            txtContentBox1.Text = id;
        }
    }
}