<%@page import="jums.JumsHelper"%>
<%@page import="javax.servlet.http.HttpSession"
        import="jums.UserDataBeans" %>
<%
    HttpSession hs = request.getSession();
    JumsHelper helper = JumsHelper.getInstance();
    UserDataBeans udb = (UserDataBeans)hs.getAttribute("udb");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body>
    <% if(udb.isAcceptInput()){ %>
        <h1>登録確認</h1>
        名前:<%= udb.getName() %><br>
        生年月日:<%= udb.getYear()+"年"+udb.getMonth()+"月"+udb.getDate()+"日"%><br>
        種別:<%= helper.convertTypeNumToString(udb.getType()) %><br>
        電話番号:<%= udb.getTel() %><br>
        自己紹介:<%= udb.getComment() %><br>
        上記の内容で登録します。よろしいですか？
        <form action="insertresult" method="POST">
            <input type="hidden" name="name" value="<%=udb.getName() %>">
            <input type="hidden" name="year" value="<%=udb.getYear() %>">
            <input type="hidden" name="month" value="<%=udb.getMonth() %>">
            <input type="hidden" name="date" value="<%=udb.getDate() %>">
            <input type="hidden" name="type" value="<%=udb.getType() %>">
            <input type="hidden" name="tel" value="<%=udb.getTel() %>">
            <input type="hidden" name="comment" value="<%=udb.getComment() %>">
            <input type="hidden" name="ac" value="<%= hs.getAttribute("ac") %>">
            <input type="submit" name="yes" value="はい">
        </form>
    <% }else{ %>
        <h1>入力が不完全です</h1>
        <ul>
            <% for (String str : udb.getInvalidInputList()) { %>
                <li><%= str %></li>
            <% } %>
        </ul>
    <% } %>
        <form action="insert" method="POST">
            <input type="hidden" name="name" value="<%=udb.getName() %>">
            <input type="hidden" name="year" value="<%=udb.getYear() %>">
            <input type="hidden" name="month" value="<%=udb.getMonth() %>">
            <input type="hidden" name="date" value="<%=udb.getDate() %>">
            <input type="hidden" name="type" value="<%=udb.getType() %>">
            <input type="hidden" name="tel" value="<%=udb.getTel() %>">
            <input type="hidden" name="comment" value="<%=udb.getComment() %>">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <br>
        <%= helper.home()%>
    </body>
</html>
