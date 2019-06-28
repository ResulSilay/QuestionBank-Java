<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Konu islemleri</title>
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
    </div>

    <div class="container">
        <%
            String mesaj = "";

            try {
                int ders_id = Integer.parseInt(request.getParameter("ders"));
                String baslik = request.getParameter("baslik");
                String aciklama = request.getParameter("aciklama");
                String tarih = request.getParameter("tarih");

                boolean status = db.set_Command("insert into konular (ders_id,baslik,aciklama,tarih) values(" + String.valueOf(ders_id) + ",'" + baslik + "','" + aciklama + "','" + tarih + "')");
                if (status)
                    mesaj = "Kayıt edildi.";
                else
                    mesaj = "Kayıt edilemedi.";
            }
            catch (Exception e){}
        %>

        <form action="action.jsp" method="post">
            <select id="ders" name="ders" class="form-control form-control-sm">
                <option>Ders Seç</option>
                <%
                    ResultSet rs = db.get_List("select id,baslik from dersler");
                    while (rs.next()) { %>
                <option value="<%=rs.getString("id") %>"><%=rs.getString("baslik") %>
                </option>
                <%}%>
            </select>
            <br>
            <input id="baslik" name="baslik" type="text" class="form-control" placeholder="Ders adı">
            <br>
            <input id="aciklama" name="aciklama" type="text" class="form-control" placeholder="Açıklama">
            <br>
            <input id="tarih" name="tarih" type="date" class="form-control" placeholder="Tarih">
            <br>

            <button type="submit" class="btn btn-primary">Kaydet</button>

            <div><%=mesaj%></div>
        </form>
    </div>

</div>

</body>
</html>
