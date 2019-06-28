<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <jsp:useBean id="db" class="methods.database"></jsp:useBean>
</head>
<body>
<%

    boolean status=false;
    String AccountID = String.valueOf(session.getAttribute("AccountID"));
    int ders_id=Integer.parseInt(request.getParameter("ders"));
    int konu_id=Integer.parseInt(request.getParameter("konu"));
    String soru=String.valueOf(request.getParameter("soru"));
    String cevap1=String.valueOf(request.getParameter("cevap1"));
    String cevap2=String.valueOf(request.getParameter("cevap2"));
    String cevap=String.valueOf(request.getParameter("sonuc"));
    String derece=String.valueOf(request.getParameter("derece"));

    String query = "insert into dogru_yanlis (kullanici_id,ders_id,konu_id,soru,cevap_1,cevap_2,sonuc,derece) values("+AccountID+","+ders_id+","+konu_id+",'"+soru+"','"+cevap1+"','"+cevap2+"','"+cevap3+"','"+cevap4+"','"+cevap5+"','"+cevap+"','"+derece+"')";
    status=db.set_Command(query);
    if(status)

    {
%>
<div class="alert-success">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    Kayıt Edildi
</div>
<%
    response.sendRedirect("list.jsp");
}
else { %>
<div class="alert-unsuccess">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    Kayıt Edilemedi.
</div>
<%} %>
<%=query%>
</body>
</html>
