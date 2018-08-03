<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calc</title>
    </head>
    <body>
        <%
            int val = 1;
            //val = 2;
            //val = 3;
            
            switch (val) {
                case 1:
                    out.println("one");
                    break;
                case 2:
                    out.println("two");
                    break;
                default:
                    out.println("想定外");
            }
        %>
    </body>
</html>