using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_App
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn= new SqlConnection(cnf);
            conn.Open();

           // GridView2.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["MyUser"] != null)
            {
                GridView1.CssClass = "myclass";
                string from, to;
                from = TextBox1.Text;
                to = TextBox2.Text;

                string q = "select * from placeorder where suser='" + Session["MyUser"].ToString() +"' AND dt between '" + from + "' AND '" + to + "' order by dt";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();

                GridView2.DataSource = rdr;
                GridView2.DataBind();
            }
        }
    }
}
