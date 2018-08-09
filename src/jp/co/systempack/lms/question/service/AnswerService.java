package jp.co.systempack.lms.question.service;

import java.util.List;

import jp.co.systempack.lms.dao.AnswerDao;
import jp.co.systempack.lms.entity.Answer;
import util.ormapper.HinaOrmapper;

public class AnswerService {

  public List<Answer> getAnswerListByQuestionId(int questionId) {

    try (HinaOrmapper ho = new HinaOrmapper()) {

      AnswerDao answerDao = new AnswerDao(ho);

      List<Answer> answerList = answerDao.getAnswerList(questionId);

      return answerList;
    }
  }

}
