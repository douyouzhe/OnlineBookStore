<%--
  Created by IntelliJ IDEA.
  User: cby
  Date: 2018/1/11
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book review</title>
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
        p4
        {
            color:#1296db;
            font-size:30px;

        }
        p5
        {
            color:#8992c8;
            font-size:20px;

        }
        input[type=text] {
            padding: 6px;
            margin-top: 6px;
            font-size: 10px;
            border: none;
            width:800px;
            height:60px;
        }

    </style>
</head>
<body class="bw">
<p1> Book Review </p1>
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
<p1> Write your review here</p1>
<form action="${pageContext.request.contextPath}/review?book_id=${book.id}" method="post" >
<table align="center">
    <tr><td>Score：<select name="score">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select></td></tr>
    <tr colspan="2"><td>review：</td></tr>
    <tr colspan="2">
    <td rowspan="3"><textarea name="review" placeholder="250 characters at most"cols="50" rows="4"></textarea></td></tr>
</table>
    <input type="image" name="submit" src="${pageContext.request.contextPath }/icons/submit.png" height="50px" align="center" border="0" alt="Submit" />
</form>





<br>
<br>

<br>
<br>
<div>
<a href="${pageContext.request.contextPath }/user?method=displayUserInfo" height="50"><img src="${pageContext.request.contextPath }/icons/userW.png" height="70px"> <p4 class="post-left">back to profile</p4> </a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="${pageContext.request.contextPath }/index?method=getall" > <img src="${pageContext.request.contextPath }/icons/homepageW.png" height="70px">  <p3>back to homepage</p3></a>
</div>



</body>
</html>
