package data.inform.inquiry;

public class InquiryDto {
	private String inquiry_id;
	private String member_id;
	private String inquiry_option;
	private String title;
	private String content;

	public String getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getInquiry_option() {
		return inquiry_option;
	}

	public void setInquiry_option(String inquiry_option) {
		this.inquiry_option = inquiry_option;
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

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	private String attachment;
}
