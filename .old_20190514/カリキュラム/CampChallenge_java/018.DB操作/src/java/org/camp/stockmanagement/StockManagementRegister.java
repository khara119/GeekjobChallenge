/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.stockmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kohei Hara
 */
@WebServlet(name = "StockManagementRegister", urlPatterns = {"/StockManagementRegister"})
public class StockManagementRegister extends HttpServlet {

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
        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");
            
            String name = request.getParameter("name");
            int stock = Integer.parseInt(request.getParameter("stock"));

            String sql = "select id, stock from item where name like ?";
            
            PreparedStatement ps = db_con.prepareStatement(sql);
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            rs.last();
            int count = rs.getRow();

            if (count == 0) {
                sql = "select count(id) from item";
                ps = db_con.prepareStatement(sql);
                rs = ps.executeQuery();
                rs.next();
                int numberOfItem = rs.getInt(1);
                
                sql = "insert into item values(?, ?, ?, ?, ?)";
                ps = db_con.prepareStatement(sql);
                ps.setInt(1, numberOfItem+1);
                ps.setString(2, name);
                ps.setInt(3, stock);
                ps.setDate(4, new Date(new java.util.Date().getTime()));
                ps.setString(5, (String)session.getAttribute("id"));
                
                ps.executeUpdate();
                
            } else {
                sql = "update item set stock=?, last_updated=?, last_updated_by=? where id=?";

                ps = db_con.prepareStatement(sql);
                ps.setInt(1, rs.getInt("stock") + stock);
                ps.setDate(2, new Date(new java.util.Date().getTime()));
                ps.setString(3, (String)session.getAttribute("id"));
                ps.setString(4, rs.getString("id"));
                
                ps.executeUpdate();
            }
            
            sql = "select * from item inner join staff on item.last_updated_by=staff.id";
            ps = db_con.prepareStatement(sql);

            rs = ps.executeQuery();
            ArrayList<Item> items = new ArrayList<>();
            while(rs.next()) {
                Item item = new Item(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getInt("stock"),
                    rs.getDate("last_updated"),
                    rs.getString("staff.name")
                );

                items.add(item);
            }

            db_con.close();

            session.setAttribute("name", (String)session.getAttribute("name"));
            session.setAttribute("items", items);

            RequestDispatcher rd = request.getRequestDispatcher("stock_management_list.jsp");
            rd.forward(request, response);
        } catch (SQLException e) {
            System.err.println("接続時にエラーが発生しました。\n" + e.getMessage());
        } catch (Exception e) {
            System.err.println("接続時にエラーが発生しました。\n" + e.getMessage());            
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
