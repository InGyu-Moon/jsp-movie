package data.inform.faq;

public class FaqDto {
	private int faqId;
	private String category; //구분
	private String question; //질분
	private String answer; //답문
	
	
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "FaqDto [faqId=" + faqId + ", category=" + category + ", question=" + question + ", answer=" + answer
				+ "]";
	}
	
}
