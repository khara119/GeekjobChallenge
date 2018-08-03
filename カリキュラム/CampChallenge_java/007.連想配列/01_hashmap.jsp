<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HashMap</title>
    </head>
    <body>
        <%@page import="java.util.HashMap"%>
        <%
            HashMap<String, String> map = new HashMap<>();
            
            map.put("1", "AAA");
            map.put("hello", "world");
            map.put("soeda", "33");
            map.put("20", "20");
            
            for (String key : map.keySet()) {
                out.println(key + " -> " + map.get(key) + "<br>");
            }
          %>
    </body>
</html>
