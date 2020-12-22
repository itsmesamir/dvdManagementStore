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
    public partial class MemberLoan : System.Web.UI.Page
    {

        private DateTime loanstaken, loansAllowed;
        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();

        public MemberLoan()
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
            command.CommandText = "select fname, lname, mem_address, memcategory_name, numberofloansallowed, count(copy_id) as NumberOfCopiesOnLoan from member_details md  join member_category mc on md.member_category_id = mc.member_category_id join loans l on md.member_num = l.member_num group by md.member_num, fname, lname, mem_address, memcategory_name, numberofloansallowed order by fname";
            adapter.Fill(data, "members");
            packageGrid.DataSource = data.Tables["members"];
            packageGrid.DataBind();

            remark();
            
        }
        public void remark()
        {
            for (int i = 0; i < packageGrid.Rows.Count; i++)
            {
                string fname = packageGrid.Rows[i].Cells[1].Text;
                int loanstaken =Convert.ToInt32(packageGrid.Rows[i].Cells[6].Text);
                int loansAllowed = Convert.ToInt32(packageGrid.Rows[i].Cells[5].Text);

                if (loanstaken>loansAllowed)
                {
                    packageGrid.Rows[i].Cells[0].Text = "Too many DVDs";

                    packageGrid.Rows[i].Cells[0].ForeColor= System.Drawing.Color.Red;


                    
                }
                else if (loanstaken == loansAllowed)
                {
                    packageGrid.Rows[i].Cells[0].Text = "Limitation reached";

                    packageGrid.Rows[i].Cells[0].ForeColor = System.Drawing.Color.Red;



                }
            }
        }
            
    }
}