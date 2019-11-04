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
    <title>Author List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="myStyle.css">
</head>

<body>
<form method="get" action="${pageContext.request.contextPath}/getList">
    <fieldset>
        <legend style="text-shadow: 2px 2px 6px black">Author List</legend>
        <table>
            <tr>
                <td>ID</td>
                <td>Author Name</td>
                <td>Date Of Birth</td>
            </tr>
            <c:forEach var="Author" items="${authorList}">
                <tr class="notfirstTr">
                    <td>${Author.getId()}</td>
                    <td>${Author.getName()}</td>
                    <td>${Author.getDob()}</td>
                    <td><a href="${pageContext.request.contextPath}/getList?idDelete=${Author.getId()}" onclick="return confirm('Are you sure?')">Delete</a></td>
                    <td><a href="${pageContext.request.contextPath}/getList?idEdit=${Author.getId()}">Edit Info</a></td>
                </tr>
            </c:forEach>
        </table>
    </fieldset>

    <fieldset>
        <p style="margin: auto"><input type="submit" value="ShowList" style="margin-bottom: 30px"> <a href="${pageContext.request.contextPath}/AddAuthorForm.jsp">
            <button type="button"> Add</button>
        </a></p>
    </fieldset>
</form>
</body>
</html>
