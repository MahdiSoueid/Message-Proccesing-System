<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EventLogs.aspx.cs" Inherits="practiceapplication.EventLogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="EventLogs" ContentPlaceHolderID="EventLogsHolder" runat="server">
    
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           
      <ContentTemplate>
          
<div class="container-fluid-custom mt-4">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Search Criteria</h5>
        </div>
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <asp:Label ID="Description" runat="server" CssClass="fw-bold form-label" Text="Description:"></asp:Label>
                    <asp:TextBox ID="Descriptiontxt" runat="server" CssClass="form-control form-control-sm" Placeholder="Description"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <asp:Label ID="ServiceName" runat="server" CssClass="fw-bold form-label" Text="ServiceName:"></asp:Label>
                    <asp:TextBox ID="ServiceNametxt" runat="server" CssClass="form-control form-control-sm" Placeholder="ServiceName"></asp:TextBox>
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
     <telerik:RadDateTimePicker ID="RadDateTimePickerTo"    runat="server" MinDate="2000-01-01" MaxDate="2100-12-31" DateInput-DateFormat="yyyy-MM-dd HH:mm:ss"  CssClass="form-control form-control-sm" ></telerik:RadDateTimePicker>
</div>
                
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Button ID="Searchbttn" runat="server" Text="Search" CssClass="btn btn-primary btn-block" OnClick="SearchBttn_Click" />
                    <asp:Button ID="Clearbttn" runat="server" Text="Clear" CssClass="btn btn-secondary btn-block" OnClick="ClearBttn_Click" />
                </div>
            </div>
        </div>
    </div>
</div>

                


      <div >
       
          <telerik:RadGrid ID="RadGrid4" runat="server" AllowPaging="True" RenderMode="Lightweight" AutoGenerateColumns="false" OnNeedDataSource="RadGrid4_NeedDataSource">
                                <ExportSettings IgnorePaging="true" OpenInNewWindow="true">
    <Pdf PageHeight="150mm" PageWidth="600" DefaultFontFamily="Arial Unicode MS" 
        
         BorderStyle="Medium" BorderColor="#666666" 
         Title="My Report" Author="Your Name" Subject="Subject of the Report">
         
       
       
    </Pdf>
</ExportSettings>
                              <ClientSettings>
    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
</ClientSettings>
              <MasterTableView Name="Event Logs" DataKeyNames="IDKey" Caption="Event Logs" CommandItemDisplay="Top">
                   <CommandItemSettings 
     ShowRefreshButton="false" ShowAddNewRecordButton="false"
     ShowExportToPdfButton="true" 
     ShowExportToExcelButton="true" 
     />
                  <Columns>
                      
                     
                      <telerik:GridBoundColumn DataField="DateTime" HeaderText="DateTime" UniqueName="DateTime" HeaderStyle-CssClass="fw-bold" />
                      <telerik:GridBoundColumn DataField="Description" HeaderText="Description" UniqueName="Description" HeaderStyle-CssClass="fw-bold" />
                      <telerik:GridBoundColumn DataField="ServiceName" HeaderText="ServiceName" UniqueName="ServiceName" HeaderStyle-CssClass="fw-bold" />
                  </Columns>
              </MasterTableView>
          </telerik:RadGrid>
      </div>
  </div>
                </ContentTemplate>
                 </asp:UpdatePanel>
            
      

           



</asp:Content>
