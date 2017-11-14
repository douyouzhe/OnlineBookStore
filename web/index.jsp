<%--
  Created by IntelliJ IDEA.
  User: youzhedou
  Date: 11/12/17
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <frameset row="17%,*">
    <frame src="${pageContext.request.contextPath}/client/head.jsp" name="head">
    <frame src="${pageContext.request.contextPath}/client/IndexServlet?method=getAll" name="body">
    </frameset>
</html>
