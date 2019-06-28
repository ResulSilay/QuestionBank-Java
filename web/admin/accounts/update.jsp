<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Hesap guncelle</title>
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
            String id = request.getParameter("id");
            String action_update = request.getParameter("action_update");
            String action_delete = request.getParameter("action_delete");

            String username, password, email,  mesaj = "", query = "";
            int VIP=-1,Type=-1;
            if (action_update != null && action_update.equals("true")) {
                username = request.getParameter("username");
                password = request.getParameter("password");
                email = request.getParameter("email");
                VIP = Integer.parseInt(request.getParameter("VIP"));
                Type = Integer.parseInt(request.getParameter("type"));

                query = "UPDATE qbdb.kullanicilar SET username='" + username + "',password='" + password + "',email='" + email + "',vip='" + VIP + "',Type='" + Type + "' WHERE id=" + id;
                boolean status = db.set_Command(query);
                if (status) {
                    mesaj = "Kayıt edildi.";
                    response.sendRedirect("list.jsp");
                } else {
                    mesaj = "Kayıt edilemedi.";
                }
            } else if (action_delete != null && action_delete.equals("true")) {
                query = "delete from qbdb.kullanicilar WHERE id=" + id;
                boolean status = db.set_Command(query);
                response.sendRedirect("list.jsp");
            }

            username = db.get_Value("select username from kullanicilar where id=" + id, 1);
            password = db.get_Value("select password from kullanicilar where id=" + id, 1);
            email = db.get_Value("select email from kullanicilar where id=" + id, 1);
            VIP = db.get_Value_Int("select vip from kullanicilar where id=" + id, 1);
            Type = db.get_Value_Int("select type from kullanicilar where id=" + id, 1);

            String checked = "";
            if (Integer.valueOf(Type) == 1) {
                checked = "checked";
            }

            if (Integer.valueOf(VIP) == 1) {
                checked = "checked";
            }
        %>

        <form action="action.jsp" method="post">
            <br>
            <input id="username" name="username" type="text" class="form-control" placeholder="kullanıcı adı"
                   value="<%=username%>">
            <br>
            <input id="password" name="password" type="password" class="form-control" placeholder="şifre"
                   value="<%=password%>">
            <br>
            <input id="email" name="email" type="date" class="form-control" placeholder="e-Posta" value="<%=email%>">
            <br>
            <div class="form-check">
                <input name="VIP" type="checkbox" class="form-check-input" value="VIP" id="vip" checked="<%=checked%>">
                <label class="form-check-label" for="vip">VIP</label>
            </div>

            <div class="form-check">
                <input name="type" type="checkbox" class="form-check-input" value="Admin" id="type" checked="<%=checked%>">
                <label class="form-check-label" for="type">Admin</label>
            </div>
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
