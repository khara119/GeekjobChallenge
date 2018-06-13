<%@page import="jums.JumsHelper"
        import="jums.UserDataBeans" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
    int id = (Integer)request.getAttribute("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>削除確認</h1>
    以下の内容を削除します。よろしいですか？
    名前:<%= udb.getName()%><br>
    生年月日:<%= udb.getYear() + "年" + udb.getMonth() + "月" + udb.getDay() + "日" %><br>
    種別:<%= jh.exTypenum(udb.getType()) %><br>
    電話番号:<%= udb.getTell()%><br>
    自己紹介:<%= udb.getComment()%><br>
    
    <form action="DeleteResult" method="POST">
      <input type="hidden" name="id" value="<%= id %>">
            <input type="hidden" name="name" value="<%= udb.getName() %>">
            <input type="hidden" name="year" value="<%= udb.getYear() %>">
            <input type="hidden" name="month" value="<%= udb.getMonth() %>">
            <input type="hidden" name="date" value="<%= udb.getDay() %>">
            <input type="hidden" name="type" value="<%= udb.getType() %>">
            <input type="hidden" name="tel" value="<%= udb.getTell() %>">
            <input type="hidden" name="comment" value="<%= udb.getComment()%>">
      <input type="submit" name="YES" value="はい"style="width:100px">
    </form><br>
    <form action="ResultDetail" method="POST">
      <input type="submit" name="NO" value="詳細画面に戻る"style="width:100px">
    </form>
    </body>
</html>
