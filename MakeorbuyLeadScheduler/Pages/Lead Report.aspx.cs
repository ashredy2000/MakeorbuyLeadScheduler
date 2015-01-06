using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Text;
namespace MakeorbuyLeadScheduler.Pages
{
    public partial class Lead_Report : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DBConnect dba = new DBConnect();
        String date;
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }
            if (!IsPostBack)
            {
                View();
            }
        }

        public void Gridviewdata()
        {
            dt.Columns.Add("Lead No");
            dt.Columns.Add("Lead Date");
            dt.Columns.Add("Client Name");
            dt.Columns.Add("ProjectName");
            dt.Columns.Add("Company Name");
            dt.Columns.Add("Location");
            dt.Columns.Add("ContactPerson");
            dt.Columns.Add("Address");
            dt.Columns.Add("Mobile Number");
            dt.Columns.Add("Land Line Number");
            dt.Columns.Add("Email ID");
            dt.Columns.Add("Descripton");
            dt.Columns.Add("Costruction Start Date");
            dt.Columns.Add("Duration");
            dt.Columns.Add("Owned By");
            dt.Columns.Add("Followup");
            Session["dtlead"] = dt;     //Saving Datatable To Session 
        }
        public String converttodate(string InDate)
        {
            String[] token = InDate.Split(' ');
            String[] date = token[0].Split('/');
            String day = date[0];
            string month = date[1];
            string year = date[2];
            if (day.Length < 2)
            {
                day = "0" + day;
            }
            return day + "/" + month + "/" + year;
        }


        public void View()
        {
            Session["dtlead"] = null;
            Gridviewdata();
            OdbcConnection maincon = dba.GeoDBMainCon();
            string query = "Select Count(*) FROM Mob_Lead  ";
            int rCnt;
            rCnt = 0;
            OdbcCommand Command1 = new OdbcCommand(query, maincon);
            rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
            if (rCnt > 0)
            {
                string aStr = "Select * from Mob_Lead  order by LeadDate ";
                OdbcDataReader dr;
                OdbcCommand cmd = new OdbcCommand(aStr, maincon);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    DataRow DR = dt.NewRow();
                    DR["Lead No"] = dr["LeadNo"].ToString();
                    if (dr["LeadDate"].ToString() != "")
                        DR["Lead Date"] = converttodate(dr["LeadDate"].ToString());
                    else
                        DR["Lead Date"] = null;
                    DR["Client Name"] = dr["ClientName"].ToString();
                    DR["ProjectName"] = dr["projectname"].ToString();
                    DR["Company Name"] = dr["CompanyName"].ToString();
                    if (dr["Location"].ToString() != "")
                        DR["Location"] = dr["Location"].ToString();
                    else
                        DR["Location"] = "-";
                    DR["ContactPerson"] = dr["contactperson"].ToString();
                    if (dr["Address"].ToString() != "")
                        DR["Address"] = dr["Address"].ToString();
                    else
                        DR["Address"] = "-";
                    if (dr["MobileNumber"].ToString() != "")
                        DR["Mobile Number"] = dr["MobileNumber"].ToString();
                    else
                        DR["Mobile Number"] = "-";
                    if (dr["MobileNumber"].ToString() != "")
                        DR["Land Line Number"] = dr["LandlineNumber"].ToString();
                    else
                        DR["Land Line Number"] = "-";
                    if (dr["EmailID"].ToString() != "")
                        DR["Email ID"] = dr["EmailID"].ToString();
                    else
                        DR["Email ID"] = "-";
                    if (dr["Description_Work"].ToString() != "")
                        DR["Descripton"] = dr["Description_Work"].ToString();
                    else
                        DR["Descripton"] = "-";
                    if (dr["Construction_StartDate"].ToString() != "")
                        //  DR["Costruction Start Date"] = dr["Construction_StartDate"].ToString();
                        DR["Costruction Start Date"] = converttodate(dr["Construction_StartDate"].ToString());
                    else
                        DR["Costruction Start Date"] = null;
                    if (dr["Duration"].ToString() != "")
                        DR["Duration"] = dr["Duration"].ToString();
                    else
                        DR["Duration"] = "-";
                    if (dr["OwnedBy"].ToString() != "")
                        DR["Owned By"] = dr["OwnedBy"].ToString();
                    else
                        DR["Owned By"] = "-";
                    
                    string aStr1 = "Select NextFollowUpType from Mob_Lead_FollowUp where ClientName='" + dr["ClientName"].ToString() + "' and LeadNo='" + dr["LeadNo"].ToString() + "'  ";
                OdbcDataReader dr1;
                OdbcCommand cmd1 = new OdbcCommand(aStr1, maincon);
                dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    if (dr1["NextFollowUpType"].ToString() != "")
                        DR["Followup"] = dr1["NextFollowUpType"].ToString();
                    else
                        DR["Followup"] = "-";
                }
                    dt.Rows.Add(DR);

                }
                Session["dtlead"] = dt;     //Saving Datatable To Session */
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.Visible = true;
                    
                }
                else
                {
                    GridView1.Visible = false;
                    
                }
                
                maincon.Close();
            }
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

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;

            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, DESCENDING);
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, ASCENDING);
            }
        }
        public SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;

                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }
        private void SortGridView(string sortExpression, string direction)
        {
            //  You can cache the DataTable for improving performance
            // DataTable dt = GetData().Tables[0];
            DataTable dt = (DataTable)Session["dtlead"];
            DataView dv = new DataView(dt);
            dv.Sort = sortExpression + direction;
            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
        public void exportexcel()
        {
            String filename = "Lead Summary.csv";
            Response.Clear();
            Response.Buffer = true;
            //Set the name of your CSV file here
            Response.AddHeader("content-disposition", "attachment;filename=" + filename);
            Response.ContentType = "text/csv";
            try
            {
                dt = (DataTable)Session["dtlead"]; //Getting datatable from session              
                StringBuilder sb = new StringBuilder();
                String str = "";
                sb.AppendLine();
                sb.Append("Lead Summary");
                sb.AppendLine();
                foreach (DataColumn col in dt.Columns)
                {
                    sb.Append(col.ColumnName + ',');
                }
                sb.Remove(sb.Length - 1, 1);
                sb.AppendLine();
                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        str = "\"" + row[i].ToString() + "\"";
                        sb.Append(str + ',');
                    }
                    sb.AppendLine();
                }
                Response.Write(sb.ToString());
                Response.End();
            }
            catch (Exception ex) { }
        }

        protected void lnkbtn_export_Click(object sender, EventArgs e)
        {
            exportexcel();
        }
    }
}