<%@ page import="Model.Author" %><%--
  Created by IntelliJ IDEA.
  User: z-one
  Date: 11/4/19
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Author selectedAuthor = (Author) request.getAttribute("selectedAuthor"); %>
<html>
<head>
    <title>Edit Author Info</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="myStyle.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/getList">
    <fieldset style="width: fit-content; height: fit-content">
        <legend><h3>Author Info</h3></legend>
        <p>Id: <input style="width: 30px" type="text" name="authorId" value="<%=selectedAuthor.getId()%>"
                      readonly="true"></p>
        <p>Name: <input type="text" name="name" value="<%=selectedAuthor.getName()%>"></p>
        <p>Date Of Birth: <input type="date" name="dob" value="<%=selectedAuthor.getDob()%>"></p>
    </fieldset>
    <p><input type="submit" value="Edit Info" name="edit" onclick="return confirm('Are you sure?')" ></p>
    <p><a href="${pageContext.request.contextPath}/getList?">
        <button type="button">Back</button>
    </a></p>
</form>
</body>
</html>
