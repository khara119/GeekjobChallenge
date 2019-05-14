<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ArrayList</title>
    </head>
    <body>
        <%@page import="java.util.ArrayList"%>
        <%
            ArrayList<String> arrayList = new ArrayList<>();
            arrayList.add("10");
            arrayList.add("100");
            arrayList.add("soeda");
            arrayList.add("hayashi");
            arrayList.add("-20");
            arrayList.add("118");
            arrayList.add("END");

            // 【A】のfor文は【B】のfor文の同じ意味。
            // 配列の先頭から順に取り出す場合は【A】が楽。
　　　　　　// 要素番号を使うときなどは【B】で書く。
            //
            // 【A】for (String str : arrayList) { }
            // 【B】for (int i=0; i<arrayList.size(); i++) {
            //      	String str = arrayList.get(i);
            //      }
            for (String str : arrayList) {
                out.println(str + "<br>");
            }
        %>
    </body>
</html>
