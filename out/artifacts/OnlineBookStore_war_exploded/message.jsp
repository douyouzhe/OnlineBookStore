<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 11/13/17
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>My JSP 'message.jsp' starting page</title>
    </head>

    <body>
        ${message}
        <br>

        <a  href="${pageContext.request.contextPath }/client/head.jsp">
            <p>Back</p>
        </a>

    </body>
</html>

