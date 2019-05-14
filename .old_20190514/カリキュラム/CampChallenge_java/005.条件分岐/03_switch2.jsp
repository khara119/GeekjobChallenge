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
            char val = 'A';
            //char val = 'あ';
            //char val = '1';
            
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
