using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace MakeorbuyLeadScheduler
{
    public partial class sample1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();

            cell.ColSpan = 3;
            cell.InnerText = "Record 1";
            row.Cells.Add(cell);
            tableContent.Rows.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();

            cell.InnerText = "1";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "2";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "3";
            row.Cells.Add(cell);

            tableContent.Rows.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();

            cell.InnerText = "a";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "b";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "c";
            row.Cells.Add(cell);

            tableContent.Rows.Add(row);


            row = new HtmlTableRow();
            cell = new HtmlTableCell();
            cell.InnerText = "m";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "n";
            row.Cells.Add(cell);

            cell = new HtmlTableCell();
            cell.InnerText = "o";
            row.Cells.Add(cell);

            tableContent.Rows.Add(row);

            row = new HtmlTableRow();
            cell = new HtmlTableCell();

            HtmlInputButton input = new HtmlInputButton();
            input.ID = "Button1";
            input.Value = "button";
           // input.onclick += new EventHandler(this.OnTestButtonClick);
            cell.ColSpan = 3;
            cell.Controls.Add(input);
            row.Cells.Add(cell);
            tableContent.Rows.Add(row);
            cell.Controls.Add(this.BuildTestButton("h1"));
            row.Cells.Add(cell);
            tableContent.Rows.Add(row);
            HyperLink link1 = new HyperLink();
            link1.Text = "LINK HERE";
            link1.NavigateUrl = "http://somedomain.com";
            cell.Controls.Add(link1);
            row.Cells.Add(cell);
            tableContent.Rows.Add(row);
            //<a href=' + link + '>' + nameofval + '</a>
        }
        protected virtual Button BuildTestButton(string g)
        {

            Button button = new Button();

            button.Width = 120;

            button.Text = g;
            
            button.Click += new EventHandler(this.OnTestButtonClick);

            return button;

        }
        protected virtual void OnTestButtonClick(object sender, EventArgs e)
        {
            //create session
            string URL = "sample2.aspx?prd=" + "hi";
            Response.Redirect(URL);
            Label1.Text = "hi";
            //do your code here.

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("sample2.aspx");
        }
    }
}