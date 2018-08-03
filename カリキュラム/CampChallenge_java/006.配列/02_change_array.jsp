<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Array</title>
    </head>
    <body>
        <%
            String[] array = {"10", "100", "soeda", "hayashi", "-20", "118", "END"};
            
            array[2] = "33";
            
            for (String str : array) {
                out.println(str + "<br>");
            }
        %>
    </body>
</html>
