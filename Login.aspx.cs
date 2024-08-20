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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn=new SqlConnection(cnf);
            conn.Open();
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            string user, pass, em, role = "User";
            user = TextBox3.Text;
            pass = TextBox5.Text;
            em = TextBox4.Text;

            string q = "exec NewUserAccountProc '" + user + "','" + pass + "','" + em + "','" + role + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            clear();
            Response.Write("<script>alert('Registration Successful!!')</script>");
            
        }
        protected void  clear()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = ""; 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string em, pass;
            em=TextBox1.Text;
            pass=TextBox2.Text;

            string q = "exec UserLoginProc '" + em + "','" + pass + "'";
            SqlCommand cmd=new SqlCommand(q, conn);
            SqlDataReader rdr=cmd.ExecuteReader();
            if(rdr.HasRows)
            {
                while (rdr.Read())
                {
                    if (rdr["acc_email"].Equals(em) && rdr["acc_pass"].Equals(pass) && rdr["acc_role"].Equals("Admin"))
                    {
                        Session["MyUser"] = em;
                        Response.Redirect("AddProducts.aspx");
                    }
                    if (rdr["acc_email"].Equals(em) && rdr["acc_pass"].Equals(pass) && rdr["acc_role"].Equals("User"))
                    {
                        Session["MyUser"] = em;
                        Response.Redirect("AllProducts.aspx");
                    }
                }
            }
            else
            {

            }
        }
    }
}