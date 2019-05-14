<%-- 
    Document   : querystring
    Created on : 2018/04/15, 17:11:27
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
        <form action="query_string_output.jsp" method="get">
            総額：<input type="number" name="total" value="0">円<br>
            数量：<input type="number" name="count" value="0">個<br>
            商品種別：<input type="radio" name="type" value="1" checked>雑貨
            <input type="radio" name="type" value="2">生鮮食品
            <input type="radio" name="type" value="3">その他
        </form>
    </body>
</html>
