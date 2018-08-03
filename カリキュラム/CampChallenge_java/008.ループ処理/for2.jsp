<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>for</title>
    </head>
    <body>
        <%
            String str = "";
            for (int i=1; i<=30; i++) {
                str += "A";
            }
            
            out.println(str);
        %>
    </body>
</html>