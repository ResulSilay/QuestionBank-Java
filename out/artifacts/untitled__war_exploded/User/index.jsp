<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Kullanici Panel</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">
</head>
<body>


<jsp:useBean id="db" class="methods.database"></jsp:useBean>

<%
    String ID = String.valueOf(session.getAttribute("AccountID"));
    int Type = -1;
    String name = "";
    try {
        Type = Integer.parseInt(String.valueOf(session.getAttribute("AccountType")));
        name = db.get_Value("select username from kullanicilar where id=" + ID, 1);

        if (ID == null)
            response.sendRedirect("../Connect/login.jsp");
        if (Type != 2)
            response.sendRedirect("../Admin/index.jsp");
    } catch (Exception e) {
    }

    String toplamTestSayisi = String.valueOf(db.get_Value_Int("select count(id) as 'count' from qbdb.testler where kullanici_id=" + ID, 1));
    String toplamDYSayisi = db.get_Value("select count(id) from qbdb.dogru_yanlis where kullanici_id=" + ID, 1);

    String toplamHataliTestSayisi = db.get_Value("select count(id) from qbdb.bildirimler where soru_tipi=1 and durum=0 and kullanici_id=" + ID, 1);
    String toplamHataliDYSayisi = db.get_Value("select count(id) from qbdb.bildirimler where soru_tipi=2 and durum=0 and kullanici_id=" + ID, 1);

%>


<div class="container shadow p-0 mb-0 bg-white rounded" style="background-color:white; height: 60px">
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/User/index.jsp">Ana Sayfa <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link"
                           href="${pageContext.request.contextPath}lessons/list.jsp">Dersler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link"
                           href="${pageContext.request.contextPath}subjects/list.jsp">Konular</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Admin/buggy/list.jsp">Bildirimler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}tests/list.jsp">Testler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}correct/list.jsp">Doğru/Yanlış</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/Connect/profile.jsp">Profil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link"
                           href="${pageContext.request.contextPath}/Connect/logout.jsp">Çıkış</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><%="Hoşgeldiniz: " + name%>
                    </button>
                </form>
            </div>
        </nav>

        <div class="container shadow p-3 mb-5 bg-white rounded">

            <form action="../Admin/search/index.jsp" method="POST" style="margin-bottom: 35px;">
                <div>
                    <div>
                        <form class="card card-sm">
                            <div class="card-body row no-gutters align-items-center"
                                 style="border-bottom: solid 1px; border-color: lightgray;">
                                <div class="col-auto">
                                    <i class="fas fa-search h4 text-body"></i>
                                </div>
                                <div class="col">
                                    <input id="search" name="search"
                                           class="form-control form-control-lg form-control-borderless"
                                           style="border: 0px"
                                           type="search" placeholder="Soru arayın...">
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Ara</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">İstatistlikler</h6></li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col">
                                    Toplam Test Sayısı:
                                </div>
                                <div class="col" style="text-align:right">
                                    <span class="badge badge-info"><%=toplamTestSayisi%></span>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col">
                                    Toplam Doğru/Yanlış Sayısı:
                                </div>
                                <div class="col" style="text-align:right">
                                    <span class="badge badge-info"><%=toplamDYSayisi%></span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Bildirimler</h6></li>
                        <li class="list-group-item">
                            <a>

                                <div class="row">
                                    <div class="col">
                                        Hatalı Test Sayısı:
                                    </div>
                                    <div class="col" style="text-align:right">
                                        <span class="badge badge-info"><%=toplamHataliTestSayisi%></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a>

                                <div class="row">
                                    <div class="col">
                                        Hatalı Doğru/Yanlış Sayısı:
                                    </div>
                                    <div class="col" style="text-align:right">
                                        <span class="badge badge-info"><%=toplamHataliDYSayisi%></span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Dersler</h6></li>
                        <li class="list-group-item"><a href="lessons/list.jsp"> Tüm Dersler</a></li>
                    </ul>

                </div>
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Konular</h6></li>
                        <li class="list-group-item"><a href="subjects/list.jsp"> Tüm Konular</a></li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Test İşlemleri</h6></li>
                        <li class="list-group-item"><a href="tests/list.jsp"> Sorularım</a></li>
                        <li class="list-group-item"><a href="../Admin/tests/actions.jsp">Soru Ekle</a></li>
                    </ul>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Doğru/Yanlış İşlemleri</h6></li>
                        <li class="list-group-item"><a href="correct/list.jsp"> Sorularım</a></li>
                        <li class="list-group-item"><a href="../Admin/actions/list.jsp"> Soru Ekle</a></li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Kullanıcı İşlemleri</h6></li>
                        <li class="list-group-item"><a href="accounts/list.jsp"> Profilim</a></li>
                        <li class="list-group-item"><a href="../Connect/logout.jsp"> Çıkış</a></li>
                    </ul>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><h6 class="card-title">Soru İşlemleri</h6></li>
                        <li class="list-group-item"><a href="load/index.jsp"> Soru Yükle</a></li>
                        <li class="list-group-item"><a href="load/print.jsp"> Soru Yazdır</a></li>
                    </ul>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>
