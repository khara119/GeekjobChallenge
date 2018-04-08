/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.returnvalue2;

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
@WebServlet(name = "ReturnValue2", urlPatterns = {"/ReturnValue2"})
public class ReturnValue2 extends HttpServlet {

    public String[] getArrayInfo() {
        String[] info = {"MIL005", "原昂平", "東京都布留部市伊庭"};
        return info;
    }
    
    public ArrayList<String> getArrayListInfo() {
        ArrayList<String> info = new ArrayList<>();
        info.add("MIL005");
        info.add("原昂平");
        info.add("東京都布留部市伊庭");
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
            String[] arrayInfo = getArrayInfo();
            for (int i=1; i<arrayInfo.length; i++) {
                out.println(arrayInfo[i]);
            }
            
            out.println("<br>");
            
            ArrayList<String> arrayListInfo = getArrayListInfo();
            for (int i=1; i<arrayListInfo.size(); i++) {
                out.println(arrayListInfo.get(i) + "<br>");
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
