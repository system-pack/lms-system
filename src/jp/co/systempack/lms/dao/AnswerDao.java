package jp.co.systempack.lms.dao;

import java.util.List;

import jp.co.systempack.lms.entity.Answer;
import util.ormapper.HinaOrmapper;

public class AnswerDao {

  private HinaOrmapper ho = null;

  public AnswerDao(HinaOrmapper ho) {
    this.ho = ho;
  }

  public List<Answer> getAnswerList(int questionId) {

    String sql = "select * from answer where question_id = ?";

    return ho.excecuteQuery(sql, Answer.class, questionId);

  }

}
