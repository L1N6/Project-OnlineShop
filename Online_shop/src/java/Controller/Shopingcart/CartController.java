/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Shopingcart;

import DAL.cart.GuestProductCart;
import DAO.cart.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jdk.nashorn.internal.ir.BreakNode;

/**
 *
 * @author LEGION
 */
public class CartController extends HttpServlet {

    List<GuestProductCart> listGuestProductCart = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productDetailID = Integer.parseInt(req.getParameter("productDetailID"));
        System.out.println(req.getSession().getAttribute("AccSession"));
        try {
            System.out.println(productDetailID);
            int totalPrice;
            if(req.getSession().getAttribute("AccSession") == null) {
                totalPrice = 0;
                GuestProductCart gProduct = new CartDAO().getGProductCart(productDetailID);
                boolean exist = false;
                for (GuestProductCart guestProduct : listGuestProductCart) {
                    if (guestProduct.getProductDetailID() == productDetailID) {
                        guestProduct.setQuantity(guestProduct.getQuantity() + 1);
                        exist = true;
                        break;
                    }
                }
                if (!exist) {
                    gProduct.setQuantity(1);
                    listGuestProductCart.add(gProduct);
                }
                for (GuestProductCart guestProduct : listGuestProductCart) {
                    totalPrice += guestProduct.getPrice() * guestProduct.getQuantity();
                }
                
                
            } else {

            }
            System.out.println(listGuestProductCart.size());
        } catch (Exception e) {
        }
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

}
