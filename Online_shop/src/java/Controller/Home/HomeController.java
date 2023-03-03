/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Controller.Home;


import DAL.BrandAndQuantity;
import DAL.Brands;
import DAL.Home.Event;
import DAL.Home.ProductDiscountUnitOnOrder;
import DAO.Home.BrandDAO;
import DAO.Home.EventDAO;
import DAO.Home.ProductDAO1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author blabl
 */
public class HomeController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            ArrayList<BrandAndQuantity> brandList = new BrandDAO().getBrands();
            ArrayList<ProductDiscountUnitOnOrder> ListSale = new ProductDAO1().getProduct(1);
            ArrayList<ProductDiscountUnitOnOrder> ListFeatured = new ProductDAO1().getProduct(2);
            ArrayList<ProductDiscountUnitOnOrder> ListBigAmount = new ProductDAO1().getProduct(3);
            ArrayList<Event> events = new EventDAO().getEvents();
            List<Brands> getAllBrands = new BrandDAO().getAllBrands();
            req.getSession().setAttribute("NvabarBrands", getAllBrands);
            req.setAttribute("Events", events);
            req.setAttribute("ListFeatured", ListFeatured);
            req.setAttribute("ListBigAmount", ListBigAmount);
            req.setAttribute("ListSale", ListSale);
            req.setAttribute("List", brandList);
            req.setAttribute("Check", "true");
            req.getSession().removeAttribute("BrandFilter");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}


