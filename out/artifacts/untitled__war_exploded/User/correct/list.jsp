<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Dogru ve Yanlislar</title>
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
                int id = Integer.parseInt(request.getParameter("id"));
                boolean status = db.set_Command("delete from dogru_yanlis where id=" + String.valueOf(id));
            }
        } catch (Exception e) {
        }
    %>

    <div class="container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">Kullanıcı</th>
                <th scope="col">Konu</th>
                <th scope="col">Soru</th>
                <th scope="col">Derece</th>
                <th scope="col">Tarih</th>
                <th scope="col">Durum</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                String AccountID = String.valueOf(session.getAttribute("AccountID"));
                ResultSet rs = db.get_List("select * from view_dogru_yanlis where kullanici_id=" + AccountID);
                while (rs.next()) { %>
            <tr>
                <th scope="row"><%=rs.getString("id") %>
                </th>
                <td><%=rs.getString("Kullanici") %>
                </td>
                <td><%=rs.getString("Konu") %>
                </td>
                <td><%=rs.getString("Soru") %>
                </td>
                <td><%=rs.getString("Derece") %>
                </td>
                <td><%=rs.getString("Tarih") %>
                </td>
                <td><% int a = rs.getInt("Durum");
                    if (a == 1)
                        System.out.print("Aktif");
                    else
                        System.out.print("Beklemede");
                %></td>
                <td>
                    <a href="detail.jsp?id=<%=rs.getString("id") %>">Detay</a> |
                    <a href="actions.jsp?id=<%=rs.getString("id") %>">Düzenle</a> |
                    <a href="list.jsp?type=1&id=<%=rs.getString("id") %>">Sil</a> |
                </td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
