<%-- 
    Document   : htmltag
    Created on : 2018/04/15, 14:34:56
    Author     : Kohei Hara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            out.println("ID: " + request.getParameter("id") + "<br>");
            out.println("以上のIDで登録しました。");
        %>
    </body>
</html>
