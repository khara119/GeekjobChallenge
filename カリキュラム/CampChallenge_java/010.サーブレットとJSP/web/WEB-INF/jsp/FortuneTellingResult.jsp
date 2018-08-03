<%-- 
    Document   : FortuneTellingResult
    Created on : 2018/04/08, 0:00:13
    Author     : Kohei Hara
--%>

<%@page import="org.camp.servlet.ResultData" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            ResultData resultData = (ResultData)request.getAttribute("DATA");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(resultData != null) {
                out.print("<h1>あなたの" + resultData.getDate().toLocaleString() + "の運勢は、" + resultData.getLuck() + "です！</h1>");
            }
        %>
    </body>
</html>
