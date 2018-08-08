package jp.co.systempack.lms.question.dto;

import java.util.List;

import jp.co.systempack.lms.entity.Question;
import jp.co.systempack.lms.entity.QuestionDefault;

public class QuestionSetDto {

  private Question question;
  private List<QuestionDefault> questionDefaultList;

  public Question getQuestion() {
    return question;
  }

  public void setQuestion(Question question) {
    this.question = question;
  }

  public List<QuestionDefault> getQuestionDefaultList() {
    return questionDefaultList;
  }

  public void setQuestionDefaultList(List<QuestionDefault> questionDefaultList) {
    this.questionDefaultList = questionDefaultList;
  }

}
