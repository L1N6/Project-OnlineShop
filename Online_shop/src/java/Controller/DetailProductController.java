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
import java.text.DecimalFormat;
import java.util.ArrayList;

public class DetailProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String IDProduct = req.getParameter("productID");

        if (IDProduct == null) {
            resp.sendRedirect("index.jsp");
        } else {
            //get product by product name
            ProductDetail product = new DAO.ProductDetails().getProductDetail(IDProduct);
            //get name product & storage
            String nameProduct = product.getProductName();
            int storageProduct = product.getProductStorage();
            //get smallest price of products
            double price = product.getUnitPrice();
            DecimalFormat decimalFormat = new DecimalFormat("0.0");
            String formattedNum = decimalFormat.format(price);
            String formattedNumDisCount = decimalFormat.format(price - 0.15*price);
            // get brand id by product and get brand name;
            int idProduct = product.getProductID();
            Brands brand = new DAO.ProductDetails().getBrandThrowBrandID(idProduct);
            //get list product detail own picture and color
            ArrayList<ProductDetail> listProductDetail = new DAO.ProductDetails().
                    getListAllAttributeProductThrowID(product.getProductID());
            ArrayList<ProductDetail> listStorage = new DAO.ProductDetails().getListStorageProductThrowID(product.getProductID());
            ArrayList<ProductDetail> listColor = new DAO.ProductDetails().getListColerProductThrowID(product.getProductID());
            //----------------------------------------------------------------------
            req.setAttribute("check", "not empty check");
            req.setAttribute("nameProduct", nameProduct);
            req.setAttribute("product", product);
            req.setAttribute("brandName", brand.getBrandName());
            req.setAttribute("storageProduct", storageProduct);
            req.setAttribute("priceProduct", formattedNum);
            req.setAttribute("priceProductDisCount", formattedNumDisCount);
            req.setAttribute("listColor", listColor);
            req.setAttribute("listStorage", listStorage);
            req.setAttribute("listProductDetail", listProductDetail);
            req.setAttribute("ID", IDProduct);
            System.out.println(req.getParameter("numberQuantity"));
            if(req.getParameter("numberQuantity") == null){
                req.setAttribute("Quanity", 1);
            }else{
                req.setAttribute("Quanity", req.getParameter("numberQuantity"));
            }
            
            req.getRequestDispatcher("detail.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
