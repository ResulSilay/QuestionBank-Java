<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Kayit Ol</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/signin.css" rel="stylesheet" >
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
    String action = request.getParameter("btn_register");
    if (action != null) {
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String pass_tekrar = request.getParameter("pass_tekrar");

        //int ID = db.get_Account_ID(username, pass);

        String query = "INSERT INTO qbdb.kullanicilar (username, password,type) VALUES ('" + username + "', '" + pass + "',2)";
        boolean status = db.set_Command(query);
        if (status)
            response.sendRedirect("login.jsp");
        if(pass==pass_tekrar) {}


    }
%>

<form action="register.jsp" method="post" class="form-signin">
    <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Giriş Paneli</h1>
    <label for="username" class="sr-only">kullanici adi</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="pass" class="sr-only">şifre</label>
    <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
    <label for="pass" class="sr-only">şifre tekrar</label>
    <input type="password" id="pass_tekrar" name="pass_tekrar" class="form-control" placeholder="Password" required>
    <button id="btn_register" name="btn_register" value="1" class="btn btn-lg btn-primary btn-block" type="submit">Kayıt Ol</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
</form>
</body>
</html>
