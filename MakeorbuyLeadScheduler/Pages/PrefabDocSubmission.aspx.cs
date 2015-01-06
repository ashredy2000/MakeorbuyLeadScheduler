using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
namespace MakeorbuyLeadScheduler.Pages
{
    public partial class PrefabDocSubmission : System.Web.UI.Page
    {
        DBConnect dba = new DBConnect();
        string EntryBy, EntryTime, submissionDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Submit();
        }
        public String converttodate(DateTime InDate)
        {
            String month, year, day;
            month = InDate.Month.ToString();
            day = InDate.Day.ToString();
            year = InDate.Year.ToString();
            if (month.Length < 2)
            {
                month = "0" + month;
            }
            if (day.Length < 2)
            {
                day = "0" + day;
            }
            return year + "-" + month + "-" + day;
        }


        public void Submit()
        {
            EntryBy = (String)Session["empName"];
            DateTime curdate = DateTime.Now;
            EntryTime = curdate.ToString("yyyy-MM-dd H:mm:ss");
            OdbcConnection MainCon = dba.GeoDBMainCon();
            submissionDate = converttodate(DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", null));
            if (ddl_vide.Text == "Email" && txt_fromwhom.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmessage();", true);
            }
            else
            {
                String StrQuery = "INSERT INTO Mob_Lead_docSubmission(ClientName ,  LeadNo ,DocNo,DocName,  DateofSubmission ,Catagory,  Vide ,  FromWhom ,  EntryBy ,  DateofEntry )  VALUES ('" + ddl_clientname.Text + "', '" + ddl_leadno.Text + "','" + txt_docno.Text + "','" + txt_docname.Text + "','" + submissionDate + "','Prefabs','" + ddl_vide.Text + "','" + txt_fromwhom.Text + "','" + EntryBy + "','" + EntryTime + "')";
                OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, MainCon);
                PQSCommand1.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), null, "confirmmessage();", true);
            }
        }
    }
}