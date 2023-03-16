/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.Account;
import DAL.Home.Brands;
import DAL.shop.Comments;
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
        String productIDAjax = req.getParameter("productID");
        String storageProductAjax = req.getParameter("productStorage");
        String colorProductAjax = req.getParameter("productColor");
        String paramCheck = req.getParameter("paramCheck");
        if (IDProduct == null || productIDAjax == null) {
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
            String formattedNumDisCount = decimalFormat.format(price - 0.15 * price);
            // get brand id by product and get brand name;
            int idProduct = product.getProductID();
            Brands brand = new DAO.ProductDetails().getBrandThrowBrandID(idProduct);
            //get list product detail own picture and color
            ArrayList<ProductDetail> listProductDetail = new DAO.ProductDetails().
                    getListAllAttributeProductThrowID(product.getProductID());
            ArrayList<ProductDetail> listStorage = new DAO.ProductDetails().getListStorageProductThrowID(product.getProductDetail());
            ArrayList<ProductDetail> listColor = new DAO.ProductDetails().getListColerProductThrowID(product.getProductDetail());
            ProductDetail spec = new DAO.ProductDetails().getSpecifiByIDAndStorage(IDProduct, storageProduct);

            //----------------------------------------------------------------------------------
            //RATING - PRICE BY STORAGE
            if ("storage".equals(paramCheck)) {
                ProductDetail productDetail
                        = new DAO.ProductDetails().getProductDetailByIDAndStorage(productIDAjax, storageProductAjax);
                //Get price product and format
                String formattedNum1 = decimalFormat.format(productDetail.getUnitPrice());
                // discount price
                String formattedNumDisCount1 = decimalFormat.format(productDetail.getUnitPrice() * 0.85);
                //get product name
                nameProduct = productDetail.getProductName();
                // Check input Storage 
                String formattedStorage = "";
                if ("1000".equals(storageProductAjax)) {
                    formattedStorage = "1TB";
                } else {
                    formattedStorage = storageProductAjax + "GB";
                }
                req.setAttribute("formattedNumNew", formattedNum1);
                req.setAttribute("formattedNumDisCountNew", formattedNumDisCount1);

            } else if ("color".equals(paramCheck)) {
                ArrayList<ProductDetail> pdt = new DAO.ProductDetails().getListPictureByIDAndColor(productIDAjax, colorProductAjax);
                System.out.println(pdt.size());
                req.setAttribute("pdt", pdt);
            } else {
                formattedNum = decimalFormat.format(price);
                formattedNumDisCount = decimalFormat.format(price - 0.15 * price);
            }
            //------------------------------------------------------------------
            ArrayList<ProductDetail> mayAlsoYouLike = new DAO.ProductDetails().mayAlsoYouLike(Integer.parseInt(IDProduct));
            Comments rateProduct = new DAO.ProductDetails().getRateByProductID(Integer.parseInt(IDProduct));
            //------------------------------------------------------------------
            //REVIEW PART
            String review = req.getParameter("review");
            System.out.println("review: " + review);
            boolean onclickSubmit = false;
            if ("review".equals(review)) {
                onclickSubmit = true;
            }
            System.out.println("onclickSubmit: " + onclickSubmit);
            if (onclickSubmit == true) {
                String message = req.getParameter("message");
                String name = req.getParameter("name");
                String number = req.getParameter("number");
                Account accSession = (Account) req.getSession().getAttribute("AccSession");
                if (accSession == null) {
                    req.getRequestDispatcher("signIn.jsp").forward(req, resp);
                }
                if (message == null || message.isEmpty()) {
                    req.setAttribute("messageError", "Please enter a message.");
                }
                if (name == null || name.isEmpty()) {
                    req.setAttribute("nameError", "Please enter your name.");
                }
                // Set attribute values for error messages
                req.setAttribute("message", message);
                req.setAttribute("name", name);

            }
            System.out.println("ALO ALO1: ");
            //------------------------------------------------------------------
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
            req.setAttribute("spec", spec);
            req.setAttribute("mayAlsoYouLike", mayAlsoYouLike);
            req.setAttribute("rateProduct", rateProduct);
            req.getRequestDispatcher("/detail.jsp").forward(req, resp);
            //----------------------------------------------------------------------
        }
    }

}
