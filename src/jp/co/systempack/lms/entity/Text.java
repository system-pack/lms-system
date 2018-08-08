package jp.co.systempack.lms.entity;

public class Text {

  private int textId;
  private String title;
  private int type;
  private String text;
  private String memo;

  public int getTextId() {
    return textId;
  }

  public void setTextId(int textId) {
    this.textId = textId;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

}
