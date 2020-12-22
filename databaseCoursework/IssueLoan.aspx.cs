using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;

namespace databaseCoursework
{
    public partial class IssueLoan : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DVD StudioConnectionString"].ConnectionString;
        int ddue;
        int allowedNum;
        int onLoan;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }

            txtDateOut.Text = DateTime.Now.ToString("MM/dd/yyyy");
            dueDate();



        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void NewButton_Click(object sender, EventArgs e)
        {

        }

        protected void dateOut_Load(object sender, EventArgs e)
        {
            
        }

        private void checkmember()
        {
            SqlConnection ConnCheckAge = new SqlConnection(strConnString);
            String MemberNo = drop_memNum.SelectedValue.ToString();
            SqlCommand cmdCheckAge = new SqlCommand("", ConnCheckAge);
            SqlDataReader DataCheckAge;

            ConnCheckAge.Open();
            cmdCheckAge.CommandText = "select member_num, age from member_details where age >18 and member_num = '" + MemberNo + "';";
            DataCheckAge = cmdCheckAge.ExecuteReader();
            if (DataCheckAge.HasRows)
            {
                //if has rows the above 18
                checkNumofLoans();
                //issuedvd();
            }
            else
            {
                checkdvd();


            }

        }

        private void checkNumofLoans()
        {
            string LoanAllowed = "";
            string DVDLoaned = "";
            
            String MemberNo = drop_memNum.SelectedValue.ToString();

            SqlConnection ConnCheckLoan = new SqlConnection(strConnString);      
            SqlCommand cmdCheckLoan = new SqlCommand("", ConnCheckLoan);
            SqlDataReader dataNumLoan;

            SqlConnection ConnDVDLoaned = new SqlConnection(strConnString);
            SqlCommand cmdDVDLoaned = new SqlCommand("", ConnDVDLoaned);
            SqlDataReader dataDVDLoaned;
            

            ConnCheckLoan.Open();

            cmdCheckLoan.CommandText = "select numberofloansallowed from member_details join member_category on member_details.member_category_id = member_category.member_category_id where member_num ='" + MemberNo + "';";
            dataNumLoan = cmdCheckLoan.ExecuteReader();

            if (dataNumLoan.Read())
            {
                LoanAllowed = dataNumLoan["numberofloansallowed"].ToString();
                allowedNum = Convert.ToInt32(LoanAllowed);

            }
            dataNumLoan.Close();

            ConnDVDLoaned.Open();
            cmdDVDLoaned.CommandText = "select count(loan_num) as totalloans from loans  where member_num= '" + MemberNo + "' and date_returned IS NULL";
                dataDVDLoaned = cmdDVDLoaned.ExecuteReader();
                if(dataDVDLoaned.Read())
                {
                    DVDLoaned = dataDVDLoaned["totalloans"].ToString();
                    onLoan = Convert.ToInt32(DVDLoaned);
                }

            dataDVDLoaned.Close();

            if (onLoan == allowedNum)
            {
                Label7.Text = "Sorry!Your Loan Limit has reached";
            }
            else
            { 
                issuedvd(); 
            } 
        }

        public void checkdvd()
        {
            String copyNo = drop_copyId.SelectedValue.ToString();

            SqlConnection ConnDVDCheck = new SqlConnection(strConnString);

            SqlCommand CmdDvdCheck = new SqlCommand("", ConnDVDCheck);
            SqlDataReader DataDvdCheck;
            ConnDVDCheck.Open();

            CmdDvdCheck.CommandText = "SELECT ageRestriction, copy_details.dvd_id, copy_details.copy_num FROM copy_details INNER JOIN dvd_details ON dvd_details.dvd_id = copy_details.dvd_id join dvd_category on dvd_details.category_id = dvd_category.dvd_category_id WHERE (dvd_category.agerestriction = 'Adult') AND (copy_details.copy_num = '" + copyNo + "')";
            DataDvdCheck = CmdDvdCheck.ExecuteReader();
            //if has rows is restricted
            if (DataDvdCheck.HasRows)
            {

                message.Text = "Age restricted dvd Chosen! Member is under 18!";


            }
            //if has no rows is restricted
            else
            {
                checkNumofLoans();
            }
        }
        

        private void dueDate()
        {
            string calcDueDate = drop_loanId.SelectedValue.ToString();
            SqlConnection DueDateConn = new SqlConnection(strConnString);
            SqlCommand DueCmd = new SqlCommand("", DueDateConn);
            SqlDataReader checkDue;
            DueDateConn.Open();

            DueCmd.CommandText = "select loanduration from loan_type where type_id = '" + calcDueDate + "'";
            checkDue = DueCmd.ExecuteReader();
            string due = "";
            if (checkDue.Read())
            {
                due = checkDue["loanduration"].ToString();
                ddue = Convert.ToInt32(due);
                txtDateDue.Text = DateTime.Now.AddDays(ddue).ToString("MM/dd/yyyy");


            }

            checkDue.Close();

        }

        private void BindDVD()
        {
            string copyNum = drop_copyId.SelectedValue.ToString();
            SqlConnection ConnDVDBind = new SqlConnection(strConnString);
            SqlCommand CmdDVDBind = new SqlCommand("", ConnDVDBind);
            SqlDataReader DataDvdBind;
            ConnDVDBind.Open();

            CmdDVDBind.CommandText = "select dvd_id from copy_details where copy_num = '" + copyNum + "'";
            DataDvdBind = CmdDVDBind.ExecuteReader();
            string dvd = "";
            if (DataDvdBind.Read())
            {
                dvd = DataDvdBind["dvd_id"].ToString();
                drop_dvdId.SelectedValue = dvd;
               
              


            }

            DataDvdBind.Close();

        }

        private void issuedvd()
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                string date = txtDateDue.Text;
                DateTime oDate = Convert.ToDateTime(date);

                string out1 = txtDateOut.Text;
                DateTime out2 = Convert.ToDateTime(out1);

                conn.Open();
                SqlCommand cmds = new SqlCommand("Insert into loans Values ('"  + drop_loanId.SelectedValue+ "','" + drop_copyId.SelectedValue + "','" + drop_memNum.SelectedValue + "','" + out2 + "','" + oDate +"','"+ null+"','"+drop_dvdId.SelectedValue+ "')", conn);
               cmds.ExecuteNonQuery();


                
            }
            Response.Redirect("~/IssueLoan.aspx");
        }

        protected void btnAddLoan_Click(object sender, EventArgs e)
        {

            if ( drop_loanId.SelectedValue == "" || drop_copyId.SelectedValue == "" || drop_memNum.SelectedValue == "" || drop_dvdId.SelectedValue == "")
            {
                message.Text = "Feild is missing values";
            }
            else if (txtDateOut.Text != null || txtDateDue.Text != null || drop_loanId.SelectedValue != null || drop_copyId.SelectedValue != null || drop_memNum.SelectedValue != null || drop_dvdId.SelectedValue != null)
            {
                checkmember();
            }
        }

        protected void drop_loanId_SelectedIndexChanged(object sender, EventArgs e)
        {
            dueDate();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void drop_copyId_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDVD();
        }
    }
}