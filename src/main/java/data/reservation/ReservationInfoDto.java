package data.reservation;

import java.sql.Timestamp;

public class ReservationInfoDto {
    private String memberId;
    private String movieTitle;
    private String movieImg;
    private String viewingRating;
    private Timestamp screeningDate;
    private Timestamp screeningTime;
    private String branch;
    private String screenName;
    private String paymentStatus;
    private String paymentMethod;
    private String screeningInfoId;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMovieImg() {
        return movieImg;
    }

    public void setMovieImg(String movieImg) {
        this.movieImg = movieImg;
    }

    public String getViewingRating() {
        return viewingRating;
    }

    public void setViewingRating(String viewingRating) {
        this.viewingRating = viewingRating;
    }

    public Timestamp getScreeningDate() {
        return screeningDate;
    }

    public void setScreeningDate(Timestamp screeningDate) {
        this.screeningDate = screeningDate;
    }

    public Timestamp getScreeningTime() {
        return screeningTime;
    }

    public void setScreeningTime(Timestamp screeningTime) {
        this.screeningTime = screeningTime;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getScreeningInfoId() {
        return screeningInfoId;
    }

    public void setScreeningInfoId(String screeningInfoId) {
        this.screeningInfoId = screeningInfoId;
    }
}
