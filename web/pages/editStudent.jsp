<%@page import="com.sms.model.Student"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sms.service.StudentService"%>
<%@page import="com.sms.service.StudentServiceInterface" %>
<jsp:useBean id="studBean" class="com.sms.beans.StudentBean" scope="request" />
<%
        studBean.setRegNo(request.getParameter("regNo"));
        String action = request.getParameter("action");
        StudentServiceInterface stud = new StudentService();
        Student student= stud.getStudent(studBean.getRegNo());
        studBean.setFistName(student.getFistName());
        studBean.setLastName(student.getLastName());
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        studBean.setDob(formatter.format(student.getDob()));
        request.setAttribute("action", action);
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
    
%>