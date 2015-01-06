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
    public partial class RetailHousingLeadSummary : System.Web.UI.Page
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
            dt.Columns.Add("Address");
            dt.Columns.Add("ContactPerson");
            dt.Columns.Add("Mobile Number");
            dt.Columns.Add("Land Line Number");
            dt.Columns.Add("Email ID");
            dt.Columns.Add("Descripton");
            dt.Columns.Add("Costruction Start Date");
            dt.Columns.Add("Duration");
            dt.Columns.Add("Owned By");
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
            string query = "Select Count(*) FROM Mob_Lead  where Catagory='Retail Housing'";
            int rCnt;
            rCnt = 0;
            OdbcCommand Command1 = new OdbcCommand(query, maincon);
            rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
            if (rCnt > 0)
            {
                string aStr = "Select * from Mob_Lead where Catagory='Retail Housing'  order by LeadDate ";
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
                    dt.Rows.Add(DR);

                }
                Session["dtlead"] = dt;     //Saving Datatable To Session */
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.Visible = true;
                    btn_update.Visible = true;
                }
                else
                {
                    GridView1.Visible = false;
                    btn_update.Visible = false;
                }
                GridView1.HeaderRow.Cells[0].Text = "Action";
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
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }
        public void BindData()
        {
            GridView1.DataSource = Session["dtlead"];
            GridView1.DataBind();
            GridView1.HeaderRow.Cells[0].Text = "Action";
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            dt = (DataTable)Session["dtlead"];
            dt.Rows[row.DataItemIndex]["Location"] = e.NewValues["Location"].ToString();
            dt.Rows[row.DataItemIndex]["ContactPerson"] = e.NewValues["ContactPerson"].ToString();
            dt.Rows[row.DataItemIndex]["Address"] = e.NewValues["Address"].ToString();
            dt.Rows[row.DataItemIndex]["Mobile Number"] = e.NewValues["Mobile Number"].ToString();
            dt.Rows[row.DataItemIndex]["Land Line Number"] = e.NewValues["Land Line Number"].ToString();
            dt.Rows[row.DataItemIndex]["Email ID"] = e.NewValues["Email ID"].ToString();
            dt.Rows[row.DataItemIndex]["Descripton"] = e.NewValues["Descripton"].ToString();
            dt.Rows[row.DataItemIndex]["Costruction Start Date"] = e.NewValues["Costruction Start Date"].ToString();
            dt.Rows[row.DataItemIndex]["Duration"] = e.NewValues["Duration"].ToString();
            Session["dtlead"] = dt;     //Saving Datatable To Session 
            GridView1.EditIndex = -1; // will cancel the updating
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.HeaderRow.Cells[0].Text = "Action";
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1; // will cancel the updating
            BindData();
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            Update();
        }

        public void Update()
        {

            OdbcConnection Maincon = dba.GeoDBMainCon();
            dt = (DataTable)Session["dtlead"];
            foreach (DataRow row in dt.Rows)
            {
                String LeadNo = row["Lead No"].ToString();
                if (row["Costruction Start Date"].ToString() != "")
                {
                    DateTime dcdate = DateTime.ParseExact(row["Costruction Start Date"].ToString(), "dd/MM/yyyy", null);
                    date = converttodate(dcdate);
                }
                String StrQuery = "UPDATE Mob_Lead SET Location= '" + row["Location"].ToString() + "' ,contactperson='" + row["ContactPerson"].ToString() + "',Address = '" + row["Address"].ToString() + "' ,MobileNumber ='" + row["Mobile Number"].ToString() + "' ,LandlineNumber='" + row["Land Line Number"].ToString() + "',EmailID ='" + row["Email ID"].ToString() + "' , Description_Work='" + row["Descripton"].ToString() + "',Construction_StartDate ='" + date + "'  ,Duration ='" + row["Duration"].ToString() + "'  where LeadNo='" + LeadNo + "' and Catagory='Retail Housing' ";
                OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, Maincon);
                PQSCommand1.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), null, "ConfirmMessage()", true);
            }
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

    }
}