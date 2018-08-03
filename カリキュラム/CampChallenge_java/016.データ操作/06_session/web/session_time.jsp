<%-- 
    Document   : session_time
    Created on : 2018/04/15, 18:24:51
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
            HttpSession httpSession = request.getSession();
            String value = (String)httpSession.getAttribute("LastAccessTime");
            if (value == null) {
                out.println("初めてのアクセスです。<br>");
            } else {
                out.println("前回のアクセス時間は" + value + "です。<br>");
            }
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            httpSession.setAttribute("LastAccessTime", sdf.format(new Date()));            
        %>
    </body>
</html>
