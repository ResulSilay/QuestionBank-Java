<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Test detaylar</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">

    <jsp:useBean id="db" class="methods.database"></jsp:useBean>

    <script>
        var show = function (elem) {
            elem.style.display = 'block';
        };

        var hide = function (elem) {
            elem.style.display = 'none';
        };

        var toggle = function (elem) {
            if (window.getComputedStyle(elem).display === 'block') {
                hide(elem);
                return;
            }
            show(elem);

        };
        document.addEventListener('click', function (event) {
            if (!event.target.classList.contains('toggle')) return;
            event.preventDefault();
            var content = document.querySelector(event.target.hash);
            if (!content) return;
            toggle(content);

        }, false);
    </script>

</head>
<body>
<div class="container shadow mb-5 bg-white rounded" style="background-color:white; padding:0px;">

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
                    <a class="nav-item nav-link"
                       href="${pageContext.request.contextPath}/Admin/tests/list.jsp">Testler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/correct/list.jsp">Doğru/Yanlış</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/accounts/list.jsp">Kullanıcılar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Connect/logout.jsp">Çıkış</a>
                </li>
            </ul>

        </div>
    </nav>

    <div class="container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">konu</th>
                <th scope="col">soru</th>
                <th scope="col">tarih</th>
                <th scope="col">durum</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                String search = request.getParameter("search");
                ResultSet rs = db.get_List("select * from view_testler where soru LIKE '%" + search + "%'");
                while (rs.next()) { %>
            <tr>
                <th scope="row"><%=rs.getString("id") %>
                </th>
                <td><%=rs.getString("konu") %>
                </td>
                <td><%=rs.getString("soru") %>
                </td>
                <td><%=rs.getString("tarih") %>
                </td>
                <td><% int a = rs.getInt("durum");
                    if (a == 1){
                %>
                    Aktif
                    <%
                        }
                        if (a == 2){%>
                    Pasif
                    <%}%></td>
                <td>
                    <a href="../tests/detail.jsp?id=<%=rs.getString("id") %>">Detay</a>
                </td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
