/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.Home.Brands;
import DAL.shop.Product;
import DAL.shop.ProductDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class DetailProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String IDProduct = req.getParameter("productID");
        System.out.println(IDProduct);
        //get product by product name
        Product product = new DAO.ProductDetails().getProductsByProductID(IDProduct);
        //get name product
        String nameProduct = product.getProductName();
        //get smallest price of products
        double price = product.getPrice();
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        String formattedNum = decimalFormat.format(price);
        // get brand id by product and get brand name;
        int brandID = product.getBrandID();
        Brands brand = new DAO.ProductDetails().getBrandThrowBrandID(brandID);
        //get list product detail own picture and color
        ArrayList<ProductDetail> listProductDetail = new DAO.ProductDetails().getListAllAttributeProductThrowID(product.getProductID());
        ArrayList<ProductDetail> listStorage = new DAO.ProductDetails().getListStorageProductThrowID(product.getProductID());
        ArrayList<ProductDetail> listColor = new DAO.ProductDetails().getListColerProductThrowID(product.getProductID());
        //----------------------------------------------------------------------
        req.setAttribute("nameProduct", nameProduct);
        req.setAttribute("product", product);
        req.setAttribute("brandName", brand.getBrandName());
        req.setAttribute("priceProduct", formattedNum);
        req.setAttribute("listColor", listColor);
        req.setAttribute("listStorage", listStorage);
        req.setAttribute("listProductDetail", listProductDetail);
        req.getRequestDispatcher("/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/detail.jsp").forward(req, resp);
    }

}
