<%-- 
    Document   : querystring_factoring
    Created on : 2018/04/15, 17:35:28
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
            int n = Integer.parseInt(request.getParameter("n"));
            boolean flag = true;
            int[] primes = {2, 3, 5, 7};
            String aster = "";
            out.println(n + " = ");
            while(flag || n <= 0) {
                flag = false;
                for (int prime : primes) {
                    if (n%prime == 0) {
                        out.println(aster + " " + prime + " ");
                        aster = "*";
                        flag = true;
                        n = n/prime;
                        break;
                    }
                }
            }
            if (n != 1) {
                out.println("あまり " + n);
            }
        %>
    </body>
</html>
