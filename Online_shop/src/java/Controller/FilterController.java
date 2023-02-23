/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.shop.ProductInfor;
import DAO.ProductDAO;
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
public class FilterController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int price;
            String color;
            int storage;
            if(req.getParameter("txtFilterPrice") == null){
                price = 0;
            }else{
                price = Integer.parseInt(req.getParameter("txtFilterPrice"));
            }
            if(req.getParameter("txtFilterColor") == null){
                color = "All";
            }else{
                color = req.getParameter("txtFilterColor");
            }
            if(req.getParameter("txtFilterStorage") == null){
                storage = 0;
            }else{
                storage = Integer.parseInt(req.getParameter("txtFilterStorage"));
            }
            List<ProductInfor> listFilterProduct = new ProductDAO().getFilterProduct(price, color, storage);
            System.out.println(listFilterProduct.size());
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
            try {
                price = Integer.parseInt(req.getParameter("txtFilterPrice"));
                color = req.getParameter("txtFilterColor");
                storage = Integer.parseInt(req.getParameter("txtFilterStorage"));
            } catch (Exception e) {
                price = 0;
                color = "All";
                storage = 0;
            }
            System.out.println(price + " " + color + " " + storage);
            List<ProductInfor> listFilterProduct = new ProductDAO().getFilterProduct(price, color, storage);
            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(FilterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
