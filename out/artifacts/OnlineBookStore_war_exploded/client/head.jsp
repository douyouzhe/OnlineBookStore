<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cby
  Date: 2017/11/13
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <style>
        .post-thumb{
            float:left;
            padding-left:100px;
        }
        .center {

            padding-left:auto;
        }
        .left{
                     padding-left:10px;
                 }
        .post-left{
            padding-top:10px;
           float:left;
        }
        a{
            text-decoration: none;

        }
        a:hover { text-decoration:underline;color: gray}

        .container {
            margin:auto;
            width: 100%;
            height: 200px;
                position: relative;
                padding: 1em;
                -webkit-filter: contrast(20);
                filter: contrast(20);
                background-color: black;
                overflow: hidden;
            }

            h1 {
                font-family: Righteous;
                color: white;
                font-size: 3rem;
                text-transform: uppercase;
                line-height: 1;
                -webkit-animation: letterspacing 5s infinite alternate ease-in-out;
                animation: letterspacing 5s infinite alternate ease-in-out;
                display: block;
                position: absolute;
                left: 50%;
                top: 100px;
                -webkit-transform: translate3d(-50%, -50%, 0);
                transform: translate3d(-50%, -50%, 0);
                letter-spacing: -2.2rem;
            }
            p1{
                color:white;
                font-size:2rem;
                text-align:left;

            }
            p1:hover { text-decoration:underline;color: gray}

        @-webkit-keyframes letterspacing {
            0% {
                letter-spacing: -2.2rem;
                -webkit-filter: blur(0.3rem);
                filter: blur(0.3rem);
            }
            50% {
                -webkit-filter: blur(0.5rem);
                filter: blur(0.5rem);
            }
            100% {
                letter-spacing: .01rem;
                -webkit-filter: blur(0rem);
                filter: blur(0rem);
                color: #fff;
            }
        }


    </style>
</head>
<body style="text-align: center;background-color:#000000">

<div class="container">
    <h1>C&D<br>BookSore<br>Welcome<br>${user.username}</h1>
</div>

<div  style="height:200px;background-color:black;color:white">


    <img src="${pageContext.request.contextPath }/icons/dividingLine.png" width=100% height="80" class="center" >
    <a href="${pageContext.request.contextPath }/index?method=getAll" target="body">  <img src="${pageContext.request.contextPath }/icons/homePage.png"  class="post-thumb" height="50"><p1 class="post-left">Homepage</p1> </a>
    <a href="${pageContext.request.contextPath }/client/listCart.jsp" target="body"><img src="${pageContext.request.contextPath }/icons/cart.png"  class="post-thumb" height="50"><p1 class="post-left">Cart</p1></a>
    <%--<a href="${pageContext.request.contextPath }/client/ClientListOrderServlet?userid=${user.id}" target="body"">查看订单</a>--%>

</div>

<div id="body" style="text-align:center;background-color:white;width:100%;height:800px">
    <div id="content" style="margin:0;width:100%">
        <div id="Categories" style="float:left;width:300px;background-color:black; color:white; font-family: Fantasy; font-size:150%;border:0px;text-align:left;height:100%;">
            <h2><img src="${pageContext.request.contextPath }/icons/categories.png" width="35" height="35" class="left">  Categories:</h2>

            <ul>
                <c:forEach var="category" items="${categories}">
                    <li>
                    <a href="${pageContext.request.contextPath}/index?method=listBooksOfThisCategory&category_id=${category.id}" style="color:White; ">${category.name}</a>
                        <br>
                        <br>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div id="bookList">

        <ul>
            <c:forEach var="thisBook" items="${curPage.list}">
                <li>
                <image src="${pageContext.request.contextPath}${thisBook.image}" width="50" height="100" class="post-thumb"></image> <p1 class="post-left">${thisBook.name} <br> ${thisBook.price}</p1>
                </li>
            </c:forEach>
        </ul>

    </div>
</div>

</body>
</html>
