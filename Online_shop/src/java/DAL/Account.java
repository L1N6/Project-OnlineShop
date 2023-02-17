/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author LEGION
 */
public class Account {
    private String Email;
    private String Pass;  
    private String CustomerID;
    private String EmployeeID;
    private int Role;

    public Account() {
    }
    
    public Account(String Email) {
        this.Email = Email;
    }

    public Account(String Email, String Pass, String CustomerID,String EmployeeID) {
        this.Email = Email;
        this.Pass = Pass;
        this.CustomerID = CustomerID;
        this.EmployeeID = EmployeeID;
    }

    public Account(String Email, String Pass, String CustomerID, int Role,String EmployeeID) {
        this.Email = Email;
        this.Pass = Pass;
        this.CustomerID = CustomerID;
        this.Role = Role;        
        this.EmployeeID = EmployeeID;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }
    
    public void setEmployeeID(String EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    @Override
    public String toString() {
        return "Account{" + "Email=" + Email + ", Pass=" + Pass + ", CustomerID=" + CustomerID + '}';
    }

    /**
     * @return the EmployeeID
     */
    public String getEmployeeID() {
        return EmployeeID;
    }

    
   
}
