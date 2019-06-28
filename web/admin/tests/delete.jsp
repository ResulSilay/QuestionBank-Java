<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="db" class="methods.database"></jsp:useBean>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    boolean status = db.set_Command("delete from testler where id="+String.valueOf(id));
%>

</body>
</html>
