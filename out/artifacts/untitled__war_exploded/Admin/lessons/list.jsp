<%@ page language="java" contentType="text/html; charset=ISO-8859-9"  pageEncoding="ISO-8859-9"%>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>Dersler</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet" >

    <jsp:useBean id="db" class="methods.database"></jsp:useBean>

</head>
<body>
<div class="container shadow mb-5 bg-white rounded" style="background-color:white; padding:0px;">

    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #f5f5f5;">
            <a class="navbar-brand" href="#">Soru Bankas�</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Admin/index.jsp">Ana Sayfa <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/lessons/list.jsp">Dersler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/subjects/list.jsp">Konular</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/tests/list.jsp">Testler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/correct/list.jsp">Do�ru/Yanl��</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/accounts/list.jsp">Kullan�c�lar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Connect/logout.jsp">��k��</a>
                    </li>
                </ul>

            </div>
        </nav>
    </div>

    <div class="container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">baslik</th>
                <th scope="col">aciklama</th>
                <th scope="col">tarih</th>
                <th scope="col">Durum</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                ResultSet rs = db.get_List("select * from dersler");
                while (rs.next()) { %>
            <tr>
                <th scope="row"><%=rs.getString("id") %>
                </th>
                <td><%=rs.getString("baslik") %>
                </td>
                <td><%=rs.getString("aciklama") %>
                </td>
                <td><%=rs.getString("tarih") %>
                </td>
                <td><% int a = rs.getInt("status");
                    if (a == 1)
                        System.out.print("Aktif");
                    else
                        System.out.print("Pasif");
                %></td>
                <td>
                    <a href="update.jsp?id=<%=rs.getString("id") %>">D�zenle</a>
                    <a href="update.jsp?id=<%=rs.getString("id") %>">Sil</a>
                </td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
