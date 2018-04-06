<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for</title>
    </head>
    <body>
        <%
            int n = 1000;
            while(n >= 100) {
                n /= 2;
                //out.println(n + "<br>");
            }
            
            out.println(n);
        %>
    </body>
</html>