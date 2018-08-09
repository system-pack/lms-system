<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>わこ塾</title>

<%-- リンク --%>
<jsp:include page="/WEB-INF/jsp/common/link.jsp" />

<script>
	function resize_func() {
		var height = $(window).height();
		var width = $(window).width();

		// 左コンテンツ・タブ内のコンテンツの高さ調節
		$("#question_content").height(height - 210);
		$("#text_content").height(height - 210);

		// 右コンテンツの高さ調節
		$("#question_select").height(height - 220);

	}

	$(window).on('load resize', resize_func);
</script>
</head>

<body>

  <%-- ナビゲーション --%>
  <jsp:include page="/WEB-INF/jsp/common/nav.jsp" />

  <%-- メインコンテンツ --%>
  <main role="main" style="margin-top: 60px;" class="container-fluid">

  <div class="row" style="width: 100%;">

    <%-- 左ペイン --%>
    <div class="col">
      <ul class="nav nav-tabs" id="tab" role="tablist" style="width: 100%">
        <li class="nav-item">
          <a class="nav-link active" id="question_content-tab" data-toggle="tab" href="#question_content" role="tab" aria-controls="question_content">問題</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="answer_content-tab" data-toggle="tab" href="#answer_content" role="tab" aria-controls="answer_content">解答</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="text_content-tab" data-toggle="tab" href="#text_content" role="tab" aria-controls="text_content"><c:out value="${text.title}" /></a>
        </li>
      </ul>

      <div class="tab-content" id="abContent">

        <%-- 問題タブのコンテンツ --%>
        <div class="tab-pane fade show active" id="question_content" role="tabpanel" aria-labelledby="question_content-tab">
          <div style="padding: 20px;">

            <c:out value="${question.question}" />

          </div>
        </div>

        <%-- 解答タブのコンテンツ --%>
        <div class="tab-pane fade" id="answer_content" role="tabpanel" aria-labelledby="answer_content-tab">
          <div style="padding: 20px;">

            <ul class="list-group">
              <c:forEach var="answer" items="${answerList}" varStatus="status">

                <li class="list-group-item">${answer.answerDescription}</li>

              </c:forEach>
            </ul>

          </div>
        </div>

        <%-- テキストタブのコンテンツ --%>
        <div class="tab-pane fade" id="text_content" role="tabpanel" aria-labelledby="text_content-tab">

          <div class="embed-responsive" style="height: 100%; width: 100%;">
            <iframe class="embed-responsive-item" style="height: 100%; width: 100%;" 6 srcdoc='<c:out value="${text.text}" />'></iframe>
          </div>

        </div>

      </div>

      <%-- ページャー --%>
      <jsp:include page="/WEB-INF/jsp/common/pager.jsp" />

    </div>

    <%-- 右ペイン --%>
    <div class="col">
      <form action="answer">
        <div id="question_select" style="width: 100%; margin-top: 42px;">
          <div style="padding: 20px;">

            <ul class="list-group">
              <c:forEach var="questionDefault" items="${questionDefaultList}" varStatus="status">

                <li class="list-group-item">
                  <div class="custom-control custom-radio">

                    <input class="custom-control-input" name="q" type="radio" value="q${status.count}" id="q${status.count}" />
                    <label class="custom-control-label" for="q${status.count}">
                      <c:out value="${questionDefault.init}" />
                    </label>

                  </div>
                </li>

              </c:forEach>
            </ul>

          </div>
        </div>

        <div style="width: 100%; padding: 5px 0 5px 0; height: 40px; text-align: right;">
          <button type="submit" class="btn btn-secondary btn-sm">答え合わせ</button>
        </div>
      </form>
    </div>

  </div>
  </main>

  <%-- フッター --%>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

</body>