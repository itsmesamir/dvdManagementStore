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
using System.Web.Security;


namespace databaseCoursework
{
    public partial class ReturnDVD : System.Web.UI.Page
    {
        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();
        public ReturnDVD()
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void returnButton_Click(object sender, EventArgs e)
        {
            Button returnButton = sender as Button;
            GridViewRow currentRow = (GridViewRow)returnButton.NamingContainer;


            command.CommandText = "UPDATE loans set date_returned = GETDATE() WHERE loan_num = @id";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@id", GridView1.Rows[currentRow.RowIndex].Cells[0].Text);

            connection.Open();
            command.ExecuteNonQuery();

            Response.Redirect("~/ReturnDVD.aspx");
        }
    }
}