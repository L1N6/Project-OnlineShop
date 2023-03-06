/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Admin;

import Controller.Home.HomeController;
import DAL.Home.BrandAndQuantity;
import DAL.Home.Brands;
import DAL.Home.Event;
import DAL.Home.ProductDiscountUnitOnOrder;
import DAO.Home.BrandDAO;
import DAO.Home.EventDAO;
import DAO.Home.ProductDAO1;
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
import org.apache.coyote.http11.Http11AprProtocol;

/**
 *
 * @author blabl
 */
public class LoginAdmin extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        
    }
    
}
