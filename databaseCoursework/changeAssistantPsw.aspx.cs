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
    public partial class ChangeAssistant : System.Web.UI.Page
    {
        private SqlConnection conobj = new SqlConnection();
        private SqlCommand comobj = new SqlCommand();
        private SqlDataAdapter adaobj = new SqlDataAdapter();
        private DataSet ds = new DataSet();

        public ChangeAssistant()
        {
            conobj.ConnectionString = ConfigurationManager.ConnectionStrings["DVD StudioConnectionString"].ConnectionString.ToString();
            comobj.Connection = conobj;
            adaobj.SelectCommand = comobj;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM user_sys WHERE fname= '" + Session["username"] + "'";
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }
        //Shows ModalPopupExtender to update password
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton BtnEdit = sender as LinkButton;
            GridViewRow currentRow = (GridViewRow)BtnEdit.NamingContainer;
            lblID.Text = GridView1.Rows[currentRow.RowIndex].Cells[1].Text;
            txtPassword.Text = GridView1.Rows[currentRow.RowIndex].Cells[6].Text;
            ModalPopupExtender1.Show();
        }
        // Updates the password for assistant
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            comobj.CommandText = " Update user_sys set password = @password where user_id=@id";
            comobj.Parameters.AddWithValue("@password", txtPassword.Text);
            comobj.Parameters.AddWithValue("@id", lblID.Text);
            conobj.Open();
            comobj.ExecuteNonQuery();
            lblError.Text = "Password Change Success";

            conobj.Close();
            Page_Load(sender, e);
            //Response.Write("<script LANGUAGE='JavaScript' >alert('PASSWORD UPDATED!')</script>");



            //try
            //{
            //    comobj.CommandText = " Update user_sys set password = @password where user_id=@id";
            //    comobj.Parameters.AddWithValue("@password", txtPassword.Text);
            //    comobj.Parameters.AddWithValue("@id", lblID.Text);
            //    conobj.Open();
            //    comobj.ExecuteNonQuery();
            //    conobj.Close();

            //}
            //catch
            //{
            //    lblError.Text = "Database connection error. Please try again.";
            //}
            //finally
            //{

            //    Response.Write("<script>alert('Password successfully Changed')</script>");



            //}

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("<script>alert('this is my message :) !');</script>");
        }
    }
}