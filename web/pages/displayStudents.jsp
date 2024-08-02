<%@page import="com.sms.service.StudentServiceInterface"%>
<%@page import="com.sms.service.StudentService"%>
<%@page import="java.util.List"%>
<%@page import="com.sms.model.Student"%>
<%@page import="java.util.ArrayList"%>
<link href="../css/table.css" rel="stylesheet" type="text/css"/>
<%@include file="home.jsp" %>
<div class="wrapper">
    <div class="table">
        <div class="row header blue">
            <div class="cell">
                RegNo
            </div>
            <div class="cell">
                First Name
            </div>
            <div class="cell">
                Last Name
            </div>
            <div class="cell">
                Date of Birth
            </div>
            <div class="cell">
                Action
            </div>

        </div>

        <%
            List<Student> students = new ArrayList<Student>();
            StudentServiceInterface studService = new StudentService();
            students = studService.getStudents();

            for (Student student : students) {
        %>
        <div class="row">
            <div class="cell" data-title="RegNo">
                <%=student.getRegNo()%>
            </div>
            <div class="cell" data-title="First Name">
                <%=student.getFistName()%>
            </div>
            <div class="cell" data-title="Last Name">
                <%=student.getLastName()%>
            </div>
            <div class="cell" data-title="Date of Birth">
                <%=student.getDob()%>
            </div>
            <div class="cell" data-title="Action">
                <a href="editStudent.jsp?regNo=<%=student.getRegNo() %>&action=Update">Edit</a>
                <a href="editStudent.jsp?regNo=<%=student.getRegNo() %>&action=Delete">Delete</a>
            </div>
        </div>
        <%}%>
    </div>
</div>