<%-- 
    Document   : FortuneTellingResult
    Created on : 2018/04/08, 0:00:13
    Author     : Kohei Hara
--%>

<%@page import="org.camp.servlet.ResultData" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            ResultData resultData = (ResultData)request.getAttribute("DATA");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fortune Telling</title>
    </head>
    <body>
        <%
            if(resultData != null) {
                // 日時データを実行環境上の文字列データに変換
                String localeDate = resultData.getDate().toLocalString();
                out.print("<h1>あなたの" + localeDate + "の運勢は、" + resultData.getLuck() + "です！</h1>");
            } else {
                // もしも占い結果がなかった場合
　　　　　　　　out.println("占い結果を取得できませんでした。");
            }
        %>
    </body>
</html>
