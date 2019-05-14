<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Switch-Case</title>
    </head>
    <body>
        <%
            /* 下記のコメントアウトをどれか１つだけ外して確認する */
            int val = 1;
            //int val = 2;
            //int val = 3;
            
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
