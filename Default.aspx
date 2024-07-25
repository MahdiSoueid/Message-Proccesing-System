<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master"  CodeBehind="Default.aspx.cs" Inherits="practiceapplication.Default" %>

<asp:Content ID="Default" ContentPlaceHolderID="DefaultHolder" runat="server">
   
  <div class="container-fluid container-fluid-custom mt-4">
    <div class="row">
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="image-item">
                <a href="MessageFilesGrid.aspx">
                    <img src="Content/file-logo.png" alt="Message Files" class="img-fluid">
                    <div class="mt-2">Message Files</div>
                </a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="image-item">
                <a href="Messages.aspx">
                    <img src="Content/message-logo.png" alt="Messages" class="img-fluid">
                    <div class="mt-2">Messages</div>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="image-item">
                <a href="MessageInterventions.aspx">
                    <img src="Content/message-interv.png" alt="Message Interventions" class="img-fluid">
                    <div class="mt-2">Message Interventions</div>
                </a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="image-item">
                <a href="EventLogs.aspx">
                    <img src="Content/eventlog-logo.jpg" alt="EventLogs" class="img-fluid">
                    <div class="mt-2">EventLogs</div>
                </a>
            </div>
        </div>
    </div>
</div>


</asp:Content>