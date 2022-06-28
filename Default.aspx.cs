using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string password="zxaQas12$1";
            
            string password2="zxaVas12$1";

            string password3="ZxaVas12$1";
            
            
            string password4="ZxaVas12$9";
            
            
            string s3_bucket_token="XQMOED0FK1ENBT4UHG3TY5BZL6FH7EGT8YOPSDF9NPSDU0FKT0WEUR0LKG0SDDFT"
            string s3_bucket_token2="XQMOED0FK1ENBT4UHG3TY5BZL6FH7EGT8YOPSDF9NPSDU0FKT0WEUR0LKG0SABCD"
           
            
            int N = 50;
            table1.Text = "<table id=\"board\" cellspacing=0 cellpadding=0>";
            for (int i = 0; i < N; ++i)
            {
                table1.Text += "<tr>";
                for (int j = 0; j < N; ++j)
                {
                    table1.Text += "<td></td>";
                }
                table1.Text += "</tr>\n";
            }
            table1.Text += "</table>";

        }
    }
}
