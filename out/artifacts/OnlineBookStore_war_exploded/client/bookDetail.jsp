<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cby
  Date: 2017/12/28
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookDetail</title>
    <style>
        h2{
            font-size:2rem;
        }
        a:hover { text-decoration:underline;color: gray}
        a{text-decoration: none; color:white}
        .bw{
            text-align:center;
            background-color:black;
            color:white
        }

        p1
        {
            color:white;
            font-size:35px;
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
<p1> Book Details </p1>
<br>
<br>
<table class="bw"  border= "1 " align="center" width="70%">


        <tr>
        <td rowspan="5" width= "50% "> <image src="${pageContext.request.contextPath}${book.image}" width="230" height="270" class="post-thumb"></image> </td>
            <td width= "50% "><p1>${book.name}</p1>
        </td></tr>

        <tr><td>Price:&nbsp &nbsp$${book.price}</td></tr>
        <tr><td>Author:&nbsp &nbsp${book.author}</td></tr>
        <tr><td>Language:&nbsp &nbsp${book.language}</td></tr>
        <tr> <td>Description:&nbsp &nbsp${book.description}</td></tr>
</table>

<br>
<br>
<br>
<br>
<br>


<div>
    <ul>
        <table border= "1 " width="60%" rules="none" align="center">

            <%--<td width="20%"> ${cur.user_id} </td>--%>
            <td width="30%"> Score </td>
            <td width="70%"> Review</td>
        </table>
        <c:forEach var="cur" items="${reviews}">
            <li style="list-style-type:none;">
                <table border= "1 " width="60%" rules="none" align="center">

                    <%--<td width="20%"> ${cur.user_id} </td>--%>
                    <td width="30%"> ${cur.score} </td>
                    <td width="70%">${cur.feedback}</td>
                </table>
            </li>
        </c:forEach>
    </ul>
</div>

<a href="${pageContext.request.contextPath }/addToCart?bookId=${book.id}" > <img src="${pageContext.request.contextPath }/icons/addToCartW.png" height="60px">  <p2>add to cart &nbsp </p2><p5>(${book.storage}left)</p5></a>
&nbsp &nbsp&nbsp &nbsp&nbsp &nbsp;
<a href="${pageContext.request.contextPath }/index?method=getall" > <img src="${pageContext.request.contextPath }/icons/homepageW.png" height="70px">  <p3>back to homepage</p3></a>




</body>
</html>
