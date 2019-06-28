<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
    <title>Giris</title>

    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/signin.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link href="signin.css" rel="stylesheet">


</head>
<body class="text-center">

<jsp:useBean id="db" class="methods.database"></jsp:useBean>
<%
    String mesaj = "";
    String action = request.getParameter("btn_login");
    try {
        String AccountID = String.valueOf(session.getAttribute("AccountID"));
        int type = db.get_Value_Int("select type from qbdb.kullanicilar where id=" + AccountID, 0);
        if (type == 1) {
            response.sendRedirect("../Admin/index.jsp");
        } else if(type == 2) {
            response.sendRedirect("../User/index.jsp");
        }
    } catch (Exception e) {

    }
    if (action != null) {
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");

        boolean status = db.Login(username, pass);
        if (status) {
            int ID = db.get_Account_ID(username, pass);
            int type = db.get_Value_Int("select type from qbdb.kullanicilar where id=" + ID, 0);
            session.setAttribute("AccountID", ID);
            session.setAttribute("AccountType", type);

            if (type == 1) {
                response.sendRedirect("../Admin/index.jsp");
            } else {
                response.sendRedirect("../User/index.jsp");
            }
        } else {
            mesaj = "Kullanici adi veya sifre hatali.";
        }
    }
%>

<form action="login.jsp" method="post" class="form-signin">
    <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Giris Paneli</h1>
    <label for="username" class="sr-only">e-posta adresi</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="pass" class="sr-only">sifre</label>
    <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Beni Hatirla
        </label>
        <label>
            <%=mesaj%>
        </label>
    </div>
    <button id="btn_login" name="btn_login" value="1" class="btn btn-lg btn-primary btn-block" type="submit">Giris
    </button>
    <a href="register.jsp">
        Kayit Ol
    </a>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
</form>
</body>
</html>
