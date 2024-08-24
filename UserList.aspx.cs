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
    public partial class UserList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ToString();
            conn=new SqlConnection(cnf);
            conn.Open();
            if(!IsPostBack)
            {
                FetchUserList();    
            }

        }
        protected void FetchUserList()
        {
            string q = "exec UsersListProc ";
            SqlCommand cmd = new SqlCommand(q, conn);   
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();   
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lbl=(Label) GridView1.Rows[e.RowIndex].FindControl("Label1");
            string id=lbl.Text;
            string q= "exec DeleteAccountById '" + id+"'";
            SqlCommand c = new SqlCommand(q, conn);
            c.ExecuteNonQuery();
            FetchUserList();
        }
    }
}