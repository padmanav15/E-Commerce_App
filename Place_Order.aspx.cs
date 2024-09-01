using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using Razorpay.Api;
namespace ECommerce_App
{
    public partial class Place_Order : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            Button1.Enabled = false;
            if (!IsPostBack)
            {
                FetchDetails();

            }
        }
        protected void FetchDetails()
        {
            string em = Session["MyUser"].ToString();
            Label4.Text = em;
            Label6.Text = Session["Address"].ToString();
            Label5.Text = Session["Contact"].ToString();

            Label3.Text = "Inv" + GenerateOrderId();
            Label7.Text = Session["Grand Total"].ToString();
        }
        protected string GenerateOrderId()
        {
            Random random = new Random();
            return random.Next(100, 999).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache); StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);
            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString()); Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 160f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            worker.Parse(stringReader);
            pdfDoc.Close();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.Enabled = true;
            string keyId = "rzp_test_Kl7588Yie2yJTV";
            string KeySecret = "6dN9Nqs7M6HPFMlL45AhaTgp";

            RazorpayClient razorpayClient = new RazorpayClient(keyId, KeySecret);
            double amount =double.Parse( Session["Grand Total"].ToString());

            //decimal amount=Convert.ToDecimal(TextBox1.Text);
            //Create an Order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100);
            options.Add("currency", "INR");
            options.Add("receipt", "order_receipt_123");
            options.Add("payment_capture", 1);

            Razorpay.Api.Order order = razorpayClient.Order.Create(options);
            string orderId = order["id"].ToString();
            // Generate checkout form and redirect user to Razorpay payment page
            string razorpayScript = $@"
            var options = 
        {{
            'key': '{keyId}',
            'amount':{amount * 100},
            'currency':'INR',
            'name': 'Masstech Business Solutions Pvt.Ltd',
            'description': 'Checkout Payment',
            'order_id':'{orderId}',
            'handler':function(response)
                {{
                    alert('Payment Successful. Payment Id:' + Response.razorpay_payment_id);   
                }},
            'prefill':
                {{
                    'name':'Padmanav Sahoo',
                    'email':'padmanavsahoo15@gmail.com',
                    'contact':'6371744966'
                }},
            'theme':
                {{
                    'color':'#F37254'
                }}
        }};
            var rzp1=new Razorpay(options);
            rzp1.open();";
            //Register the script on the page
            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
        }
    }
}

