/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.shop.ProductDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class AjaxController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Use Ajax for product Storage;
        //1. Get all attribute of a product has storage and id

        String productIDAjax = req.getParameter("productID");
        String storageProductAjax = req.getParameter("productStorage");
        String colorProductAjax = req.getParameter("productColor");
        String paramCheck = req.getParameter("paramCheck");
        if ("storage".equals(paramCheck)) {
            System.out.println("storage: " + storageProductAjax);
            System.out.println("productID: " + productIDAjax);
            ProductDetail productDetail
                    = new DAO.ProductDetails().getProductDetailByIDAndStorage(productIDAjax, storageProductAjax);
            //Get price product and format
            System.out.println(productDetail.getUnitPrice());
            DecimalFormat decimalFormat = new DecimalFormat("0.0");
            String formattedNum = decimalFormat.format(productDetail.getUnitPrice());
            // discount price
            String formattedDiscount = decimalFormat.format(productDetail.getUnitPrice() * 0.85);
            //get product name
            String nameProduct = productDetail.getProductName();
            // Check input Storage 
            String formattedStorage = "";
            if ("1000".equals(storageProductAjax)) {
                formattedStorage = "1TB";
            } else {
                formattedStorage = storageProductAjax + "GB";
            }
            PrintWriter out = resp.getWriter();

            out.print("<h3>" + nameProduct + "\n"
                    + "                        <c:if test=\"${" + storageProductAjax + " != 1000}\"> " + formattedStorage + "</c:if>                   \n"
                    + "                        </h3>\n"
                    + "                    <div class=\"d-flex mb-3\">\n"
                    + "                        <div class=\"text-primary mr-2\">\n"
                    + "                            <small class=\"fas fa-star\"></small>\n"
                    + "                            <small class=\"fas fa-star\"></small>\n"
                    + "                            <small class=\"fas fa-star\"></small>\n"
                    + "                            <small class=\"fas fa-star-half-alt\"></small>\n"
                    + "                            <small class=\"far fa-star\"></small>\n"
                    + "                        </div>\n"
                    + "                        <small class=\"pt-1\">(99 Reviews)</small>\n"
                    + "                    </div>\n"
                    + "                    <div  class=\"d-flex mt-2\">\n"
                    + "                        <h3  class=\"font-weight-semi-bold mb-4\" style=\"align-items: flex-start\">$" + formattedDiscount + "\n"
                    + "                        <h5 class=\"text-muted ml-2\"><del>$" + formattedNum + "</del></h5>\n"
                    + "                    </h3>");
        }
        if ("color".equals(paramCheck)) {
            System.out.println("color: " + paramCheck);
            System.out.println("color mau: " + colorProductAjax);
            System.out.println("id " + productIDAjax);
            ProductDetail pdt = new DAO.ProductDetails().getListPictureByIDAndColor(productIDAjax, colorProductAjax);
            PrintWriter out = resp.getWriter();
            out.print("<img class=\"w-100 h-100\" style=\"width: 120%; height: 120%; object-fit: contain\" src=\"img/"+pdt.getPicture()+"\" alt=\"Image\">");
        }

    }

}
