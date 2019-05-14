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
@WebServlet(name = "Method8", urlPatterns = {"/Method8"})
public class Method8 extends HttpServlet {

    public String[] UserProfile(int idx) {
        String[][] info = {
            {"1", "技育太郎", "東京", "男", "プログラマー"},
            {"2", "技育花子", "北海道", "女", "システムエンジニア"},
            {"3", "技育三郎", "大阪", "男", "Webエンジニア"}
        };

		for (String[] profile : info) {
			if (Integer.parseInt(profile[0]) == idx) {
				return profile;
			}
		}
 
        return null;
    }
    
    /**
     * ArrayListで受け取る場合は以下の書き方
     * （メソッド名は適宜修正）
     */
    public ArrayList<String> getUserProfileB() {
        ArrayList<ArrayList<String>> info = new ArrayList<>();

        // １つのプロファイルデータを入れるためのArrayList
        ArrayList<String> data = new ArrayList<>();
        data.add("1");
        data.add("技育太郎");
        data.add("東京");
        data.add("男");
        data.add("プログラマー");

        info.add(data);

        data = new ArrayList<>();
        data.add("2");
        data.add("技育花子");
        data.add("北海道");
        data.add("女");
        data.add("システムエンジニア");

        info.add(data);

        data = new ArrayList<>();
        data.add("3");
        data.add("技育三郎");
        data.add("大阪");
        data.add("男");
        data.add("Webエンジニア");

        info.add(data);

		for (ArrayList<String> profile : info) {
			if (Integer.parseInt(profile.get(0)) == idx) {
				return profile;
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

            for (int i=1; i<=3; i++) {
                String[] profiles = getUserProfile(i);
                for (int j=1; j<profiles.length; j++) {
                    out.println(profiles[i]);
                }
                out.println("<br>");
            }
            
            out.println("<br>");

            // ArrayListの取得はこっち
            for (int i=1; i<=3; i++) {
                ArrayList<String> profilesB = getProfilesB(i);
                for (int j=1; j<profilesB.size(); j++) {
                    out.println(profilesB.get(j) + "<br>");
                }
                out.println("<br>");
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
