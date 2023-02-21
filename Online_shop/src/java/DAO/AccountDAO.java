package DAO;

import DAL.Account;
import DAL.Customer;
import DAL.DBcontext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO extends DBcontext {
    ResultSet rs;
    PreparedStatement ps;
    public Account getAccount(String email, String pass) throws SQLException {
        Account acc = null;
        try {
            String sql = "select * from Accounts where Email = ? and Password = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Email = rs.getString("Email");
                String Password = rs.getString("Password");
                String CusID = rs.getString("CustomerID");
                int role = rs.getInt("Role");
                String EmpID = rs.getString("EmployeeID");
                acc = new Account(Email, Password, CusID, role,EmpID);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return acc;
    }


    public int addAccount(Customer customer, Account acc) throws SQLException {
        int result1 = 0, result2 = 0;
        try {
            String sql1 = "insert into Customers(CustomerID, CompanyName, ContactName, ContactTitle, Address) values(?,?,?,?,?)";
            String sql2 = "insert into Accounts(Email,Password,CustomerID,EmployeeID,Role) values(?,?,?,?,2)";
            boolean fl = true;
            if(acc.getEmployeeID() == null ){
                sql2 =  "insert into Accounts(Email,Password,CustomerID,EmployeeID,Role) values(?,?,?,NULL,2)";
                fl=false;
            }
            
            PreparedStatement ps1 = getConnection().prepareStatement(sql1);
            PreparedStatement ps2 = getConnection().prepareStatement(sql2);
            ps1.setString(1, customer.getCustomerID());
            ps1.setString(2, customer.getCompanyName()==null?"Null":customer.getCompanyName());
            ps1.setString(3, customer.getContactName()==null?"NULL":customer.getContactName());
            ps1.setString(4, customer.getContactTitle()==null?"NULL":customer.getContactTitle());
            ps1.setString(5, customer.getAddress());
            ps2.setString(1, acc.getEmail());
            ps2.setString(2, acc.getPass());
            ps2.setString(3, customer.getCustomerID());   
            if(fl)
                ps2.setInt(4, Integer.parseInt(acc.getEmployeeID()));  
            result1 = ps1.executeUpdate();
            result2 = ps2.executeUpdate();
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        if(result1 > 0 && result2 > 0){
            return 1;
        }else{
            return 0;
        }
    }
    
    public void changedPassword(String email, String newPassword) throws SQLException{
        try {
            String sql = "Update Accounts Set Password = ? where Email = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
    }
    
    public Account checkAccount(String email) throws SQLException{
        Account acc = null;
        try {
            String sql = "select * from Accounts where Email = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) {
                String Email = rs.getString("Email");
                String Password = rs.getString("Password");
                String CusID = rs.getString("CustomerID");
                int role = rs.getInt("Role");
                String EmpID = rs.getString("EmployeeID");
                acc = new Account(Email, Password, CusID, role,EmpID);
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return acc;
    }
    
    
    

}
