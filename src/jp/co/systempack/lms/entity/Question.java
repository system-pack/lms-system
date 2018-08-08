package jp.co.systempack.lms.entity;

public class Question {

  int questionId;
  int type;
  String title;
  String question;
  String memo;

  public int getQuestionId() {
    return questionId;
  }

  public void setQuestionId(int questionId) {
    this.questionId = questionId;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getQuestion() {
    return question;
  }

  public void setQuestion(String question) {
    this.question = question;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  @Override
  public String toString() {
    return "Question [questionId=" + questionId + ", type=" + type + ", title=" + title + ", question=" + question + ", memo=" + memo + "]";
  }

}
