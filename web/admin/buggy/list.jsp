<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Bildirimler</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">

    <jsp:useBean id="db" class="methods.database"></jsp:useBean>

</head>
<body>
<div class="container shadow mb-5 bg-white rounded" style="background-color:white; padding:0px;">

    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #f5f5f5;">
            <a class="navbar-brand" href="#">Soru Bankası</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Admin/index.jsp">Ana Sayfa <span
                                class="sr-only">(current)</span></a>
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
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/correct/list.jsp">Doğru/Yanlış</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/accounts/list.jsp">Kullanıcılar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link"
                           href="${pageContext.request.contextPath}/Connect/logout.jsp">Çıkış</a>
                    </li>
                </ul>

            </div>
        </nav>
    </div>

    <%
        try {
            int action = Integer.parseInt(request.getParameter("type"));

            if (action == 1) {
                int id = Integer.parseInt(request.getParameter("status"));
                int status = Integer.parseInt(request.getParameter("status"));
                db.set_Command("update view_bildirimler set durum=2 where id=" + String.valueOf(id));
            }
        } catch (Exception e) {
        }
    %>

    <div class="container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">Soru Tipi</th>
                <th scope="col">Kullanıcı</th>
                <th scope="col">Aciklama</th>
                <th scope="col">Tarih</th>
                <th scope="col">Durum</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                ResultSet rs = db.get_List("select * from view_bildirimler");
                while (rs.next()) { %>
            <tr>
                <th scope="row"><%=rs.getString("id") %>
                </th>
                <td><%=rs.getString("kullanici") %>
                </td>

                <td><% int s = rs.getInt("soru_tipi");
                    if (s == 1)
                        System.out.print("Test");
                    else
                        System.out.print("Doğru/Yanlış");
                %>
                <td><%=rs.getString("Aciklama") %>
                </td>
                <td><%=rs.getString("Tarih") %>
                </td>
                <td><% int a = rs.getInt("Durum");
                    if (a == 1){
                %>
                    Aktif
                    <%
                        }
                        if (a == 2){%>
                    Pasif
                    <%}%></td>
                <td>
                    <a href="../tests/detail.jsp?id=<%=rs.getString("soru_id") %>">Detay</a> |
                    <a href="../tests/actions.jsp?id=<%=rs.getString("soru_id") %>">Düzenle</a> |
                    <a href="list.jsp?type=1&status=1&id=<%=rs.getString("id") %>">Aktif</a> |
                    <a href="list.jsp?type=1&status=2&id=<%=rs.getString("id") %>">Pasif</a>
                </td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
