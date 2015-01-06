using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Data;
namespace MakeorbuyLeadScheduler
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]

    public class WebService1 : System.Web.Services.WebService
    {
        static DBConnect dba = new DBConnect();
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public  List<string> GetAutoCompleteData(string username)
        {

            List<string> result = new List<string>();
            using (OdbcConnection con = dba.GeoDBMainCon())
            {
                //using (OdbcCommand cmd = new OdbcCommand("select Distinct Description from st_DMR where Description REGEXP '" + username + "'", con)) 
                using (OdbcCommand cmd = new OdbcCommand("select UserName from UserInformation where UserName REGEXP '" + username + "' ", con))
                {
                    OdbcDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(dr["UserName"].ToString());
                    }
                    return result;
                }
            }
        }
        [WebMethod]
        public List<string> GetAutoCompleteData1(string productname)
        {

            List<string> result = new List<string>();
            using (OdbcConnection con = dba.GeoDBMainCon())
            {
                //using (OdbcCommand cmd = new OdbcCommand("select Distinct Description from st_DMR where Description REGEXP '" + username + "'", con)) 
                using (OdbcCommand cmd = new OdbcCommand("select Description from Products where Description REGEXP '" + productname + "' ", con))
                {
                    OdbcDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        result.Add(dr["Description"].ToString());
                    }
                    return result;
                }
            }
        }
       
        
    }
}
