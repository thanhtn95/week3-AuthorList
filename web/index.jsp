<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Author" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: z-one
  Date: 11/4/19
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<% ArrayList<Author> list = null;--%>
<%--    list = (ArrayList<Author>) request.getAttribute("authorList");%>--%>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<style>

    table {
        margin: auto;
        border: 2px solid black;
    }

    .notfirstTr:hover {
        color: red;
        background-color: darkgray;
        cursor: pointer;
    }

    .notfirstTr {
        border: 2px double black;
        margin: auto;
        padding: 15px;
    }

    tr {
        border: 2px solid black;
        margin: auto;
        padding: 15px;
    }

    td {
        margin: auto;
        border: 2px solid black;
        text-align: center;
        padding: 15px;
        font-weight: bolder;
    }

</style>
<body>
<form method="get" action="${pageContext.request.contextPath}/getList">
    <table>
        <tr>
            <td>Author Name</td>
            <td>Date Of Birth</td>
        </tr>
        <c:forEach var="Author" items="${authorList}">
            <tr class="notfirstTr">
                <td>${Author.getName()}</td>
                <td>${Author.getDob()}</td>
                <td><a href="${pageContext.request.contextPath}/getList?idDelete=${Author.getId()}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <p><input type="submit" value="ShowList" style="margin-bottom: 30px"></p>
    <p><a href="${pageContext.request.contextPath}/AddAuthorForm.jsp">
        <button type="button"> Add</button>
    </a></p>
</form>
</body>
</html>
