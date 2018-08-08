package jp.co.systempack.lms.question.form;

import java.util.List;

public class CurrentPageInfoForm {

  private Subject currentSubject;
  private Chapter currentChapter;
  private Section currentSection;
  private QuestionNo currentQuestionNo;
  private TextNo currentTextNo;
  private List<QuestionNo> Questions;
  private List<TextNo> texts;

  public Subject getCurrentSubject() {
    return currentSubject;
  }

  public void setCurrentSubject(Subject currentSubject) {
    this.currentSubject = currentSubject;
  }

  public Chapter getCurrentChapter() {
    return currentChapter;
  }

  public void setCurrentChapter(Chapter currentChapter) {
    this.currentChapter = currentChapter;
  }

  public Section getCurrentSection() {
    return currentSection;
  }

  public void setCurrentSection(Section currentSection) {
    this.currentSection = currentSection;
  }

  public QuestionNo getCurrentQuestionNo() {
    return currentQuestionNo;
  }

  public void setCurrentQuestionNo(QuestionNo currentQuestionNo) {
    this.currentQuestionNo = currentQuestionNo;
  }

  public TextNo getCurrentTextNo() {
    return currentTextNo;
  }

  public void setCurrentTextNo(TextNo currentTextNo) {
    this.currentTextNo = currentTextNo;
  }

  public List<QuestionNo> getQuestions() {
    return Questions;
  }

  public void setQuestions(List<QuestionNo> questions) {
    Questions = questions;
  }

  public List<TextNo> getTexts() {
    return texts;
  }

  public void setTexts(List<TextNo> texts) {
    this.texts = texts;
  }

  /**
   * 科目クラス
   * @author tomal
   *
   */
  static public class Subject {

    private int subjectId;
    private String title;
    private String content;

    public int getSubjectId() {
      return subjectId;
    }

    public void setSubjectId(int subjectId) {
      this.subjectId = subjectId;
    }

    public String getTitle() {
      return title;
    }

    public void setTitle(String title) {
      this.title = title;
    }

    public String getContent() {
      return content;
    }

    public void setContent(String content) {
      this.content = content;
    }

  }

  /**
   * 章クラス
   * @author tomal
   *
   */
  static public class Chapter {

    private int chapterId;
    private String title;
    private String content;

    public int getChapterId() {
      return chapterId;
    }

    public void setChapterId(int chapterId) {
      this.chapterId = chapterId;
    }

    public String getTitle() {
      return title;
    }

    public void setTitle(String title) {
      this.title = title;
    }

    public String getContent() {
      return content;
    }

    public void setContent(String content) {
      this.content = content;
    }

  }

  /**
   * 節
   * @author tomal
   *
   */
  static public class Section {

    private int sectionId;
    private String title;
    private String content;

    public int getSectionId() {
      return sectionId;
    }

    public void setSectionId(int sectionId) {
      this.sectionId = sectionId;
    }

    public String getTitle() {
      return title;
    }

    public void setTitle(String title) {
      this.title = title;
    }

    public String getContent() {
      return content;
    }

    public void setContent(String content) {
      this.content = content;
    }

  }

  /**
   * 問題ページ
   * @author tomal
   *
   */
  static public class QuestionNo {

    private int questionId;
    private int no;
    private String memo;

    public int getQuestionId() {
      return questionId;
    }

    public void setQuestionId(int questionId) {
      this.questionId = questionId;
    }

    public int getNo() {
      return no;
    }

    public void setNo(int no) {
      this.no = no;
    }

    public String getMemo() {
      return memo;
    }

    public void setMemo(String memo) {
      this.memo = memo;
    }

  }

  /**
   * テキストページ
   * @author tomal
   *
   */
  static public class TextNo {

    private int questionId;
    private int no;
    private String memo;

    public int getQuestionId() {
      return questionId;
    }

    public void setQuestionId(int questionId) {
      this.questionId = questionId;
    }

    public int getNo() {
      return no;
    }

    public void setNo(int no) {
      this.no = no;
    }

    public String getMemo() {
      return memo;
    }

    public void setMemo(String memo) {
      this.memo = memo;
    }

  }

}
