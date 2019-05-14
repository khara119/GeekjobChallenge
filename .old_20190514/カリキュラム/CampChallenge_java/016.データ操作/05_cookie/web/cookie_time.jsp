<%-- 
    Document   : cookie_time
    Created on : 2018/04/15, 18:04:47
    Author     : Kohei Hara
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            boolean isFound = false;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("LastAccessTime")) {
                    isFound = true;
                    out.println("前回のアクセス時間は" + cookie.getValue() + "です。<br>");
                    break;
                }
            }
            
            if (!isFound) {
                out.println("初めてのアクセスです。<br>");
            }
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            response.addCookie(new Cookie("LastAccessTime", sdf.format(new Date())));
        %>
    </body>
</html>
