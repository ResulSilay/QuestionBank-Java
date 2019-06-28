<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.InputStream" %>

<html>
<head>
    <title>Title</title>
    <link href="/untitled__war_exploded/webroot/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="https://getbootstrap.com/docs/4.3/examples/sign-in/signin.css" rel="stylesheet">

    <jsp:useBean id="db" class="methods.database"></jsp:useBean>

</head>
<body>
<div class="container shadow mb-5 bg-white rounded" style="background-color:white; padding:0px;">

    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="#">Features</a>
                    <a class="nav-item nav-link" href="#">Pricing</a>
                    <a class="nav-item nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </div>
            </div>
        </nav>
    </div>


    <div class="container">
        <label class="control-label">Select File</label>
        <input type="file" name="file" id="file">
    </div>

    <%
        InputStream input = new FileInputStream(filename);

        HSSFWorkbook wb = new HSSFWorkbook(input);

        for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++)
        {
            HSSFSheet sheet = wb.getSheetAt(sheetIndex);
            Iterator rowIter = sheet.rowIterator();
            while (rowIter.hasNext())
            {
                HSSFRow row = (HSSFRow) rowIter.next();
                Iterator cellIter = row.cellIterator();
                while (cellIter.hasNext())
                {
                    HSSFCell cell = (HSSFCell) cellIter.next();
                    printCellValue(cell);
                }
            }
        }

        input.close();

    %>

</div>

</body>
</html>
