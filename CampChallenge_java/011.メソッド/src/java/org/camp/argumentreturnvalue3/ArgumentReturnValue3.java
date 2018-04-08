/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.argumentreturnvalue3;

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
@WebServlet(name = "ArgumentReturnValue3", urlPatterns = {"/ArgumentReturnValue3"})
public class ArgumentReturnValue3 extends HttpServlet {

    public String[] getArrayInfo(String id) {
        String[][] info = {
            {"MIL005", "原昂平", "東京都布留部市伊庭"},
            {"MIL050", "高瀬蓮", null},
            {"MIL500", "黒羽司", "東京都布留部市柏原"},
        };
        
        for (int i=0; i<info.length; i++) {
            if (info[i][0].equals(id)) {
                return info[i];
            }
        }

        return null;
    }
    
    public ArrayList<String> getArrayListInfo(String id) {
        ArrayList<ArrayList<String>> info = new ArrayList<>();
        
        info.add(new ArrayList<String>() {
            {
                add("MIL005");
                add("原昂平");
                add("東京都布留部市伊庭");
            }
        });
        
        info.add(new ArrayList<String>() {
            {
                add("MIL050");
                add("高瀬蓮");
                add(null);
            }
        });
        
        info.add(new ArrayList<String>() {
            {
                add("MIL500");
                add("黒羽司");
                add("東京都布留部市柏原");
            }
        });

        for (ArrayList<String> info_one : info) {
            if (info_one.get(0).equals(id)) {
                return info_one;
            }
        }
        
        return null;
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
            String[] ids = {"MIL005", "MIL050", "MIL500"};

            int limit = 2;
            for (int i=0; i<ids.length && limit > 0; i++) {
                String[] info = getArrayInfo(ids[i]);
                if (info[2]==null) {
                    continue;
                }
                
                out.println(info[1] + " " + info[2] + "<br>");
                limit--;
            }

            out.println("<br>");
            
            limit = 2;
            for (int i=0; i<ids.length && limit > 0; i++) {
                ArrayList<String> info = getArrayListInfo(ids[i]);
                if (info.get(2)==null) {
                    continue;
                }
                
                out.println(info.get(1) + " " + info.get(2) + "<br>");
                limit--;
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
