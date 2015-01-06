using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.Odbc;
using System.Data;
namespace MakeorbuyLeadScheduler
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        static DBConnect dba = new DBConnect();
        List<Common> country;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            divSerach.Style.Add("display", "block");

            List<People> people = new List<People>
            {
                new People(){ Name = "Pranay",Email="pranay@test.com",CityID=2 },
                new People(){ Name = "Heamng",Email="Hemang@test.com",CityID=1 },
                new People(){ Name = "Hiral" ,Email="Hiral@test.com",CityID=2},
                new People(){ Name = "Maitri",Email="Maitri@test.com",CityID=1 }
            };

            GridViewNotional.DataSource =
                            (from s in people
                             where s.CityID == Convert.ToInt32(txtCityID.Text)
                             select s).ToList<People>();

            GridViewNotional.DataBind();
        }


        protected void btnCountry_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            trState.Visible = false;
            trCity.Visible = false;
            trState.Visible = true;
        }

        protected void btnState_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            trCity.Visible = false;
            divSerach.Style.Add("display", "none");
            trCity.Visible = true;
        }

        protected void btnCity_Click(object sender, EventArgs e)
        {
            divSerach.Style.Add("display", "block");
        }
        [WebMethod]

        public static List<Common> GetCountry(string username)
        {
            try
            {
                List<Common> clientnamedetails = new List<Common>();
           // List<string> result = new List<string>();
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsclientname = new DataSet();
            String astr = "Select Sl_No,ClientName from Mob_Lead  ";
            OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
            daclientname.Fill(dsclientname);
            MainCon.Close();
            int count = 0;            
            foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
            {
                count++;
               // new Common1() { ID };
                int Code = int.Parse(dtrow["Sl_No"].ToString());
                string clientname = dtrow["ClientName"].ToString();
                return new List<Common>  {
                   { new Common() { ID=Code,Name=clientname,ParentID=count} }
                };
               clientnamedetails.Add(new Common());
            }
            List<Common> lstcountry =
                            (from c in clientnamedetails
                             where c.Name.StartsWith(username)
                             select c).ToList<Common>();
            return lstcountry;
            }
            catch (Exception ex)
            {
                return null;
            }
            //return clientnamedetails.ToList<Common1>();
        }

        //[WebMethod]
        //public static List<Common> GetCountry(string id)
        //{
        //    List<Common> country;
        //    try
        //    {
        //        OdbcConnection MainCon = dba.GeoDBMainCon();
        //        DataSet dsclientname = new DataSet();
        //        String astr = "Select Sl_No,ClientName from Mob_Lead  ";
        //        OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
        //        daclientname.Fill(dsclientname);
        //        MainCon.Close();
        //        int count = 0;

        //        foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
        //        {
        //            int Code = int.Parse(dtrow["Sl_No"].ToString());
        //            string clientname = dtrow["ClientName"].ToString();
        //            country = new List<Common>
        //    {
              
        //       new Common() { ID=Code,Name=clientname,ParentID=count}
        //    };
        //        }

        //            List<Common> lstcountry =
        //                        (from c in country
        //                         where c.Name.StartsWith(id)
        //                         select c).ToList<Common>();
        //            return lstcountry;
                

        //    }
        //    catch (Exception ex)
        //    {
        //        return null;
        //    }
        //}

        [WebMethod]
        public static List<Common> GetCountry1(string id)
        {
            try
            {
                List<Common> country = new List<Common>
            {
                new Common(){ ID=1 ,Name = "India",ParentID=0 },
                new Common(){ ID=2 ,Name = "USA",ParentID=0 },
                new Common(){ ID=3 ,Name = "Ireland",ParentID=0 },
                new Common(){ ID=4 ,Name = "Australia",ParentID=0 }
            };
                List<Common> lstcountry =
                            (from c in country
                             where c.Name.StartsWith(id)
                             select c).ToList<Common>();
                return lstcountry;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static List<Common> GetState(string id, string country)
        {
            try
            {
                List<Common> state = new List<Common>
            {
                new Common(){ ID=1 ,Name = "Gujarat" ,ParentID=1 },
                new Common(){ ID=2 ,Name = "Mahastra",ParentID=1 },
                new Common(){ ID=3 ,Name = "Califonia",ParentID=2 },
                new Common(){ ID=4 ,Name = "Sadney",ParentID=4 }
            };
                List<Common> lstState =
                            (from s in state
                             where s.Name.StartsWith(id) && s.ParentID == Convert.ToInt32(country)
                             select s).ToList<Common>();
                return lstState;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        [WebMethod]
        public static List<Common> GetCity(string id, string state)
        {
            try
            {
                List<Common> city = new List<Common>
            {
                new Common(){ ID=1 ,Name = "Ahmedabad",ParentID=1  },
                new Common(){ ID=2 ,Name = "Baroda",ParentID=1 },
                new Common(){ ID=3 ,Name = "Bombay",ParentID=2 },
                new Common(){ ID=4 ,Name = "Califonia",ParentID=3 },
                new Common(){ ID=5 ,Name = "Sadney",ParentID=4 }
            };
                List<Common> lstCity =
                            (from c in city
                             where c.Name.StartsWith(id) && c.ParentID == Convert.ToInt32(state)
                             select c).ToList<Common>();
                return lstCity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}

public class Common
{
    public int ID { get; set; }
    public string Name { get; set; }
    public int ParentID { get; set; }
}

public class Common1
{
    public string ID { get; set; }
    public string Name { get; set; }
    public int ParentID { get; set; }
}

public class People
{
    public string Name { get; set; }
    public string Email { get; set; }
    public int CityID { get; set; }
}

