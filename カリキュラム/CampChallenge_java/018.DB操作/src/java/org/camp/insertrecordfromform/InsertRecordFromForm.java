/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.insertrecordfromform;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kohei Hara
 */
@WebServlet(name = "InsertRecordFromForm", urlPatterns = {"/InsertRecordFromForm"})
public class InsertRecordFromForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection db_con = null;
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            Object[] data = {
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("tel"),
                Integer.parseInt(request.getParameter("age")),
                Date.valueOf(request.getParameter("birthday"))
            };
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");

            // 挿入処理
            String sql = "insert into profiles values(?, ?, ?, ?, ?)";
            PreparedStatement ps = db_con.prepareStatement(sql);
            
            // SQL文の「?」に対応するデータをセット
            for (int i=0; i<data.length; i++) {
                if (data[i] instanceof Integer) {
                    ps.setInt(i+1, (Integer)data[i]);
                } else if (data[i] instanceof Date) {
                    ps.setDate(i+1, (Date)data[i]);
                } else {
                    ps.setString(i+1, (String)data[i]);
                }
            }
            
            ps.executeUpdate();

            // SQLインジェクション対策のSQL文
            sql = "select * from profiles";

            ps = db_con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            out.println("<table border=\"1\"");
            out.println("<tr><th>ID</th><th>Name</th><th>TEL</th><th>Age</th><th>Birthday</th></tr>");
            while (rs.next()) {
                int id = rs.getInt("profilesID");
                String name = rs.getString("name");
                String tel = rs.getString("tel");
                int age = rs.getInt("age");
                Date birthday = rs.getDate("birthday");
                
                out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + tel + "</td><td>" + age + "</td><td>" + birthday + "</td></tr>");
            }
            out.println("</table>");
            db_con.close();
        } catch (SQLException e) {
            System.err.println("エラーが発生しました。\n" + e.getMessage());
        } catch (Exception e) {
            System.err.println("エラーが発生しました。\n" + e.getMessage());            
        } finally {
            if (db_con != null) {
                try {
                    db_con.close();
                } catch (Exception e) {
                    System.err.println("Closeでエラーが発生しました。\n" + e.getMessage());
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
