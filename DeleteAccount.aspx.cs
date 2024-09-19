using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_App
{
    public partial class DeleteAccount : System.Web.UI.Page
        
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn= new SqlConnection(cnf);
            conn.Open();
            if(!IsPostBack)
            {
                FetchProfile();
            }
        }
        protected void FetchProfile()
        {
            string em = Session["MyUser"].ToString();
            string q = " exec FindProfileById  '" + em + "' ";
            SqlDataAdapter ada= new SqlDataAdapter(q,conn);
            DataSet ds=new DataSet();
            ada.Fill(ds);
            DataList1.DataSource = ds;  
            DataList1.DataBind();   
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName =="Delete")
            {
               string id= e.CommandArgument.ToString();
                string q = "Exec DeleteAccountById '"+id+"'";
                SqlCommand cmd = new SqlCommand(q,conn);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Account Deleted Successfully');window.location.href='Login.aspx'</script>");
                
            }
        }
    }
}
