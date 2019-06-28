<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Hesap islemleri</title>
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String VIP = request.getParameter("VIP");
            String Type = request.getParameter("type");
            String mesaj = "";

            boolean status = db.set_Command("insert into qbdb.kullanicilar (username,password,email,VIP,Type) values('" + username + "','" + password + "','" + email + "',"+VIP+","+Type+")");
            if (status)
                mesaj = "Kayıt edildi.";
            else
                mesaj = "Kayıt edilemedi.";
        %>

        <form action="action.jsp" method="post">
            <br>
            <input id="username" name="username" type="text" class="form-control" placeholder="kullanıcı adı">
            <br>
            <input id="password" name="password" type="password" class="form-control" placeholder="şifre">
            <br>
            <input id="email" name="email" type="date" class="form-control" placeholder="e-Posta">
            <br>

            <div class="form-check">
                <input name="VIP" type="checkbox" class="form-check-input" id="vip">
                <label class="form-check-label" for="vip">VIP</label>
            </div>

            <div class="form-check">
                <input name="type" type="checkbox" class="form-check-input" id="type">
                <label class="form-check-label" for="type">Admin</label>
            </div>

            <button type="submit" class="btn btn-primary">Kaydet</button>

            <div><%=mesaj%>
            </div>
        </form>
    </div>

</div>

</body>
</html>
