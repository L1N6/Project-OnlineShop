/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.cart;

import DAL.DBcontext;
import DAL.cart.GuestProductCart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LEGION
 */
public class CartDAO extends DBcontext {

    ResultSet rs;
    PreparedStatement ps;

    public GuestProductCart getGProductCart(int ProductDetailID) throws SQLException {
        GuestProductCart gProduct = new GuestProductCart();
        try {
            String sql = "select pd.ProductDetailID, pd.ProductID, p.ProductName, pd.Picture, pd.UnitPrice, pd.Coler \n"
                    + "from Products p inner join ProductDetails pd  \n"
                    + "on  p.ProductID = pd.ProductID and pd.ProductDetailID = ?";
            ps = getConnection().prepareCall(sql);
            ps.setInt(1, ProductDetailID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Color = rs.getString("Coler");
                String ProductName = rs.getString("ProductName");
                String Picture = rs.getString("Picture");
                int productDetailID = rs.getInt("ProductDetailID");
                Double Price = rs.getDouble("UnitPrice");
                gProduct = new GuestProductCart(productDetailID, ProductName, Price, Picture, Color);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return gProduct;
    }
}
