<%-- 
    Document   : inputfield_session_post
    Created on : 2018/04/15, 18:43:15
    Author     : Kohei Hara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession httpSession = request.getSession();
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String hobby = request.getParameter("hobby");
            out.print("名前：" + name + "<br>");
            out.print("性別：" + gender + "<br>");
            out.print("趣味：" + hobby + "<br>");
            httpSession.setAttribute("name", name);
            httpSession.setAttribute("gender", gender);
            httpSession.setAttribute("hobby", hobby);            
        %>
    </body>
</html>
