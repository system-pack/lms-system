package jp.co.systempack.lms.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import jp.co.systempack.lms.entity.Question;
import jp.co.systempack.lms.entity.QuestionDefault;
import util.ormapper.HinaOrmapper;

class QuestionDaoTest {

  @Test
  void test() {

    try (HinaOrmapper ho = new HinaOrmapper();) {

      QuestionDao dao = new QuestionDao(ho);

      // 問題文取得テスト
      Question question = dao.getQuestionById(1);
      System.out.println(question);
      assertEquals(1, question.getQuestionId());

      // 選択肢取得テスト
      List<QuestionDefault> questionDefault = dao.getQuestionDefaultList(1);
      questionDefault.forEach(System.out::println);

    }

  }

}
