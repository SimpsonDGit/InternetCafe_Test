using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;


namespace AD_Website
{
    public partial class Rental : System.Web.UI.Page
    {
        SqlConnection userconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BMGS"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        DataTable dataTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Button to display all web controls associated with Rental Profits
        protected void viewProfit_Click(object sender, EventArgs e)
        {
            Selection.Text = "Rental Profits";
            Label1.Text = "Start Date: ";
            Label1.Visible = true;
            TextBox1.Visible = true;
            TextBox1.Text = "yyyy-mm-dd";
            Label2.Text = "End Date: ";
            Label2.Visible = true;
            TextBox2.Visible = true;
            TextBox2.Text = "yyyy-mm-dd";
            submit.Visible = true;
            Label3.Visible = true;
            Label3.Text = "Monthly Profit: ";
            Profit.Visible = true;
            Profit.Text = "";
            Label4.Visible = false;
            hardID.Visible = false;
            Label5.Visible = false;
            empID.Visible = false;
            GridView1.Visible = false;
        }

        protected void addRentals_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rental.aspx");
        }

        //Button to display all web controls associated with Maintenance Schedule
        protected void viewSchedule_Click(object sender, EventArgs e)
        {
            Selection.Text = "Maintenance Schedule";
            Label1.Text = "Start Date: ";
            Label1.Visible = true;
            TextBox1.Visible = true;
            TextBox1.Text = "yyyy-mm-dd";
            Label2.Text = "End Date: ";
            Label2.Visible = true;
            Label3.Visible = false;
            Profit.Visible = false;
            TextBox2.Visible = true;
            TextBox2.Text = "yyyy-mm-dd";
            submit.Visible = true;
            Label4.Visible = false;
            hardID.Visible = false;
            Label5.Visible = false;
            empID.Visible = false;
            GridView1.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            submit_Click(Selection.Text);
        }
        public void submit_Click(string Header)
        {
            userconn.Open();
            SqlDataReader reader = null;
            cmd.Connection = userconn;
            cmd2.Connection = userconn;
            switch (Header)
            {
                case "Rental Profits":
                    cmd.Parameters.AddWithValue("@startdate", Convert.ToDateTime(TextBox1.Text));
                    cmd.Parameters.AddWithValue("@enddate", Convert.ToDateTime(TextBox2.Text));
                    cmd.CommandText = "Select [dbo].DetermineMonthlyProfit(@startdate, @enddate) as 'Monthly Profit'";
                    Profit.Text = "$ " + cmd.ExecuteScalar().ToString();
                    break;

                case "Maintenance Schedule":
                    cmd.Parameters.AddWithValue("@startdateM", Convert.ToDateTime(TextBox1.Text));
                    cmd.Parameters.AddWithValue("@enddateM", Convert.ToDateTime(TextBox2.Text));
                    cmd.CommandText = "SELECT * From[dbo].MaintenanceCheck(@startdateM, @enddateM)";
                    using (cmd)
                    {
                        using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                        {
                            sa.Fill(dataTable);
                        }
                        GridView1.Visible = true;
                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                    break;
                case "Update Schedule":
                    cmd.Parameters.AddWithValue("@newdate", Convert.ToDateTime(TextBox1.Text));
                    cmd.Parameters.AddWithValue("@type", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@hware", hardID.Text);
                    cmd.Parameters.AddWithValue("@emp", empID.Text);
                    cmd.CommandText = "Exec spUpdateMaintenance @hware, @newdate, @emp, @type";
                    cmd2.Parameters.AddWithValue("@newdate", Convert.ToDateTime(TextBox1.Text));
                    cmd2.Parameters.AddWithValue("@type", TextBox2.Text);
                    cmd2.Parameters.AddWithValue("@hware", hardID.Text);
                    cmd2.Parameters.AddWithValue("@emp", empID.Text);

                    cmd2.CommandText = "Select * from Maintenance where hardware_ID = @hware";
                    reader = cmd2.ExecuteReader();
                    if (reader.HasRows)
                    {
                        cmd.CommandText = "Exec spUpdateMaintenance @hwareMaint, @newdateM, @empMaint, @service_type";
                        reader = cmd.ExecuteReader();
                        Label3.Visible = true;
                        Label3.Text = "Update Complete!";
                    }
                    else
                    {
                        Label3.Visible = true;
                        Label3.Text = "Device was not previously Scheduled";
                    }
                    break;

            }
        }

        protected void viewRents_Click(object sender, EventArgs e)
        {
            Selection.Text = "Total Employee Rentals";
            Label1.Visible = false;
            TextBox1.Visible = false;
            Label2.Visible = false;
            TextBox2.Visible = false;
            Label3.Visible = false;
            Profit.Visible = false;
            Label4.Visible = false;
            hardID.Visible = false;
            Label5.Visible = false;
            empID.Visible = false;
            submit.Visible = false;

            userconn.Open();
            cmd.CommandText = "Execute spMostRentals";
            cmd.Connection = userconn;

            using (cmd)
            {
                using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                {
                    sa.Fill(dataTable);
                }

            }
            GridView1.Visible = true;
            GridView1.DataSource = dataTable;
            GridView1.DataBind();

        }

        protected void UpdateSchedule_Click(object sender, EventArgs e)
        {
            Selection.Visible = true;
            Label1.Visible = true;
            TextBox1.Visible = true;
            Label2.Visible = true;
            TextBox2.Visible = true;
            Label4.Visible = true;
            hardID.Visible = true;
            Label5.Visible = true;
            empID.Visible = true;
            submit.Visible = true;
            GridView1.Visible = false;

            Selection.Text = "Update Schedule";
            Label1.Text = "New Date: ";
            TextBox1.Text = "yyyy-mm-dd";
            Label2.Text = "Type";
            TextBox2.Text = "";
            Label4.Text = "Hardware ID: ";
            Label5.Text = "Employee ID: ";

            userconn.Open();
            cmd.CommandText = "Select hardware_id From COMPUTER";
            cmd2.CommandText = "Select EmpTRN From EMPLOYEE";
            cmd.Connection = userconn;
            cmd2.Connection = userconn;

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            SqlDataAdapter sa2 = new SqlDataAdapter(cmd2);
            DataSet ID = new DataSet();
            DataSet TRN = new DataSet();

            sa.Fill(ID, "ComputerID");
            sa2.Fill(TRN, "EmployeeTRN");

            DataTable myDataTable = ID.Tables[0];
            DataTable secondDT = TRN.Tables[0];

            DataRow tempRow = null;
            DataRow tempRow2 = null;
            foreach (DataRow tempRow_Variable in myDataTable.Rows)
            {
                tempRow = tempRow_Variable;
                hardID.Items.Add(tempRow["hardware_ID"].ToString());
            }
            foreach (DataRow tempRow2_Variable in secondDT.Rows)
            {
                tempRow2 = tempRow2_Variable;
                empID.Items.Add(tempRow2["EmpTRN"].ToString());
            }
        }
        protected void viewEmps_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            TextBox1.Visible = false;
            TextBox2.Visible = false;
            hardID.Visible = false;
            empID.Visible = false;
            submit.Visible = false;
            GridView1.Visible = true;
            Selection.Visible = true;
            Selection.Text = "Employees";
            

            userconn.Open();
            cmd.CommandText = "Select * From EMPLOYEE";
            cmd.Connection = userconn;

            using (cmd)
            {
                using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                {
                    sa.Fill(dataTable);
                }
            }
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
            userconn.Close();
        }

    }
}