<%-- 
    Document   : stock_management_list
    Created on : 2018/04/21, 19:49:24
    Author     : Kohei Hara
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.camp.stockmanagement.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession httpSession = request.getSession();
            String name = (String)httpSession.getAttribute("name");
            ArrayList<Item> items = (ArrayList<Item>)httpSession.getAttribute("items");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% out.print(name); %>でログインしています。<a href="stock_management_login.html">ログアウト</a><br><br>
        <a href="stock_management_register.html">商品登録はこちら</a><br><br>
        <h3>商品リスト</h3>
        <table border="1">
            <tr><th>商品ID</th><th>商品名</th><th>在庫数</th><th>最終更新日</th><th>最終更新者</th></tr>
            <% for (Item item : items) { %>
                <tr>
                    <td><% out.print(item.getId()); %></td>
                    <td><% out.print(item.getName()); %></td>
                    <td><% out.print(item.getStock()); %></td>
                    <td><% out.print(item.getLastUpdated()); %></td>
                    <td><% out.print(item.getLastUpdatedBy()); %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
