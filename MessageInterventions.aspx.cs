using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace practiceapplication
{
    public partial class MessageInterventions : System.Web.UI.Page
    {
        public static string MessageID;
        string connectionString = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MessageID = "0";


                if (Request.QueryString["IDKey"] != null)
                {

                    MessageID = Request.QueryString["IDKey"];







                }
                else
                {
                    RadGrid3.Rebind();
                }


            }
        }
        protected void RadGrid3_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {


            RadGrid3.DataSource = GetMessagesInterventions();

        }
        protected void ClearBttn_Click(object sender, EventArgs e)
        {

            IntervTexttxt.Text = "";
            RadDateTimePickerFrom.SelectedDate = null;
            RadDateTimePickerTo.SelectedDate = null;
            RadGrid3.Rebind();
        }
        protected void SearchBttn_Click(object sender, EventArgs e)
        {
            RadGrid3.Rebind();
        }
        private DataTable GetMessagesInterventions()
        {
            DateTime selectedDateTimeFrom = RadDateTimePickerFrom.SelectedDate ?? DateTime.MinValue;
            DateTime selectedDateTimeTo = RadDateTimePickerTo.SelectedDate ?? DateTime.MaxValue;
            string DateTo = selectedDateTimeTo.ToString("yyyy-MM-dd HH:mm:ss");
            string DateFrom = selectedDateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss");
            string IntervTexts = IntervTexttxt.Text;
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
            string query;
            if (MessageID != "0")
                query = "SELECT * FROM MessagesInterventions WHERE MessageID = @MessageID AND DateTime >= @DateFrom AND DateTime <= @DateTo and IntervText like @IntervText;";
            else
                query = "SELECT * FROM MessagesInterventions WHERE MessageID >= @MessageID AND DateTime >= @DateFrom AND DateTime <= @DateTo and IntervText like @IntervText;";






            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    command.Parameters.AddWithValue("@MessageID ", MessageID);
                    command.Parameters.AddWithValue("@IntervText", "%" + IntervTexts + "%");
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

    }
}