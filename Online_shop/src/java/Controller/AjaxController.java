/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.ProductDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

/**
 *
 * @author acer
 */
public class AjaxController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Use Ajax for product Storage;
        //1. Get all attribute of a product has storage and id
        String storageValue = req.getParameter("productStorage");
        String productIDAjax = req.getParameter("productID");
        ProductDetail productDetail = 
                new DAO.ProductDetails().getProductDetailByIDAndStorage(productIDAjax, storageValue);
        System.out.println(productDetail.getUnitPrice());
         DecimalFormat decimalFormat = new DecimalFormat("0.0");
        String formattedNum = decimalFormat.format(productDetail.getUnitPrice());
        PrintWriter out = resp.getWriter();
        out.print("<h3 id=\"unitPrice\" class=\"font-weight-semi-bold mb-4\">$"+formattedNum+"</h3>");
    }
    
}
