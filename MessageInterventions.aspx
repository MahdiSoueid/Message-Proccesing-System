<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageInterventions.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="practiceapplication.MessageInterventions" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

    
       <asp:Content ID="MessageInterv" ContentPlaceHolderID="MessageIntervHolder" runat="server">
           
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
          
     <div class="container-fluid mt-4">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Search Criteria</h5>
        </div>
        <div class="card-body">
            <div class="row mb-2">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <asp:Label ID="IntervText" runat="server" CssClass="fw-bold form-label mb-1" Text="IntervText:"></asp:Label>
                    <asp:TextBox ID="IntervTexttxt" runat="server" CssClass="form-control form-control-sm" Placeholder="IntervText"></asp:TextBox>
                </div>
                  <div class="col-lg-2 col-md-4 col-sm-6">
       <div class="form-group">
           <asp:Label ID="DateFrom" runat="server" CssClass="fw-bold form-label mb-1" Text="From:"></asp:Label>
         
       </div>
         <telerik:RadDateTimePicker ID="RadDateTimePickerFrom" runat="server" MinDate="2000-01-01" MaxDate="2100-12-31" DateInput-DateFormat="yyyy-MM-dd HH:mm:ss"  CssClass=" form-control form-control-sm" ></telerik:RadDateTimePicker>
   </div>
   <div class="col-lg-2 col-md-4 col-sm-6">
       <div class="form-group">
           <asp:Label ID="DateTo" runat="server" CssClass="fw-bold form-label mb-1" Text="To:"></asp:Label>
          
       </div>
        <telerik:RadDateTimePicker ID="RadDateTimePickerTo" runat="server" MinDate="2000-01-01" MaxDate="2100-12-31" DateInput-DateFormat="yyyy-MM-dd HH:mm:ss"  CssClass="form-control form-control-sm" ></telerik:RadDateTimePicker>
   </div>
                <div class="col-lg-3 col-md-4 col-sm-6 d-flex align-items-end">
                    <asp:Label ID="errorMessage" runat="server" CssClass="text-danger me-3" Text="Wrong order of comparison" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="Searchbttn" runat="server" Text="Search" CssClass="btn btn-primary btn-block" OnClick="SearchBttn_Click" />
                    <asp:Button ID="Clearbttn" runat="server" Text="Clear" CssClass="btn btn-secondary btn-block" OnClick="ClearBttn_Click" />
                </div>
            </div>
        </div>
    </div>
</div>


            <div class="table-responsive">
                
                <telerik:RadGrid ID="RadGrid3"  AllowPaging="True" RenderMode="Lightweight"  runat="server" AutoGenerateColumns="false" OnNeedDataSource="RadGrid3_NeedDataSource">
                                  <ExportSettings IgnorePaging="true" OpenInNewWindow="true">
<Pdf PageHeight="150mm" PageWidth="400mm" DefaultFontFamily="Arial Unicode MS" 
    
     BorderStyle="Medium" BorderColor="#666666" 
     Title="My Report" Author="Your Name" Subject="Subject of the Report">
     
   
   
</Pdf>
 </ExportSettings>
                                    <ClientSettings>
    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
</ClientSettings>
                    <MasterTableView Name="MessagesInterventions" DataKeyNames="IDKey" Caption="Message Interventions"  CommandItemDisplay="Top">
                         <CommandItemSettings 
     ShowRefreshButton="false" ShowAddNewRecordButton="false"
     ShowExportToPdfButton="true" 
     ShowExportToExcelButton="true" 
     />
                        <Columns>
                            <telerik:GridBoundColumn DataField="IDKey" HeaderText="Message Interventions ID" UniqueName="IDKey" />
                            <telerik:GridBoundColumn DataField="IntervText" HeaderText="IntervText" UniqueName="IntervText" />
                            <telerik:GridBoundColumn DataField="DateTime" HeaderText="DateTime" UniqueName="DateTime" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
             </ContentTemplate>
   </asp:UpdatePanel>
            
           </asp:Content>
    
