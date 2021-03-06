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
@WebServlet(name = "Method7", urlPatterns = {"/Method7"})
public class Method7 extends HttpServlet {

    public String[] UserProfile(int idx) {
        String[][] info = {
            {"1", "技育太郎", "東京", null, "プログラマー"},
            {"2", "技育花子", null, "女", "システムエンジニア"},
            {"3", "技育三郎", "大阪", "男", null}
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
        data.add(null);
        data.add("プログラマー");

        info.add(data);

        data = new ArrayList<>();
        data.add("2");
        data.add("技育花子");
        data.add(null);
        data.add("女");
        data.add("システムエンジニア");

        info.add(data);

        data = new ArrayList<>();
        data.add("3");
        data.add("技育三郎");
        data.add("大阪");
        data.add("男");
        data.add(null);

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
            /* 以下のコメントアウトをどれか１つだけ外して確認する */
            int idx = 1;
            //int idx = 2;
            //int idx = 3;

            String[] profiles = getUserProfile(idx);
            for (int i=1; i<profiles.length; i++) {
                if (profiles[i] == null) {
                    continue;
                }

                out.println(profiles[i]);
            }
            
            out.println("<br>");
            
            // ArrayListの取得はこっち
            ArrayList<String> profilesB = getProfilesB(idx);
            for (int i=1; i<profilesB.size(); i++) {
                if (progilesB.get(i) == null) {
                    continue;
                }

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
