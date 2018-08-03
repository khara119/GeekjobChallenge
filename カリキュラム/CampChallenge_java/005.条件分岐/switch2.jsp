<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calc</title>
    </head>
    <body>
        <%
            char val = 'A';
            //val = 'あ';
            //val = '1';
            
            switch (val) {
                case 'A':
                    out.println("英語");
                    break;
                case 'あ':
                    out.println("日本語");
                    break;
            }
        %>
    </body>
</html>