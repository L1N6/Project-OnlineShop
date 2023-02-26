/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.shop;

import DAL.PaginationObject;
import DAL.shop.ProductInfor;
import DAO.shop.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LEGION
 */
public class FilterController extends HttpServlet {

    private final PaginationObject pcp = new PaginationObject();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int price;
            String color;
            int storage;
            //get Price for filter
            if (req.getParameter("txtCheckedFilterPrice") != null && req.getParameter("txtFilterPrice") != null) {
                price = Integer.parseInt(req.getParameter("txtFilterPrice"));
            } else {
                 price = Integer.parseInt(req.getParameter("txtCheckedFilterPrice"));
            }

            //get Color for filter
            if (req.getParameter("txtCheckedFilterColor") != null && req.getParameter("txtFilterColor") != null) {
                color = req.getParameter("txtFilterColor");
            } else {
                color = req.getParameter("txtCheckedFilterColor");
            }

            //get Storage for filter
            if (req.getParameter("txtCheckedFilterStorage") != null && req.getParameter("txtFilterStorage") != null) {
                storage = Integer.parseInt(req.getParameter("txtFilterStorage"));
            } else {
                    storage = Integer.parseInt(req.getParameter("txtCheckedFilterStorage"));
            }
            int currentPage;
            int numberOfPage;
            String a = req.getParameter("currentPage");
            if ("".equals(a) || a == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(req.getParameter("currentPage"));
            }
            req.getSession().removeAttribute("searching");
            req.getSession().removeAttribute("sortSession");
            //Paging
            List<ProductInfor> listFilterProduct = new ProductDAO().getFilterProduct(price, color, storage);
            List<ProductInfor> getFilterProduct = pcp.getPageOfResult(listFilterProduct, currentPage, PaginationObject.getNumberOfRowEachPage());
            numberOfPage = pcp.getTotalPageOfResult(listFilterProduct, PaginationObject.getNumberOfRowEachPage());
            req.getSession().setAttribute("currentPage", currentPage);
            req.setAttribute("numberOfPage", numberOfPage);
            //Pull attribute on shop
            req.setAttribute("listFilterProduct", getFilterProduct);
            req.getSession().setAttribute("PriceFilter", price);
            req.getSession().setAttribute("ColorFilter", color);
            req.getSession().setAttribute("StorageFilter", storage);
            req.getSession().setAttribute("filter", "not null");
            req.setAttribute("check", "not empty");

            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(FilterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int price;
            String color;
            int storage;
            //get Price for filter
            price = Integer.parseInt(req.getParameter("txtFilterPrice"));
            //get Color for filter
            color = req.getParameter("txtFilterColor");
            //get Storage for filter
            storage = Integer.parseInt(req.getParameter("txtFilterStorage"));
            int currentPage;
            int numberOfPage;
            String a = req.getParameter("currentPage");
            if ("".equals(a) || a == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(req.getParameter("currentPage"));
            }
            req.getSession().removeAttribute("searching");
            req.getSession().removeAttribute("sortSession");
            //Paging
            List<ProductInfor> listFilterProduct = new ProductDAO().getFilterProduct(price, color, storage);
            List<ProductInfor> getFilterProduct = pcp.getPageOfResult(listFilterProduct, currentPage, PaginationObject.getNumberOfRowEachPage());
            numberOfPage = pcp.getTotalPageOfResult(listFilterProduct, PaginationObject.getNumberOfRowEachPage());
            req.getSession().setAttribute("currentPage", currentPage);
            req.setAttribute("numberOfPage", numberOfPage);
            //Pull attribute on shop
            req.setAttribute("listFilterProduct", getFilterProduct);
            req.getSession().setAttribute("PriceFilter", price);
            req.getSession().setAttribute("ColorFilter", color);
            req.getSession().setAttribute("StorageFilter", storage);
            req.getSession().setAttribute("filter", "not null");
            req.setAttribute("check", "not empty");

            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        }
        catch (NumberFormatException e){
            System.out.println(e.getMessage());
            resp.sendRedirect("shop.jsp");
        }
        catch (SQLException ex) {
            Logger.getLogger(FilterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}