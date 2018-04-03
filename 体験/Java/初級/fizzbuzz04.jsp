<%-- 
    Document   : fizzbuzz03
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
            for (int i=1; i<=40; i++) {
                out.print(i);
                /* if ((i%3 == 0 || String.valueOf(i).indexOf("3") != -1) && i%5 == 0) { */
                if (i%15 == 0 || i%5 == 0 && String.valueOf(i).indexOf("3") != -1) {
                    out.print("アホ犬になる");
                } else if (i%3 == 0 || String.valueOf(i).indexOf("3") != -1) {
                    out.print("アホになる");
                } else if (i%5 == 0) {
                    out.print("犬っぽくなる");
                }
                out.println("<br>");
            }
        %>
    </body>
</html>
