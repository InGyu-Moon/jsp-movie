package data.inform.inquiry;

public class InquiryDto {

	private int inquiryId;
	private int memberId;
	private InquiryOption option;
	private String title;
	private String content;
	private String attachment; // 첨부파일
	private String answer; // 문의에 대한 답변

	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public InquiryOption getOption() {
		return option;
	}

	public void setOption(InquiryOption option) {
		this.option = option;
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

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "InquiryDto [inquiryId=" + inquiryId + ", memberId=" + memberId + ", option=" + option + ", title="
				+ title + ", content=" + content + ", attachment=" + attachment + ", answer=" + answer + "]";
	}

}
