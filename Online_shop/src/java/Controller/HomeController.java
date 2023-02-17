/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;


import DAL.BrandAndQuantity;
import DAL.Event;
import DAL.ProductDiscountUnitOnOrder;
import DAO.BrandDAO;
import DAO.EventDAO;
import DAO.ProductDAO;
import DAO.ProductDAO1;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author hieuh
 */
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    } 

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        ArrayList<BrandAndQuantity> brandList = new BrandDAO().getBrands();
        ArrayList<ProductDiscountUnitOnOrder> ListSale = new ProductDAO1().getProductBestSale();
        ArrayList<Event> events = new EventDAO().getEvents();
       
        req.setAttribute("Events", events);
        req.setAttribute("ListSale", ListSale);
        req.setAttribute("List", brandList);
        req.setAttribute("Check", "true");
        req.setAttribute("check", "not empty");
        req.getRequestDispatcher("./index.jsp").forward(req, resp);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
