<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="StudentAttendanceDetails.aspx.cs" Inherits="SchoolProject.Admin.StudentAttendanceDetails" %>

<%@ Register  Src="~/StudentAttendanceUserControl1.ascx" TagPrefix="uc" TagName="StudentAttendance"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <uc:StudentAttendance ID="StudentAttendance1" runat="server"></uc:StudentAttendance>

</asp:Content>
