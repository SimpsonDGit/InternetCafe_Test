using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace AD_Website
{
    public partial class ALogin : System.Web.UI.Page
    {

        bool flag = false;
        String Username = null;
        String Password = null;
        SqlConnection userconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BMGS"].ConnectionString);
        SqlCommand cmd = new SqlCommand();



        protected void Page_Load(object sender, EventArgs e)
        {
            check.Text = "";
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            idCheck(TextBox1.Text);
        }
        public void idCheck(string username)
        { 
            userconn.Open();
            cmd.Connection = userconn;
            
            cmd.CommandText = "Select Username, Convert(varchar(250), DECRYPTBYPASSPHRASE('SHA1',[password])) as 'Password' From USERS";
            SqlDataReader sdr = cmd.ExecuteReader();

            while(sdr.Read())
            {
                Username = sdr["Username"] as String;
                Password = sdr["Password"] as String;

                if (Username ==TextBox1.Text && Password == TextBox2.Text)
                {
                    flag = true;
                    break;
                }
            }
            if (flag == true)
            {
                switch (username)
                {
                    case "SupeA":
                        Response.Redirect("Alogin.aspx");
                        break;
                    case "BMGSemp":
                        Response.Redirect("Elogin.aspx");
                        break;
                }
                
            }
            else
            {
                check.Text = "Invalid Credentials!";
            }
            
        }
    }
}