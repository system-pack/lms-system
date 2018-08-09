package jp.co.systempack.lms.question.form;

public class AnswerForm {

  private int questionId;
  private int no;
  private int type;
  private String answerDescription;
  private int answer;
  private String memo;

  public int getQuestionId() {
    return questionId;
  }

  public void setQuestionId(int questionId) {
    this.questionId = questionId;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getAnswerDescription() {
    return answerDescription;
  }

  public void setAnswerDescription(String answerDescription) {
    this.answerDescription = answerDescription;
  }

  public int getAnswer() {
    return answer;
  }

  public void setAnswer(int answer) {
    this.answer = answer;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  @Override
  public String toString() {
    return "Answer [questionId=" + questionId + ", no=" + no + ", type=" + type + ", answerDescription=" + answerDescription + ", answer=" + answer + ", memo=" + memo + "]";
  }

}
