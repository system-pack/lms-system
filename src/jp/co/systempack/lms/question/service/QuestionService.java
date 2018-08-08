package jp.co.systempack.lms.question.service;

import java.util.List;

import jp.co.systempack.lms.dao.QuestionDao;
import jp.co.systempack.lms.dao.TextDao;
import jp.co.systempack.lms.entity.Question;
import jp.co.systempack.lms.entity.QuestionDefault;
import jp.co.systempack.lms.entity.Text;
import jp.co.systempack.lms.question.dto.QuestionSetDto;
import util.ormapper.HinaOrmapper;

public class QuestionService {

  /**
   * 問題を取得
   * @param questionId
   * @return
   */
  public QuestionSetDto getQuestionSetByQuestionId(int questionId) {

    try (HinaOrmapper ho = new HinaOrmapper();) {

      // DAO生成
      QuestionDao questionDao = new QuestionDao(ho);

      // 結果用DTO生成
      QuestionSetDto dto = new QuestionSetDto();

      // 問題文取得
      Question question = questionDao.getQuestionById(questionId);
      dto.setQuestion(question);

      // 選択肢取得
      List<QuestionDefault> questionDefaultList = questionDao.getQuestionDefaultList(questionId);
      dto.setQuestionDefaultList(questionDefaultList);

      return dto;

    }
  }

  /**
   * テキストを取得
   * @param textId
   * @return
   */
  public Text getTextByTextId(int textId) {

    try (HinaOrmapper ho = new HinaOrmapper();) {

      // DAO生成
      TextDao textDao = new TextDao(ho);

      // テキスト取得
      Text text = textDao.getTextByTextId(textId);

      return text;
    }

  }

}
