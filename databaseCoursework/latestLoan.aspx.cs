using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databaseCoursework
{
    public partial class LatestLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            copiesLoanedToMember.SelectCommand = "select md.fname,md.lname, title, l.dvd_id, l.copy_id from dvd_details dd join loans l on dd.dvd_id=l.dvd_id join member_details md on l.member_num = md.member_num where l.date_out >= GETDATE() - 31 and md.member_num = '100005'";
            GridView1.DataSource = copiesLoanedToMember;
            GridView1.DataBind();


        }

        protected void memberdropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            String queryTest = memberdropDown.SelectedValue.ToString();

            copiesLoanedToMember.SelectCommand = "select md.fname,md.lname, title, l.dvd_id, l.copy_id from dvd_details dd join loans l on dd.dvd_id=l.dvd_id join member_details md on l.member_num = md.member_num where l.date_out >= GETDATE() - 31 and md.member_num = '" + queryTest + "'";

            GridView1.DataSource = copiesLoanedToMember;
            GridView1.DataBind();
        }
    }
}