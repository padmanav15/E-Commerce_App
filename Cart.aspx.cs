using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_App
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection conn;
        string address, contact;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn= new SqlConnection(cnf);   
            conn.Open();
            
            if(!IsPostBack)
            {
                fetchCart();
                GrandTotal();
            }
            address=TextBox1.Text;
            contact=TextBox2.Text;
            Session["Address"] = address;
            Session["Contact"] = contact;
        }
        protected void GrandTotal()
        {
            string total_price;
            if (Session["MyUser"]!=null)
            {
                string suser = Session["MyUser"].ToString();
                string q = "select sum(price) as total from cart where suser='" + suser + "'";
                SqlCommand cmd = new SqlCommand(q,conn);
                SqlDataReader r = cmd.ExecuteReader();  
                r.Read();
                total_price=r["total"].ToString();
                Label8.Text=total_price;
                Session["Grand Total"]=total_price;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void fetchCart()
        {
            if (Session["MyUser"]!=null)
            {
                string suser = Session["MyUser"].ToString();
                string q = "exec FindCartDetailsBySession '" + suser + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           Label l1=(Label) GridView1.Rows[e.RowIndex].FindControl("Label7");
            string id= l1.Text;
            string q = "exec DeleteCartProductProc '" + id + "'";
            SqlCommand c = new SqlCommand(q, conn);
            c.ExecuteNonQuery();
            fetchCart();
            Response.Redirect("Cart.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["MyUser"] != null)
            {
                string address, contact;
                address=TextBox1.Text;
                contact=TextBox2.Text; 
                
                string us = Session["MyUser"].ToString();
                string q = "insert into placeorder (pname,pcat,price,qty,pic,dt,suser,perprice,address,contact,pstatus) select pname,pcat,price,qty,pic,dt,suser,perprice,'"+address+"','"+contact+"','Not Delivered' from cart where suser='" + us + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                int row = cmd.ExecuteNonQuery();
                if (row>0)
                {
                    string q1 = "exec DeleteCartProc '" + us+"'";
                    SqlCommand c=new SqlCommand(q1, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("Place_Order.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Something Went Wrong');</script>");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
