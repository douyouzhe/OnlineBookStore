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
    <body style = "text-align: left;">
    <img src="${pageContext.request.contextPath}/images/ONLINEBOOKSTORE.JPG">
    <h3>please fill your information to join.</h3>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <table>
            <tr><td>Username：</td><td><input type="text" name="username"></td></tr>

            <tr><td>Password：</td><td><input type="password" name="password"></td></tr>

            <tr><td>Tel：</td><td><input type="text" name="tel"></td></tr>

            <tr><td>E-mail：</td><td><input type="text" name="email"></td></tr>

            <tr><td>Address：</td><td><input type="text" name="address"></td></tr>
        </table>

        <input type="submit" value="Join">
    </form>


    </body>
</html>
