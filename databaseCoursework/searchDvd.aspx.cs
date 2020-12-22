using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databaseCoursework
{
    public partial class SearchDVD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            searchDvdTitle.SelectCommand = "select title, cast_list.fname, cast_list.lname, cast_list.fname from dvd_details join dvd_cast on dvd_details.dvd_id= dvd_cast.dvd_id join cast_list on dvd_cast.cast_id = cast_list.cast_id where cast_list.lname = 'Hamal'; ";
            GridView1.DataSource = searchDvdTitle;
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String queryTest = DropDownList1.SelectedValue.ToString();
            searchDvdTitle.SelectCommand = "select title, cast_list.fname, cast_list.lname from dvd_details join dvd_cast on dvd_details.dvd_id= dvd_cast.dvd_id join cast_list on dvd_cast.cast_id = cast_list.cast_id where cast_list.lname = '" + queryTest + "'";

            GridView1.DataSource = searchDvdTitle;
            GridView1.DataBind();
        }
    } 
}