<%@page import="com.sms.model.Student"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sms.service.StudentService"%>
<%@page import="com.sms.service.StudentServiceInterface" %>
<jsp:useBean id="studBean" class="com.sms.beans.StudentBean" scope="request" />
<%
    try {
        Student student = new Student();
        student.setRegNo(request.getParameter("regno"));
        student.setFistName(request.getParameter("fname"));
        student.setLastName(request.getParameter("lname"));

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        if (request.getParameter("dob") != null) {
            student.setDob(formatter.parse(request.getParameter("dob")));
        }

        StudentServiceInterface stud = new StudentService();

        if (request.getParameter("action").equals("Update")) {
            stud.updateStudent(student);
            studBean.setInfoMessage("Updated successfully!");
        } else if (request.getParameter("action").equals("Delete")) {
            stud.deleteStudent(student);
            studBean.setInfoMessage("Deleted successfully!");
        } else {
            stud.saveStudent(student);
            studBean.setInfoMessage("Saved successfully!");
        }
        studBean.clear();
        studBean.setErrorMessage("");
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
    } catch (Exception ex) {
        studBean.setErrorMessage("Error! Check student issue.");
        studBean.setInfoMessage("");
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
    }
%>