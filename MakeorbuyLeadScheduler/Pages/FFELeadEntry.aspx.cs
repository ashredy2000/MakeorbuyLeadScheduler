using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
namespace MakeorbuyLeadScheduler.FFE
{
    public partial class FFELeadEntry : System.Web.UI.Page
    {
        DBConnect dba = new DBConnect();
        string LeadDate;
        string EntryBy = "";
        string EntryTime = "";
        string StartDate = "";
        DateTime LeadDate1;
        string Lead;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }
            if (!Page.IsPostBack)
            {
                slno();
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
            LeadDate = converttodate(DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", null));
            if (txt_startdate.Text != "")
                StartDate = converttodate(DateTime.ParseExact(txt_startdate.Text, "dd/MM/yyyy", null));
            String StrQuery = "INSERT INTO Mob_Lead(LeadNo,  LeadDate, ClientName,projectname,  CompanyName,  Location ,  Address,contactperson,  MobileNumber ,  LandlineNumber ,  EmailID ,  Description_Work ,  Construction_StartDate ,  Duration ,OwnedBy,Catagory,  EntryBy ,  EntryTime)  VALUES ('" + lbl_slNo.Text + "','" + LeadDate + "','" + txt_clientname.Text + "','" + txt_enquiryname.Text + "','" + txt_companyname.Text + "','" + txt_location.Text + "','" + txt_address.Text + "','" + txt_contactperson.Text + "','" + txt_mobileno.Text + "','" + txt_landline.Text + "','" + txt_emailid.Text + "','" + txt_Descr.Text + "','" + StartDate + "','" + txt_duration.Text + "','" + txt_ownedBy.Text + "','FFE', '" + EntryBy + "','" + EntryTime + "')";
            OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, MainCon);
            PQSCommand1.ExecuteNonQuery();
           
            StrQuery = "INSERT INTO LeadStatusReport(ClientName,LeadNo,  Status, Catagory)  VALUES ('" + txt_clientname.Text + "','" + lbl_slNo.Text + "','Pending','FFE')";
            PQSCommand1 = new OdbcCommand(StrQuery, MainCon);
            PQSCommand1.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), null, "confirmmessage();", true);
        }
        public void slno()
        {
            if (txt_date.Text != "")
                LeadDate1 = DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", null);
            String month, year, day;
            month = LeadDate1.Month.ToString();
            day = LeadDate1.Day.ToString();
            year = LeadDate1.Year.ToString();
            if (month.Length < 2)
            {
                month = "0" + month;
            }
            if (day.Length < 2)
            {
                day = "0" + day;
            }

            if (year.ToString().Length == 4 && month.ToString().Length == 2)
                //string sub = input.Substring(0, 3);
                //Console.WriteLine("Substring: {0}", sub);

                Lead = "MOB/" + year.Substring(2, 2) + month;
            OdbcConnection MainCon = dba.GeoDBMainCon();
            string query = "Select Count(*) FROM Mob_Lead where Year(LeadDate)='" + year + "'  and month(LeadDate)='" + month + "' ";
            int rCnt;
            rCnt = 0;
            OdbcCommand Command1 = new OdbcCommand(query, MainCon);
            rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
            if (rCnt > 0)
            {
                string aStr = " SELECT max(LeadNo) AS leadNo From Mob_Lead where Year(LeadDate)='" + year + "'  and month(LeadDate)='" + month + "'";
                OdbcDataReader dr;
                OdbcCommand cmd = new OdbcCommand(aStr, MainCon);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string bill = dr["leadNo"].ToString();
                        string[] billn = bill.Split('/');
                        int billno = int.Parse(billn[1].ToString());
                        int num = billno + 1;
                        int sum = 0;
                        int r = 0;
                        while (num != 0)
                        {
                            r = num % 10;
                            num = num / 10;
                            sum = sum + r;
                        }
                        if (sum.ToString().Length == 2)
                        {
                            num = sum;
                            sum = 0;
                            while (num != 0)
                            {
                                r = num % 10;
                                num = num / 10;
                                sum = sum + r;
                            }
                        }
                        if (sum == 8)
                            this.lbl_slNo.Text = "MOB/" + (billno + 2).ToString();
                        else
                            this.lbl_slNo.Text = "MOB/" + (billno + 1).ToString();
                        //  if ((billno+1).ToString().Length == 1)
                        // this.lbl_slNo.Text = "0" + (billno + 1).ToString();
                        //else
                    }
                }
                MainCon.Close();
            }
            else
            {
                int billno = 0;
                string bill = "0";
                if (year.ToString().Length == 4 && month.ToString().Length == 2)
                    bill = year.Substring(2, 2) + month + "01";
                billno = int.Parse(bill.ToString());
                int num = billno;
                int sum = 0;
                int r = 0;
                while (num != 0)
                {
                    r = num % 10;
                    num = num / 10;
                    sum = sum + r;
                }
                if (sum == 8)
                    billno = billno + 1;
                //if (billno.ToString().Length == 1)
                //    this.lbl_slNo.Text = Lead + "0" + billno.ToString();
                this.lbl_slNo.Text = "MOB/" + billno.ToString();
            }
        }
        //public void slno()
        //{
        //    if (txt_date.Text != "")
        //        LeadDate1 = DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", null);
        //    String month, year, day;
        //    month = LeadDate1.Month.ToString();
        //    day = LeadDate1.Day.ToString();
        //    year = LeadDate1.Year.ToString();
        //    if (month.Length < 2)
        //    {
        //        month = "0" + month;
        //    }
        //    if (day.Length < 2)
        //    {
        //        day = "0" + day;
        //    }

        //    if (year.ToString().Length == 4 && month.ToString().Length == 2)
        //        //string sub = input.Substring(0, 3);
        //        //Console.WriteLine("Substring: {0}", sub);

        //        Lead = "MOB/" + year.Substring(2, 2) + month;
        //    OdbcConnection MainCon = dba.GeoDBMainCon();
        //    string query = "Select Count(*) FROM Mob_Lead where Year(LeadDate)='" + year + "'  and month(LeadDate)='" + month + "' ";
        //    int rCnt;
        //    rCnt = 0;
        //    OdbcCommand Command1 = new OdbcCommand(query, MainCon);
        //    rCnt = int.Parse((Command1.ExecuteScalar().ToString()));
        //    if (rCnt > 0)
        //    {
        //        string aStr = " SELECT max(LeadNo) AS leadNo From Mob_Lead where Year(LeadDate)='" + year + "'  and month(LeadDate)='" + month + "'";
        //        OdbcDataReader dr;
        //        OdbcCommand cmd = new OdbcCommand(aStr, MainCon);
        //        dr = cmd.ExecuteReader();
        //        if (dr.HasRows)
        //        {
        //            while (dr.Read())
        //            {
        //                string bill = dr["leadNo"].ToString();
        //                string[] billn = bill.Split('/');
        //                int billno = int.Parse(billn[1].ToString());
        //                //  if ((billno+1).ToString().Length == 1)
        //                // this.lbl_slNo.Text = "0" + (billno + 1).ToString();
        //                //else
        //                this.lbl_slNo.Text = "MOB/" + (billno + 1).ToString();
        //            }
        //        }
        //        MainCon.Close();
        //    }
        //    else
        //        this.lbl_slNo.Text = Lead + "01";
        //}

        protected void txt_date_TextChanged(object sender, EventArgs e)
        {
            slno();
        }
        public void addtodecisiontab()
        {
            
        }
    }
}