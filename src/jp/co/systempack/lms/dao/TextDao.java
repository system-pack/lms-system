package jp.co.systempack.lms.dao;

import jp.co.systempack.lms.entity.Text;
import util.ormapper.HinaOrmapper;

public class TextDao {

  private HinaOrmapper ho = null;

  public TextDao(HinaOrmapper ho) {
    this.ho = ho;
  }

  public Text getTextByTextId(int textId) {

    String sql = "select * from text where text_id = ?";

    return ho.executeQueryOne(sql, Text.class, textId);

  }

}
