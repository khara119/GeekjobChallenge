<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calc</title>
    </head>
    <body>
        <%
            int a = 20;
            int b = 10;
            final int A = 30;
            final int B = 15;
           
            out.println("変数同士の四則演算"); 
            out.println(a + " + " + b + " = " + (a+b) + "<br>");
            out.println(a + " - " + b + " = " + (a-b) + "<br>");
            out.println(a + " * " + b + " = " + (a*b) + "<br>");
            out.println(a + " / " + b + " = " + (a/b) + "<br>");
            out.println(a + " % " + b + " = " + (a%b) + "<br>");

            out.println("<br>");

            out.println("変数と定数の四則演算"); 
            out.println(a + " + " + B + " = " + (a+B) + "<br>");
            out.println(a + " - " + B + " = " + (a-B) + "<br>");
            out.println(a + " * " + B + " = " + (a*B) + "<br>");
            out.println(a + " / " + B + " = " + (a/B) + "<br>");
            out.println(a + " % " + B + " = " + (a%B) + "<br>");

            out.println("<br>");

            out.println("定数同士の四則演算"); 
            out.println(A + " + " + B + " = " + (A+B) + "<br>");
            out.println(A + " - " + B + " = " + (A-B) + "<br>");
            out.println(A + " * " + B + " = " + (A*B) + "<br>");
            out.println(A + " / " + B + " = " + (A/B) + "<br>");
            out.println(A + " % " + B + " = " + (A%B) + "<br>");
        %>
    </body>
</html>
