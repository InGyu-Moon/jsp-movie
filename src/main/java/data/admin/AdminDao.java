package data.admin;

import db.mysql.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
    DbConnect db = new DbConnect();

    public boolean checkAdminLogin(String adminId, String adminPw){
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        boolean adminLoginResult = false;

        String sql = "select * from ADMIN_INFO where username = ? and password = ?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,adminId);
            pstmt.setString(2,adminPw);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                adminLoginResult = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs,pstmt,conn);
        }
        return adminLoginResult;
    }
}
