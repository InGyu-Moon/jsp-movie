package data.inform.notice;

import java.sql.Timestamp;

public class NoticeDto {
    private String noticeId;
    private Category category;
    private String title;
    private String content;
    private Timestamp registeredDate;

    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Timestamp registeredDate) {
        this.registeredDate = registeredDate;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    private int viewCount;

    @Override
    public String toString() {
        return "NoticeDto{" +
                "noticeId='" + noticeId + '\'' +
                ", category=" + category +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", registeredDate=" + registeredDate +
                ", viewCount=" + viewCount +
                '}';
    }
}
