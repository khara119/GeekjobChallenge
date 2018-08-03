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

            // 【A】のfor文は【B】のfor文の同じ意味。
            // 配列の先頭から順に取り出す場合は【A】が楽。
　　　　　　// 要素番号を使うときなどは【B】で書く。
            //
            // 【A】for (String str : array) { }
            // 【B】for (int i=0; i<array.length; i++) {
            //      	String str = array[i];
            //      }
            for (String str : array) {
                out.println(str + "<br>");
            }
        %>
    </body>
</html>
