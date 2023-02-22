/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.PaginationObject;
import DAL.Product;
import DAL.ProductDetail;
import DAL.ProductInfor;
import DAO.ProductDAO;
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
 * @author LEGION
 */
public class ShopViewController extends HttpServlet {

    private final PaginationObject pcp = new PaginationObject();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String choice = req.getParameter("choice");
            if(choice == null){
                choice += "home";
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
            List<ProductInfor> listProduct = new ProductDAO().getAllProduct();
            switch (choice) {
                case "sort":
                    String condition = req.getParameter("sort");
                    List<ProductInfor> listSortingProduct = new ProductDAO().sortProducts(condition);
                    List<ProductInfor> sortProduct = pcp.getPageOfResult(listSortingProduct, currentPage, PaginationObject.getNumberOfRowEachPage());
                    numberOfPage = pcp.getTotalPageOfResult(listSortingProduct, PaginationObject.getNumberOfRowEachPage());
                    req.getSession().setAttribute("sortSession", "not null");
                    req.getSession().setAttribute("currentPage", currentPage);
                    req.setAttribute("sortCondition", condition);
                    req.setAttribute("numberOfPage", numberOfPage);
                    req.setAttribute("shopListProduct", sortProduct);
                    break;
                default: {
                        List<ProductInfor> getProduct = pcp.getPageOfResult(listProduct, currentPage, PaginationObject.getNumberOfRowEachPage());
                        numberOfPage = pcp.getTotalPageOfResult(listProduct, PaginationObject.getNumberOfRowEachPage());
                        req.getSession().setAttribute("currentPage", currentPage);
                        req.setAttribute("numberOfPage", numberOfPage);
                        req.setAttribute("shopListProduct", getProduct);
                        break;
                        }
            }
            List<ProductDetail> getColor = new ProductDAO().getAllColor();
            System.out.println(listProduct.size());
            req.getSession().setAttribute("totalListProduct", listProduct.size());
            req.getSession().setAttribute("listColor", getColor);
            req.setAttribute("check","not empty");
            req.getRequestDispatcher("shop.jsp").forward(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ShopViewController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
