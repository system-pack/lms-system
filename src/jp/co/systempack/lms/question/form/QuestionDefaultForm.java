package jp.co.systempack.lms.question.form;

public class QuestionDefaultForm {

  private int questionId;
  private int no;
  private int type;
  private String init;
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

  public String getInit() {
    return init;
  }

  public void setInit(String init) {
    this.init = init;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  @Override
  public String toString() {
    return "QuestionDefault [questionId=" + questionId + ", no=" + no + ", type=" + type + ", init=" + init + ", memo=" + memo + "]";
  }

}
