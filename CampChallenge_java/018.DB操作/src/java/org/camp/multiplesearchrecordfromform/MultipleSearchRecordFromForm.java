/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.multiplesearchrecordfromform;

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
@WebServlet(name = "MultipleSearchRecordFromForm", urlPatterns = {"/MultipleSearchRecordFromForm"})
public class MultipleSearchRecordFromForm extends HttpServlet {

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
            String[] searchText = new String[4];
            Object[] values = new Object[4];
            
            int idx = 0;
            if (!request.getParameter("name").equals("")) {
                searchText[idx] = "name like ?";
                values[idx] = (String)("%" + request.getParameter("name") + "%");
                idx++;
            }
            
            if (!request.getParameter("tel").equals("")) {
                searchText[idx] = "tel=?";
                values[idx] = request.getParameter("tel");
                idx++;
            }
            
            if (!request.getParameter("age").equals("")) {
                searchText[idx] = "age=?";
                values[idx] = Integer.parseInt(request.getParameter("age"));
                idx++;
            }
            
            if (!request.getParameter("birthday").equals("")) {
                searchText[idx] = "birthday=?";
                values[idx] = Date.valueOf(request.getParameter("birthday"));
                idx++;
            }
            
            String type = request.getParameter("search_type");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");
            
            String sql = "select * from profiles";
            if (idx > 0) {
                sql += " where";
                for (int i=0; i<idx; i++) {
                    sql += " " + searchText[i];
                    if (i != idx-1) {
                        sql += " " + type;
                    }
                }
            }

            PreparedStatement ps = db_con.prepareStatement(sql);
            for (int i=0; i<idx; i++) {
                if (values[i] instanceof Integer) {
                    ps.setInt(i+1, (Integer)values[i]);
                } else if (values[i] instanceof Date) {
                    ps.setDate(i+1, (Date)values[i]);
                } else {
                    ps.setString(i+1, (String)values[i]);
                }
            }
            
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
