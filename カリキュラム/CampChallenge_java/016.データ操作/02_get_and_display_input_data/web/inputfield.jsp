<%-- 
    Document   : output
    Created on : 2018/04/15, 13:36:08
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
            out.print("名前：" + request.getParameter("name") + "<br>");
            out.print("性別：" + request.getParameter("gender") + "<br>");
            out.print("趣味：" + request.getParameter("hobby") + "<br>");
        %>
    </body>
</html>
