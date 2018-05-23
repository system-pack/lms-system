<%@page import="dto.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.color_back_white {
	background-color: whitesmoke
}

.color_back_gray1 {
	background-color: lightgray
}

.color_back_gray2 {
	background-color: darkgray
}

.color_back_gray3 {
	background-color: gray;
	color: whitesmoke
}

.color_back_orange {
	background-color: orange
}

.color_back_crimson {
	background-color: crimson
}

.color_back_violet {
	background-color: blueviolet
}

.color_back_blue {
	background-color: cornflowerblue
}

.main {
	width: 1200px;
	margin: auto;
	padding: 10px;
	overflow: hidden;
}

header {
	height: 70px;
}

.content_left {
	width: 580px;
	background-color: whitesmoke;
	color: black;
	padding: 10px;
	float: left;
}

.content_right {
	width: 565px;
	background-color: whitesmoke;
	color: black;
	padding: 10px;
	float: left;
	margin-left: 15px
}

label.panel-label {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	display: block;
	width: 100%;
	color: #bdc3c7;
	cursor: pointer;
	background-color: #ecf0f1;
	-webkit-transition-property: background-color, color;
	transition-property: background-color, color;
	-webkit-transition-duration: 200ms;
	transition-duration: 200ms;
}

label.panel-label:hover {
	color: #003399;
}

#panels {
	background-color: white;
}

#panels .container {
	margin: 0 auto;
	width: 100%;
}

#panels section header label.panel-label {
	padding: 12px 5px;
	box-sizing: border-box;
}

#panels section main {
	box-sizing: border-box;
	max-height: 0;
	opacity: 0;
	-webkit-transition: opacity 600ms;
	transition: opacity 600ms;
	overflow-y: hidden;
}

#panel-1-ctrl:checked ~#panels #panel-1 main {
	max-height: initial;
	opacity: 1;
	padding: 48px 5px;
}

#panel-2-ctrl:checked ~#panels #panel-2 main {
	max-height: initial;
	opacity: 1;
	padding: 48px 5px;
}

#panel-3-ctrl:checked ~#panels #panel-3 main {
	max-height: initial;
	opacity: 1;
	padding: 48px 5px;
}

#panel-1-ctrl:checked ~#tabs-list #li-for-panel-1 {
	pointer-events: none;
	cursor: default;
	-webkit-transform: translate3d(0, 1px, 0);
	transform: translate3d(0, 1px, 0);
	box-shadow: none;
	border-right: none;
}

#panel-1-ctrl:checked ~#tabs-list #li-for-panel-1.last {
	border-right: 1px solid transparent;
}

#panel-1-ctrl:checked ~#tabs-list #li-for-panel-1+li {
	border-left: 1px solid #dfdfdf;
}

#panel-1-ctrl:checked ~#tabs-list #li-for-panel-1 label.panel-label {
	background-color: white;
	color: #003399;
	padding-top: 5px;
}

#panel-1-ctrl:checked ~#tabs-list #li-for-panel-1 label.panel-label::after
	{
	height: 6px;
}

#panel-2-ctrl:checked ~#tabs-list #li-for-panel-2 {
	pointer-events: none;
	cursor: default;
	-webkit-transform: translate3d(0, 1px, 0);
	transform: translate3d(0, 1px, 0);
	box-shadow: none;
	border-right: none;
}

#panel-2-ctrl:checked ~#tabs-list #li-for-panel-2.last {
	border-right: 1px solid transparent;
}

#panel-2-ctrl:checked ~#tabs-list #li-for-panel-2+li {
	border-left: 1px solid #dfdfdf;
}

#panel-2-ctrl:checked ~#tabs-list #li-for-panel-2 label.panel-label {
	background-color: white;
	color: #003399;
	padding-top: 5px;
}

#panel-2-ctrl:checked ~#tabs-list #li-for-panel-2 label.panel-label::after
	{
	height: 6px;
}

#panel-3-ctrl:checked ~#tabs-list #li-for-panel-3 {
	pointer-events: none;
	cursor: default;
	-webkit-transform: translate3d(0, 1px, 0);
	transform: translate3d(0, 1px, 0);
	box-shadow: none;
	border-right: none;
}

#panel-3-ctrl:checked ~#tabs-list #li-for-panel-3.last {
	border-right: 1px solid transparent;
}

#panel-3-ctrl:checked ~#tabs-list #li-for-panel-3+li {
	border-left: 1px solid #dfdfdf;
}

#panel-3-ctrl:checked ~#tabs-list #li-for-panel-3 label.panel-label {
	background-color: white;
	color: #003399;
	padding-top: 5px;
}

#panel-3-ctrl:checked ~#tabs-list #li-for-panel-3 label.panel-label::after
	{
	height: 6px;
}

ul#tabs-list {
	display: flex;
	list-style: none;
	text-align: center;
	border-bottom: 1px solid #dfdfdf;
	margin: 0;
	padding: 0;
}

ul#tabs-list li {
	text-align: center;
	font-size: 0.875em;
	width: 18%;
	box-shadow: 0px -2px 2px rgba(0, 0, 0, 0.05);
	border-right: 1px solid #dfdfdf;
	position: relative;
}

ul#tabs-list li:hover {
	-webkit-transition: none;
	transition: none;
	border-right: none;
}

ul#tabs-list li:hover.last {
	border-right: 1px solid transparent;
}

ul#tabs-list li:hover+li {
	border-left: 1px solid #dfdfdf;
}

ul#tabs-list li label.panel-label {
	position: relative;
	padding: 5px 0;
	font-size: 0.875em;
}

ul#tabs-list li label.panel-label::after {
	content: "";
	position: absolute;
	width: 100%;
	left: 0;
	bottom: 100%;
	background-color: #003399;
	height: 0;
	-webkit-transition-property: height;
	transition-property: height;
	-webkit-transition-duration: 200ms;
	transition-duration: 200ms;
}

ul#tabs-list li label.panel-label:hover {
	padding-top: 5px;
}

ul#tabs-list li label.panel-label:hover::after {
	height: 6px;
}

main {
	width: 100%;
	height: 493px;
	margin: 0 auto;
}

.panel-radios {
	display: none;
}

body {
	background: #00bfff;
	color: #444444;
}

main p {
	line-height: 1.8;
}

#editor {
	width: 565px;
	height: 340px
}

#editor_result {
	width: 565px;
	height: 140px
}
</style>

</head>
<%


    Question question = (Question)request.getAttribute("question");

%>
<body>
    <div class="main color_back_gray3">
        <header>
            <div>Java Program</div>
            <nav>トップ > Java ＞ itrate1</nav>
            <div>■演習問題 1</div>
        </header>
        <div class="content_left">
            <!-- TAB CONTROLLERS -->
            <input id="panel-1-ctrl" class="panel-radios" type="radio" name="tab-radios" checked>
            <input id="panel-2-ctrl" class="panel-radios" type="radio" name="tab-radios">
            <input id="panel-3-ctrl" class="panel-radios" type="radio" name="tab-radios">

            <!-- TABS LIST -->
            <ul id="tabs-list">
                <!-- MENU TOGGLE -->
                <li id="li-for-panel-1">
                    <label class="panel-label" for="panel-1-ctrl">問題</label>
                </li>
                <!--INLINE-BLOCK FIX-->
                <li id="li-for-panel-2">
                    <label class="panel-label" for="panel-2-ctrl">解答</label>
                </li>
                <!--INLINE-BLOCK FIX-->
                <li id="li-for-panel-3">
                    <label class="panel-label" for="panel-3-ctrl">成績</label>
                </li>
                <li id="li-for-panel-4">
                    <label class="panel-label" for="panel-4-ctrl">テキスト</label>
                </li>
                <li id="li-for-panel-5">
                    <label class="panel-label" for="panel-5-ctrl">目次</label>
                </li>
                <!--INLINE-BLOCK FIX-->
            </ul>

            <!-- THE PANELS -->
            <article id="panels">
                <div class="container">
                    <section id="panel-1">
                        <main><%=question %></main>
                        <div style="text-align: right;">
                            <input type="submit" value="前の問題" />
                            <input type="submit" value="次の問題" />
                        </div>
                    </section>
                    <section id="panel-2">
                        <main><code><pre><%-- 解答 --%></pre></code></main>
                    </section>
                    <section id="panel-3">
                        <main>
                        <p>Content3</p>
                        </main>
                    </section>
                    <section id="panel-4">
                        <main>
                        <p>Content4</p>
                        </main>
                    </section>
                    <section id="panel-5">
                        <main>
                        <p>Content5</p>
                        </main>
                    </section>
                </div>
            </article>

        </div>
        <div class="content_right">
            <pre id="editor">
            </pre>
            <pre id="editor_result">
            </pre>
            <div style="text-align: right;">
                <input type="submit" value="コンパイル" />
                <input type="submit" value="採点" />
                <input type="submit" value="保存" />
            </div>
        </div>
    </div>
    <script src="js/lib/editor/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
					var editor = ace.edit("editor");
					editor.setTheme("ace/theme/monokai");
					editor.setFontSize(14);
					editor.getSession().setMode("ace/mode/java");
					editor.getSession().setUseWrapMode(true);
					editor.getSession().setTabSize(2);

					var editorResult = ace.edit("editor_result");
					editorResult.setTheme("ace/theme/monokai");
					editorResult.setFontSize(14);
					editorResult.getSession().setMode("ace/mode/java");
					editorResult.getSession().setUseWrapMode(true);
					editorResult.getSession().setTabSize(2);
				</script>
</body>

</html>