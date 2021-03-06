/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import wrappers.Room;

/**
 * @author Anirudh
 */

public class RoomManager {

    private final JdbcTemplate TEMP;
    private final String INSERT;
    private final String GET;
    private final String COUNT;
    private final String UPDATE;
    private final String DELETE;
    private final String SELECT_ALL;
    
    public RoomManager(DataSource dataSource) {
        TEMP = new JdbcTemplate(dataSource);
        GET = "SELECT * FROM ROOMS WHERE ROOM_NUMBER =";
        INSERT = "INSERT INTO ROOMS(ROOM_NUMBER, PACKAGE_ID, GUESTS, FRIDGE, TV, WIFI, PRICE) VALUES (?,?,?,?,?,?,?)";
        COUNT = "SELECT MAX(ROOM_NUMBER) FROM ROOMS";
        UPDATE = "UPDATE ROOMS SET PACKAGE_ID=?,GUESTS=?,FRIDGE=?,TV=?,WIFI=?,PRICE=? WHERE ROOM_NUMBER=?";
        DELETE = "DELETE FROM ROOMS WHERE ROOM_NUMBER = ?";
        SELECT_ALL = "SELECT * FROM ROOMS";
    }

    public List<Room> list() {
        List<Room> list = TEMP.query(this.SELECT_ALL, new RowMapper<Room>() {
            @Override
            public Room mapRow(ResultSet rs, int rowNum) throws SQLException {
                Room r = new Room();
                r.setGuests(rs.getInt("GUESTS"));
                r.setFridge(rs.getBoolean("FRIDGE"));
                r.setTV(rs.getBoolean("TV"));
                r.setWiFi(rs.getBoolean("WIFI"));
                r.setPackageID(rs.getInt("PACKAGE_ID"));
                r.setPackageID(rs.getInt("PACKAGE_ID"));
                r.setPrice(rs.getDouble("PRICE"));
                r.setRoomNumber(rs.getInt("ROOM_NUMBER"));
                return r;
            }
        });
        return list;
    }
    
    public Boolean delete(int roomNumber) {
        try
        {
            return TEMP.update(this.DELETE, roomNumber) == 1;
        }
        catch(DataAccessException ex)
        {
            return false;
        }
    }
    
    public Room get(Object id) {
        String query = this.GET + id;
        return TEMP.query(query, (ResultSet rs) -> {
            if (rs.next()) {
                Room r = new Room();
                r.setGuests(rs.getInt("GUESTS"));
                r.setFridge(rs.getBoolean("FRIDGE"));
                r.setTV(rs.getBoolean("TV"));
                r.setWiFi(rs.getBoolean("WIFI"));
                r.setPackageID(rs.getInt("PACKAGE_ID"));
                r.setPackageID(rs.getInt("PACKAGE_ID"));
                r.setPrice(rs.getDouble("PRICE"));
                r.setRoomNumber(rs.getInt("ROOM_NUMBER"));
                return r;
            }
            return null;
        });
    }
    
    public int getLastRoomNumber()
    {
        return TEMP.query(this.COUNT, (ResultSet rs) -> {
            if (rs.next()) {
                return rs.getInt("MAX(ROOM_NUMBER)");
            }
            return 0;
        });
    }
    
    public Boolean saveOrUpdate(Object obj) {
        if (obj instanceof Room) // object is correct one i.e. it is a room since this class only deals with rooms!
        {
            Room i = (Room) obj;
            if(i.getRoomNumber() == 0 || this.get(i.getRoomNumber()) == null)
            {
                // item is new and doesn't exist
                //adding new object using insert
               if(i.getRoomNumber() == 0)
                   i.setRoomNumber(this.getLastRoomNumber() + 1);
               
               try
               {
                    return TEMP.update(this.INSERT, 
                           i.getRoomNumber(), i.getPackageID(), i.getGuests(), i.isFridge(), i.isTV(), i.isWiFi(), i.getPrice()) == 1;
               }
               catch(DataAccessException ex)
               {
                   return false;
               }
            }
            else
            {
                // item is old but requires update
                // placing the new object instead of old one
               try
               {
                   return TEMP.update(this.UPDATE, 
                           i.getPackageID(), i.getGuests(), i.isFridge(), i.isTV(), i.isWiFi(), i.getPrice(), i.getRoomNumber()) == 1;
               }
               catch(DataAccessException ex)
               {
                   return false;
               }
                
            }
        } else //object isn't correct!
        {
            return false;
        }
    }
       
}