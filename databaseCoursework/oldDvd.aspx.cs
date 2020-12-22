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
    public partial class OldDvd : System.Web.UI.Page
    {
        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();
        public OldDvd()
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

        protected void deleteCopy_Click(object sender, EventArgs e)
        {
            Button deleteBtn = sender as Button;
            GridViewRow currentRow = (GridViewRow)deleteBtn.NamingContainer;


            command.CommandText = "DELETE FROM copy_details WHERE copy_num = @id";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@id", oldDetails.Rows[currentRow.RowIndex].Cells[2].Text);

            connection.Open();
            command.ExecuteNonQuery();
            Response.Redirect("~/oldDvd.aspx");

        }

        protected void oldDetails_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}