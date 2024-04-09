package data.inform.notice;

import db.mysql.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {

    DbConnect db = new DbConnect();

    public void insertNotice(NoticeDto noticeDto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO NOTICE (CATEGORY, TITLE, CONTENT, REGISTERED_DATE, VIEW_COUNT) " +
                "VALUES (?, ?, ?, NOW(), 0)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeDto.getCategory().toString());
            pstmt.setString(2, noticeDto.getTitle());
            pstmt.setString(3, noticeDto.getContent());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }
    }


    public List<NoticeDto> getAllNotices() {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from NOTICE order by NOTICE_ID desc";
        List<NoticeDto> noticeDtoList = new ArrayList<NoticeDto>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeDto noticeDto = new NoticeDto();
                noticeDto.setNoticeId(rs.getInt("notice_id"));
                noticeDto.setCategory(Category.valueOf(rs.getString("category")));
                noticeDto.setContent(rs.getString("content"));
                noticeDto.setTitle(rs.getString("title"));

                noticeDtoList.add(noticeDto);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return noticeDtoList;
    }
    public int getNoticeCount() {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select count(*) from NOTICE";
        int count = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        }catch(Exception ex) {
            ex.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return count;
    }

}
