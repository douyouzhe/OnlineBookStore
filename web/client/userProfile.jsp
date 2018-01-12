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
    <style>
        h2{
            font-size:2rem;
        }
        a:hover { text-decoration:underline;color: gray}
        a{text-decoration: none; color:orangered;}
        .bw{
            text-align:center;
            background-color:black;
            color:white
        }

        p1
        {
            color:#1296db;
            font-size:50px;
            font-family:Fantasy
        }
        p2
        {
            color:#1296db;
            font-size:30px;

        }
        p3
        {
            color:#e0620d;
            font-size:30px;

        }
        p5
        {
            color:#8992c8;
            font-size:20px;

        }

    </style>
</head>
<body class="bw">
<div>
    <img src="${pageContext.request.contextPath }/icons/userW.png" width="70" align="center">
<p1>Your Information</p1>
    <br>
    <br>

<table align="center" border="1" width="40%">
    <tr><td width="20%">ID:</td> <td width="20%">${requestScope.get("id")}</td></tr>
    <tr><td width="20%">Username:</td> <td width="20%">${requestScope.get("username")}</td></tr>
    <tr><td width="20%">Address:</td> <td width="20%">${requestScope.get("address")}</td></tr>
    <tr><td width="20%">Tel:</td> <td width="20%">${requestScope.get("tel")}</td></tr>
    <tr><td width="20%">Email:</td> <td width="20%">${requestScope.get("email")}</td></tr>
</table>
</div>
<div>
<p2>Your Order List</p2>
<table align="center" width="40%" border="1" style="text-align: center;">
    <tr>
        <td>Order ID:</td>
        <td>Order time:</td>
        <td>Order Price:</td>
        <td>Order Status:</td>
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
</div>

<div>

<c:if test="${BookList!=null}">
    <p2>Your Order Details</p2>
    <br>
    <p5> order ID:${orderId}</p5>
<div>
    <table align="center" width="40%" border="1" style="text-align: center;">
        <tr>
            <td>Book Name:</td>
            <%--<td>Unit Price:</td>--%>
            <td>Quantity:</td>
            <td>Review:</td>
            <%--<td>Order Status:</td>--%>
        </tr>

        <c:forEach var="me" items="${requestScope.get(\"BookList\")}">
            <tr>
                <td>${me.key}</td>
                <td>${me.value}</td>
                <td><a href="${pageContext.request.contextPath}/review?bookName=${me.key}&orderId=${orderId}">Write a review!</a></td>
            </tr>
        </c:forEach>

    </table>
</div>
</c:if>
    <a align="center" href="${pageContext.request.contextPath }index?method=getAll" > <img src="${pageContext.request.contextPath }/icons/ContinueShopping.png"  height="200"></a>
</div>
</body>
</html>
