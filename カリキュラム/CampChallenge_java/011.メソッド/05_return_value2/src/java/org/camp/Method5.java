/*
 *  Copyright © 2018 Kohei Hara
 */
package org.camp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kohei Hara
 */
@WebServlet(name = "Method5", urlPatterns = {"/Method5"})
public class Method5 extends HttpServlet {

    public String[] UserProfile() {
        String[] info = {"1", "技育太郎", "東京", "男", "プログラマー"};
        return info;
    }
    
    /**
     * ArrayListで受け取る場合は以下の書き方
     * （メソッド名は適宜修正）
     */
    public ArrayList<String> getUserProfileB() {
        ArrayList<String> info = new ArrayList<>();
        info.add("1");
        info.add("技育太郎");
        info.add("東京");
        info.add("男");
        info.add("プログラマー");
        return info;
    }
    
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
        try (PrintWriter out = response.getWriter()) {
            String[] profiles = getUserProfile();
            for (int i=1; i<profiles.length; i++) {
                out.println(profiles[i]);
            }
            
            out.println("<br>");
            
            ArrayList<String> profilesB = getProfilesB();
            for (int i=1; i<profilesB.size(); i++) {
                out.println(profilesB.get(i) + "<br>");
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
