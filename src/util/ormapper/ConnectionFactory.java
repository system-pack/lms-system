package util.ormapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import util.exception.HinaOrmapperException;

public class ConnectionFactory {

  private static Connection connection = null;

  private ConnectionFactory() {
    // インスタンスを作りたくないクラスは、コンストラクタをprivateにする。
  }

  /**
   * コネクションを取得する。<br>
   * プロジェクトによりここを変更する。
   * @return
   */
  static public Connection getConnection() {

    // mariadb
    String driver = "org.mariadb.jdbc.Driver";
    String url = "jdbc:mariadb://localhost/lms";
    String user = "root";
    String password = "";

    return getConnection(driver, url, user, password);
  }

  static public Connection getConnection(String driver, String url, String user, String password) throws HinaOrmapperException {

    try {

      Class.forName(driver); // 最近は必要なくなった。

      connection = DriverManager.getConnection(url, user, password);
      connection.setAutoCommit(false);

    } catch (ClassNotFoundException | SQLException e) {

      throw new HinaOrmapperException("コネクションの生成に失敗しました。", e);

    }

    return connection;

  }

}
