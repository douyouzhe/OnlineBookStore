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

<h2>Your Information</h2>
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
        <%--<a href="${pageContext.request.contextPath}/index?method=${param.method}&curPage=${curPage}&category_id=${param.category_id}">${curPage }</a>--%>
    </tr>
    <c:forEach var="me" items="${requestScope.get(\"order\")}">
        <tr>
            <td><a href="${pageContext.request.contextPath}/user?method=displayOrderInfo&orderId=${me.id}">${me.id}</a></td>
            <td>${me.orderTime}</td>
            <td>${me.price}</td>
            <td>${me.state}</td>
            <%--<td>${me.orderItems}</td>--%>
        </tr>
    </c:forEach>
</table>
&nbsp &nbsp &nbsp
&nbsp &nbsp &nbsp
&nbsp &nbsp &nbsp
&nbsp &nbsp &nbsp

<h2>Your Order Details</h2>

<div>
    <table width="40%" border="1" style="text-align: center;">
        <tr>
            <td>Book Name:</td>
            <%--<td>Unit Price:</td>--%>
            <td>Quantity:</td>
            <%--<td>Order Status:</td>--%>
        </tr>

        <c:forEach var="me" items="${requestScope.get(\"BookList\")}">
            <tr>
                <td>${me.key}</td>
                <td>${me.value}</td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
