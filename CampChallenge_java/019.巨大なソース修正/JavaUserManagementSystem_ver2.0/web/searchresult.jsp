<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO"
        import="java.util.ArrayList" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    ArrayList<UserDataDTO> resultData = (ArrayList)request.getAttribute("resultData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body>
        <h1>検索結果</h1>
        <table border=1>
            <tr>
				<th>ID</th>
                <th>名前</th>
                <th>生年</th>
                <th>種別</th>
                <th>登録日時</th>
            </tr>
            <% for (int i=0; i<resultData.size(); i++) {
                UserDataDTO udd = resultData.get(i); %>
            <tr>
                <td><%= udd.getUserID() %></td>
                <td><a href="ResultDetail?id=<%= udd.getUserID()%>"><%= udd.getName()%></a></td>
                <td><%= jh.getYearFromBirthday(udd.getBirthday()) %></td>
                <td><%= jh.exTypenum(udd.getType()) %></td>
                <td><%= udd.getNewDate()%></td>
            </tr>
            <% } %>
        </table>
    </body>
    <%=jh.home()%>
</html>
