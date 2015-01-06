using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;
namespace MakeorbuyLeadScheduler
{
    public partial class sample2 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        double sum = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                FirstGridViewRow();
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Table submitTable = new Table();
        //    TableRow row = new TableRow();
        //    TableCell cell = new TableCell();
        //    cell.Controls.Add(this.BuildTestButton());
        //    row.Cells.Add(cell);
        //    submitTable.Rows.Add(row);
        //}
        //protected virtual Button BuildTestButton()
        //{

        //    Button button = new Button();

        //    button.Width = 120;

        //    button.Text = "Test";

        //    button.Click += new EventHandler(this.OnTestButtonClick);

        //    return button;

        //}
        //protected virtual void OnTestButtonClick(object sender, EventArgs e)
        //{
        //    Label1.Text = "hi";
        //    //do your code here.

        //}
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRow();

        }
        private void FirstGridViewRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Desc", typeof(string)));           
            dt.Columns.Add(new DataColumn("Spec", typeof(string)));          

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["Desc"] = string.Empty;           
            dr["Spec"] = string.Empty;           
            dt.Rows.Add(dr);

            ViewState["CurrentTable"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();      
                      
            Button btnAdd = (Button)GridView1.FooterRow.Cells[1].FindControl("ButtonAdd");
            Page.Form.DefaultFocus = btnAdd.ClientID;
        }
        private void AddNewRow()
        {
            int rowIndex = 0;

            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        TextBox txtval = (TextBox)GridView1.Rows[rowIndex].Cells[1].FindControl("txt_spec");
                        Label lblamt = (Label)GridView1.Rows[rowIndex].Cells[0].FindControl("lbl_amt");
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        double val = Convert.ToDouble(txtval.Text);
                        double amt = val * 10;
                        dtCurrentTable.Rows[i - 1]["Desc"] =amt.ToString();
                        dtCurrentTable.Rows[i - 1]["Spec"] = txtval.Text;                        
                        rowIndex++;                       

                    }
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;
                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();                
                    // txn.Focus;
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
            SetPreviousData();
        }
        private void SetPreviousData()
        {
            Label totalsum = (Label)GridView1.FooterRow.Cells[0].FindControl("lblsum");
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox TextBoxspec= (TextBox)GridView1.Rows[rowIndex].Cells[1].FindControl("txt_spec");
                        Label lblamt = (Label)GridView1.Rows[rowIndex].Cells[0].FindControl("lbl_amt");
                        TextBoxspec.Text = dt.Rows[i]["Spec"].ToString();
                        lblamt.Text = dt.Rows[i]["Desc"].ToString();
                        
                        rowIndex++;
                        
                    }
                }
            }
            settotal();           
        }
        public void settotal()
        {
            Label totalsum = (Label)GridView1.FooterRow.Cells[0].FindControl("lblsum");
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count - 1; i++)
                {
                    sum += Convert.ToDouble(dt.Rows[i]["Desc"].ToString());
                }
            }
            totalsum.Text = sum.ToString();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.DataSource = (DataTable)ViewState["CurrentTable"];
            GridView2.DataBind();
        }
    }
}