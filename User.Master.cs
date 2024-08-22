using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_App
{
    public partial class User : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (Session["MyUser"]!=null)
            {
                string user_email = Session["MyUser"].ToString();
                string q = "select * from user_account where acc_email='" + user_email + "'";

                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                string user = rdr["acc_user"].ToString();
                Label1.Text = user;
            }
            else
            {
                Response.Write("<script>alert('You need to Login First!!');window.location.href='Login.aspx'</script>");
            }
            if (!IsPostBack)
            {
                CountProduct();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string em, profile;
            em=Session["MyUser"].ToString();
            FileUpload1.SaveAs(Server.MapPath("Profiles/") + Path.GetFileName(FileUpload1.FileName));
            profile = "Profiles/" + Path.GetFileName(FileUpload1.FileName);
            string q1 = " exec ChangeProfileProc '"+profile+"','"+em +"'";
            SqlCommand cmd=new SqlCommand(q1, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Profile Changed Successfully');window.location.href='DeleteAccount.aspx';</script>");
        }
        protected void CountProduct()
        {
            if (Session["MyUser"] != null) { 
            string suser = Session["MyUser"].ToString();
            string q = "select count(pid) as cnt from cart where suser='" + suser + "' ";
            SqlCommand cmd=new SqlCommand(q, conn); 
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Label2.Text = rdr["cnt"].ToString();
            }
        }
    }
}