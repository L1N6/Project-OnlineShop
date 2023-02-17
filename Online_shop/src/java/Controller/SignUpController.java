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
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        String txtFirstName = (String)request.getParameter("txtFirstName");
        String txtLastName = (String)request.getParameter("txtLastName");
        String txtEmail = (String)request.getParameter("txtEmail");
        String txtPass = (String)request.getParameter("txtPass");
        AccountDAO acd = new AccountDAO();
        if(acd.checkAccount(txtEmail)!=null){
            request.setAttribute("txtFirstName", txtFirstName);
            request.setAttribute("txtLastName", txtLastName);
            request.setAttribute("ERROR","email already exist!");
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        }else{
            Customer cus = new Customer(txtEmail.substring(0,3)+txtFirstName.substring(0,2),txtFirstName + " " + txtLastName);
            Account acc = new Account(txtEmail, txtPass,cus.getCustomerID(), null);
                if(acd.addAccount(cus, acc)!=0){
                request.getSession().setAttribute("AccSession", acc);
                CustomerAccount inforAccount = new CustomerDAO().getCustomerInfor(acc.getCustomerID());
                request.getSession().setAttribute("CustomerInfor", inforAccount);
                response.sendRedirect("home");
            }else{
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
