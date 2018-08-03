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
            
            if (val == 1) {
                out.println("１です！");
            } else if(val == 2) {
                out.println("プログラミングキャンプ！");
            } else {
                out.println("その他です！");
            }
        %>
    </body>
</html>