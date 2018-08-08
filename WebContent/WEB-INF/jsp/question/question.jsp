<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>わこ塾＞演習画面</title>

<%-- リンク --%>
<jsp:include page="/WEB-INF/jsp/common/link.jsp" />

<script>
	function resize_func() {
		var height = $(window).height();
		var width = $(window).width();
		$("#question_content").height(height - 210);
		$("#question_select").height(height - 175);
		$("#left_pane").width((width - 30) / 2);
		$("#right_pane").width((width - 30) / 2);
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

          <c:out value="${question.question}" />

        </div>

        <%-- 解答タブのコンテンツ --%>
        <div class="tab-pane fade" id="answer_content" role="tabpanel" aria-labelledby="answer_content-tab">
          <ul>
            <c:forEach var="questionDefault" items="${questionDefaultList}" varStatus="status">

              <li>
                <label>
                  <input type="checkbox" value="q${status.count}" />
                  <c:out value="${questionDefault.init}" />
                </label>
              </li>

            </c:forEach>
          </ul>
        </div>

        <%-- テキストタブのコンテンツ --%>
        <div class="tab-pane fade" id="text_content" role="tabpanel" aria-labelledby="text_content-tab">

          <div class="embed-responsive embed-responsive-1by1" style="height: 100%; width: 100%;">
            <iframe class="embed-responsive-item" srcdoc='<c:out value="${text.text}" />'></iframe>
          </div>

        </div>

      </div>

      <%-- ページャー --%>
      <jsp:include page="/WEB-INF/jsp/common/pager.jsp" />

    </div>

    <%-- 右ペイン --%>
    <div class="col">

      <div id="question_select" style="width: 100%;"></div>

      <div style="width: 100%; padding: 5px 0 5px 0; height: 40px; text-align: right;">
        <button type="button" class="btn btn-secondary btn-sm">答え合わせ</button>
      </div>

    </div>

  </div>
  </main>

  <%-- フッター --%>
  <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

</body>