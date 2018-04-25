<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.UserDataBeans" %>
<%@page import="jums.JumsHelper" %>
<%
    HttpSession hs = request.getSession();
    UserDataBeans udb = (UserDataBeans)hs.getAttribute("udb");
    if (udb == null) {
        udb = UserDataBeans.getInstance();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
    <form action="insertconfirm" method="POST">
        名前:
        <input type="text" name="name" value="<%= udb.getName() %>">
        <br><br>

        生年月日:
        <select name="year">
            <option value="" <% if(udb.getYear()==0) out.print("selected"); %>>----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>" <% if(udb.getYear()==i) out.print("selected"); %>> <%=i%> </option>
            <% } %>
        </select>年
        <select name="month">
            <option value="" <% if(udb.getMonth()==0) out.print("selected"); %>>--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>" <% if(udb.getMonth()==i) out.print("selected"); %>><%=i%></option>
            <% } %>
        </select>月
        <select name="day">
            <option value="" <% if(udb.getDate()==0) out.print("selected"); %>>--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>" <% if(udb.getDate()==i) out.print("selected"); %>><%=i%></option>
            <% } %>
        </select>日
        <br><br>

        種別:
        <br>
        <input type="radio" name="type" value="1" <% if (udb.getType()==1) out.print("checked"); %>>エンジニア<br>
        <input type="radio" name="type" value="2" <% if (udb.getType()==2) out.print("checked"); %>>営業<br>
        <input type="radio" name="type" value="3" <% if (udb.getType()==3) out.print("checked"); %>>その他<br>
        <br>

        電話番号:
        <input type="text" name="tell" value="<%= udb.getTel() %>">
        <br><br>

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%= udb.getComment() %></textarea><br><br>

        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
