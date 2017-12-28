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
    <title>C&D Book Sotre</title>
    <style>
        .post-thumb{
            float:left;
            padding-left:100px;
        }
        .post-thumb2{
            float:left;
            padding-left:300px;
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
/*the h1 is copied from a blog,because it's too fancy*/
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
/*as above*/
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
        /*search bar,copied from w3school*/
        .search .search-container {
            float: left;
            margin-left:350px;
        }

        .search input[type=text] {
            padding: 6px;
            margin-top: 6px;
            font-size: 30px;
            border: none;
        }

        .search .search-container button {
            float: right;
            padding: 6px 10px;
            margin-top: 6px;
            margin-right: 16px;
            background: bottom;
            font-size: 60px;
            border: none;
            cursor: pointer;
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
    <div class="search">
    <div class="search-container" width="500">
        <form method="post" action="${pageContext.request.contextPath }/search">
            <input type="text" placeholder="Search by book name.." name="search">
            <button type="submit"><img src="${pageContext.request.contextPath}/icons/search.png" height="40"></button>
        </form>
    </div>
    </div>

    <a href="${pageContext.request.contextPath }/user" height="50"><img src="${pageContext.request.contextPath }/icons/profile.png"class="post-thumb2" height="50"> <p1 class="post-left">User</p1> </a>
    <a href="${pageContext.request.contextPath }/index.jsp" height="50"><img src="${pageContext.request.contextPath }/icons/logOut.png" class="post-thumb" height="50"> <p1 class="post-left">Logout</p1> </a>


</div>

<div id="body" style="text-align:center;background-color:white;width:100%;height:1000px">
    <div id="content" style="margin:0;width:100%">
        <div id="Categories" style="float:left;width:300px;background-color:black; color:white; font-family: Fantasy; font-size:150%;border:0px;text-align:left;height:100%;">
            <h2><img src="${pageContext.request.contextPath }/icons/categories.png" width="35" height="35" class="left">  Categories:</h2>

            <ul>
                <c:forEach var="category" items="${categories}">
                    <li>
                    <a href="${pageContext.request.contextPath}/index?method=listBookOfThisCategory&category_id=${category.id}" style="color:White; ">${category.name}</a>
                        <br>
                        <br>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div id="bookList">
    <c:if test="${showType=='category'}">

        <div>
        <ul>
            <c:forEach var="thisBook" items="${page.list}">
                <li>
                    <table>

                        <td><image src="${pageContext.request.contextPath}${thisBook.image}" width="230" height="270" class="post-thumb"></image> </td>
                            <td><p1 style="font-size:100%;color:black;"class="post-left">${thisBook.name} <br> $${thisBook.price}</p1></td>

                        <td>&nbsp &nbsp &nbsp
                        </td>
                    <td>
                        <a href="${pageContext.request.contextPath }/addToCart?bookId=${thisBook.id}" style="color:black; "> <img src="${pageContext.request.contextPath }/icons/addToCart.png"  class="post-thumb" height="30"> &nbsp add to cart</a>
                    </td>

                    </table>
                </li>
            </c:forEach>
        </ul>
        </div>
        <div id="page" style="margin-top:20px; text-align:center;">
           current page: &nbsp;[${page.curPage }]&nbsp;
            <c:forEach var="curPage" begin="${page.startpage }" end="${page.endpage }">
                <a href="${pageContext.request.contextPath }/index?method=${param.method }&curPage=${curPage}&category_id=${param.category_id}">${curPage }</a>
            </c:forEach>

            total pages:${page.totalpage }&nbsp;&nbsp;&nbsp;${page.totalrecord }books in list
        </div>
        </c:if>
<c:if test="${showType=='searchResult'}">

    <table>

    <td><image src="${pageContext.request.contextPath}${targetBook.image}" width="230" height="270" class="post-thumb"></image> </td>
    <td><p1 style="font-size:100%;color:black;"class="post-left">${targetBook.name} <br> $${targetBook.price}</p1></td>

    <td>&nbsp &nbsp &nbsp
    </td>
    <td>
    <a href="${pageContext.request.contextPath }/addToCart?bookId=${targetBoook.id}" style="color:black; "> <img src="${pageContext.request.contextPath }/icons/addToCart.png"  class="post-thumb" height="30"> &nbsp add to cart</a>
    </td>

    </table>
</c:if>
    </div>
</div>

</body>
</html>
