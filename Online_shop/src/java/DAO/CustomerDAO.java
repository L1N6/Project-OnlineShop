/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.Account;
import DAL.Customer;
import DAL.CustomerAccount;
import DAL.DBcontext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author LEGION
 */
public class CustomerDAO extends DBcontext {
    ResultSet rs;
    PreparedStatement ps;
    public CustomerAccount getCustomerInfor(String CusID) throws SQLException {
        CustomerAccount customerAccount = null;
        try {
            String sql = "select * from Customers c, Accounts a where c.CustomerID = a.CustomerID and c.CustomerID = ?;";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, CusID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Email = rs.getString("Email");
                String CompanyName = rs.getString("CompanyName");
                String ContactName = rs.getString("ContactName");
                String ContactTitle = rs.getString("ContactTitle");
                String Address = rs.getString("Address");
                String CustomerID = rs.getString("CustomerID");
                Customer customer = new Customer(CustomerID, CompanyName, ContactName, ContactTitle, Address, rs.getBoolean("Gender"));
                Account acc = new Account(Email);
                customerAccount = new CustomerAccount(acc, customer);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return customerAccount;
    }

    public void updateCustomer(Customer cus) throws SQLException {
        try {
            String sql = "Update Customers set ContactName= ?, CompanyName= ?,ContactTitle= ?,[Address]= ? \n"
                    + "where CustomerID = ? ";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, cus.getContactName());
            ps.setString(2, cus.getCompanyName());
            ps.setString(3, cus.getContactTitle());
            ps.setString(4, cus.getAddress());
            ps.setString(5, cus.getCustomerID());
            ps.executeUpdate();
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
    }

    public ArrayList<CustomerAccount> getCustomerbyCondition(String condition, String cusName) throws SQLException {
        ArrayList<CustomerAccount> list = new ArrayList<>();
        Customer c = new Customer();
        Account ac = new Account();
        CustomerAccount customerAccount = new CustomerAccount();
        try {
            String sql;
            switch (condition) {
                case "searchByCustomerName":
                    sql = "select * from Customers c left join Accounts ac on c.CustomerID = ac.CustomerID where c.ContactName like ?";
                    ps = getConnection().prepareStatement(sql);
                    ps.setString(1, "%" + cusName + "%");
                    break;
                default:
                    sql = "select * from Customers c left join Accounts ac on c.CustomerID = ac.CustomerID ";
                    ps = getConnection().prepareStatement(sql);
                    break;
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                String CustomerID = rs.getString("CustomerID");
                String CompanyName = rs.getString("CompanyName");
                String ContactName = rs.getString("ContactName");
                String ContactTitle = rs.getString("ContactTitle");
                String Address = rs.getString("Address");
                c = new Customer(CustomerID, CompanyName, ContactName, ContactTitle, Address, rs.getBoolean("Gender"));
                String Email = rs.getString("Email");
                ac = new Account(Email);
                customerAccount = new CustomerAccount(ac, c);
                list.add(customerAccount);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

}
