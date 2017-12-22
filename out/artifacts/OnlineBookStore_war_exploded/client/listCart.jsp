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
    <style>
     h2{
         font-size:2rem;
     }
     a:hover { text-decoration:underline;color: gray}
     a{text-decoration: none; color:white}
    </style>
</head>
    <body style="text-align:center; background-color:black; color:white">
    <c:if test="${user == null }">
        You are not logged in!&nbsp&nbsp
        <a href="${pageContext.request.contextPath}/index.jsp"> <img  src="${pageContext.request.contextPath }/icons/profile.png" width=20>  login</a>
    </c:if>

    <p test="${user != null }">
        <div align="center">
            <img  src="${pageContext.request.contextPath }/icons/cartDetail.png" width=400>
        </div>
        <h2 >Here are items in your cart!</h2>
        <table width="40%" border="1" align="center" style="text-align: center;">
            <tr>
                <td>Book Name:</td>
                <td>Author:</td>
                <td>Unit Price:</td>
                <td>Quantity:</td>
                <td>Total:</td>
                <td>Edit:</td>
            </tr>
            <c:forEach var="me" items="${cart.map}">
                <tr>
                    <td>${me.value.book.name}</td>
                    <td>${me.value.book.author}</td>
                    <td>${me.value.book.price}</td>
                    <td>${me.value.quantity}</td>
                    <td>${me.value.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/delete?bookId=${me.value.book.id}"> <img  src="${pageContext.request.contextPath }/icons/delete.png" width=20></a>
                    </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="1">Total Price:</td>
                <td colspan="5">${cart.price }</td>
            </tr>
        </table>
        <p style="font-size:2rem"><a href="${pageContext.request.contextPath }/buy"><img src="${pageContext.request.contextPath }/icons/finishTheOrder.png" width="40">Looks good! </a></p>
        <p style="font-size:2rem"><a href="${pageContext.request.contextPath }/index?method=getAll"><img src="${pageContext.request.contextPath }/icons/homePage.png" width="40">Continue Shopping </a></p>
    </body>
</html>