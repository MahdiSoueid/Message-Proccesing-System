using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace practiceapplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string username = UserNametxt.Text.Trim();
            string password = Passwordtxt.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
            string query = "SELECT * FROM ManageUsers WHERE username = @Username AND password = @Password";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        string name = reader["username"].ToString();
                        Session["UserName"] = name;

                        FormsAuthentication.SetAuthCookie(username, false);
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        WrongPasstxt.Text = "Wrong Password or UserName";
                        WrongPasstxt.ForeColor = System.Drawing.Color.Red;
                        WrongPasstxt.Visible = true;
                    }

                    reader.Close();
                }
            }
        }


    }
}