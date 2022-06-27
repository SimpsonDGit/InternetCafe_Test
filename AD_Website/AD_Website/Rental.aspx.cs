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
    public partial class Rental1 : System.Web.UI.Page
    {
        SqlConnection userconn = new SqlConnection(WebConfigurationManager.ConnectionStrings["BMGS"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        DataTable dataTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void createRent_Click(object sender, EventArgs e)
        {
            rentSelect.Visible = true;
            Label1.Visible = true;
            compID.Visible = true;
            Label2.Visible = true;
            compValue.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            compID2.Visible = true;
            compID3.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            compValue2.Visible = true;
            compValue3.Visible = true;
            hrs.Visible = false;
            Total.Visible = false;
            Price.Visible = false;
            submit.Visible = true;
            viewTable.Visible = false;
            HardwareView.Visible = false;

            rentSelect.Text = "Assign Device";
            Label1.Text = "Hardware ID:";
            Label2.Text = "Date: ";
            Label3.Text = "Supervisor: ";
            Label4.Text = "Employee: ";
            Label5.Text = "Name: ";
            Label6.Text = "Email";

            compValue.Text = "yyyy-mm-dd";

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
                compID.Items.Add(tempRow["hardware_ID"].ToString());
            }
            foreach (DataRow tempRow2_Variable in secondDT.Rows)
            {
                tempRow2 = tempRow2_Variable;
                compID2.Items.Add(tempRow2["EmpTRN"].ToString());
                compID3.Items.Add(tempRow2["EmpTRN"].ToString());
            }
        }

        protected void viewRent_Click(object sender, EventArgs e)
        {
            viewTable.Visible = true;
            rentSelect.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            hrs.Visible = false;
            submit.Visible = false;
            Label4.Visible = false;
            compID.Visible = false;
            compID2.Visible = false;
            compID3.Visible = false;
            compValue.Visible = false;
            compValue2.Visible = false;
            compValue3.Visible = false;
            Total.Visible = false;
            Price.Visible = false;
            
            viewTable.Text = "Rentals";

            userconn.Open();
            cmd.CommandText = "Select reference#, hardware_id, rental_date, name, email From RENTAL";
            cmd.Connection = userconn;

            using (cmd)
            {
                using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                {
                    sa.Fill(dataTable);
                }

            }

            HardwareView.Visible = true;
            HardwareView.DataSource = dataTable;
            HardwareView.DataBind();
            userconn.Close();
        }

        protected void viewComp_Click(object sender, EventArgs e)
        {
            viewTable.Visible = true;
            rentSelect.Visible = false;
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            hrs.Visible = false;
            submit.Visible = false;
            Label4.Visible = false;
            compID.Visible = false;
            compID2.Visible = false;
            compID3.Visible = false;
            compValue.Visible = false;
            compValue2.Visible = false;
            compValue3.Visible = false;
            Total.Visible = false;
            Price.Visible = false;
            viewTable.Text = "Computer Info";

            userconn.Open();
            cmd.CommandText = "Select * From [dbo].ComputerInfo()";
            cmd.Connection = userconn;

            using (cmd)
            {
                using (SqlDataAdapter sa = new SqlDataAdapter(cmd))
                {
                    sa.Fill(dataTable);
                }

            }

            HardwareView.Visible = true;
            HardwareView.DataSource = dataTable;
            HardwareView.DataBind();
            userconn.Close();

        }
        protected void calcCost_Click(object sender, EventArgs e)
        {
            rentSelect.Visible = true;
            Label1.Visible = true;
            Label2.Visible = false;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = false;
            Label6.Visible = false;
            compID.Visible = true;
            compID2.Visible = true;
            compID3.Visible = false;
            compValue.Visible = false;
            compValue2.Visible = false;
            compValue3.Visible = false;
            viewTable.Visible = false;
            HardwareView.Visible = false;
            hrs.Visible = true;
            Total.Visible = true;
            Price.Visible = true;
            submit.Visible = true;

            rentSelect.Text = "Calculate Cost";
            Label1.Text = "Hardware ID:";
            Label3.Text = "Hours: ";
            Label4.Text = "Hardware ID2: ";
            

            userconn.Open();
            cmd.CommandText = "Select hardware_id From COMPUTER";
            cmd.Connection = userconn;

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataSet ID = new DataSet();

            sa.Fill(ID, "ComputerID");

            DataTable myDataTable = ID.Tables[0];

            DataRow tempRow = null;

            ListItemCollection liCol = compID2.Items;
            for (int i = 0; i < liCol.Count; i++)
            {
                ListItem li = liCol[i];
                if (li.Value != "0")
                    compID2.Items.Remove(li);
            }
            foreach (DataRow tempRow_Variable in myDataTable.Rows)

            {
                tempRow = tempRow_Variable;
                compID.Items.Add(tempRow["hardware_ID"].ToString());
                compID2.Items.Add(tempRow["hardware_ID"].ToString());
            }
            userconn.Close();
        }
    

        protected void upStatus_Click(object sender, EventArgs e)
        {
            rentSelect.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            compID.Visible = true;
            compID2.Visible = false;
            compID3.Visible = false;
            compValue.Visible = true;
            compValue2.Visible = false;
            compValue3.Visible = false;
            hrs.Visible = false;
            Total.Visible = false;
            Price.Visible = false;
            submit.Visible = true;
            viewTable.Visible = true;
            HardwareView.Visible = true;

            rentSelect.Text = "Update Status";
            Label1.Text = "Hardware ID:";
            Label2.Text = "Status: ";
            compValue.Text = "--A, R, D, M valid--";

            userconn.Open();
            cmd.CommandText = "Select hardware_id From COMPUTER";
            cmd.Connection = userconn;

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataSet ID = new DataSet();

            sa.Fill(ID, "ComputerID");

            DataTable myDataTable = ID.Tables[0];

            DataRow tempRow = null;

            foreach (DataRow tempRow_Variable in myDataTable.Rows)

            {
                tempRow = tempRow_Variable;
                compID.Items.Add(tempRow["hardware_ID"].ToString());
            }
            userconn.Close();

        }

        protected void modVal_Click(object sender, EventArgs e)
        {
            rentSelect.Visible = true;
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            compID.Visible = true;
            compID2.Visible = false;
            compID3.Visible = false;
            compValue.Visible = true;
            compValue2.Visible = false;
            compValue3.Visible = false;
            hrs.Visible = false;
            Total.Visible = false;
            Price.Visible = false;
            submit.Visible = true;
            viewTable.Visible = true;
            HardwareView.Visible = true;

            rentSelect.Text = "Update Value";
            Label1.Text = "Hardware ID:";
            Label2.Text = "Value: ";
            compValue.Text = null;

            userconn.Open();
            cmd.CommandText = "Select hardware_id From COMPUTER";
            cmd.Connection = userconn;

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataSet ID = new DataSet();

            sa.Fill(ID, "ComputerID");

            DataTable myDataTable = ID.Tables[0];

            DataRow tempRow = null;

            foreach (DataRow tempRow_Variable in myDataTable.Rows)

            {
                tempRow = tempRow_Variable;
                compID.Items.Add(tempRow["hardware_ID"].ToString());
            }
            userconn.Close();

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            submit_Click(rentSelect.Text);
        }

        public void submit_Click(string Header)
        {
            userconn.Open();
            cmd.Connection = userconn;
            SqlDataReader reader = null;
            switch (Header)
            {
                case "Calculate Cost":
                    cmd.Parameters.AddWithValue("@id1",(compID.Text));
                    cmd.Parameters.AddWithValue("@id2",(compID2.Text));
                    cmd.Parameters.AddWithValue("@hrs", Convert.ToInt16(hrs.Text));

                    if(compID2.Text != "")
                    { cmd.CommandText = "Select[dbo].CalcDiscount(@hrs, @id1, @id2) as 'Total'"; }

                    else
                    { cmd.CommandText = "Select [dbo].RentalCost(@id1, @hrs) as 'Total'"; }

                    reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            Price.Text = Convert.ToString(reader.GetInt32(reader.GetOrdinal("Total")));
                        }
                    
                    break;

                case "Update Status":
                    cmd.Parameters.AddWithValue("@id1", (compID.Text));
                    cmd.Parameters.AddWithValue("@status", (compValue.Text));
                    
                    cmd.CommandText = "Exec [ spDetermineStatus] @id1, @status";

                    reader = cmd.ExecuteReader();
                    Price.Visible = true;
                    Price.Text = "Update Complete!";
                    viewTable.Visible = false;
                    HardwareView.Visible = false;
                    break;

                case "Update Value":
                    cmd.Parameters.AddWithValue("@hid1", (compID.Text));
                    if (compValue.Text != "")
                    {
                        cmd.Parameters.AddWithValue("@newvalue", (compValue.Text));
                        cmd.CommandText = "EXECUTE spModifyValue @hid1, @newvalue";
                    }
                    else { cmd.CommandText = "EXECUTE spModifyValue @hid1, null"; }

                    reader = cmd.ExecuteReader();
                    Price.Visible = true;
                    Price.Text = "Update Complete!";
                    viewTable.Visible = false;
                    HardwareView.Visible = false;
                    break;

                case "Assign Device":
                    cmd.Parameters.AddWithValue("@comp", compID.Text);
                    cmd.Parameters.AddWithValue("@date", compValue.Text);
                    cmd.Parameters.AddWithValue("@emp", compID2.Text);
                    cmd.Parameters.AddWithValue("@name", compValue2.Text);
                    cmd.Parameters.AddWithValue("@email", compValue3.Text);
                    cmd.Parameters.AddWithValue("@sup", compID3.Text);
                    cmd.CommandText = "Exec spValidateRental @comp, @date, @emp, @sup, @name, @email";

                    reader = cmd.ExecuteReader();
                    break;

            }

        }

    }
}