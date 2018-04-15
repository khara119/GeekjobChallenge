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
        <%
            request.setCharacterEncoding("UTF-8");
            out.println("商品種別：");
            int type = Integer.parseInt(request.getParameter("type"));
            
            switch(type) {
                case 1:
                    out.println("雑貨");
                    break;
                case 2:
                    out.println("生鮮食品");
                    break;
                default:
                    out.println("その他");
            }
            out.println("<br>");
           
            int total = Integer.parseInt(request.getParameter("total"));
            out.println("購入金額：" + total);
            out.println("加算ポイント：");
            
            if (total < 3000) {
                out.println(0);
            } else if(total < 5000) {
                out.println((int)(total*0.04));
            } else {
                out.println((int)(total*0.05));
            }
        %>
    </body>
</html>
