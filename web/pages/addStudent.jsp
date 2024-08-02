<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="studBean" class="com.sms.beans.StudentBean" scope="request" />
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<%@include file="home.jsp" %>
<div class="formbold-main-wrapper">
    <div class="formbold-form-wrapper">
        <font style="color: red">
        ${studBean.errorMessage}
        </font>
        <font style="color: green">
        ${studBean.infoMessage}
        </font>
        <form action="registerStudent.jsp" method="post">
            <div class="formbold-mb-5">
                <label class="formbold-form-label">  </label>
                <input type="text" name="regno" placeholder="Enter RegNo" class="formbold-form-input" value="${studBean.regNo}"/> 
            </div>
            <div class="formbold-mb-5">
                <input type="text" name="fname" placeholder="Enter First Name" class="formbold-form-input" value="${studBean.fistName}"/> 
            </div>
            <div class="formbold-mb-5">
                <input type="text" name="lname" placeholder="Enter Last Name" class="formbold-form-input" value="${studBean.lastName}"/> 
            </div>
            <div class="formbold-mb-5">
                <input type="date" name="dob" placeholder="Enter Date of Birth" class="formbold-form-input" value="${studBean.dob}"/> 
            </div>
            <% if (request.getAttribute("action") == null) { %>
            <div class="formbold-mb-5">
                <input type="submit" name="action" value="Submit" class="formbold-btn" />
            </div>
            <%} else {%>
            <div class="formbold-mb-5">
                <input type="submit" name="action" value="${action}" class="formbold-btn" />
            </div>
            <%}%>
        </form>
    </div>
</div>


