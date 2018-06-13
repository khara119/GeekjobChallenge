<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- データベース初期化のために使うだけ。本来の課題では無いのが理想 -->
<%@page import="base.DBManager"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JUMSトップ</title>
</head>
<body>
    <%
        // 初期化パラメータが付与されていればデータベースを初期化する
        String param = request.getParameter("init");
        if (param != null && param.equals("init")) {
            base.DBManager.initDatabase();
        }
    %>
    <h1>ユーザー情報管理トップ</h1><br>
    <h3>ここでは、ユーザー情報管理システムとしてユーザー情報の登録や検索、
        付随して修正や削除を行うことができます</h3><br>
    <a href="insert">新規登録</a><br>
    <a href="Search" >検索(修正・削除)</a><br>
</body>
</html>
