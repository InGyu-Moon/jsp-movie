package data.inform.notice;

import data.inform.faq.FaqDto;
import db.mysql.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        } catch(SQLException e) {
            System.out.println("insertNotice error = " + e);
        } finally {
            db.dbClose(pstmt, conn);
        }
    }

    public NoticeDto getNoticeById(String noticeId){
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from NOTICE where notice_id=?";
        NoticeDto noticeDto = new NoticeDto();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeId);

            rs = pstmt.executeQuery();

            if(rs.next()) {
                noticeDto.setNoticeId(rs.getString("notice_id"));
                noticeDto.setTitle(rs.getString("title"));
                noticeDto.setContent(rs.getString("content"));
                noticeDto.setCategory(Category.valueOf(rs.getString("category")));
                noticeDto.setViewCount(rs.getInt("view_count"));
                noticeDto.setRegisteredDate(rs.getTimestamp("registered_date"));
            }

        }catch(SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
//        System.out.println("getNoticeById ");
//        System.out.println("noticeDto = " + noticeDto.toString());
//        System.out.println("--------------------------------------------------------------");

        return noticeDto;
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
                noticeDto.setNoticeId(rs.getString("notice_id"));
                noticeDto.setCategory(Category.valueOf(rs.getString("category")));
                noticeDto.setContent(rs.getString("content"));
                noticeDto.setTitle(rs.getString("title"));
                noticeDto.setRegisteredDate(rs.getTimestamp("registered_date"));
                noticeDto.setViewCount(rs.getInt("view_count"));

                noticeDtoList.add(noticeDto);
            }

        } catch(SQLException e) {
            System.out.println("e = " + e);
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

        }catch(SQLException e) {
            System.out.println("e = " + e);
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return count;
    }

    public void updateNotice(NoticeDto noticeDto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

//        System.out.println("updateNotice ");
//        System.out.println("noticeDto = " + noticeDto.toString());
//        System.out.println("--------------------------------------------------------------");

        String sql = "update NOTICE set title=?, content=?, category=? where notice_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,noticeDto.getTitle());
            pstmt.setString(2,noticeDto.getContent());
//            pstmt.setString(3,noticeDto.getCategory().toString());
            pstmt.setString(3,noticeDto.getCategory().name());
            pstmt.setString(4,noticeDto.getNoticeId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateNotice error = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

    public void deleteNotice(String noticeId){
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        String sql = "delete from notice where notice_id=?";

        try {
            pstmt= conn.prepareStatement(sql);
            pstmt.setString(1,noticeId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("deleteNotice error = " + e);
        }finally {
            db.dbClose(pstmt, conn);
        }
    }

}
