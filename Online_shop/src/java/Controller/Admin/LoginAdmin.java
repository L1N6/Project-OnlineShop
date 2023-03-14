/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Admin;

import DAL.Admin.Account;
import DAO.Admin.AdminAccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author blabl
 */
public class LoginAdmin extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("Logined") != null){
            resp.sendRedirect("product");
        }else{    
        req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
   }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        
        Account acc = new AdminAccountDAO().getAccount(email, pass);
        
        if(acc.getRole() == 0){
            req.setAttribute("msg", "Email or Password fail");
            req.getRequestDispatcher("login.jsp").forward(req, resp);  
        }else if(acc.getRole() == 1){
            req.getSession().setAttribute("Employee", acc);
            req.getSession().setAttribute("Logined", true);
            resp.sendRedirect("product");
        }
        
    }

}
