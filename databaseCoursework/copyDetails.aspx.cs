using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databaseCoursework
{
    public partial class CopyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            CopyDetails1.SelectCommand = "select copy_id, loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title as dvd from loans join member_details on loans.member_num = member_details.member_num join dvd_details on dvd_details.dvd_id = loans.dvd_id group by copy_id,loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title having date_out = (select max(date_out) from loans where copy_id = 20000) and copy_id = 20000";
            GridView1.DataSource = CopyDetails1;
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String queryTest = DropDownList1.SelectedValue.ToString();

            CopyDetails1.SelectCommand = "select copy_id, loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title as dvd from loans join member_details on loans.member_num = member_details.member_num join dvd_details on dvd_details.dvd_id = loans.dvd_id group by copy_id,loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title having date_out = (select max(date_out) from loans where copy_id = '" + queryTest + "') and copy_id = '" + queryTest + "'";

            GridView1.DataSource = CopyDetails1;
            GridView1.DataBind();
        }
    }
}