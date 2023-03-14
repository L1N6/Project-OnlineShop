/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Admin;

import DAL.Admin.AccountComment;
import DAL.Admin.CustomerOrder;
import DAO.Admin.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author blabl
 */
public class AdminManageOrder extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<CustomerOrder> list = new AdminDAO().getCustomerOrder();
        req.setAttribute("list", list);
        req.getRequestDispatcher("manageOrder.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderID = req.getParameter("orderID");
        String status = req.getParameter("status");
        String EmployeeID = req.getParameter("id");
        if (status.equals("Pending")) {
            status = "0";
        }else
        if (status.equals("Cancelled")) {
            status = "2";
        }else
        if (status.equals("Accepted")) {
            status = "1";
        }
        
        new AdminDAO().manageOrder(orderID,  EmployeeID,  status);
        
        
    }
}
