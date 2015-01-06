using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace MakeorbuyLeadScheduler
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DBConnect dba = new DBConnect();
        string UserId;
        string UserPassword;
        string Pass, Logintime, username = "";
        String status = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_OK.Visible = true;
            btn_adduser.Visible = false;
            if (!Page.IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["preferences"];
                if (Session["status"] != null)
                {
                    status = (String)Session["status"];
                    if (Session["UserName"] != null)
                    {
                          if (status != "")
                        {
                            greeting_label.Text = "Welcome " + (string)(Session["empName"]) + ",";
                            greeting_label.Visible = true;
                            logout.Visible = true;
                            login.Visible = false;
                            menu_prefab.Visible = true;
                            menu_retailHousing.Visible = true;
                            menu_FFE.Visible = true;
                            menu_Report.Visible = true;
                           // lnkbtnmenu.Visible = true;
                        }

                        else
                        {
                            greeting_label.Visible = false;
                            logout.Visible = false;
                            login.Visible = true;
                            menu_prefab.Visible = false;
                            menu_retailHousing.Visible = false;
                            menu_FFE.Visible = false;
                            menu_Report.Visible = false;
                            //lnkbtnmenu.Visible = false;
                        }
                    }
                }
                if (this.chkNewUser != null && this.chkNewUser.Checked == true)
                {
                    btn_OK.Visible = false;
                    btn_adduser.Visible = true;
                }
                else
                {
                    btn_adduser.Visible = false;
                    btn_OK.Visible = true;
                }
            }
        }
        private void chkNewUser_CheckStateChanged(Object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPswrd.Text = "";
            if (chkNewUser.Checked == true)
            {
               
            }
            else
            {
                btn_OK.Visible = true;
                btn_adduser.Visible = false;
            }
        }
     
        public void AddUser(Boolean CheckOld)
        {
            String OdbcStr, UserName, Pass, OldPassWord;
            OdbcDataReader dr;
            OdbcConnection MainCon = dba.GeoDBMainCon();
            OdbcCommand cmd1 = new OdbcCommand("select EmpPassword from employees where EmpCode='" + txtUserName.Text + "' and Status= 'Working'", MainCon);
            dr = cmd1.ExecuteReader();
            if (dr.HasRows == true)
               while (dr.Read())
                    {
                        // OldPassWord = dr.GetString(0);
                        OldPassWord = dr["EmpPassword"].ToString();                       
             if ((OldPassWord).ToUpper() == "GTPL" || (OldPassWord).ToUpper() == "")
                    { 
                OdbcCommand cmd = new OdbcCommand("select * from employees where EmpCode=? and Status=?", MainCon);
                //  cmd.Parameters.Add("@EmpCode", OdbcType.VarChar, 10);
                cmd.Parameters.AddWithValue("@EmpCode", txtUserName.Text);
                //  cmd.Parameters.Add("@Status", OdbcType.VarChar, 25);
                cmd.Parameters.AddWithValue("@Status", "Working");
                dr = cmd.ExecuteReader();
                //   'Check if user is working. 
                if (dr.HasRows == true)
                {
                    Pass = dba.MD5(txtPswrd.Text, 1);
                    //  Pass = txtPswrd.Text;
                    UserName = txtUserName.Text;
                    OdbcStr = "Update employees Set EmpPassword = " + "'" + Pass + "'" + " WHERE " + " EmpCode = " + "'" + UserName + "'" + " And Status = " + "'Working'";
                    OdbcCommand UserCommand = new OdbcCommand(OdbcStr, MainCon);
                    UserCommand.ExecuteNonQuery();
                    if (CheckOld == true)
                    {
                        txtUserName.Text = "";
                        txtPswrd.Text = "";
                        //chkNewUser.Checked = false;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), null, "accountcreated();", true); 
                    }
                    else
                    //  ' Incorrect Login Details Supplied  
                    {
                       // MainCon.Close();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), null, "check2();", true); 
                        txtUserName.Text = "";
                        txtPswrd.Text = "";
                    }
                }
           }
             else
             {
                 txtUserName.Text = "";
                 txtPswrd.Text = "";
                 chkNewUser.Checked = false;
                 Page.ClientScript.RegisterStartupScript(this.GetType(), null, "warningalreadyexists();", true);                
             }
          }
                MainCon.Close();
                chkNewUser.Checked = false;
        }
        protected void chkNewUser_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkNewUser != null && this.chkNewUser.Checked == true)
            {
                btn_OK.Visible = false;
                btn_adduser.Visible = true;
            }
        }


        protected void btn_adduser_Click(object sender, EventArgs e)
        {
            AddUser(true);
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            Response.Redirect("~/Index.aspx");
        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
        }
        protected void btn_OK_Click(object sender, EventArgs e)
        {
            if (this.CheckBox1 != null && this.CheckBox1.Checked == true)
            {
                //cookie for storing username and password
                HttpCookie cookie = new HttpCookie("preferences");
                cookie["Name"] = txtUserName.Text + " " + txtPswrd.Text;
                cookie.Expires.AddDays(1);
                Response.Cookies.Add(cookie);
            }
            OdbcConnection MainCon = dba.GeoDBMainCon();
            UserId = txtUserName.Text;
            UserPassword = txtPswrd.Text;
            Pass = dba.MD5(txtPswrd.Text, 1);            
            Session["status"] = dba.GetPrivilege("MOB", UserId);
            string c = Pass.Substring(0, 20);        
            if (btn_OK.Text.Equals("Sign In"))
            {
                CheckSecurity(UserId, UserPassword);
                    //OdbcCommand cmd1 = new OdbcCommand("select EmpName from employees where EmpCode='" + txtUserName.Text + "' and EmpPassword= '" + c + "' and Status= 'Working'", MainCon);
                    //OdbcDataReader dr = cmd1.ExecuteReader();
                    //if (dr.Read())
                    //{
                    //    Session["empName"] = dr["EmpName"].ToString();
                        
                    //}
            }                     
        }
        public void CheckSecurity(string UserId, string UserPassword)
        {
               OdbcConnection MainCon = dba.GeoDBMainCon();
                String a, b;
                a = UserPassword;
                b = dba.MD5(a, 1);
                string c = b.Substring(0, 20);
                // OdbcCommand cmd1 = new OdbcCommand("select * from employees where EmpCode=" + UserId + " and EmpPassword= '" + b + "'and Status='Working'", PqsMainCon);
                OdbcCommand cmd1 = new OdbcCommand("select EmpName from employees where EmpCode='" + txtUserName.Text + "'and EmpPassword= '" + c + "'and Status= 'Working'", MainCon);
                OdbcDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    Session["empName"] = dr1["EmpName"].ToString();
                }
                Session["UserName"] = txtUserName.Text;
                OdbcCommand cmd = new OdbcCommand("select * from employees where EmpCode=? and EmpPassword=? and Status=?", MainCon);
                // cmd.Parameters.Add("@EmpCode", OdbcType.VarChar, 10);
                cmd.Parameters.AddWithValue("@EmpCode", UserId);
                //b = MD5(a, 1);
                // 'MD5 hash code for the password string is now held in variable b  
                //cmd.Parameters.Add("@EmpPassword", OdbcType.VarChar, 20);
                cmd.Parameters.AddWithValue("@EmpPassword", c);
                // cmd.Parameters.Add("@Status",OdbcType.VarChar, 20);
                cmd.Parameters.AddWithValue("@Status", "Working");
                // 'Me.Close()
                //'frmMain.ShowDialog()
                //'Exit Sub
                //'We have a Data Reader to read the values returned by the SQL Command Execution  
                OdbcDataReader dr;
                dr = cmd.ExecuteReader();
                // 'Check if username and password exist.   
                if (dr.HasRows == true)
                {
                    while (dr.Read())
                    {
                        if (Session["status"] != null)
                        {
                            String designation = (String)Session["status"];
                            if (Session["empName"] != null)
                            {
                                DateTime curdate = DateTime.Now;
                                Logintime = curdate.ToString("yyyy-MM-dd H:mm:ss");
                                username = (string)Session["empname"];
                                string StrQuery = "INSERT INTO mob_loginlog(empID ,  EmpName ,  LoginTime,Activity) VALUES ('" + txtUserName.Text + "',' " + username + " ','" + Logintime + "','Login' )";
                                OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, MainCon);
                                PQSCommand1.ExecuteNonQuery();
                               // if (designation.Equals("Development") || designation.Equals("Store Manager") || designation.Equals("Planning Manager") || designation.Equals("Stores testing") || designation.Equals("site testing") || designation.Equals("Site Manager") || designation.Equals("Subcontracts Manager") || designation.Equals("subcontract testing"))
                                
                                hdn_val.Value = "2";
                                Response.Redirect("~/Index.aspx");
                               
                              }   
                        }
                        // 'If exists, then we show the next form which contains the application, in my case its Form1  
                        // 'Me.Close()
                        // 'frmMain.ShowDialog()
                        MainCon.Close();                       
                        // return true;
                    }
                }
                else
                {
                    MainCon.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), null, "loginerror();", true); 
                    //' Incorrect Login Details Supplied  
                    // 'Me.ErrorProvider1.SetError(Me.OK, "Incorrect Login...Try again")
                    //MessageBox.Show("Incorrect Login...Try again", "Login Error", //MessageBoxButtons.OK);
                    // frmBim.Close();
                    //frmBim.Dispose();
                    ///  return false;
                }
            //}
            //  else
            //  return true;
                MainCon.Close();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["Preferences"] != null)
            {
                HttpCookie cookie = new HttpCookie("preferences");
                cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(cookie);
            }
            Session.Abandon();
            Response.Redirect("~/Index.aspx");
        }

       
    }
}
    