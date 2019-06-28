<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.net.ResponseCache" %>
<%@ page import="org.omg.CORBA.Request" %>
<html>
<head>
    <title>Ders guncelle</title>
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
            <a class="navbar-brand" href="#">Soru Bankasý</a>
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
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/correct/list.jsp">Doðru/Yanlýþ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/accounts/list.jsp">Kullanýcýlar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Connect/logout.jsp">Çýkýþ</a>
                    </li>
                </ul>

            </div>
        </nav>
    </div>

    <div class="container">

        <%
            String id = request.getParameter("id");
            String action_update = request.getParameter("action_update");
            String action_delete = request.getParameter("action_delete");

            String baslik, aciklama, tarih, mesaj = "", query = "";

            if (action_update != null && action_update.equals("true")) {
                baslik = request.getParameter("baslik");
                aciklama = request.getParameter("aciklama");
                tarih = request.getParameter("tarih");

                query = "UPDATE qbdb.dersler SET baslik='" + baslik + "',aciklama='" + aciklama + "',tarih='" + tarih + "' WHERE id=" + id;
                boolean status = db.set_Command(query);
                if (status) {
                    mesaj = "Kayýt edildi.";
                    response.sendRedirect("list.jsp");
                } else {
                    mesaj = "Kayýt edilemedi.";
                }
            } else if (action_delete != null && action_delete.equals("true")) {
                query = "delete from qbdb.dersler WHERE id=" + id;
                boolean status = db.set_Command(query);
                response.sendRedirect("list.jsp");
            }

            baslik = db.get_Value("select baslik from dersler where id=" + id, 1);
            aciklama = db.get_Value("select aciklama from dersler where id=" + id, 1);
            tarih = db.get_Value("select tarih from dersler where id=" + id, 1);
        %>

        <form action="update.jsp?id=<%=id%>" method="post">
            <br>
            <input id="baslik" name="baslik" type="text" class="form-control" placeholder="Ders adý"
                   value="<%=baslik%>">
            <br>
            <input id="aciklama" name="aciklama" type="text" class="form-control" placeholder="Açýklama"
                   value="<%=aciklama%>">
            <br>
            <input id="tarih" name="tarih" type="date" class="form-control" placeholder="Tarih" value="<%=tarih%>">
            <br>

            <button name="action_update" value="true" type="submit" class="btn btn-primary">Kaydet</button>
            <button name="action_delete" value="true" type="submit" class="btn btn-primary">Delete</button>

            <div><%=mesaj%>
            </div>
        </form>
    </div>

</div>

</body>
</html>
