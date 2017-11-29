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
            padding-left:0px;
        }
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
    <a href="${pageContext.request.contextPath }/index?method=getAll" target="body">  <img src="${pageContext.request.contextPath }/icons/homePage.png"  class="post-thumb" height="50"></a>
    <%--<hr width=90% size=3 color=white style="filter:progid:DXImageTransform.Microsoft.Glow(color=#5151A2,strength=10)">--%>
    <%--<hr width=90% size=30 color=white style="filter:alpha(opacity=100,finishopacity=0,style=2)">--%>
    <%--<a href="${pageContext.request.contextPath }/client/listcart.jsp" target="body">查看购物车</a>--%>
    <%--<a href="${pageContext.request.contextPath }/client/ClientListOrderServlet?userid=${user.id}" target="body"">查看订单</a>--%>

</div>

<div id="body" style="text-align:center;background-color:white;width:100%;height:600px">
    <div id="content" style="margin:0;width:100%">
        <div id="Categories" style="float:left;width:200px;background-color:black; color:white;border:1px solid grey;text-align:left;height:300px;">
            <img src="${pageContext.request.contextPath }/icons/categories.png" width="20" height="20" class="left">categories:
            <ul>
                <c:forEach var="category" items="${categories}">
                    <li>
                    <a href="${pageContext.request.contextPath}/index?method=listBooksOfThisCategory&category_id=${category.id}">${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
sdaaaaf
    </div>
</div>

</body>
</html>
