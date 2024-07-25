using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace practiceapplication
{
    public partial class EventLogs : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadGrid4_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            RadGrid4.DataSource = GetEventLogs();
        }
        protected void SearchBttn_Click(object sender, EventArgs e)
        {
            RadGrid4.Rebind();
        }
        protected void ClearBttn_Click(object sender, EventArgs e)
        {
            Descriptiontxt.Text = "";
            ServiceNametxt.Text = "";
            RadDateTimePickerFrom.SelectedDate = null;
            RadDateTimePickerTo.SelectedDate = null;
            RadGrid4.Rebind();
        }
        private DataTable GetEventLogs()
        {
            DateTime selectedDateTimeFrom = RadDateTimePickerFrom.SelectedDate ?? DateTime.MinValue;
            DateTime selectedDateTimeTo = RadDateTimePickerTo.SelectedDate ?? DateTime.MaxValue;
            string DateTo = selectedDateTimeTo.ToString("yyyy-MM-dd HH:mm:ss");
            string DateFrom = selectedDateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss");
            string Description = Descriptiontxt.Text;
            string ServiceName = ServiceNametxt.Text;



            DataTable dataTable = new DataTable();
            if (!string.IsNullOrEmpty(DateTo) && !string.IsNullOrEmpty(DateFrom))
            {
                DateTime dateTo = DateTime.Parse(DateTo);
                DateTime dateFrom = DateTime.Parse(DateFrom);
                if (dateFrom > dateTo)
                {

                    return dataTable;
                }
            }

            DateTo = !string.IsNullOrEmpty(DateTo) ? DateTime.Parse(DateTo).ToString("yyyy-MM-dd HH:mm:ss") : DateTime.MaxValue.ToString("yyyy-MM-dd HH:mm:ss");
            DateFrom = !string.IsNullOrEmpty(DateFrom) ? DateTime.Parse(DateFrom).ToString("yyyy-MM-dd HH:mm:ss") : DateTime.MinValue.ToString("yyyy-MM-dd HH:mm:ss");

            string connectionString = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
            string query = "SELECT * FROM EventLogs WHERE Description LIKE @Description AND DateTime >= @DateFrom AND DateTime <= @DateTo and ServiceName like @ServiceName;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Description", "%" + Description + "%");
                    command.Parameters.AddWithValue("@DateTo", DateTo);
                    command.Parameters.AddWithValue("@DateFrom", DateFrom);
                    command.Parameters.AddWithValue("@ServiceName", "%" + ServiceName + "%");


                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }

    }
}