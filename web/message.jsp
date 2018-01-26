<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>
            a:hover { text-decoration:underline;color: gray;}
            a{text-decoration: none; color:white;text-align: center}
            p{color:white; font-size:2rem; }
        </style>
    </head>

    <body bgcolor="black">

    <div style="text-align:center">

    <img  src="${pageContext.request.contextPath }/icons/message.png" width=200>
    </div>
    <p align="center">${message}</p>
        <br>
    <div style="text-align: center">
        <c:if test="${user == null }">
            <div style ="color:white;">
            You are not logged in!&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/index.jsp"> <img  src="${pageContext.request.contextPath }/icons/profile.png" width=20>  login</a>
            </div>

        </c:if>
        <c:if test="${user != null }">
       <a href="${pageContext.request.contextPath }/index?method=getAll">
            <img align="center"  src="${pageContext.request.contextPath }/icons/ContinueShopping.png" height="180">
        </a>
        </c:if>
    </div>
    </body>
</html>

