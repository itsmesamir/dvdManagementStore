using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databaseCoursework
{
    public partial class DvdDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            SqlDataSource1.SelectCommand = "select dd.dvd_id, dd.title, st.name as studio, pd.name as producer, cl.fname, cl.lname, dd.datereleased from dvd_details dd join studio st on dd.studio_id = st.studio_id join dvd_producer dp on dd.dvd_id = dp.dvd_id join producer pd on dp.producer_id= pd.producer_id join dvd_cast dc on dd.dvd_id= dc.dvd_id join cast_list cl on dc.cast_id=cl.cast_id order by cl.lname, dd.datereleased";
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();


        }
    }

       
       
}