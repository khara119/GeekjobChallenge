<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>If</title>
    </head>
    <body>
        <%
            /* 下記のどれか１つだけコメントアウトを外して確認する */
            int val = 1;
            //int val = 2;
            //int val = 3;
            
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
