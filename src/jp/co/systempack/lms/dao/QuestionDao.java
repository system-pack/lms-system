package jp.co.systempack.lms.dao;

import java.util.List;

import jp.co.systempack.lms.entity.Question;
import jp.co.systempack.lms.entity.QuestionDefault;
import util.ormapper.HinaOrmapper;

public class QuestionDao {

  private HinaOrmapper ho = null;

  public QuestionDao(HinaOrmapper ho) {
    this.ho = ho;
  }

  public Question getQuestionById(int questionId) {

    String sql = "select * from question where question_id = ?";

    return ho.executeQueryOne(sql, Question.class, questionId);

  }

  public List<QuestionDefault> getQuestionDefaultList(int questionId) {

    String sql = "select * from question_default where question_id = ?";

    return ho.excecuteQuery(sql, QuestionDefault.class, questionId);

  }

}
