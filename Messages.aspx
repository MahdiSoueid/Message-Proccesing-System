<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" MasterPageFile="~/Site1.Master"  Inherits="practiceapplication.Messages" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<asp:Content ID="Messages" ContentPlaceHolderID="MessagesHolder" runat="server">
    
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>

      
     <div class="container-fluid-custom mt-4">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Search Criteria</h5>
        </div>
        <div class="card-body">
            <div class="row mb-2">
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="OwnBic" runat="server" CssClass="fw-bold form-label mb-1" Text="OwnBic:"></asp:Label>
                    <asp:TextBox ID="OwnBictxt" runat="server" CssClass="form-control form-control-sm" Placeholder="OwnBic"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="CorrBic" runat="server" CssClass="fw-bold form-label mb-1" Text="CorrBic:"></asp:Label>
                    <asp:TextBox ID="CorrBictxt" runat="server" CssClass="form-control form-control-sm" Placeholder="CorrBic"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="MessageType" runat="server" CssClass="fw-bold form-label mb-1" Text="MessageType:"></asp:Label>
                    <asp:TextBox ID="MessageTypetxt" runat="server" CssClass="form-control form-control-sm" Placeholder="MessageType"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="SLA" runat="server" CssClass="fw-bold form-label mb-1" Text="SLA:"></asp:Label>
                    <asp:TextBox ID="SLAtxt" runat="server" CssClass="form-control form-control-sm" Placeholder="SLA"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="UserReferenceLabel" runat="server" CssClass="fw-bold form-label mb-1" Text="User Reference:"></asp:Label>
                    <asp:DropDownList ID="ddlUserReferenceOptions" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="DEFAULT" Value="2"></asp:ListItem>
                        <asp:ListItem Text="USERREF1" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="SubFormatLabel" runat="server" CssClass="fw-bold form-label mb-1" Text="Sub Format:"></asp:Label>
                    <asp:DropDownList ID="ddlSubFormatOptions" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="INPUT" Value="2"></asp:ListItem>
                        <asp:ListItem Text="OUTPUT" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="DetailsOfCharges" runat="server" CssClass="fw-bold form-label mb-1" Text="Details Of Charges:"></asp:Label>
                    <asp:TextBox ID="DetailsOfChargestxt" runat="server" CssClass="form-control form-control-sm" Placeholder="Details Of Charges"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <asp:Label ID="MesgStatusLabel" runat="server" CssClass="fw-bold form-label mb-1" Text="Message Status:"></asp:Label>
                    <asp:DropDownList ID="ddlMesgStatusOptions" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="MesgInserted" Value="2"></asp:ListItem>
                        <asp:ListItem Text="MesgProcessed" Value="3"></asp:ListItem>
                    </asp:DropDownList>
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
                <div class="col-lg-2 col-md-4 col-sm-6 align-self-end">
                    <div class="form-group text-right">
                        <asp:Button ID="Searchbttn" runat="server" Text="Search" CssClass="btn btn-primary btn-sm" OnClick="SearchBttn_Click" />
                        <asp:Button ID="Clearbttn" runat="server" Text="Clear" CssClass="btn btn-secondary btn-sm ml-2" OnClick="ClearBttn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

            <div >
            
              
                <telerik:RadGrid skin="Metro" AllowSorting="true"  AllowPaging="True" RenderMode="Lightweight"  ID="RadGrid2" runat="server" AutoGenerateColumns="false" OnNeedDataSource="RadGrid2_NeedDataSource"   OnItemCommand="RadGrid2_ItemCommand" >
                      <ExportSettings IgnorePaging="true" OpenInNewWindow="true">
        <Pdf PageHeight="150mm" PageWidth="1500mm" DefaultFontFamily="Arial Unicode MS" 
            
             BorderStyle="Medium" BorderColor="#666666" 
             Title="My Report" Author="Your Name" Subject="Subject of the Report">
             
           
           
        </Pdf>
    </ExportSettings>
      <ClientSettings>
        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
    </ClientSettings>
    <MasterTableView   Name="MessageFiles" DataKeyNames="IDKey" Caption="Message Files" CommandItemDisplay="Top" >
        <CommandItemSettings 
            ShowRefreshButton="false" ShowAddNewRecordButton="false"
            ShowExportToPdfButton="true" 
            ShowExportToExcelButton="true" 
            />
        <Columns>
        <telerik:GridButtonColumn CommandName="ViewDetails"
                          UniqueName="ViewDetails"
                          ButtonType="ImageButton"
                          ImageUrl="Content/icon-info.png"
                          ItemStyle-CssClass="grid-button-logo" />

            <telerik:GridBoundColumn DataField="IDKey" HeaderText="Message ID" UniqueName="IDKey" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="MessageContent" HeaderText="Message Content" UniqueName="MessageContent" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="InsertionDateTime" HeaderText="InsertionDateTime" UniqueName="InsertionDateTime" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="OwnBic" HeaderText="OwnBic" UniqueName="OwnBic" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="CorrBic" HeaderText="CorrBic" UniqueName="CorrBic" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="MessageType" HeaderText="Message Type" UniqueName="MessageType" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="SubFormat" HeaderText="SubFormat" UniqueName="SubFormat" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="UserReference" HeaderText="User Reference" UniqueName="UserReference" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="SLA" HeaderText="SLA" UniqueName="SLA" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="UETR" HeaderText="UETR" UniqueName="UETR" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="Reference" HeaderText="Reference" UniqueName="Reference" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="OrderingCust" HeaderText="OrderingCust" UniqueName="OrderingCust" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="BeneficiaryCust" HeaderText="BeneficiaryCust" UniqueName="BeneficiaryCust" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="DetailsOfCharges" HeaderText="DetailsOfCharges" UniqueName="DetailsOfCharges" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="Block1" HeaderText="Block1" UniqueName="Block1" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="Block2" HeaderText="Block2" UniqueName="Block2" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="Block3" HeaderText="Block3" UniqueName="Block3" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="Block4" HeaderText="Block4" UniqueName="Block4" HeaderStyle-CssClass="fw-bold" />
            <telerik:GridBoundColumn DataField="MesgStatus" HeaderText="MesgStatus" UniqueName="MesgStatus" HeaderStyle-CssClass="fw-bold" />
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

            </div>
        </div>
         </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
