/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.Account;
import DAL.Customer;
import DAL.CustomerAccount; 
import DAO.AccountDAO;
import DAO.CustomerDAO;
import MyUntils.SendMail;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hieuh
 */
public class SignUpController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("check", "not empty");
        request.getRequestDispatcher("./signUp.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String txtFirstName = (String)request.getParameter("txtFirstName");
            String txtLastName = (String)request.getParameter("txtLastName");
            String txtEmail = (String)request.getParameter("txtEmail");
            String txtPass = (String)request.getParameter("txtPass");
            String txtAddress = (String)request.getParameter("txtAddress");
            boolean gender = (Boolean.valueOf(request.getParameter("gender")));
            AccountDAO acd = new AccountDAO();
            if(acd.checkAccount(txtEmail)!=null){
                request.setAttribute("txtFirstName", txtFirstName);
                request.setAttribute("txtLastName", txtLastName);
                request.setAttribute("txtAddress", txtAddress);
                request.setAttribute("gender", gender);
                request.setAttribute("ERROR","email already exist!");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }else{
                // id = 3 chu cái dau Email và 2 chu cai dau FirstName ..... ContactName = txtFirstName + " " + txtLastName
                Customer cus = new Customer(txtEmail.substring(0,3)+txtFirstName.substring(0,2),txtFirstName + " " + txtLastName);
                cus.setAddress(txtAddress);
                cus.setGender(gender);
                Account acc = new Account(txtEmail, txtPass,cus, null);
                if(acd.addAccount(cus, acc)!=0){
                     SendMail.SendMailFunction(txtEmail, "tieu de", acc.toString());
                    request.getSession().setAttribute("AccSession", acc);
                    CustomerAccount inforAccount = new CustomerDAO().getCustomerInfor(acc.getCustomerID().getCustomerID());
                    request.getSession().setAttribute("CustomerInfor", inforAccount);
                    response.sendRedirect("home");
                }else{
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                } 
            }
        } catch (SQLException ex) {
            Logger.getLogger(SignUpController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
