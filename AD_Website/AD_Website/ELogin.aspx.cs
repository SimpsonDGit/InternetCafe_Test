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
    public partial class ELogin : System.Web.UI.Page
    {
        SqlConnection userconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BMGS"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        DataTable dataTable = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addRentals_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rental.aspx");
        }

        protected void ViewMaintenance_Click(object sender, EventArgs e)
        {
            newDate.Visible = true;
            endDate.Visible = true;
            hardware.Visible = false;
            emp.Visible = false;
            text_newdate.Visible = true;
            text_enddate.Visible = true;
            ddl_hdware.Visible = false;
            ddl_emp.Visible = false;
            submit.Visible = true;
            status.Visible = false;
            empOGrid.Visible = false;

            Selection.Text = "Maintenance Schedule";
            newDate.Text = "Start Date: ";
            text_newdate.Text = "yyyy-mm-dd";
            endDate.Text = "End Date: ";
            text_enddate.Text = "yyyy-mm-dd";

        }

        protected void UpdateSchedule_Click(object sender, EventArgs e)
        {
            newDate.Visible = true;
            endDate.Visible = true;
            hardware.Visible = true;
            emp.Visible = true;
            text_newdate.Visible = true;
            text_enddate.Visible = true;
            ddl_hdware.Visible = true;
            ddl_emp.Visible = true;
            submit.Visible = true;
            status.Visible = false;
            empOGrid.Visible = false;

            Selection.Text = "Update Schedule";
            newDate.Text = "New Date: ";
            text_newdate.Text = "yyyy-mm-dd";
            endDate.Text = "Type: ";
            text_enddate.Text = "yyyy-mm-dd";
            hardware.Text = "HardwareID: ";
            emp.Text = "EmployeeID: ";

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
                ddl_hdware.Items.Add(tempRow["hardware_ID"].ToString());
            }
            foreach (DataRow tempRow2_Variable in secondDT.Rows)
            {
                tempRow2 = tempRow2_Variable;
                ddl_emp.Items.Add(tempRow2["EmpTRN"].ToString());
            }
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
                case "Maintenance Schedule":
                    cmd.Parameters.AddWithValue("@startdateM", Convert.ToDateTime(text_newdate.Text));
                    cmd.Parameters.AddWithValue("@enddateM", Convert.ToDateTime(text_enddate.Text));
                    cmd.CommandText = "SELECT * From[dbo].MaintenanceCheck(@startdateM, @enddateM)";
                    using (cmd)
                    {
                        using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                        {
                            sa.Fill(dataTable);
                        }
                        empOGrid.Visible = true;
                        empOGrid.DataSource = dataTable;
                        empOGrid.DataBind();
                    }
                    break;

                case "Update Schedule":
                    cmd.Parameters.AddWithValue("@newdateM", Convert.ToDateTime(text_newdate.Text));
                    cmd.Parameters.AddWithValue("@service_type", text_enddate.Text);
                    cmd.Parameters.AddWithValue("@hwareMaint", ddl_hdware.Text);
                    cmd.Parameters.AddWithValue("@empMaint", ddl_emp.Text);
                    cmd2.Parameters.AddWithValue("@newdateM", Convert.ToDateTime(text_newdate.Text));
                    cmd2.Parameters.AddWithValue("@service_type", text_enddate.Text);
                    cmd2.Parameters.AddWithValue("@hwareMaint", ddl_hdware.Text);
                    cmd2.Parameters.AddWithValue("@empMaint", ddl_emp.Text);
                    cmd2.CommandText = "Select * from Maintenance where hardware_ID = @hwareMaint";
                    reader = cmd2.ExecuteReader();
                    if(reader.HasRows)
                    {
                        cmd.CommandText = "Exec spUpdateMaintenance @hwareMaint, @newdateM, @empMaint, @service_type";
                        reader = cmd.ExecuteReader();
                        status.Visible = true;
                        status.Text = "Update Complete!";
                    }
                    else
                    {
                        status.Visible = true;
                        status.Text = "Device was not previously Scheduled";
                    }
                    break;

            }
        }
    }
}