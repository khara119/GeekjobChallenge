<%-- 
    Document   : fizzbuzz01
    Created on : 2018/04/03, 23:11:56
    Author     : Kohei Hara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ナベアツ課題</title>
    </head>
    <body>
        <h1>ナベアツ課題</h1>
        <%
            for (int i=1; i<=20; i++) {
                out.print(i);
                if (i%3 == 0) {
                    out.print("アホになる");
                }
                out.println("<br>");
            }
        %>
    </body>
</html>
