using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Configuration;

namespace databaseCoursework
{
    public partial class MemberList : System.Web.UI.Page
    {

        private string targetDate, targetName;

        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();

        public MemberList()
        {
            //configuring the ConnectionString for SqlConnection instance
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DVD StudioConnectionString"].ConnectionString.ToString();

            //configuring the SqlCommand instance
            command.Connection = connection;

            //configuring SqlDataAdapter instance
            adapter.SelectCommand = command;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            command.CommandText = "select fname, max(l.date_out) as Date_out from member_details md  join loans l on md.member_num = l.member_num where date_out<GETDATE()-31 group by fname order by date_out";
            adapter.Fill(data, "Loans");
            GridView3.DataSource = data.Tables["Loans"];
            GridView3.DataBind();
            btnPrev1.Visible = false;

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btnTarget = sender as LinkButton;
            GridViewRow targetRow = (GridViewRow)btnTarget.NamingContainer;
            targetName = GridView3.Rows[targetRow.RowIndex].Cells[1].Text;
            targetDate = GridView3.Rows[targetRow.RowIndex].Cells[2].Text;
            GridView3.Visible = false;
            GridView4.Visible = true;
            btnPrev1.Visible = true;
            command.CommandText = "select fname as First_Name, lname as Last_Name, mem_address as Address, l.date_out as Date_out, title, datediff(DAY, l.date_out, GETDATE()) as NumberOfDaysSinceLastLoan from member_details md  join loans l on md.member_num = l.member_num join dvd_details dd on dd.dvd_id = l.dvd_id where fname = @targetName and date_out = @targetDate";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@targetName", targetName);
            command.Parameters.AddWithValue("@targetDate", targetDate);
            adapter.Fill(data, "Loan");
            GridView4.DataSource = data.Tables["Loan"];
            GridView4.DataBind();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MemberList.aspx");

        }
    }
}