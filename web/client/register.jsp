<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 11/12/17
  Time: 10:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>
            New User Registration
        </title>
    </head>
    <body style = "text-align: center;">

    <form action="${pageContext.request.contextPath}WEB-INF/classes/RegisterServlet" method="post">
        Username：<input type="text" name="username"><br/>
        Password：<input type="password" name="password"><br/>
        Tel：<input type="text" name="tel"><br/>
        E-mail：<input type="text" name="email"><br/>
        Address：<input type="text" name="address"><br/>
        <input type="submit" value="Join">
    </form>


    </body>
</html>
