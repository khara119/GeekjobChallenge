<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for</title>
    </head>
    <body>
        <%
            int sum = 0;
            for (int i=0; i<=100; i++) {
                sum += i;
            }
            
            out.println(sum);
        %>
    </body>
</html>
