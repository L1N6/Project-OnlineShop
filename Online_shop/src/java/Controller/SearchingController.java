    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.PaginationObject;
import DAL.Product;
import DAO.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author LEGION
 */
public class SearchingController extends HttpServlet {
private final PaginationObject pcp = new PaginationObject();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String searchingInf = req.getParameter("txt");
        List<Product> searchingList = new ProductDAO().searchProducts(searchingInf);
        int currentPage;
            String a = req.getParameter("currentPage");
            if ("".equals(a) || a == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(req.getParameter("currentPage"));
            }
        int numberOfPage;
        List<Product> getProduct = pcp.getPageOfResult(searchingList, currentPage, PaginationObject.getNumberOfRowEachPage());
        numberOfPage = pcp.getTotalPageOfResult(searchingList, PaginationObject.getNumberOfRowEachPage());
        req.getSession().setAttribute("currentPage", currentPage);
        req.setAttribute("numberOfPage", numberOfPage);
        req.setAttribute("shopListProduct", getProduct);
        req.setAttribute("txtValue", searchingInf);
        req.getRequestDispatcher("shop.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        String searchingInf = req.getParameter("txt");
//        List<Product> searchingList = new ProductDAO().searchProducts(searchingInf);
//        System.out.println(searchingList.size() + searchingInf);
//        for (Product p : searchingList) {
//            resp.getWriter().println("<div class=\"product-item bg-light mb-4\">\n" +
//"                            <div class=\"product-img position-relative overflow-hidden\">\n" +
//"                                <img class=\"img-fluid w-100\" src=\"img/"+p.getPicture()+"\" alt=\"\">\n" +
//"                                <div class=\"product-action\">\n" +
//"                                    <a class=\"btn btn-outline-dark btn-square\" href=\"<c:url value=\"/detail.jsp\"/>\"><i class=\"fa fa-shopping-cart\"></i></a>\n" +
//"                                    <a class=\"btn btn-outline-dark btn-square\" href=\"\"><i class=\"far fa-heart\"></i></a>\n" +
//"                                    <a class=\"btn btn-outline-dark btn-square\" href=\"\"><i class=\"fa fa-sync-alt\"></i></a>\n" +
//"                                    <a class=\"btn btn-outline-dark btn-square\" href=\"\"><i class=\"fa fa-search\"></i></a>\n" +
//"                                </div>\n" +
//"                            </div>\n" +
//"                            <div class=\"text-center py-4\">\n" +
//"                                <a class=\"h6 text-decoration-none text-truncate\" href=\"\">"+p.getProductName()+"</a>\n" +
//"                                <div class=\"d-flex align-items-center justify-content-center mt-2\">\n" +
//"                                    <h5>$123.00</h5><h6 class=\"text-muted ml-2\"><del>$123.00</del></h6>\n" +
//"                                </div>\n" +
//"                                <div class=\"d-flex align-items-center justify-content-center mb-1\">\n" +
//"                                    <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
//"                                    <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
//"                                    <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
//"                                    <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
//"                                    <small class=\"fa fa-star text-primary mr-1\"></small>\n" +
//"                                    <small>(99)</small>\n" +
//"                                </div>\n" +
//"                            </div>\n" +
//"                        </div>");
//        }
//        int currentPage;
//            String a = req.getParameter("currentPage");
//            if ("".equals(a) || a == null) {
//                currentPage = 1;
//            } else {
//                currentPage = Integer.parseInt(req.getParameter("currentPage"));
//            }
//        int numberOfPage;
//        List<Product> getProduct = pcp.getPageOfResult(searchingList, currentPage, PaginationObject.getNumberOfRowEachPage());
//        numberOfPage = pcp.getTotalPageOfResult(searchingList, PaginationObject.getNumberOfRowEachPage());
//        req.getSession().setAttribute("currentPage", currentPage);
//        req.setAttribute("numberOfPage", numberOfPage);
//        req.setAttribute("shopListProduct", getProduct);
//        req.setAttribute("txtValue", searchingInf);
//        req.getRequestDispatcher("shop.jsp").forward(req, resp);
    }
    
}
