/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;




import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

/**
 *
 * @author blabl
 */
public class HomeController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        ArrayList<BrandAndQuantity> brandList = new BrandDAO().getBrands();
        ArrayList<ProductDiscountUnitOnOrder> ListSale = new ProductDAO1().getProductBestSale();
        ArrayList<Event> events = new EventDAO().getEvents();
       
        req.setAttribute("Events", events);
        req.setAttribute("ListSale", ListSale);
        req.setAttribute("List", brandList);
        req.setAttribute("Check", "true");
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    } 
}

/**
 *
 * @author hieuh
 */

