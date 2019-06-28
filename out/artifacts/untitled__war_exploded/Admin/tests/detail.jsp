<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Test detaylar</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet" >

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

    <div class="container" style="margin: 10px;">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ResultSet rs = db.get_List("select * from view_testler where id=" + id);

            String action_buggy = request.getParameter("action_buggy");
            String kullanici_id = String.valueOf(session.getAttribute("AccountID"));
            String aciklama, query, mesaj = "";

            if (action_buggy != null && action_buggy.equals("true")) {
                aciklama = request.getParameter("aciklama");

                query = "INSERT INTO qbdb.bildirimler (aciklama,kullanici_id,soru_id,soru_tipi,durum) values('" + aciklama + "'," + kullanici_id + "," + id + ",1,1)";
                boolean status = db.set_Command(query);
                if (status) {
                    mesaj = "Gönderildi";
                    response.sendRedirect("list.jsp");
                } else {
                    mesaj = "Gönderilemedi";
                }
            }
            else
                {

            while (rs.next()) { %>
        <div class="card">
            <div class="card-body">
                <%=rs.getString("soru") %>
            </div>
        </div>

        <form action="#" method="get">
            <button type="button" class="btn btn-primary">
                <span class="badge badge-light">A</span> <%=rs.getString("cevap_1") %>
            </button>
            <br>
            <button type="button" class="btn btn-primary">
                <span class="badge badge-light">B</span> <%=rs.getString("cevap_2") %>
            </button>
            <br>

            <button type="button" class="btn btn-primary">
                <span class="badge badge-light">C</span> <%=rs.getString("cevap_3") %>
            </button>
            <br>

            <button type="button" class="btn btn-primary">
                <span class="badge badge-light">D</span> <%=rs.getString("cevap_4") %>
            </button>
            <br>

            <button type="button" class="btn btn-primary">
                <span class="badge badge-light">E</span> <%=rs.getString("cevap_5") %>
            </button>
        </form>
        <br>
        <%}%>

        <div class="col">
            <a class="toggle" href="#example">Bildir</a>
        </div>
        <form action="detail.jsp?id=<%=id%>" method="post">
            <div class="toggle-content" id="example" style="display: none;">
                <input id="aciklama" name="aciklama" type="text" class="form-control"
                       placeholder="Sorunu açıklayınız...">
                <button name="action_buggy" value="true" type="submit" class="btn btn-primary">Gönder</button>
            </div>
        </form>
        <%} %>
    </div>
</div>

</body>
</html>
