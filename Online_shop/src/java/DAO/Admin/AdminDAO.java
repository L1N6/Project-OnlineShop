/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Admin;

import DAL.Admin.AccountComment;
import DAL.Admin.Event;
import DAL.DBcontext;
import DAL.Admin.Product;
import DAL.Admin.ProductDetails;
import DAL.Admin.AccountCustomer;
import DAL.Admin.CustomerOrder;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.Date;

/**
 *
 * @author blabl
 */
public class AdminDAO extends DBcontext {

    ResultSet rs;
    PreparedStatement ps;

    public ArrayList<Product> getProduct() throws SQLException {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Date date = java.util.Calendar.getInstance().getTime();
            String sql = "select c.Price,g.BrandName, c.ProductID,c.ProductName,e.UnitsInStock,e.UnitsOnOrder,c.Picture,b.Discount,d.Rate,d.AmountRate,a.EventName,a.StartEvent,a.EndEvent from [Events] as a inner join Discounts \n"
                    + "                     as b on a.EventID=b.EventID right join Products as c on b.ProductID=c.ProductID\n"
                    + "                    left join (SELECT ProductID,AVG(Rate) as Rate,Count(Rate) as AmountRate FROM Comments GROUP BY ProductID) as d \n"
                    + "                    on c.ProductID = d.ProductID\n"
                    + "                    left join(select ProductID,SUM(UnitsInStock) as UnitsInStock , SUM(UnitsOnOrder) as UnitsOnOrder from ProductDetails group by ProductID) as e\n"
                    + "                    on c.ProductID = e.ProductID\n"
                    + "                    inner join Brands as g On c.BrandID = g.BrandID";

            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Product product = new Product();

                if (rs.getFloat("Discount") == 0) {
                    int productID = rs.getInt("ProductID");
                    String productName = rs.getString("ProductName");
                    String picture = rs.getString("Picture");
                    float price = rs.getFloat("Price");
                    int rate = rs.getInt("Rate");
                    int amountRate = rs.getInt("AmountRate");
                    int unitInStock = rs.getInt("UnitsInStock");
                    int unitOnOrder = rs.getInt("UnitsOnOrder");
                    String brandName = rs.getString("BrandName");
                    String EventName = rs.getString("EventName");
                    product = new Product(productID, productName, unitInStock, unitOnOrder, brandName);
                    list.add(product);

                } else {
                    Date dateS = rs.getDate("StartEvent");
                    Date dateE = rs.getDate("EndEvent");

                    if (dateS.before(date) && date.before(dateE)) {
                        int productID = rs.getInt("ProductID");
                        String productName = rs.getString("ProductName");
                        String picture = rs.getString("Picture");
                        float discount = rs.getFloat("Discount");
                        float price = rs.getFloat("Price");
                        int rate = rs.getInt("Rate");
                        int amountRate = rs.getInt("AmountRate");
                        int unitInStock = rs.getInt("UnitsInStock");
                        int unitOnOrder = rs.getInt("UnitsOnOrder");
                        String brandName = rs.getString("BrandName");
                        String EventName = rs.getString("EventName");
                        product = new Product(productID, productName, unitInStock, unitOnOrder, brandName);
                        list.add(product);

                    }
                }
            }
        } catch (SQLException e) {
            getConnection().rollback();
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public Product getProductByProductID(String id) {
        Product product = new Product();
        try {

            String sql = "select c.BrandID,c.PhoneScreen,c.OperatingSystem,c.Ram,c.Chip,c.Price,g.BrandName, c.ProductID,c.ProductName,e.UnitsInStock,e.UnitsOnOrder,c.Picture,d.Rate,d.AmountRate from  Products as c\n"
                    + "                                     left join (SELECT ProductID,AVG(Rate) as Rate,Count(Rate) as AmountRate FROM Comments GROUP BY ProductID) as d \n"
                    + "                                       on c.ProductID = d.ProductID\n"
                    + "                                       left join(select ProductID,SUM(UnitsInStock) as UnitsInStock , SUM(UnitsOnOrder) as UnitsOnOrder from ProductDetails group by ProductID) as e\n"
                    + "                                        on c.ProductID = e.ProductID\n"
                    + "                                       inner join Brands as g On c.BrandID = g.BrandID where c.ProductID = ?";

            ps = getConnection().prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String picture = rs.getString("Picture");
                float price = rs.getFloat("Price");
                int rate = rs.getInt("Rate");
                int amountRate = rs.getInt("AmountRate");
                String chip = rs.getString("Chip");
                String phoneScreen = rs.getString("phoneScreen");
                String pin = rs.getString("pin");
                int ram = rs.getInt("ram");
                int brandID = rs.getInt("brandID");
                int unitInStock = rs.getInt("UnitsInStock");
                int unitOnOrder = rs.getInt("UnitsOnOrder");
                String brandName = rs.getString("BrandName");
                product = new Product(productID, productName, brandID, chip, ram, pin, phoneScreen, picture, unitInStock, unitOnOrder, price, rate, amountRate, brandName);
                return product;
            }

        } catch (SQLException e) {
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return product;
    }

    public ArrayList<ProductDetails> getProductDetailById(String id) {
        ArrayList<ProductDetails> list = new ArrayList<>();
        ProductDetails product = new ProductDetails();
        try {

            String sql = "select * from ProductDetails where ProductID = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                int productDetailID = rs.getInt("productDetailID");
                int productID = rs.getInt("productID");
                int productStorage = rs.getInt("productStorage");
                float price = rs.getFloat("Unitprice");
                String picture = rs.getString("Picture");
                String coler = rs.getString("coler");
                int unitInStock = rs.getInt("UnitsInStock");
                int unitOnOrder = rs.getInt("UnitsOnOrder");
                product = new ProductDetails(productDetailID, productID, productStorage, price, picture, coler, unitInStock, unitOnOrder);
                list.add(product);

            }

        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public ArrayList<Event> getEventById(String id) {
        ArrayList<Event> list = new ArrayList<>();
        Event event = new Event();
        try {
            String sql = "select * from Events as a inner join Discounts as b on a.EventID=b.EventID where ProductID = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {

                String eventID = rs.getString("EventID");
                String eventName = rs.getString("EventName");
                String picture = rs.getString("picture");
                Date startEvent = rs.getDate("startEvent");
                Date endEvent = rs.getDate("endEvent");
                float discount = rs.getFloat("discount");
                int discountID = rs.getInt("discountID");
                event = new Event(eventID, eventName, picture, startEvent, endEvent, discount, discountID);
                list.add(event);

            }

        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public ArrayList<AccountCustomer> getAccountCustomer() {
        ArrayList<AccountCustomer> list = new ArrayList<>();
        AccountCustomer acc = new AccountCustomer();
        try {

            String sql = "select * from Accounts inner join Customers on Accounts.CustomerID = Customers.CustomerID";
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int accountID = rs.getInt("accountID");
                String email = rs.getString("email");
                String companyName = rs.getString("companyName");
                String contactName = rs.getString("contactName");
                String contactTitle = rs.getString("contactTitle");
                String address = rs.getString("address");
                int status = rs.getInt("status");
                int gender = rs.getInt("gender");
                acc = new AccountCustomer(accountID, email, companyName, contactName, contactTitle, address, status, gender);
                list.add(acc);

            }

        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public void changeStatusCustomer(String id, String status, String sql) {

        try {
            ps = getConnection().prepareStatement(sql);
            System.out.println(status);
            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }

    }

    public ArrayList<AccountComment> getAccountComment() {
        ArrayList<AccountComment> list = new ArrayList<>();
        AccountComment acc = new AccountComment();
        try {

            String sql = "Select a.*,b.Email,c.ProductID,c.ProductName from Comments as a inner join Accounts as b on a.AccountID = b.AccountID\n"
                    + "inner join Products as c on a.ProductID = c.ProductID";
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                int accountID = rs.getInt("accountID");
                String email = rs.getString("email");
                int commentID = rs.getInt("commentID");
                int status = rs.getInt("status");

                int ProductID = rs.getInt("ProductID");
                String productName = rs.getString("productName");
                int rate = rs.getInt("rate");
                Date date = rs.getDate("time");
                String description = rs.getString("description");
                String picture = rs.getString("picture");
                acc = new AccountComment(accountID, email, commentID, status, ProductID, productName, rate, date, description, picture);
                list.add(acc);

            }

        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public ArrayList<CustomerOrder> getCustomerOrder() {
        ArrayList<CustomerOrder> list = new ArrayList<>();
        CustomerOrder acc = new CustomerOrder();
        try {

            String sql = "select * from Orders as a inner join Customers  as b on a.CustomerID = b.CustomerID";
            ps = getConnection().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                String customerID = rs.getString("customerID");
                int orderID = rs.getInt("orderID");
                String contactName = rs.getString("contactName");
                Date requiredDate = rs.getDate("requiredDate");
                Date shippedDate = rs.getDate("shippedDate");
                Date orderDate = rs.getDate("orderDate");
                String shipAddress = rs.getString("shipAddress");
                int status = rs.getInt("status");

                acc = new CustomerOrder(customerID, orderID, contactName, requiredDate, shippedDate, orderDate, shipAddress, status);
                list.add(acc);

            }

        } catch (SQLException e) {

        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }
        return list;
    }

    public void manageOrder(String orderID, String EmployeeID, String status) {
        System.err.println("fdsafasd");
        String pattern = "yyyy/MM/dd HH:mm:ss";

        DateFormat df = new SimpleDateFormat(pattern);

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 7);

        Date today = Calendar.getInstance().getTime();
        Date required = calendar.getTime();

        String todayAsString = df.format(today);
        String requiredString = df.format(required);

        
        try {
            String sql = "";
           
            if (status.equals("1")) {
                sql = "update Orders Set RequiredDate = CAST( ? AS DateTime),Status = ?  where orderID = ?";
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, requiredString);
                ps.setString(2, status);
                ps.setString(3, orderID);
                ps.executeUpdate();
               
                sql = "INSERT [dbo].[OrderHistory] ( [EmployeeID], [Description], [Time], [OrderID])"
                        + " VALUES ( ?, ?, CAST(? AS DateTime), ?)";
                PreparedStatement ps1 = getConnection().prepareStatement(sql);
                ps1.setString(1, EmployeeID);
                ps1.setString(2, "Accepted");
                ps1.setString(3, todayAsString);
                ps1.setString(4, orderID);
                ps1.executeUpdate();
               
            } else if (status.equals("2")) {
                sql = "update Orders Set Status = ?  where orderID = ?";
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, status);
                ps.setString(2, orderID);
                ps.executeUpdate();
                sql = "INSERT [dbo].[OrderHistory] ( [EmployeeID], [Description], [Time], [OrderID])"
                        + " VALUES ( ?, ?, CAST(? AS DateTime), ?)";
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, EmployeeID);
                ps.setString(2, "Cancelled");
                ps.setString(3, todayAsString);
                ps.setString(4, orderID);
                ps.executeUpdate();
                
            } else if (status.equals("0")){
               sql = "update Orders Set RequiredDate = null,Status = ?  where orderID = ?";
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, status);
                ps.setString(2, orderID);
                ps.executeUpdate();
                sql = "INSERT [dbo].[OrderHistory] ( [EmployeeID], [Description], [Time], [OrderID])"
                        + " VALUES ( ?, ?, CAST(? AS DateTime), ?)";
                
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, EmployeeID);
                ps.setString(2, "Pending");
                ps.setString(3, todayAsString);
                ps.setString(4, orderID);
                ps.executeUpdate();
            }


        } catch (SQLException e) {
        } finally {
            DBcontext.releaseJBDCObject(rs, ps, getConnection());
        }

    }
    public static void main(String[] args) {
        new AdminDAO().manageOrder("1","5","2");
        
    }

}
