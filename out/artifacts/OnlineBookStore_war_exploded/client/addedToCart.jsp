<%--
  Created by IntelliJ IDEA.
  User: cby
  Date: 2017/12/21
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <title>book added</title>

   <style>
        a:hover { text-decoration:underline;color: gray}
        a{text-decoration: none; color:white}
        p{color:white; font-size:3rem; }
    </style>

</head>


<body bgcolor="black">
<div align="center">
<img  src="${pageContext.request.contextPath }/icons/addedToCart.png" width=400>
</div>
<p align="center">Oh Yeah!<br> We have added this book to your cart</p>
<div style="text-align:center;" >


    <a align="center" href="${pageContext.request.contextPath }index?method=getAll" > <img src="${pageContext.request.contextPath }/icons/ContinueShopping.png"  height="200"></a>
</div>
<div style="text-align:center;" >

    <a align="center" href="${pageContext.request.contextPath }client/listCart.jsp"> <img  src="${pageContext.request.contextPath }/icons/checkOut.png" height="100"> </a>
</div>
</body>

</html>
