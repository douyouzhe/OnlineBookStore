<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 11/29/17
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My Cart</title>
</head>
    <body style="text-align:center;">
    <c:if test="${user == null }">
        You are not logged in!
    </c:if>

    <c:if test="${user != null }">
        <h2>Items in your cart</h2>
        <table width="40%" border="1" align="center" style="text-align: center;">
            <tr>
                <td>Book Name:</td>
                <td>Author:</td>
                <td>Unit Price:</td>
                <td>Quantity:</td>
                <td>Total:</td>
                <td>Action:</td>
            </tr>
            <c:forEach var="me" items="${cart.map}">
                <tr>
                    <td>${me.value.book.name}</td>
                    <td>${me.value.book.author}</td>
                    <td>${me.value.book.price}</td>
                    <td>${me.value.quantity}</td>
                    <td>${me.value.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/delete?bookId=${me.value.book.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="1">Total Price:</td>
                <td colspan="5">${cart.price }</td>
            </tr>
        </table>
        <a href="${pageContext.request.contextPath }/client/OrderServlet">Buy</a>
    </c:if>
    </body>
</html>