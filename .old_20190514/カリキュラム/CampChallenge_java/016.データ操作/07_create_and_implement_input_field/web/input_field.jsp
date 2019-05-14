<%-- 
    Document   : inputfield_session
    Created on : 2018/04/15, 18:33:57
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
            HttpSession httpSession = request.getSession(); 
            String name = (String)httpSession.getAttribute("name");
            String gender = (String)httpSession.getAttribute("gender");
            String hobby = (String)httpSession.getAttribute("hobby");
        %>
        <!--<form action="inputfield_session_result.jsp" method="post">-->
        <form action="InputFieldResult" method="post">
            名前：<input type="text" name="name"
            <%
                if (name != null) {
                    out.print("value=\""+ name +"\"");
                }
            %>
            ><br>
            性別：<input type="radio" name="gender" value="男"
            <%
                if (gender != null) {
                    if (gender.equals("男")) {
                        out.print("checked=\"checked\"");
                    }
                }
            %>
            >男
            <input type="radio" name="gender" value="女"
            <%
                if (gender != null) {
                    if (gender.equals("女")) {
                        out.print("checked=\"checked\"");
                    }
                }
            %>
            >女<br>
            趣味：<textarea name="hobby"><%
                if (hobby != null) {
                    out.print(hobby);
                }
            %></textarea><br>
            <input type="submit">
        </form>
    </body>
</html>
