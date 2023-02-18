/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.BrandAndQuantity;
import DAL.DBcontext;
import DAL.Event;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author blabl
 */
public class EventDAO extends DBcontext{
    public ArrayList<Event> getEvents() {
        ArrayList<Event> list = new ArrayList<>();
        try {
            
            Date date = java.util.Calendar.getInstance().getTime();
            String sql = "select * from [Events]";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Date dateS = rs.getDate("StartEvent");
                Date dateE = rs.getDate("EndEvent");
                if (dateS.before(date) && date.before(dateE)) {
                    int SaleID = rs.getInt("EventID");
                    String NameSale = rs.getString("EventName");
                    String picture= rs.getString("Picture");
                    Date StartSale = rs.getDate("StartEvent");
                    Date EndSale = rs.getDate("EndEvent");
                    list.add(new Event(sql, NameSale, picture, StartSale, EndSale));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args){
        ArrayList<Event> brandList = new EventDAO().getEvents();
        for (Event event : brandList) {
            System.out.println("d");
        }
        
    }
}