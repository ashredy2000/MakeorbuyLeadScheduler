using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.Odbc;
using System.Net.Mail;
namespace MakeorbuyLeadScheduler.FFE
{
    public partial class FFELeadFollowup : System.Web.UI.Page
    {
        DBConnect dba = new DBConnect();
        string filename = string.Empty;
        String EntryTime, FollowupDate, nextFollowupDate = "", EntryBy = "";
        string biddingstrategy;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["UserName"] == null)
            {
                Response.Redirect("~/Index.aspx");
            }
        }
        public void upload()
        {
            filename = Path.GetFileName(inpAttachment.PostedFile.FileName);
            if (filename != "")
            {
                inpAttachment.SaveAs(Server.MapPath("~/lead_inputfiles/" + filename));
                lbl_attachment1.Text = inpAttachment.FileName;
                //if (lb_attachment.Items.Contains(new ListItem(inpAttachment.FileName)))
                //{
                //    lb_attachment.Items.Add(inpAttachment.FileName);
                //    lb_attachment.Items.Remove(inpAttachment.FileName);
                //}
                //else
                // lbl_attachment1.Text.Add(inpAttachment.FileName);
                lnkbtn_attachmentremove1.Visible = true;
            }
            filename = string.Empty;
            filename = Path.GetFileName(inpAttachment0.PostedFile.FileName);
            if (filename != "")
            {
                inpAttachment0.SaveAs(Server.MapPath("~/lead_inputfiles/" + filename));
                lbl_attachment2.Text = inpAttachment0.FileName;
                lnkbtn_attachmentremove2.Visible = true;
            }
            filename = string.Empty;
        }


        protected void lnkbtn_attachment1_Click(object sender, EventArgs e)
        {
            upload();
        }

        protected void lnkbtn_attachment2_Click(object sender, EventArgs e)
        {
            upload();
        }

        protected void lnkbtn_attachmentremove1_Click(object sender, EventArgs e)
        {
            lbl_attachment1.Text = "";
            lnkbtn_attachmentremove1.Visible = false;
        }

        protected void lnkbtn_attachmentremove2_Click(object sender, EventArgs e)
        {
            lbl_attachment2.Text = "";
            lnkbtn_attachmentremove2.Visible = false;
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
        //   ClientName ,  CompanyName ,  LeadNo ,  FollowUpBy ,  FollowUpType ,  Date_ofEntry ,  AttachmentLocation1,AttachmentLocation2 ,  PointToNote_MOM ,  NextFollowUpType ,  NextFollowUp_Date ,  SetReminder ,  EntryBy ,  EntryTime
        public void Submit()
        {
            EntryBy = (String)Session["empName"];
            DateTime curdate = DateTime.Now;
            EntryTime = curdate.ToString("yyyy-MM-dd H:mm:ss");
            OdbcConnection MainCon = dba.GeoDBMainCon();
            FollowupDate = converttodate(DateTime.ParseExact(txt_date.Text, "dd/MM/yyyy", null));
            if (txt_followupdate.Text != "")
                nextFollowupDate = converttodate(DateTime.ParseExact(txt_followupdate.Text, "dd/MM/yyyy", null));
            string reminder = "";
            String StrQuery = "INSERT INTO Mob_Lead_FollowUp(ClientName ,  CompanyName ,  LeadNo ,  FollowUpBy ,  FollowUpType ,  Date_ofEntry ,  AttachmentLocation1,AttachmentLocation2 ,  PointToNote_MOM ,  NextFollowUpType ,  NextFollowUp_Date ,  SetReminder ,Catagory,  EntryBy ,  EntryTime   )  VALUES ('" + ddl_clientname.Text + "','" + lbl_companyname.Text + "',  '" + ddl_leadno.Text + "','" + txt_followupby.Text + "','" + ddl_followupbyType.Text + "','" + FollowupDate + "','" + lbl_attachment1.Text + "','" + lbl_attachment2.Text + "','" + txt_Descr.Text + "','" + ddl_nextfollowup.Text + "','" + nextFollowupDate + "','" + reminder + "','FFE','" + EntryBy + "','" + EntryTime + "')";
            OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, MainCon);
            PQSCommand1.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), null, "confirmmessage();", true);
        }

        protected void btn_submit0_Click(object sender, EventArgs e)
        {
            OdbcConnection Maincon = dba.GeoDBMainCon();

            if (ddl_bidding.Text == "Loss")
            {
                if (txt_Bidding.Text == "")
                    Page.ClientScript.RegisterStartupScript(this.GetType(), null, "alertmsg();", true);
                else
                    biddingstrategy = txt_Bidding.Text;
            }

            String StrQuery = "UPDATE LeadStatusReport SET Status= '" + ddl_bidding.Text + "',ReasonforBidding='"+biddingstrategy+"' where LeadNo='" + ddl_leadno0.Text + "' and Catagory='FFE' ";
            OdbcCommand PQSCommand1 = new OdbcCommand(StrQuery, Maincon);
            PQSCommand1.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), null, "confirmmessage()", true);
            orderSubmit("mail.geodesictechniques.com");
        }
        public void orderSubmit(string server)
        {
            string source = "source";
            string mailtable ="Reminder";
                   

            //var fromAddress = EmailId_from.Text.ToString();
            var fromAddress = "vidya.ravindran88@gmail.com";
            var fromname = "Lead Reminder";
            var toaddress = "vidya.ravindran@geodesictechniques.com";
            MailAddress from = new MailAddress(fromAddress, fromname);
            MailAddress to = new MailAddress(toaddress);
            MailMessage message = new MailMessage(from, to);
            message.Subject = "makeorbuy.com Reminder:";
            // message.Body = "Enquiry Details" +txt_firstname.Text;
            message.IsBodyHtml = true;
            message.Body = "Next follow up is fixed on tomorrow. Details as follows:" + mailtable;
            SmtpClient client = new SmtpClient(server);
            // Include credentials if the server requires them.
            client.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
            Console.WriteLine("Sending an e-mail message to {0} by using the SMTP host {1}.", to.Address, client.Host);
            try
            {
                client.Send(message);
                Page.ClientScript.RegisterStartupScript(this.GetType(), null, "confirmsent();", true);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception caught in CreateCopyMessage(): {0}", ex.ToString());
            }
        }
    }
}