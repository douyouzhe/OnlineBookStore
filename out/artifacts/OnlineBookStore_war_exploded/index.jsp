<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 11/12/17
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>OBS</title>
  </head>

  <body style = "text-align: left;">
  <img src="${pageContext.request.contextPath}/images/ONLINEBOOKSTORE.JPG">
  <h3>Welcome! login if already a user</h3>

  <form action="${pageContext.request.contextPath}/login" method="post">

    <table>
      <tr><td>Username：</td><td><input type="text" name="username"></td></tr>
      <tr><td>Password：</td><td><input type="password" name="password"></td></tr>
    </table>

    <input type="submit" name="action" value="Login">
    <input type="submit" name="action" value="New User">
  </form>

  </body>
</html>
