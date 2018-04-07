<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for</title>
    </head>
    <body>
        <%
            long res = 1;
            for (int i=1; i<=20; i++) {
                res *= 8;
            }
            
            out.println(res);
        %>
    </body>
</html>