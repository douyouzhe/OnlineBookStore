<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 12/22/17
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<body>
<table>
    <tr><td>ID:</td> <td>${requestScope.get("id")}</td></tr>
    <tr><td>Username:</td> <td>${requestScope.get("username")}</td></tr>
    <tr><td>Address:</td> <td>${requestScope.get("address")}</td></tr>
    <tr><td>Tel:</td> <td>${requestScope.get("tel")}</td></tr>
    <tr><td>Email:</td> <td>${requestScope.get("email")}</td></tr>
</table>

<table width="40%" border="1" style="text-align: center;">
    <tr>
        <td>Order ID:</td>
        <td>Order time:</td>
        <td>Order Price:</td>
        <td>Order Status:</td>
        <%--<td>Order Items:</td>--%>
    </tr>
    <c:forEach var="me" items="${requestScope.get(\"order\")}">
        <tr>
            <td>${me.id}</td>
            <td>${me.orderTime}</td>
            <td>${me.price}</td>
            <td>${me.state}</td>
            <%--<td>${me.orderItems}</td>--%>
        </tr>
    </c:forEach>

    <tr>
        <td colspan="1">Total Price:</td>
        <td colspan="5">${cart.price }</td>
    </tr>
</table>




</body>
</html>
