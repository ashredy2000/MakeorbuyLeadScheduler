using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
namespace MakeorbuyLeadScheduler.Retail_Housing
{
    public partial class RetailHosingLeadHistory : System.Web.UI.Page
    {
        DBConnect dba = new DBConnect();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }
            if (!IsPostBack)
            {
                // Gridviewdata();
               //  Gridviewdatadoc();
            }
        }

        public void Gridviewdata()
        {
            dt.Columns.Add("Date of Follow Up");
            dt.Columns.Add("Follow Up By");
            dt.Columns.Add("Follow Up Type");
            dt.Columns.Add("Point To Note / MOM");
            dt.Columns.Add("Next Follow Up Type");
            dt.Columns.Add("Next Follow Up Date");
            Session["dtlead"] = dt;     //Saving Datatable To Session 
        }
        public void Gridviewdatadoc()
        {
            dt1.Columns.Add("Doc No");
            dt1.Columns.Add("Doc Name");
            dt1.Columns.Add("Date of Submission");
            dt1.Columns.Add("Vide");
            dt1.Columns.Add("From Whom");
            Session["dtdoc"] = dt1;     //Saving Datatable To Session 
        }
        protected void btn_view_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            Session["dtlead"] = null;
            Session["dtdoc"] = null;
            //GridView1.DataSource=Session["dtlead"];
            //GridView
            //GridView2.DataSource = Session["dtdoc"];
            Summary();
            DocSummary();
            if (GridView1.Rows.Count > 0)
                GridView1.Visible = true;
            else
                GridView1.Visible = false;
            if (GridView2.Rows.Count > 0)
                GridView2.Visible = true;
            else
                GridView2.Visible = false;
            if (GridView1.Rows.Count == 0 && GridView2.Rows.Count == 0)
                Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmessage();", true);
        }
        public String converttodate(string InDate)
        {
            String[] token = InDate.Split(' ');
            String[] date = token[0].Split('/');
            String day = date[1];
            string month = date[0];
            string year = date[2];
            if (day.Length < 2)
            {
                day = "0" + day;
            }
            return day + "/" + month + "/" + year;
        }
        public void Summary()
        {
            GridView1.Visible = false;
            Session["dtlead"] = null;
            Gridviewdata();

            OdbcConnection maincon = dba.GeoDBMainCon();
            string query = "Select Count(*) FROM Mob_Lead_FollowUp WHERE ClientName = '" + ddl_clientname.Text + "' and LeadNo='" + ddl_leadno.Text + "' and Catagory='Retail Housing'";
            int rCnt;
            rCnt = 0;
            OdbcCommand Command1 = new OdbcCommand(query, maincon);
            rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
           // if (rCnt == 0)
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmessage();", true);
            if (rCnt > 0)
            {
                string aStr = "Select * from Mob_Lead_FollowUp WHERE ClientName = '" + ddl_clientname.Text + "' and LeadNo='" + ddl_leadno.Text + "' and Catagory='Retail Housing' ";
                OdbcDataReader dr;
                OdbcCommand cmd = new OdbcCommand(aStr, maincon);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    DataRow DR = dt.NewRow();
                    DR["Follow Up By"] = dr["FollowUpBy"].ToString();
                    if (dr["Date_ofEntry"].ToString() != "")
                        DR["Date of Follow Up"] = converttodate(dr["Date_ofEntry"].ToString());
                    else
                        DR["Date of Follow Up"] = null;

                    DR["Follow Up Type"] = dr["FollowUpType"].ToString();
                    
                    DR["Point To Note / MOM"] = dr["PointToNote_MOM"].ToString();
                    DR["Next Follow Up Type"] = dr["NextFollowUpType"].ToString();

                    if (dr["NextFollowUp_Date"].ToString() != "")
                        DR["Next Follow Up Date"] = converttodate(dr["NextFollowUp_Date"].ToString());
                    else
                        DR["Next Follow Up Date"] = null;
                    dt.Rows.Add(DR);
                }
            }
                Session["dtlead"] = dt;     //Saving Datatable To Session */
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //if (GridView1.Rows.Count > 0)
                //    GridView1.Visible = true;
                //else
                //    Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmessage();", true);
                // GridView1.HeaderRow.Cells[0].Text = "Action";
                maincon.Close();
            
        }
        public void DocSummary()
        {
            GridView2.Visible = false;
            Session["dtdoc"] = null;
            Gridviewdatadoc();
            OdbcConnection maincon = dba.GeoDBMainCon();
            string query = "Select Count(*) FROM Mob_Lead_docSubmission WHERE ClientName = '" + ddl_clientname.Text + "' and LeadNo='" + ddl_leadno.Text + "' and Catagory='Retail Housing' ";
            int rCnt;
            rCnt = 0;
            OdbcCommand Command1 = new OdbcCommand(query, maincon);
            rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
            if (rCnt > 0)
            // Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmessage();", true);
            //else if (rCnt > 0)
            {
                string aStr = "Select * from Mob_Lead_docSubmission WHERE ClientName = '" + ddl_clientname.Text + "' and LeadNo='" + ddl_leadno.Text + "' and Catagory='Retail Housing' ";
                OdbcDataReader dr;
                OdbcCommand cmd = new OdbcCommand(aStr, maincon);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    DataRow DR = dt1.NewRow();
                    DR["Doc No"] = dr["DocNo"].ToString();
                    DR["Doc Name"] = dr["DocName"].ToString();
                    if (dr["DateofSubmission"].ToString() != "")
                        DR["Date of Submission"] = converttodate(dr["DateofSubmission"].ToString());
                    else
                        DR["Date of Submission"] = null;
                    DR["Vide"] = dr["Vide"].ToString();
                    DR["From Whom"] = dr["FromWhom"].ToString();
                    dt1.Rows.Add(DR);
                }
            }
                Session["dtdoc"] = dt1;     //Saving Datatable To Session */
                GridView2.DataSource = dt1;
                GridView2.DataBind();
                // GridView1.HeaderRow.Cells[0].Text = "Action";
                maincon.Close();
           
        }
    }
}