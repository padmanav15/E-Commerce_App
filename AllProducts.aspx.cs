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
    public partial class AllProducts : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn= new SqlConnection(cnf);   
            conn.Open();
            if(!IsPostBack)
            {
                FetchAllProduct();
            }
        }
        protected void FetchAllProduct()
        {
            string q = "select * from product";
            SqlCommand cmd = new SqlCommand(q, conn);   
            SqlDataReader rdr= cmd.ExecuteReader();
            DataList1.DataSource = rdr;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName =="AddToCart")
            {
                string pname, pcat, pic,dt,suser;
                double price,total_price;
                int qty;
                string id=e.CommandArgument.ToString();
                string q = "exec FindProductDetailsById '" + id + "'";
                SqlCommand cmd= new SqlCommand(q, conn);
                SqlDataReader rdr= cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    pname = rdr["pname"].ToString();
                    pcat = rdr["pcat"].ToString();
                    pic = rdr["pic"].ToString();
                    price = double.Parse(rdr["price"].ToString());
                    DropDownList dl =(DropDownList) e.Item.FindControl("DropDownList1");
                    qty=int.Parse(dl.SelectedValue.ToString());

                    total_price=price*qty;

                    dt = DateTime.Now.ToString("yyyy-MM-dd");
                    suser = Session["MyUser"].ToString();

                    string q1="exec AddToCartProc '"+pname+"','"+pcat+"','"+total_price+"','"+ qty + "','"+pic+"','"+dt+"','"+suser+"','"+price+"'";
                    SqlCommand c=new SqlCommand(q1, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string q = "select * from product order by price ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataList1.DataSource = rdr;
            DataList1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string q = "select * from product order by price desc ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataList1.DataSource = rdr;
            DataList1.DataBind();
        }
    }
}
