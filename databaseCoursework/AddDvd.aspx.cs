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
    public partial class AddDvd : System.Web.UI.Page
    {
        private  string title, numberofcopies, date_released, standardCharge, penaltyCharge,studioName,
            producerName, castFName, castLName,castRole, dvdCategory;
        private string dvdId = "";
        private string producerId = "";
        private string studioId = "";
        private string castId = "";

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            clear();
            //Response.Write("<Script> alert('Clear button is pressed');</script>");

        }


        //instance for SqlConnection
        private SqlConnection connection = new SqlConnection();

        //instance for SqlCommand
        private SqlCommand command = new SqlCommand();

        //instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //instance for DataSet
        private DataSet data = new DataSet();

        SqlDataReader dataReader;

        public AddDvd()
        {
            //configuring the ConnectionString for SqlConnection instance
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["DVD StudioConnectionString"].ConnectionString.ToString();

            //configuring the SqlCommand instance
            command.Connection = connection;

            //configuring SqlDataAdapter instance
            adapter.SelectCommand = command;

           
        }
        public void changeRoleIndex()
        {
            command.CommandText = "select distinct role from cast_list";
            adapter.Fill(data, "castlist");
            if (data.Tables["castlist"].Rows.Count > 0)
            {
                listRole.DataSource = data.Tables["castlist"];
                listRole.DataTextField = "role";
                listRole.DataValueField = "role";
                listRole.DataBind();
                listRole.Items.Insert(0, new ListItem("Select", "0"));
                listRole.SelectedIndex = 0;
            }
        }
        public void changeCategoryIndex()
        {
            command.CommandText = "select dvd_category_id, name from dvd_category";
            adapter.Fill(data, "category");
            if (data.Tables["category"].Rows.Count > 0)
            {
                dropListCategory.DataSource = data.Tables["category"];
                dropListCategory.DataTextField = "name";
                dropListCategory.DataValueField = "dvd_category_id";
                dropListCategory.DataBind();
                dropListCategory.Items.Insert(0, new ListItem("Select", "0"));
                dropListCategory.SelectedIndex = 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("loginPage.aspx");

            }
            lblResult.Text = "";
            title = txtTitle.Text.ToString();
            numberofcopies = txtCopyNo.Text.ToString();
            date_released = txtDateReleased.Text.ToString();
            producerName = txtProducerName.Text.ToString();
            standardCharge = txtStandardCharge.Text.ToString();
            penaltyCharge = txtPenaltyCharge.Text.ToString();
            studioName = txtStudioName.Text.ToString();
            castFName = txtCastFirstName.Text.ToString();
            castLName = txtCastLastName.Text.ToString();
            castRole = listRole.Text.ToString();
            dvdCategory = dropListCategory.Text.ToString();
            if (!IsPostBack)
            {
                changeRoleIndex();
                changeCategoryIndex();
            }

        }

        public void validation()
        {
            if(title=="" || numberofcopies == ""||date_released==""|| producerName== "" || standardCharge==""||penaltyCharge==""||
                studioName==""||castFName==""||castLName==""||dvdCategory==""|| castRole=="")
            {
                lblResult.Text = "Please fill all the fields";
                

            }
            else
            {
                if (listRole.SelectedIndex == 0)
                {
                    lblResult.Text = "Please select a valid role.";
                }
                else if (dropListCategory.SelectedIndex==0){

                    lblResult.Text = "Please select a category name.";

                }
                else
                {
                    addDVD();
                }
            }
           
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            validation();
        }
        public void clear()
        {
            txtCastFirstName.Text = "";
            txtCastLastName.Text = "";
            txtTitle.Text = "";
            txtStudioName.Text = "";
            txtStandardCharge.Text = "";
            txtProducerName.Text = "";
            txtCopyNo.Text = "";
            txtDateReleased.Text = "";
            txtPenaltyCharge.Text = "";
            listRole.SelectedIndex = 0;
            dropListCategory.SelectedIndex = 0;
        }
        public void addDVD()
        {
            connection.Open();
            command.CommandText = "select title from dvd_details where title = @title";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@title", title);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                studioId = dataReader["title"].ToString();

                lblResult.Text = "DVD already added into the database.";
                
            }
            else
            {
                connection.Close();
                addStudio();
            }

        }
        public void addStudio()
        {
            
            connection.Open();
            command.CommandText = "select studio_id from studio where studio.name = @studioName";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@studioName", studioName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                studioId = dataReader["studio_id"].ToString();

                //lblResult.Text = studioId.ToString();
                
            }
            else
            {
                SqlConnection conn = new SqlConnection(connection.ConnectionString);
                conn.Open();
                SqlCommand command = new SqlCommand("Insert into Studio values('"+studioName+"')", conn);
                command.ExecuteNonQuery();
                conn.Close();
                

            }
            connection.Close();
            findStudioID();
           

        }
        public void findStudioID()
        {
            connection.Open();
            command.CommandText = "select studio_id from studio where studio.name = @studioName";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@studioName", studioName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                studioId = dataReader["studio_id"].ToString();
            }
            connection.Close();
            addCast();
        }
        public void addCast()
        {

            connection.Open();
            command.CommandText = "select cast_id from cast_list where fname = @fName and lname= @Lname";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@fName", castFName);
            command.Parameters.AddWithValue("@lName", castLName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                castId = dataReader["cast_id"].ToString();

                //lblResult.Text = castId.ToString();
            }
            else
            {

                SqlConnection conn = new SqlConnection(connection.ConnectionString);
                conn.Open();
                SqlCommand command = new SqlCommand("Insert into cast_list values('" + castFName + "','"+castLName+"','"+castRole+"')", conn);
                command.ExecuteNonQuery();
                lblResult.Text = castId.ToString();
                conn.Close();

            }
            connection.Close();

            findCastID();

        }
        public void findCastID()
        {
            connection.Open();
            command.CommandText = "select cast_id from cast_list where fname = @fName and lname= @Lname";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@fName", castFName);
            command.Parameters.AddWithValue("@lName", castLName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                castId = dataReader["cast_id"].ToString();
            }
            connection.Close();
            addProducer();
        }
        public void addProducer()
        {
            connection.Open();
            command.CommandText = "select producer_id from producer where producer.name=@producerName";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@producerName", producerName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                producerId = dataReader["producer_id"].ToString();
            }
            else
            {

                SqlConnection conn = new SqlConnection(connection.ConnectionString);
                conn.Open();
                SqlCommand command = new SqlCommand("Insert into producer values('" + producerName + "')", conn);
                command.ExecuteNonQuery();
                lblResult.Text = producerId.ToString();
                conn.Close();

            }
            connection.Close();

            findProducerID();
        }
        public void findProducerID()
        {
            connection.Open();
            command.CommandText = "select producer_id from producer where producer.name=@producerName";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@producerName", producerName);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                producerId = dataReader["producer_id"].ToString();
            }
            connection.Close();
            addDvdDetails();
        }

        public void addDvdDetails()
        {
            SqlConnection conn = new SqlConnection(connection.ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Insert into dvd_details values('" + title + "','"+numberofcopies+ "', '" + date_released + "','" + standardCharge + "', '" + penaltyCharge + "', '"+dvdCategory+"', '"+studioId+"' )", conn);
            command.ExecuteNonQuery();
            conn.Close();
            findDVDID();
        }
        public void findDVDID()
        {
            connection.Open();
            command.CommandText = "select dvd_id from dvd_details where title=@title";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@title", title);
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                dvdId = dataReader["dvd_id"].ToString();

                lblResult.Text = "Data successfully added into the database";
            }
            connection.Close();
            addDVDProducer();
        }
        public void addDVDProducer()
        {
            SqlConnection conn = new SqlConnection(connection.ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Insert into dvd_producer values('" + dvdId + "','" + producerId + "')", conn);
            command.ExecuteNonQuery();
            conn.Close();
            addDvdCast();
        }
        public void addDvdCast()
        {
            SqlConnection conn = new SqlConnection(connection.ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Insert into dvd_cast values('" + dvdId + "','" + castId + "')", conn);
            command.ExecuteNonQuery();
            conn.Close();
        }
    }
}