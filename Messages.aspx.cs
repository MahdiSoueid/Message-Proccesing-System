using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace practiceapplication
{
    public partial class Messages : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TestConnectionString"].ConnectionString;
        public static string FileID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                FileID = "0";


                if (Request.QueryString["IDKey"] != null)
                {

                    FileID = Request.QueryString["IDKey"];







                }
                else
                {
                    RadGrid2.Rebind();
                }




            }

        }
        protected void ExportToExcelButton_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            RadGrid2.MasterTableView.ExportToExcel();
        }

        protected void ExportToPdfButton_Click(object sender, EventArgs e)
        {
            ConfigureExport();
            RadGrid2.MasterTableView.ExportToPdf();
        }

        private void ConfigureExport()
        {

            RadGrid2.ExportSettings.OpenInNewWindow = true;
            RadGrid2.ExportSettings.FileName = "MessageFiles";
        }
        protected void ClearBttn_Click(object sender, EventArgs e)
        {

            OwnBictxt.Text = "";
            CorrBictxt.Text = "";
            DetailsOfChargestxt.Text = "";
            ddlMesgStatusOptions.SelectedItem.Text = "";

            MessageTypetxt.Text = "";
            SLAtxt.Text = "";

            ddlSubFormatOptions.SelectedItem.Text = "";
            ddlUserReferenceOptions.SelectedItem.Text = "";
            RadDateTimePickerFrom.SelectedDate = null;
            RadDateTimePickerTo.SelectedDate = null;




            RadGrid2.Rebind();
        }


        protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string MesgStatus = ddlMesgStatusOptions.SelectedItem.Text;


            RadGrid2.DataSource = GetMessages(MesgStatus, FileID);

        }

        protected void SearchBttn_Click(object sender, EventArgs e)
        {
            RadGrid2.Rebind();
        }
        private DataTable GetMessages(string MesgStatus, string FileID)
        {

            string OwnBic = OwnBictxt.Text;
            string CorrBic = CorrBictxt.Text;
            string MessageType = MessageTypetxt.Text;
            string DetailsOfCharges = DetailsOfChargestxt.Text;

            DataTable dataTable = new DataTable();
            DateTime selectedDateTimeFrom = RadDateTimePickerFrom.SelectedDate ?? DateTime.MinValue;
            DateTime selectedDateTimeTo = RadDateTimePickerTo.SelectedDate ?? DateTime.MaxValue;
            string DateTo = selectedDateTimeTo.ToString("yyyy-MM-dd HH:mm:ss");
            string DateFrom = selectedDateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss");
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
            string query;
            if (FileID != "0")
                query = "SELECT * FROM Messages WHERE FileID = @FileID and MesgStatus LIKE @MesgStatus AND InsertionDateTime >= @DateFrom AND InsertionDateTime <= @DateTo and UserReference like @UserReference and SubFormat like @SubFormat and  OwnBic like @OwnBic and CorrBic like @CorrBic and MessageType like @MessageType and DetailsOfCharges like @DetailsOfCharges;";
            else
                query = "SELECT * FROM Messages WHERE FileID >= @FileID and MesgStatus LIKE @MesgStatus AND InsertionDateTime >= @DateFrom AND InsertionDateTime <= @DateTo and UserReference like @UserReference and SubFormat like @SubFormat and OwnBic like @OwnBic and CorrBic like @CorrBic and MessageType like @MessageType and DetailsOfCharges like @DetailsOfCharges;";


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    command.Parameters.AddWithValue("@FileID ", FileID);
                    command.Parameters.AddWithValue("@MesgStatus", "%" + MesgStatus + "%");
                    command.Parameters.AddWithValue("@DateTo", DateTo);
                    command.Parameters.AddWithValue("@DateFrom", DateFrom);
                    command.Parameters.AddWithValue("@UserReference", "%" + ddlUserReferenceOptions.SelectedItem.Text + "%");
                    command.Parameters.AddWithValue("@OwnBic", "%" + OwnBic + "%");
                    command.Parameters.AddWithValue("@CorrBic", "%" + CorrBic + "%");
                    command.Parameters.AddWithValue("@MessageType", "%" + MessageType + "%");
                    command.Parameters.AddWithValue("@DetailsOfCharges", "%" + DetailsOfCharges + "%");
                    command.Parameters.AddWithValue("@SubFormat", "%" + ddlSubFormatOptions.SelectedItem.Text + "%");
                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }
            }

            return dataTable;
        }
        protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails" && e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                string IDKey = item["IDKey"].Text;

                Response.Redirect($"MessageInterventions.aspx?IDKey={IDKey}");
            }
        }




    }
}