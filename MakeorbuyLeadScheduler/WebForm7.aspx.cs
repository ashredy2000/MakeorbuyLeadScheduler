using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
namespace MakeorbuyLeadScheduler
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        DBConnect dba = new DBConnect();
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void st()
        {
            OdbcConnection maincon = dba.GeoDBMainCon();
        }
        //[WebMethod]

        //public static List<string> GetAutoCompleteData(string username)
        //{
        //    List<string> result = new List<string>();
            
        //    //using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
        //    //{
        //        using (SqlCommand cmd = new SqlCommand("select DISTINCT UserName from UserInformation where UserName LIKE '%'+@SearchText+'%'", con))
        //        {
        //            con.Open();
        //            cmd.Parameters.AddWithValue("@SearchText", username);
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            while (dr.Read())
        //            {
        //                result.Add(dr["UserName"].ToString());
        //            }
        //            return result;
        //        }
        //  //  }
        //}
    }
}
   
