<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageFilesGrid.aspx.cs" MasterPageFile="~/Site1.Master"  Inherits="practiceapplication.MessageFilesGrid" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 <asp:Content ID="MessageFiles" ContentPlaceHolderID="MessageFilesHolder" runat="server">


       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
  
  <div class="container-fluid-custom mt-4">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Search Criteria</h5>
        </div>
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="filename" runat="server" CssClass="fw-bold form-label" Text="File Name:"></asp:Label>
                    <asp:TextBox ID="FileNametxt" runat="server" CssClass="form-control form-control-sm" Placeholder="FileName"></asp:TextBox>
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
                <div class="col-md-3 d-flex align-items-end">
                    <asp:Label ID="errorMessage" runat="server" CssClass="fw-bold text-danger me-3" Text="Wrong order of comparison" Visible="false"></asp:Label>
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
               
                <telerik:RadGrid ID="RadGrid1" skin="Metro" runat="server" AutoGenerateColumns="false"  AllowPaging="True" RenderMode="Lightweight"  OnNeedDataSource="RadGrid1_NeedDataSource" OnDetailTableDataBind="RadGrid1_DetailTableDataBind" OnItemCommand="RadGrid1_ItemCommand" >
                                      <ExportSettings IgnorePaging="true" OpenInNewWindow="true">
    <Pdf PageHeight="150mm" PageWidth="1000mm" DefaultFontFamily="Arial Unicode MS" 
        
         BorderStyle="Medium" BorderColor="#666666" 
         Title="My Report" Author="Your Name" Subject="Subject of the Report">
         
       
       
    </Pdf>
</ExportSettings>
                                    <ClientSettings>
    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
</ClientSettings>
                    <MasterTableView Name="MessageFiles" DataKeyNames="IDKey" Caption="Message Files"  CommandItemDisplay="Top">
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
                            <telerik:GridBoundColumn DataField="IDKey" HeaderText="File ID" UniqueName="IDKey" />
                            <telerik:GridBoundColumn DataField="FileName" HeaderText="FileName" UniqueName="FileName" />
                            <telerik:GridBoundColumn DataField="DateTime" HeaderText="DateTime" UniqueName="DateTime" />
                            <telerik:GridBoundColumn DataField="FileContent" HeaderText="FileContent" UniqueName="FileContent" />
                            <telerik:GridBoundColumn DataField="InsertionDateTime" HeaderText="InsertionDateTime" UniqueName="InsertionDateTime" />
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView Name="Messages" DataKeyNames="IDKey" Caption="Messages Table" AutoGenerateColumns="false" Width="3200px" Height="100%">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="IDKey" HeaderText="Message ID" UniqueName="IDKey" />
                                    <telerik:GridBoundColumn DataField="MessageContent" HeaderText="Message Content" UniqueName="MessageContent" />
                                    <telerik:GridBoundColumn DataField="InsertionDateTime" HeaderText="InsertionDateTime" UniqueName="InsertionDateTime" />
                                    <telerik:GridBoundColumn DataField="OwnBic" HeaderText="OwnBic" UniqueName="OwnBic" />
                                    <telerik:GridBoundColumn DataField="CorrBic" HeaderText="CorrBic" UniqueName="CorrBic" />
                                    <telerik:GridBoundColumn DataField="MessageType" HeaderText="Message Type" UniqueName="MessageType" />
                                    <telerik:GridBoundColumn DataField="SubFormat" HeaderText="SubFormat" UniqueName="SubFormat" />
                                    <telerik:GridBoundColumn DataField="UserReference" HeaderText="User Reference" UniqueName="UserReference" />
                                    <telerik:GridBoundColumn DataField="SLA" HeaderText="SLA" UniqueName="SLA" />
                                    <telerik:GridBoundColumn DataField="UETR" HeaderText="UETR" UniqueName="UETR" />
                                    <telerik:GridBoundColumn DataField="Reference" HeaderText="Reference" UniqueName="Reference" />
                                    <telerik:GridBoundColumn DataField="OrderingCust" HeaderText="OrderingCust" UniqueName="OrderingCust" />
                                    <telerik:GridBoundColumn DataField="BeneficiaryCust" HeaderText="BeneficiaryCust" UniqueName="BeneficiaryCust" />
                                    <telerik:GridBoundColumn DataField="DetailsOfCharges" HeaderText="DetailsOfCharges" UniqueName="DetailsOfCharges" />
                                    <telerik:GridBoundColumn DataField="Block1" HeaderText="Block1" UniqueName="Block1" />
                                    <telerik:GridBoundColumn DataField="Block2" HeaderText="Block2" UniqueName="Block2" />
                                    <telerik:GridBoundColumn DataField="Block3" HeaderText="Block3" UniqueName="Block3" />
                                    <telerik:GridBoundColumn DataField="Block4" HeaderText="Block4" UniqueName="Block4" />
                                    <telerik:GridBoundColumn DataField="MesgStatus" HeaderText="MesgStatus" UniqueName="MesgStatus" />
                                </Columns>
                                <ParentTableRelation>
                                    <telerik:GridRelationFields DetailKeyField="FileID" MasterKeyField="IDKey" />
                                </ParentTableRelation>
                                <DetailTables>
                                    <telerik:GridTableView Name="MessageIntervention" DataKeyNames="MessageID" Caption="Message Intervention Table" AutoGenerateColumns="false">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="IDKey" HeaderText="Intervention ID" UniqueName="IDKey" />
                                            <telerik:GridBoundColumn DataField="IntervText" HeaderText="IntervText" UniqueName="IntervText" />
                                            <telerik:GridBoundColumn DataField="DateTime" HeaderText="DateTime" UniqueName="DateTime" />
                                        </Columns>
                                        <ParentTableRelation>
                                            <telerik:GridRelationFields DetailKeyField="MessageID" MasterKeyField="IDKey" />
                                        </ParentTableRelation>
                                    </telerik:GridTableView>
                                </DetailTables>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    
            </ContentTemplate>
        </asp:UpdatePanel>
             
       

            

 </asp:Content>
