<%--
  Created by IntelliJ IDEA.
  User: z-one
  Date: 11/4/19
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/getList">
    <fieldset style="width: fit-content; height: fit-content">
        <legend><h3>Author Info</h3></legend>
        <p>Name: <input type="text" name="name" placeholder="Author Name"></p>
        <p>Date Of Birth: <input type="date" name="dob"></p>
    </fieldset>
    <p><input type="submit" value="Add Author" name="add"></p>
</form>
</body>
</html>
