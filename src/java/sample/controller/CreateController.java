/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.daos.UserDAO;
import sample.dtos.UserDTO;
import sample.dtos.UserErrorDTO;

/**
 *
 * @author User-PC
 */
public class CreateController extends HttpServlet {

    private static final String SUCCESS = "login.html";
    private static final String ERROR = "createUser.jsp";

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
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            boolean check = false;
            UserErrorDTO error = new UserErrorDTO("", "", "", "", "");
            if (userID.length() < 3 || userID.length() > 10) {
                check = true;
                error.setUserIDError("User ID must be in between 3 and 10!");
            }
            if (fullName.length() < 5 || userID.length() > 50) {
                check = true;
                error.setFullNameError("Full name must be in between 5 and 50!");
            }
            if (roleID.length() < 2 || userID.length() > 10) {
                check = true;
                error.setRoleIDError("Role ID must be in between 2 and 10!");
            }
            if (password.length() < 6 || userID.length() > 10) {
                check = true;
                error.setPasswordError("Password must be in between 6 and 10!");
            }
            if (!password.equals(confirm)) {
                check = true;
                error.setConfirmError("Confirmation is not matched!");
            }
            if (check) {
                request.setAttribute("ERROR_USER", error);
            } else {
                UserDAO dao = new UserDAO();
                boolean checkDuplicate = dao.checkDuplicate(userID);
                if (checkDuplicate) {
                    error.setUserIDError("User ID is duplicated!");
                    request.setAttribute("ERROR_USER", error);
                } else {
                    UserDTO user = new UserDTO(userID, fullName, roleID, password);
                    dao.insert(user);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
