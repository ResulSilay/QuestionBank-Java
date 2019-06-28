<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Test islemleri</title>
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
        <form action="action.jsp" method="post">
            <br>

            <select name="ders" id="ders" class="form-control form-control-sm">
                <option>Ders Seç</option>
                <%
                    ResultSet rs = db.get_List("select id,baslik from dersler");
                    while (rs.next()) { %>
                <option value="<%=rs.getString("id") %>"><%=rs.getString("baslik") %>
                </option>
                <%}%>
            </select>
            <br>

            <select name="konu" id="konu" class="form-control form-control-sm">
                <option>Konu Seç</option>
                <%
                    ResultSet rs_konu = db.get_List("select id,baslik from konular where ders_id=1");
                    while (rs_konu.next()) { %>
                <option value="<%=rs_konu.getString("id") %>"><%=rs_konu.getString("baslik") %>
                </option>
                <%}%>
            </select>
            <br>
            <input id="soru" name="soru" type="text" class="form-control" placeholder="Soru">
            <br>
            <input id="cevap1" name="cevap1" type="text" class="form-control" placeholder="Cevap A">
            <br>

            <input id="cevap2" name="cevap2" type="text" class="form-control" placeholder="Cevap B">
            <br>

            <input id="cevap3" name="cevap3" type="text" class="form-control" placeholder="Cevap C">
            <br>

            <input id="cevap4" name="cevap4" type="text" class="form-control" placeholder="Cevap D">
            <br>

            <input id="cevap5" name="cevap5" type="text" class="form-control" placeholder="Cevap E">
            <br>

            <select name="cevap" id="cevap" class="form-control form-control-sm">
                <option>Cevap Seç</option>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
                <option value="E">E</option>
            </select>
            <br>

            <select name="derece" id="derece" class="form-control form-control-sm">
                <option>Derece Seç</option>
                <option value="1">Kolay</option>
                <option value="2">Orta</option>
                <option value="3">Zor</option>
            </select>
            <br>

            <button type="submit" class="btn btn-primary">Kaydet</button>
        </form>
    </div>

</div>

</body>
</html>
