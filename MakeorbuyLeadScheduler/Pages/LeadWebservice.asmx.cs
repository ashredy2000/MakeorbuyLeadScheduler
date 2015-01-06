using System;
using System.Collections;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Collections.Specialized;
using AjaxControlToolkit;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
namespace MakeorbuyLeadScheduler
{
    /// <summary>
    /// Summary description for LeadWebservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LeadWebservice : System.Web.Services.WebService
    {

        DBConnect dba = new DBConnect();
        String astr;
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdown(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsclientname = new DataSet();
            String astr = "Select ClientName from Mob_Lead where Catagory='Prefabs' ";
            OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
            daclientname.Fill(dsclientname);
            MainCon.Close();

            List<CascadingDropDownNameValue> clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string clientname = dtrow["ClientName"].ToString();
                clientnamedetails.Add(new CascadingDropDownNameValue(clientname, Code));
            }
            return clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdown(string knownCategoryValues, string category)
        {
            string clientname;
            StringDictionary ClientName = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            clientname = ClientName["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from Mob_Lead where ClientName='" + clientname + "' and Catagory='Prefabs'";
            OdbcDataAdapter daleadno = new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdownR(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsclientname = new DataSet();
            String astr = "Select ClientName from Mob_Lead where Catagory='Retail Housing' ";
            OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
            daclientname.Fill(dsclientname);
            MainCon.Close();

            List<CascadingDropDownNameValue> clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string clientname = dtrow["ClientName"].ToString();
                clientnamedetails.Add(new CascadingDropDownNameValue(clientname, Code));
            }
            return clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdownR(string knownCategoryValues, string category)
        {
            string ClientName;
            StringDictionary clientname = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ClientName = clientname["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from Mob_Lead where ClientName='" + ClientName + "' and Catagory='Retail Housing'";
            OdbcDataAdapter daleadno= new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdownF(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsclientname = new DataSet();
            String astr = "Select ClientName from Mob_Lead where Catagory='FFE' ";
            OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
            daclientname.Fill(dsclientname);
            MainCon.Close();
            List<CascadingDropDownNameValue> clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string clientname = dtrow["ClientName"].ToString();
                clientnamedetails.Add(new CascadingDropDownNameValue(clientname, Code));
            }
            return clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdownF(string knownCategoryValues, string category)
        {
            string clientname;
            StringDictionary ClientName = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            clientname = ClientName["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from Mob_Lead where ClientName='" + clientname + "' and Catagory='FFE'";
            OdbcDataAdapter daleadno = new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdownP2(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsclientname = new DataSet();
            String astr = "Select ClientName from LeadStatusReport where Catagory='Prefabs' and Status='Pending' ";
            OdbcDataAdapter daclientname = new OdbcDataAdapter(astr, MainCon);
            daclientname.Fill(dsclientname);
            MainCon.Close();
            List<CascadingDropDownNameValue> clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsclientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string clientname = dtrow["ClientName"].ToString();
                clientnamedetails.Add(new CascadingDropDownNameValue(clientname, Code));
            }
            return clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdownP2(string knownCategoryValues, string category)
        {
            string clientname;
            StringDictionary ClientName = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            clientname = ClientName["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from LeadStatusReport where ClientName='" + clientname + "' and Catagory='Prefabs' and Status='Pending'";
            OdbcDataAdapter daleadno = new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdownR2(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsClientname = new DataSet();
            String astr = "Select ClientName from LeadStatusReport where Catagory='Retail Housing' and Status='Pending' ";
            OdbcDataAdapter daClientname = new OdbcDataAdapter(astr, MainCon);
            daClientname.Fill(dsClientname);
            MainCon.Close();
            List<CascadingDropDownNameValue> Clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsClientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string Clientname = dtrow["ClientName"].ToString();
                Clientnamedetails.Add(new CascadingDropDownNameValue(Clientname, Code));
            }
            return Clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdownR2(string knownCategoryValues, string category)
        {
            string clientname;
            StringDictionary ClientName = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            clientname = ClientName["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from LeadStatusReport where ClientName='" + clientname + "' and Catagory='Retail Housing' and Status='Pending'";
            OdbcDataAdapter daleadno = new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindClientNamedropdownF2(string knownCategoryValues, string category)
        {
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsClientname = new DataSet();
            String astr = "Select ClientName from LeadStatusReport where Catagory='FFE' and Status='Pending' ";
            OdbcDataAdapter daClientname = new OdbcDataAdapter(astr, MainCon);
            daClientname.Fill(dsClientname);
            MainCon.Close();
            List<CascadingDropDownNameValue> Clientnamedetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsClientname.Tables[0].Rows)
            {
                string Code = dtrow["ClientName"].ToString();
                string Clientname = dtrow["ClientName"].ToString();
                Clientnamedetails.Add(new CascadingDropDownNameValue(Clientname, Code));
            }
            return Clientnamedetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindLeadNodropdownF2(string knownCategoryValues, string category)
        {
            string clientname;
            StringDictionary ClientName = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            clientname = ClientName["ClientName"];
            OdbcConnection MainCon = dba.GeoDBMainCon();
            DataSet dsleadno = new DataSet();
            String astr = "Select * from LeadStatusReport where ClientName='" + clientname + "' and Catagory='FFE' and Status='Pending'";
            OdbcDataAdapter daleadno = new OdbcDataAdapter(astr, MainCon);
            daleadno.Fill(dsleadno);
            MainCon.Close();

            List<CascadingDropDownNameValue> leadnodetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow dtrow in dsleadno.Tables[0].Rows)
            {
                string code = dtrow["LeadNo"].ToString();
                string leadno = dtrow["LeadNo"].ToString();
                leadnodetails.Add(new CascadingDropDownNameValue(leadno, code));
            }
            return leadnodetails.ToArray();
        }
    }
}

