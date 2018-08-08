package util.ormapper;

import static java.sql.Types.*;

import java.io.Closeable;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import util.exception.HinaException;
import util.exception.HinaOrmapperException;

public class HinaOrmapper implements Closeable {

  private Connection con = null;

  /**
   * コンストラクタ
   */
  public HinaOrmapper() {

    this.con = ConnectionFactory.getConnection();

  }

  /**
   * コネクション取得
   * @return
   * @deprecated
   */
  public Connection getCon() {
    return con;
  }

  /**
   * コネクションセット
   * @param con
   * @deprecated
   */
  public void setCon(Connection con) {
    this.con = con;
  }

  /**
   * sqlからマップを取得する
   * @param id
   * @param args
   * @return
   * @throws HinaException
   */
  public List<Map<String, Object>> excecuteQuery(String sql, Object... args) throws HinaException {

    if (sql == null) {
      throw new HinaOrmapperException("sqlが存在しません。");
    }

    List<Map<String, Object>> resultList = new ArrayList<>();

    // sql実行
    try (PreparedStatement pst = con.prepareStatement(sql);) {

      if (args != null) {
        int i = 1;
        for (Object arg : args) {
          pst.setObject(i++, arg);
        }
      }

      try (ResultSet rs = pst.executeQuery()) {

        while (rs.next()) {

          ResultSetMetaData data = rs.getMetaData();

          int count = data.getColumnCount();

          Map<String, Object> resultMap = new HashMap<>();
          for (int i = 1; i <= count; i++) {

            // カラム名取得
            String name = data.getColumnName(i);

            // カラムの値取得
            int typeInt = data.getColumnType(i);
            Object result = null;
            if (typeInt == INTEGER || typeInt == BIGINT || typeInt == TINYINT) {

              // 数字の場合
              result = rs.getInt(i);

            } else if (typeInt == DATE) {

              // 日付の場合
              java.sql.Date date = rs.getDate(i);
              result = new Date(date.getTime());

            } else {

              // その他は文字として処理
              result = rs.getString(i);

            }

            String[] parts = name.split("_");
            String key = "";
            for (String part : parts) {
              key += part.substring(0, 1).toUpperCase() + part.substring(1);
            }
            resultMap.put(key, result);

          }
          resultList.add(resultMap);

        }
      }

      return resultList;
    } catch (Exception e) {
      throw new HinaOrmapperException("sqlの実行に失敗しました。", e);
    }

  }

  /**
   * 1レコードのみの取得
   * @param sql
   * @param clazz
   * @param params
   * @return
   */
  public <T> T executeQueryOne(String sql, Class<T> clazz, Object... params) {

    List<T> list = excecuteQuery(sql, clazz, params);

    if (list.isEmpty()) {
      return null;
    }

    return list.get(0);
  }

  /**
   * sqlから所定のインスタンスを取得する
   * @param id
   * @param params
   * @param clazz
   * @return
   * @throws HinaException
   */
  public <T> List<T> excecuteQuery(String sql, Class<T> clazz, Object... params) throws HinaException {

    List<Map<String, Object>> targetList = excecuteQuery(sql, params);

    // レコードのリストからオブジェクトのリストに
    List<T> resultList;
    try {
      resultList = new ArrayList<>();
      for (Map<String, Object> resultMap : targetList) {

        // １レコードからオブジェクトに
        Object target = clazz.newInstance();
        for (Entry<String, Object> entry : resultMap.entrySet()) {

          Object value = entry.getValue();
          String name = entry.getKey();

          String setterName = "set" + name;
          Method[] methods = clazz.getMethods();
          for (Method method : methods) {

            if (method.getName().equalsIgnoreCase((setterName))) {
              Class<?> parameterClazz = method.getParameterTypes()[0];

              if (parameterClazz == int.class) {

                method.invoke(target, ((Integer) value).intValue());

              } else if (parameterClazz == long.class) {

                method.invoke(target, ((Long) value).intValue());

              } else {

                method.invoke(target, parameterClazz.cast(value));

              }
            }

          }

        }

        resultList.add(clazz.cast(target));

      }
    } catch (Exception e) {
      throw new HinaOrmapperException("レコードのインスタンスへの変換に失敗しました。", e);
    }

    return resultList;

  }

  /**
   * 更新処理を行う
   * @param id
   * @param params
   * @return
   * @throws HinaException
   */
  public <T> int excecutedUpdate(String sql, String... params) throws HinaException {

    int resultCount = 0;

    try (PreparedStatement pst = con.prepareStatement(sql);) {

      int i = 1;
      for (String param : params) {
        pst.setObject(i++, param);
      }

      resultCount = pst.executeUpdate();

    } catch (Exception e) {
      try {
        if (con != null) {
          con.rollback();
        }
      } catch (SQLException e1) {
        throw new HinaOrmapperException("インサート、または、アップデートに、失敗し、コネクションのクローズに失敗しました。", e);
      }
      throw new HinaOrmapperException("インサート、または、アップデートに、失敗しました。", e);
    }

    return resultCount;

  }

  /**
   * リソースのクローズを行う
   */
  @Override
  public void close() {

    try {
      if (con != null) {
        con.commit();
        con.close();
      }
    } catch (SQLException e) {
      throw new HinaOrmapperException("DBとの接続を閉じるのに失敗しました。", e);
    }

  }
}
