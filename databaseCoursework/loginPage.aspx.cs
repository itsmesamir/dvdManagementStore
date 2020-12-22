using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;

namespace databaseCoursework
{
    public partial class LoanPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DVD StudioConnectionString"].ConnectionString);
                SqlCommand com = new SqlCommand("select password,type from user_sys where fname like @userfname", con);
                com.Parameters.Clear();
                com.Parameters.AddWithValue("@userfname", txtFirstName.Text);
                SqlDataReader rd;
                try
                {
                    con.Open();
                    rd = com.ExecuteReader();
                    if (rd.Read())
                    {
                        if (rd["password"].ToString().Equals(txtPassword.Text))
                        {
                            Session["username"] = txtFirstName.Text;
                            Session["type"] = rd["type"].ToString();
                            FormsAuthentication.RedirectFromLoginPage(txtFirstName.Text, chkRemember.Checked);
                        }
                        else
                        {
                            lblResult.Text = "Login failed. Invalid email + Password Combination.";
                        }
                    }
                    else
                    {
                        lblResult.Text = "Login failed. Invalid Email + Password Combination";
                    }
                    rd.Close();
                    con.Close();
                }
                catch (Exception ex)
                {
                    lblResult.Text = "Database Error: " + ex.Message;
                }
                finally
                {
                    if (con.State != ConnectionState.Closed)
                        con.Close();
                }
            }
        }
    }
}