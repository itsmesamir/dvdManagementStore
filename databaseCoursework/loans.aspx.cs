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
    public partial class loans : System.Web.UI.Page
    {
        private string targetDate;

        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();

        public loans()
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
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            command.CommandText = "select row_number() over(order by date_out) as SN, date_out, count(date_out) as NO_Of_Loans from loans where date_returned is null group by date_out";
            adapter.Fill(data, "Loans");
            GridView1.DataSource = data.Tables["Loans"];
            GridView1.DataBind();
            btnPrev.Visible = false;
        }

        protected void lnameSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
 
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btnTarget = sender as LinkButton;
            GridViewRow targetRow = (GridViewRow)btnTarget.NamingContainer;
            targetDate = GridView1.Rows[targetRow.RowIndex].Cells[2].Text;
            GridView1.Visible=false;
            GridView2.Visible = true;
            btnPrev.Visible = true;
            command.CommandText = "select dvd_details.dvd_id, dvd_details.title, loans.copy_id, member_details.fname, member_details.lname, loans.date_out from dvd_details join loans on dvd_details.dvd_id = loans.dvd_id join member_details on loans.member_num = member_details.member_num where loans.date_out = @targetDate and date_returned is null";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@targetDate", targetDate);
            adapter.Fill(data, "Loan");
            GridView2.DataSource = data.Tables["Loan"];
            GridView2.DataBind();

        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/loans.aspx");
        }
    }
}