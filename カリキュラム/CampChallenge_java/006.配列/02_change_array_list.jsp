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

            // 0から数えて2番目の値に「33」をセットする
            arrayList.set(2, "33");

            for (String str : arrayList) {
                out.println(str + "<br>");
            }
        %>
    </body>
</html>
