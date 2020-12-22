using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace databaseCoursework
{
    public partial class Dashboard: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DVDCount
            DataView DVD = (DataView)getDVDcount.Select(DataSourceSelectArguments.Empty);
            DVDcount.Text = String.Join("|", DVD.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            //LoanCount
          DataView LCount = (DataView)getLoanCount.Select(DataSourceSelectArguments.Empty);
          LoanCount.Text = String.Join("|", LCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            //MemberCount
          DataView MCount = (DataView)getMemberCount.Select(DataSourceSelectArguments.Empty);
          MemberCount.Text = String.Join("|", MCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            //StaffCount
          DataView SCount = (DataView)getStaffCount.Select(DataSourceSelectArguments.Empty);
          StaffCount.Text = String.Join("|", SCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

        }

        
    }
}
