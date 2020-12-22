using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databaseCoursework
{
    public partial class Copies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            findCopies.SelectCommand = "select dd.dvd_id, dd.title, count(l.dvd_id) as numofcopies from dvd_details dd join dvd_cast dc on dd.dvd_id =dc.dvd_id join cast_list cl on dc.cast_id = cl.cast_id join loans l on dd.dvd_id = l.dvd_id where cl.lname = 'Hamal' and l.date_returned is not null group by dd.dvd_id, dd.title";
            GridView1.DataSource = findCopies;
            GridView1.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String queryTest = DropDownList1.SelectedValue.ToString();
            findCopies.SelectCommand = "select dd.dvd_id, dd.title, count(l.dvd_id) as numofcopies from dvd_details dd join dvd_cast dc on dd.dvd_id =dc.dvd_id join cast_list cl on dc.cast_id = cl.cast_id join loans l on dd.dvd_id = l.dvd_id where cl.lname = '" + queryTest + "' and l.date_returned is not null group by dd.dvd_id, dd.title";

            GridView1.DataSource = findCopies;
            GridView1.DataBind();
        }
    }
}