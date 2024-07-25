using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace practiceapplication
{
    public partial class MessageFilesGrid : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string FileName = FileNametxt.Text;

            DateTime selectedDateTimeFrom = RadDateTimePickerFrom.SelectedDate ?? DateTime.MinValue;
            DateTime selectedDateTimeTo = RadDateTimePickerTo.SelectedDate ?? DateTime.MaxValue;
            string DateTo = selectedDateTimeTo.ToString("yyyy-MM-dd HH:mm:ss");
            string DateFrom = selectedDateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss");

            RadGrid1.DataSource = GetMesgFiles(FileName, DateTo, DateFrom);
        }

        protected void SearchBttn_Click(object sender, EventArgs e)
        {
            RadGrid1.Rebind();
        }
        protected void ClearBttn_Click(object sender, EventArgs e)
        {
            FileNametxt.Text = "";
            RadDateTimePickerFrom.SelectedDate = null;
            RadDateTimePickerTo.SelectedDate = null;
            RadGrid1.Rebind();
        }
        private DataTable GetMesgFiles(string FileName, string DateTo, string DateFrom)
        {
            errorMessage.Visible = false;
            DataTable dataTable = new DataTable();
            if (!string.IsNullOrEmpty(DateTo) && !string.IsNullOrEmpty(DateFrom))
            {
                DateTime dateTo = DateTime.Parse(DateTo);
                DateTime dateFrom = DateTime.Parse(DateFrom);
                if (dateFrom > dateTo)
                {
                    errorMessage.Visible = true;
                    return dataTable;
                }
            }

            DateTo = !string.IsNullOrEmpty(DateTo) ? DateTime.Parse(DateTo).ToString("yyyy-MM-dd HH:mm:ss") : DateTime.MaxValue.ToString("yyyy-MM-dd HH:mm:ss");
            DateFrom = !string.IsNullOrEmpty(DateFrom) ? DateTime.Parse(DateFrom).ToString("yyyy-MM-dd HH:mm:ss") : DateTime.MinValue.ToString("yyyy-MM-dd HH:mm:ss");


            string query = "SELECT * FROM MesgFiles WHERE FileName LIKE @FileName AND DateTime >= @DateFrom AND DateTime <= @DateTo;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FileName", "%" + FileName + "%");
                    command.Parameters.AddWithValue("@DateTo", DateTo);
                    command.Parameters.AddWithValue("@DateFrom", DateFrom);

                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }

        protected void RadGrid1_DetailTableDataBind(object sender, GridDetailTableDataBindEventArgs e)
        {


            if (e.DetailTableView.Name == "Messages")
            {
                e.DetailTableView.DataSource = GetMessages();
            }
            else if (e.DetailTableView.Name == "MessageIntervention")
            {
                e.DetailTableView.DataSource = GetMessageInterventions();
            }

        }

        private DataTable GetMessages()
        {
            DataTable dataTable = new DataTable();
            string query = "SELECT * FROM Messages ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    //command.Parameters.AddWithValue("@IDKey", "%" + IDkey + "%");
                    //command.Parameters.AddWithValue("@InsertionDateTime", "%" + InsertionDateTime + "%");

                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }
        private DataTable GetMessageInterventions()
        {
            DataTable dataTable = new DataTable();
            string query = "SELECT * FROM MessagesInterventions ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    //command.Parameters.AddWithValue("@IDKey", "%" + IDkey + "%");
                    //command.Parameters.AddWithValue("@InsertionDateTime", "%" + InsertionDateTime + "%");

                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails" && e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                string IDKey = item["IDKey"].Text;

                Response.Redirect($"Messages.aspx?IDKey={IDKey}");
            }
        }

    }

}
