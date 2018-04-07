<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calc</title>
    </head>
    <body>
        <%@page import="java.util.ArrayList"%>
        <%
            String[] array = {"10", "100", "soeda", "hayashi", "-20", "118", "END"};
            for (int i=0; i<array.length; i++) {
                out.println(array[i] + "<br>");
            }
            
            out.println("<br>");
            ArrayList<String> arrayList = new ArrayList<>();
            arrayList.add("10");
            arrayList.add("100");
            arrayList.add("soeda");
            arrayList.add("hayashi");
            arrayList.add("-20");
            arrayList.add("118");
            arrayList.add("END");

            for (String str : arrayList) {
                out.println(str + "<br>");
            }
        %>
    </body>
</html>