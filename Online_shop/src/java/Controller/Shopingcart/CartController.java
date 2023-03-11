/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Shopingcart;

import DAL.Account;
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
        String choice = req.getParameter("type");
        if (choice == null) {
            choice = "showCart";
        }
        try {
            int productDetailID;
            if (req.getParameter("productDetailID") == null) {
                productDetailID = 0;
            } else {
                productDetailID = Integer.parseInt(req.getParameter("productDetailID"));
            }
            String code = req.getParameter("txtCouponCode");
            double CouponCode;
            if (code == null) {
                CouponCode = 0;
            } else {
                CouponCode = 0.1;
            }
            Account acc = (Account) req.getSession().getAttribute("AccSession");
            double totalPrice;
            switch (choice) {
                case "+":
                    totalPrice = 0;
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        if (guestProduct.getProductDetailID() == productDetailID) {
                            guestProduct.setQuantity(guestProduct.getQuantity() + 1);
                            break;
                        }
                    }
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        totalPrice += guestProduct.getPrice() * guestProduct.getQuantity();
                    }
                    req.getSession().setAttribute("GuestProductCart", listGuestProductCart);
                    req.getSession().setAttribute("Subtotal", totalPrice);
                    req.setAttribute("Code", code);
                    req.setAttribute("Discount", CouponCode);
                    req.getRequestDispatcher("cart.jsp").forward(req, resp);
                    break;
                case "-":
                    boolean checkZero = false;
                    totalPrice = 0;
                    int i = 0;
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        if (guestProduct.getProductDetailID() == productDetailID) {
                            if (guestProduct.getQuantity() == 1) {
                                checkZero = true;
                                break;
                            } else {
                                guestProduct.setQuantity(guestProduct.getQuantity() - 1);
                                break;
                            }
                        }
                        i++;
                    }
                    if (checkZero) {
                        listGuestProductCart.remove(i);
                    }
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        totalPrice += guestProduct.getPrice() * guestProduct.getQuantity();
                    }
                    req.getSession().setAttribute("GuestProductCart", listGuestProductCart);
                    req.getSession().setAttribute("Subtotal", totalPrice);
                    req.setAttribute("Code", code);
                    req.setAttribute("Discount", CouponCode);
                    req.getRequestDispatcher("cart.jsp").forward(req, resp);
                    break;
                case "remove":{
                    totalPrice = 0;
                    i = 0;
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        if (guestProduct.getProductDetailID() == productDetailID) {
                            break;
                        }
                        i++;
                    }
                    listGuestProductCart.remove(i);
                    for (GuestProductCart guestProduct : listGuestProductCart) {
                        totalPrice += guestProduct.getPrice() * guestProduct.getQuantity();
                    }
                    req.getSession().setAttribute("GuestProductCart", listGuestProductCart);
                    req.getSession().setAttribute("Subtotal", totalPrice);
                    req.setAttribute("Code", code);
                    req.setAttribute("Discount", CouponCode);
                    req.getRequestDispatcher("cart.jsp").forward(req, resp);
                    break;
                }
                case "buyNow":
                    if (acc == null && productDetailID != 0) {
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
                        req.getSession().setAttribute("GuestProductCart", listGuestProductCart);
                        req.getSession().setAttribute("Subtotal", totalPrice);
                    } else {
                        
                    }
                    req.setAttribute("Code", code);
                    req.setAttribute("Discount", CouponCode);
                    req.getRequestDispatcher("cart.jsp").forward(req, resp);
                    break;
                    
                case "addToCart":
                    int quantity = Integer.parseInt(req.getParameter("txtQuantity"));
                    if (acc == null && productDetailID != 0) {
                        totalPrice = 0;
                        GuestProductCart gProduct = new CartDAO().getGProductCart(productDetailID);
                        boolean exist = false;
                        for (GuestProductCart guestProduct : listGuestProductCart) {
                            if (guestProduct.getProductDetailID() == productDetailID) {
                                if(guestProduct.getQuantity() != 1){
                                    guestProduct.setQuantity(guestProduct.getQuantity() + quantity);
                                }else{
                                    guestProduct.setQuantity(guestProduct.getQuantity() + 1);
                                }
                                exist = true;
                                break;
                            }
                        }
                        if (!exist) {
                            gProduct.setQuantity(quantity);
                            listGuestProductCart.add(gProduct);
                        }
                        for (GuestProductCart guestProduct : listGuestProductCart) {
                            totalPrice += guestProduct.getPrice() * guestProduct.getQuantity();
                        }
                        req.getSession().setAttribute("GuestProductCart", listGuestProductCart);
                        req.getSession().setAttribute("Subtotal", totalPrice);
                    } else {
                        
                    }
                    resp.sendRedirect("detail?productID="+productDetailID+"&?numberQuantity="+quantity+"");
                    break;
                default:
                    req.setAttribute("Code", code);
                    req.setAttribute("Discount", CouponCode);
                    req.getRequestDispatcher("cart.jsp").forward(req, resp);
                    break;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            resp.sendRedirect("Error");
        }

    }

}
