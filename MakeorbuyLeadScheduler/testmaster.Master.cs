using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeorbuyLeadScheduler
{
    public partial class testmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //expose controls on master page as public properties
        public TextBox PropertyMasterTextBox1
        {
            get { return txtMasterBox1; }
            set { txtMasterBox1 = value; }
        }
        //public TextBox PropertyMasterTextBox2
        //{
        //    get { return txtMasterBox2; }
        //    set { txtMasterBox2 = value; }
        //}
        public Button PropertyMasterButton1
        {
            get { return btnMasterButton1; }
        }
        //public Button PropertyMasterButton2
        //{
        //    get { return btnMasterButton2; }
        //}
        //expose public methods on master page for content page to call
        public void SetMasterBox1Value(string myText)
        {
            txtMasterBox1.Text = myText;
        }
        public string GetMasterbox1Value()
        {
            return txtMasterBox1.Text;
        }

        protected void btnMasterButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage.aspx?id=" + txtMasterBox1.Text);
        }
        //public void SetMasterBox2Value(string myText)
        //{
        //    txtMasterBox2.Text = myText;
        //}
        //public string GetMasterBox2Value()
        //{
        //    return txtMasterBox2.Text;
        //}
    }
}