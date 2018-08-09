-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018 年 8 朁E09 日 15:18
-- サーバのバージョン： 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `answer`
--

CREATE TABLE `answer` (
  `question_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `answer_description` text COLLATE utf8mb4_bin,
  `answer` int(11) DEFAULT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `answer`
--

INSERT INTO `answer` (`question_id`, `no`, `type`, `answer_description`, `answer`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 1, 'idというカラムは存在していませんので、間違いです。', 0, NULL, 999, '2018-08-09 05:28:31', 999, '2018-08-09 05:28:31'),
(1, 2, 1, 'Where句の後ろに、いきなり条件の数値が書いてあります。\r\nこれは、文法的に間違いです。', 0, NULL, 999, '2018-08-09 05:29:40', 999, '2018-08-09 05:29:40'),
(1, 3, 1, 'where句の後ろに、\r\nカラム名＝条件値、\r\nと記載してあります。\r\n正しい記載です。', 0, NULL, 999, '2018-08-09 05:30:33', 999, '2018-08-09 05:30:33');

-- --------------------------------------------------------

--
-- テーブルの構造 `chapter`
--

CREATE TABLE `chapter` (
  `subject_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `chapter`
--

INSERT INTO `chapter` (`subject_id`, `chapter_id`, `title`, `content`, `sort`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, '参照系のSQL', 'SELECTに関する問題の章', NULL, 999, '2018-08-05 12:15:27', 999, '2018-08-05 12:15:27'),
(1, 2, '編集系', 'insert,update,deleteなどの編集系のSQLについて学習します。', NULL, 999, '2018-08-05 12:16:38', 999, '2018-08-05 12:16:38');

-- --------------------------------------------------------

--
-- テーブルの構造 `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `question` varchar(1024) COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `question`
--

INSERT INTO `question` (`question_id`, `type`, `title`, `question`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 'WHERE句の問題', '図書テーブルから、書誌番号=272096の行だけ取得するSQLで正しいのは以下のうち、どれでしょうか？', NULL, 999, '2018-07-29 07:26:58', 999, '2018-07-29 07:26:58');

-- --------------------------------------------------------

--
-- テーブルの構造 `question_default`
--

CREATE TABLE `question_default` (
  `question_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `init` varchar(1024) COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `question_default`
--

INSERT INTO `question_default` (`question_id`, `no`, `type`, `init`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 2, 'select * from books where id=272096;', NULL, 999, '2018-08-09 01:29:43', 999, '2018-08-09 01:29:43'),
(1, 2, 2, 'select * from books where 272096;', NULL, 999, '2018-08-09 01:30:34', 999, '2018-08-09 01:30:34'),
(1, 3, 2, 'select * from books where book_id=272096;', NULL, 0, '2018-08-09 01:30:57', 999, '2018-08-09 01:30:57');

-- --------------------------------------------------------

--
-- テーブルの構造 `question_no`
--

CREATE TABLE `question_no` (
  `section_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `question_no`
--

INSERT INTO `question_no` (`section_id`, `question_id`, `no`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 1, NULL, 999, '2018-08-08 18:19:48', 999, '2018-08-08 18:19:48');

-- --------------------------------------------------------

--
-- テーブルの構造 `section`
--

CREATE TABLE `section` (
  `chapter_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `section`
--

INSERT INTO `section` (`chapter_id`, `section_id`, `title`, `content`, `sort`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, '射影', '特定の列を取得する方法について学習します。特定の行を取得する方法は、この後、学習します。', NULL, 999, '2018-07-29 07:24:31', 999, '2018-07-29 07:24:31');

-- --------------------------------------------------------

--
-- テーブルの構造 `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `subject`
--

INSERT INTO `subject` (`subject_id`, `title`, `content`, `sort`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 'SQLの基礎', 'SQLの基本的な知識を問う選択問題。', NULL, 999, '2018-08-05 12:13:00', 999, '2018-08-05 12:13:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `text`
--

CREATE TABLE `text` (
  `text_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `text` text COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `text`
--

INSERT INTO `text` (`text_id`, `type`, `title`, `text`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 'テーブルの内容', '  <html>\r\n    <head>\r\n      <meta charset=\"utf-8\">\r\n      <title>0.テーブル.adoc</title>\r\n      <style>\r\n        #wrapper {width: 960px; margin: 0 auto;}\r\n        /* Asciidoctor default stylesheet | MIT License | http://asciidoctor.org */\r\n/* Remove comment around @import statement below when using as a custom stylesheet */\r\n/*@import \"https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic%7CNoto+Serif:400,400italic,700,700italic%7CDroid+Sans+Mono:400,700\";*/\r\narticle,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}\r\naudio,canvas,video{display:inline-block}\r\naudio:not([controls]){display:none;height:0}\r\n[hidden],template{display:none}\r\nscript{display:none!important}\r\nhtml{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}\r\na{background:transparent}\r\na:focus{outline:thin dotted}\r\na:active,a:hover{outline:0}\r\nh1{font-size:2em;margin:.67em 0}\r\nabbr[title]{border-bottom:1px dotted}\r\nb,strong{font-weight:bold}\r\ndfn{font-style:italic}\r\nhr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}\r\nmark{background:#ff0;color:#000}\r\ncode,kbd,pre,samp{font-family:monospace;font-size:1em}\r\npre{white-space:pre-wrap}\r\nq{quotes:\"\\201C\" \"\\201D\" \"\\2018\" \"\\2019\"}\r\nsmall{font-size:80%}\r\nsub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}\r\nsup{top:-.5em}\r\nsub{bottom:-.25em}\r\nimg{border:0}\r\nsvg:not(:root){overflow:hidden}\r\nfigure{margin:0}\r\nfieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}\r\nlegend{border:0;padding:0}\r\nbutton,input,select,textarea{font-family:inherit;font-size:100%;margin:0}\r\nbutton,input{line-height:normal}\r\nbutton,select{text-transform:none}\r\nbutton,html input[type=\"button\"],input[type=\"reset\"],input[type=\"submit\"]{-webkit-appearance:button;cursor:pointer}\r\nbutton[disabled],html input[disabled]{cursor:default}\r\ninput[type=\"checkbox\"],input[type=\"radio\"]{box-sizing:border-box;padding:0}\r\ninput[type=\"search\"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box}\r\ninput[type=\"search\"]::-webkit-search-cancel-button,input[type=\"search\"]::-webkit-search-decoration{-webkit-appearance:none}\r\nbutton::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}\r\ntextarea{overflow:auto;vertical-align:top}\r\ntable{border-collapse:collapse;border-spacing:0}\r\n*,*:before,*:after{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}\r\nhtml,body{font-size:100%}\r\nbody{background:#fff;color:rgba(0,0,0,.8);padding:0;margin:0;font-family:\"Noto Serif\",\"DejaVu Serif\",serif;font-weight:400;font-style:normal;line-height:1;position:relative;cursor:auto;tab-size:4;-moz-osx-font-smoothing:grayscale;-webkit-font-smoothing:antialiased}\r\na:hover{cursor:pointer}\r\nimg,object,embed{max-width:100%;height:auto}\r\nobject,embed{height:100%}\r\nimg{-ms-interpolation-mode:bicubic}\r\n.left{float:left!important}\r\n.right{float:right!important}\r\n.text-left{text-align:left!important}\r\n.text-right{text-align:right!important}\r\n.text-center{text-align:center!important}\r\n.text-justify{text-align:justify!important}\r\n.hide{display:none}\r\nimg,object,svg{display:inline-block;vertical-align:middle}\r\ntextarea{height:auto;min-height:50px}\r\nselect{width:100%}\r\n.center{margin-left:auto;margin-right:auto}\r\n.spread{width:100%}\r\np.lead,.paragraph.lead>p,#preamble>.sectionbody>.paragraph:first-of-type p{font-size:1.21875em;line-height:1.6}\r\n.subheader,.admonitionblock td.content>.title,.audioblock>.title,.exampleblock>.title,.imageblock>.title,.listingblock>.title,.literalblock>.title,.stemblock>.title,.openblock>.title,.paragraph>.title,.quoteblock>.title,table.tableblock>.title,.verseblock>.title,.videoblock>.title,.dlist>.title,.olist>.title,.ulist>.title,.qlist>.title,.hdlist>.title{line-height:1.45;color:#7a2518;font-weight:400;margin-top:0;margin-bottom:.25em}\r\ndiv,dl,dt,dd,ul,ol,li,h1,h2,h3,#toctitle,.sidebarblock>.content>.title,h4,h5,h6,pre,form,p,blockquote,th,td{margin:0;padding:0;direction:ltr}\r\na{color:#2156a5;text-decoration:underline;line-height:inherit}\r\na:hover,a:focus{color:#1d4b8f}\r\na img{border:none}\r\np{font-family:inherit;font-weight:400;font-size:1em;line-height:1.6;margin-bottom:1.25em;text-rendering:optimizeLegibility}\r\np aside{font-size:.875em;line-height:1.35;font-style:italic}\r\nh1,h2,h3,#toctitle,.sidebarblock>.content>.title,h4,h5,h6{font-family:\"Open Sans\",\"DejaVu Sans\",sans-serif;font-weight:300;font-style:normal;color:#ba3925;text-rendering:optimizeLegibility;margin-top:1em;margin-bottom:.5em;line-height:1.0125em}\r\nh1 small,h2 small,h3 small,#toctitle small,.sidebarblock>.content>.title small,h4 small,h5 small,h6 small{font-size:60%;color:#e99b8f;line-height:0}\r\nh1{font-size:2.125em}\r\nh2{font-size:1.6875em}\r\nh3,#toctitle,.sidebarblock>.content>.title{font-size:1.375em}\r\nh4,h5{font-size:1.125em}\r\nh6{font-size:1em}\r\nhr{border:solid #ddddd8;border-width:1px 0 0;clear:both;margin:1.25em 0 1.1875em;height:0}\r\nem,i{font-style:italic;line-height:inherit}\r\nstrong,b{font-weight:bold;line-height:inherit}\r\nsmall{font-size:60%;line-height:inherit}\r\ncode{font-family:\"Droid Sans Mono\",\"DejaVu Sans Mono\",monospace;font-weight:400;color:rgba(0,0,0,.9)}\r\nul,ol,dl{font-size:1em;line-height:1.6;margin-bottom:1.25em;list-style-position:outside;font-family:inherit}\r\nul,ol{margin-left:1.5em}\r\nul li ul,ul li ol{margin-left:1.25em;margin-bottom:0;font-size:1em}\r\nul.square li ul,ul.circle li ul,ul.disc li ul{list-style:inherit}\r\nul.square{list-style-type:square}\r\nul.circle{list-style-type:circle}\r\nul.disc{list-style-type:disc}\r\nol li ul,ol li ol{margin-left:1.25em;margin-bottom:0}\r\ndl dt{margin-bottom:.3125em;font-weight:bold}\r\ndl dd{margin-bottom:1.25em}\r\nabbr,acronym{text-transform:uppercase;font-size:90%;color:rgba(0,0,0,.8);border-bottom:1px dotted #ddd;cursor:help}\r\nabbr{text-transform:none}\r\nblockquote{margin:0 0 1.25em;padding:.5625em 1.25em 0 1.1875em;border-left:1px solid #ddd}\r\nblockquote cite{display:block;font-size:.9375em;color:rgba(0,0,0,.6)}\r\nblockquote cite:before{content:\"\\2014 \\0020\"}\r\nblockquote cite a,blockquote cite a:visited{color:rgba(0,0,0,.6)}\r\nblockquote,blockquote p{line-height:1.6;color:rgba(0,0,0,.85)}\r\n@media only screen and (min-width:768px){h1,h2,h3,#toctitle,.sidebarblock>.content>.title,h4,h5,h6{line-height:1.2}\r\nh1{font-size:2.75em}\r\nh2{font-size:2.3125em}\r\nh3,#toctitle,.sidebarblock>.content>.title{font-size:1.6875em}\r\nh4{font-size:1.4375em}}\r\ntable{background:#fff;margin-bottom:1.25em;border:solid 1px #dedede}\r\ntable thead,table tfoot{background:#f7f8f7;font-weight:bold}\r\ntable thead tr th,table thead tr td,table tfoot tr th,table tfoot tr td{padding:.5em .625em .625em;font-size:inherit;color:rgba(0,0,0,.8);text-align:left}\r\ntable tr th,table tr td{padding:.5625em .625em;font-size:inherit;color:rgba(0,0,0,.8)}\r\ntable tr.even,table tr.alt,table tr:nth-of-type(even){background:#f8f8f7}\r\ntable thead tr th,table tfoot tr th,table tbody tr td,table tr td,table tfoot tr td{display:table-cell;line-height:1.6}\r\nh1,h2,h3,#toctitle,.sidebarblock>.content>.title,h4,h5,h6{line-height:1.2;word-spacing:-.05em}\r\nh1 strong,h2 strong,h3 strong,#toctitle strong,.sidebarblock>.content>.title strong,h4 strong,h5 strong,h6 strong{font-weight:400}\r\n.clearfix:before,.clearfix:after,.float-group:before,.float-group:after{content:\" \";display:table}\r\n.clearfix:after,.float-group:after{clear:both}\r\n*:not(pre)>code{font-size:.9375em;font-style:normal!important;letter-spacing:0;padding:.1em .5ex;word-spacing:-.15em;background-color:#f7f7f8;-webkit-border-radius:4px;border-radius:4px;line-height:1.45;text-rendering:optimizeSpeed;word-wrap:break-word}\r\n*:not(pre)>code.nobreak{word-wrap:normal}\r\n*:not(pre)>code.nowrap{white-space:nowrap}\r\npre,pre>code{line-height:1.45;color:rgba(0,0,0,.9);font-family:\"Droid Sans Mono\",\"DejaVu Sans Mono\",monospace;font-weight:400;text-rendering:optimizeSpeed}\r\nem em{font-style:normal}\r\nstrong strong{font-weight:400}\r\n.keyseq{color:rgba(51,51,51,.8)}\r\nkbd{font-family:\"Droid Sans Mono\",\"DejaVu Sans Mono\",monospace;display:inline-block;color:rgba(0,0,0,.8);font-size:.65em;line-height:1.45;background-color:#f7f7f7;border:1px solid #ccc;-webkit-border-radius:3px;border-radius:3px;-webkit-box-shadow:0 1px 0 rgba(0,0,0,.2),0 0 0 .1em white inset;box-shadow:0 1px 0 rgba(0,0,0,.2),0 0 0 .1em #fff inset;margin:0 .15em;padding:.2em .5em;vertical-align:middle;position:relative;top:-.1em;white-space:nowrap}\r\n.keyseq kbd:first-child{margin-left:0}\r\n.keyseq kbd:last-child{margin-right:0}\r\n.menuseq,.menuref{color:#000}\r\n.menuseq b:not(.caret),.menuref{font-weight:inherit}\r\n.menuseq{word-spacing:-.02em}\r\n.menuseq b.caret{font-size:1.25em;line-height:.8}\r\n.menuseq i.caret{font-weight:bold;text-align:center;width:.45em}\r\nb.button:before,b.button:after{position:relative;top:-1px;font-weight:400}\r\nb.button:before{content:\"[\";padding:0 3px 0 2px}\r\nb.button:after{content:\"]\";padding:0 2px 0 3px}\r\np a>code:hover{color:rgba(0,0,0,.9)}\r\n#header,#content,#footnotes,#footer{width:100%;margin-left:auto;margin-right:auto;margin-top:0;margin-bottom:0;max-width:62.5em;*zoom:1;position:relative;padding-left:.9375em;padding-right:.9375em}\r\n#header:before,#header:after,#content:before,#content:after,#footnotes:before,#footnotes:after,#footer:before,#footer:after{content:\" \";display:table}\r\n#header:after,#content:after,#footnotes:after,#footer:after{clear:both}\r\n#content{margin-top:1.25em}\r\n#content:before{content:none}\r\n#header>h1:first-child{color:rgba(0,0,0,.85);margin-top:2.25rem;margin-bottom:0}\r\n#header>h1:first-child+#toc{margin-top:8px;border-top:1px solid #ddddd8}\r\n#header>h1:only-child,body.toc2 #header>h1:nth-last-child(2){border-bottom:1px solid #ddddd8;padding-bottom:8px}\r\n#header .details{border-bottom:1px solid #ddddd8;line-height:1.45;padding-top:.25em;padding-bottom:.25em;padding-left:.25em;color:rgba(0,0,0,.6);display:-ms-flexbox;display:-webkit-flex;display:flex;-ms-flex-flow:row wrap;-webkit-flex-flow:row wrap;flex-flow:row wrap}\r\n#header .details span:first-child{margin-left:-.125em}\r\n#header .details span.email a{color:rgba(0,0,0,.85)}\r\n#header .details br{display:none}\r\n#header .details br+span:before{content:\"\\00a0\\2013\\00a0\"}\r\n#header .details br+span.author:before{content:\"\\00a0\\22c5\\00a0\";color:rgba(0,0,0,.85)}\r\n#header .details br+span#revremark:before{content:\"\\00a0|\\00a0\"}\r\n#header #revnumber{text-transform:capitalize}\r\n#header #revnumber:after{content:\"\\00a0\"}\r\n#content>h1:first-child:not([class]){color:rgba(0,0,0,.85);border-bottom:1px solid #ddddd8;padding-bottom:8px;margin-top:0;padding-top:1rem;margin-bottom:1.25rem}\r\n#toc{border-bottom:1px solid #efefed;padding-bottom:.5em}\r\n#toc>ul{margin-left:.125em}\r\n#toc ul.sectlevel0>li>a{font-style:italic}\r\n#toc ul.sectlevel0 ul.sectlevel1{margin:.5em 0}\r\n#toc ul{font-family:\"Open Sans\",\"DejaVu Sans\",sans-serif;list-style-type:none}\r\n#toc li{line-height:1.3334;margin-top:.3334em}\r\n#toc a{text-decoration:none}\r\n#toc a:active{text-decoration:underline}\r\n#toctitle{color:#7a2518;font-size:1.2em}\r\n@media only screen and (min-width:768px){#toctitle{font-size:1.375em}\r\nbody.toc2{padding-left:15em;padding-right:0}\r\n#toc.toc2{margin-top:0!important;background-color:#f8f8f7;position:fixed;width:15em;left:0;top:0;border-right:1px solid #efefed;border-top-width:0!important;border-bottom-width:0!important;z-index:1000;padding:1.25em 1em;height:100%;overflow:auto}\r\n#toc.toc2 #toctitle{margin-top:0;margin-bottom:.8rem;font-size:1.2em}\r\n#toc.toc2>ul{font-size:.9em;margin-bottom:0}\r\n#toc.toc2 ul ul{margin-left:0;padding-left:1em}\r\n#toc.toc2 ul.sectlevel0 ul.sectlevel1{padding-left:0;margin-top:.5em;margin-bottom:.5em}\r\nbody.toc2.toc-right{padding-left:0;padding-right:15em}\r\nbody.toc2.toc-right #toc.toc2{border-right-width:0;border-left:1px solid #efefed;left:auto;right:0}}\r\n@media only screen and (min-width:1280px){body.toc2{padding-left:20em;padding-right:0}\r\n#toc.toc2{width:20em}\r\n#toc.toc2 #toctitle{font-size:1.375em}\r\n#toc.toc2>ul{font-size:.95em}\r\n#toc.toc2 ul ul{padding-left:1.25em}\r\nbody.toc2.toc-right{padding-left:0;padding-right:20em}}\r\n#content #toc{border-style:solid;border-width:1px;border-color:#e0e0dc;margin-bottom:1.25em;padding:1.25em;background:#f8f8f7;-webkit-border-radius:4px;border-radius:4px}\r\n#content #toc>:first-child{margin-top:0}\r\n#content #toc>:last-child{margin-bottom:0}\r\n#footer{max-width:100%;background-color:rgba(0,0,0,.8);padding:1.25em}\r\n#footer-text{color:rgba(255,255,255,.8);line-height:1.44}\r\n.sect1{padding-bottom:.625em}\r\n@media only screen and (min-width:768px){.sect1{padding-bottom:1.25em}}\r\n.sect1+.sect1{border-top:1px solid #efefed}\r\n#content h1>a.anchor,h2>a.anchor,h3>a.anchor,#toctitle>a.anchor,.sidebarblock>.content>.title>a.anchor,h4>a.anchor,h5>a.anchor,h6>a.anchor{position:absolute;z-index:1001;width:1.5ex;margin-left:-1.5ex;display:block;text-decoration:none!important;visibility:hidden;text-align:center;font-weight:400}\r\n#content h1>a.anchor:before,h2>a.anchor:before,h3>a.anchor:before,#toctitle>a.anchor:before,.sidebarblock>.content>.title>a.anchor:before,h4>a.anchor:before,h5>a.anchor:before,h6>a.anchor:before{content:\"\\00A7\";font-size:.85em;display:block;padding-top:.1em}\r\n#content h1:hover>a.anchor,#content h1>a.anchor:hover,h2:hover>a.anchor,h2>a.anchor:hover,h3:hover>a.anchor,#toctitle:hover>a.anchor,.sidebarblock>.content>.title:hover>a.anchor,h3>a.anchor:hover,#toctitle>a.anchor:hover,.sidebarblock>.content>.title>a.anchor:hover,h4:hover>a.anchor,h4>a.anchor:hover,h5:hover>a.anchor,h5>a.anchor:hover,h6:hover>a.anchor,h6>a.anchor:hover{visibility:visible}\r\n#content h1>a.link,h2>a.link,h3>a.link,#toctitle>a.link,.sidebarblock>.content>.title>a.link,h4>a.link,h5>a.link,h6>a.link{color:#ba3925;text-decoration:none}\r\n#content h1>a.link:hover,h2>a.link:hover,h3>a.link:hover,#toctitle>a.link:hover,.sidebarblock>.content>.title>a.link:hover,h4>a.link:hover,h5>a.link:hover,h6>a.link:hover{color:#a53221}\r\n.audioblock,.imageblock,.literalblock,.listingblock,.stemblock,.videoblock{margin-bottom:1.25em}\r\n.admonitionblock td.content>.title,.audioblock>.title,.exampleblock>.title,.imageblock>.title,.listingblock>.title,.literalblock>.title,.stemblock>.title,.openblock>.title,.paragraph>.title,.quoteblock>.title,table.tableblock>.title,.verseblock>.title,.videoblock>.title,.dlist>.title,.olist>.title,.ulist>.title,.qlist>.title,.hdlist>.title{text-rendering:optimizeLegibility;text-align:left;font-family:\"Noto Serif\",\"DejaVu Serif\",serif;font-size:1rem;font-style:italic}\r\ntable.tableblock>caption.title{white-space:nowrap;overflow:visible;max-width:0}\r\n.paragraph.lead>p,#preamble>.sectionbody>.paragraph:first-of-type p{color:rgba(0,0,0,.85)}\r\ntable.tableblock #preamble>.sectionbody>.paragraph:first-of-type p{font-size:inherit}\r\n.admonitionblock>table{border-collapse:separate;border:0;background:none;width:100%}\r\n.admonitionblock>table td.icon{text-align:center;width:80px}\r\n.admonitionblock>table td.icon img{max-width:initial}\r\n.admonitionblock>table td.icon .title{font-weight:bold;font-family:\"Open Sans\",\"DejaVu Sans\",sans-serif;text-transform:uppercase}\r\n.admonitionblock>table td.content{padding-left:1.125em;padding-right:1.25em;border-left:1px solid #ddddd8;color:rgba(0,0,0,.6)}\r\n.admonitionblock>table td.content>:last-child>:last-child{margin-bottom:0}\r\n.exampleblock>.content{border-style:solid;border-width:1px;border-color:#e6e6e6;margin-bottom:1.25em;padding:1.25em;background:#fff;-webkit-border-radius:4px;border-radius:4px}\r\n.exampleblock>.content>:first-child{margin-top:0}\r\n.exampleblock>.content>:last-child{margin-bottom:0}\r\n.sidebarblock{border-style:solid;border-width:1px;border-color:#e0e0dc;margin-bottom:1.25em;padding:1.25em;background:#f8f8f7;-webkit-border-radius:4px;border-radius:4px}\r\n.sidebarblock>:first-child{margin-top:0}\r\n.sidebarblock>:last-child{margin-bottom:0}\r\n.sidebarblock>.content>.title{color:#7a2518;margin-top:0;text-align:center}\r\n.exampleblock>.content>:last-child>:last-child,.exampleblock>.content .olist>ol>li:last-child>:last-child,.exampleblock>.content .ulist>ul>li:last-child>:last-child,.exampleblock>.content .qlist>ol>li:last-child>:last-child,.sidebarblock>.content>:last-child>:last-child,.sidebarblock>.content .olist>ol>li:last-child>:last-child,.sidebarblock>.content .ulist>ul>li:last-child>:last-child,.sidebarblock>.content .qlist>ol>li:last-child>:last-child{margin-bottom:0}\r\n.literalblock pre,.listingblock pre:not(.highlight),.listingblock pre[class=\"highlight\"],.listingblock pre[class^=\"highlight \"],.listingblock pre.CodeRay,.listingblock pre.prettyprint{background:#f7f7f8}\r\n.sidebarblock .literalblock pre,.sidebarblock .listingblock pre:not(.highlight),.sidebarblock .listingblock pre[class=\"highlight\"],.sidebarblock .listingblock pre[class^=\"highlight \"],.sidebarblock .listingblock pre.CodeRay,.sidebarblock .listingblock pre.prettyprint{background:#f2f1f1}\r\n.literalblock pre,.literalblock pre[class],.listingblock pre,.listingblock pre[class]{-webkit-border-radius:4px;border-radius:4px;word-wrap:break-word;padding:1em;font-size:.8125em}\r\n.literalblock pre.nowrap,.literalblock pre[class].nowrap,.listingblock pre.nowrap,.listingblock pre[class].nowrap{overflow-x:auto;white-space:pre;word-wrap:normal}\r\n@media only screen and (min-width:768px){.literalblock pre,.literalblock pre[class],.listingblock pre,.listingblock pre[class]{font-size:.90625em}}\r\n@media only screen and (min-width:1280px){.literalblock pre,.literalblock pre[class],.listingblock pre,.listingblock pre[class]{font-size:1em}}\r\n.literalblock.output pre{color:#f7f7f8;background-color:rgba(0,0,0,.9)}\r\n.listingblock pre.highlightjs{padding:0}\r\n.listingblock pre.highlightjs>code{padding:1em;-webkit-border-radius:4px;border-radius:4px}\r\n.listingblock pre.prettyprint{border-width:0}\r\n.listingblock>.content{position:relative}\r\n.listingblock code[data-lang]:before{display:none;content:attr(data-lang);position:absolute;font-size:.75em;top:.425rem;right:.5rem;line-height:1;text-transform:uppercase;color:#999}\r\n.listingblock:hover code[data-lang]:before{display:block}\r\n.listingblock.terminal pre .command:before{content:attr(data-prompt);padding-right:.5em;color:#999}\r\n.listingblock.terminal pre .command:not([data-prompt]):before{content:\"$\"}\r\ntable.pyhltable{border-collapse:separate;border:0;margin-bottom:0;background:none}\r\ntable.pyhltable td{vertical-align:top;padding-top:0;padding-bottom:0;line-height:1.45}\r\ntable.pyhltable td.code{padding-left:.75em;padding-right:0}\r\npre.pygments .lineno,table.pyhltable td:not(.code){color:#999;padding-left:0;padding-right:.5em;border-right:1px solid #ddddd8}\r\npre.pygments .lineno{display:inline-block;margin-right:.25em}\r\ntable.pyhltable .linenodiv{background:none!important;padding-right:0!important}\r\n.quoteblock{margin:0 1em 1.25em 1.5em;display:table}\r\n.quoteblock>.title{margin-left:-1.5em;margin-bottom:.75em}\r\n.quoteblock blockquote,.quoteblock blockquote p{color:rgba(0,0,0,.85);font-size:1.15rem;line-height:1.75;word-spacing:.1em;letter-spacing:0;font-style:italic;text-align:justify}\r\n.quoteblock blockquote{margin:0;padding:0;border:0}\r\n.quoteblock blockquote:before{content:\"\\201c\";float:left;font-size:2.75em;font-weight:bold;line-height:.6em;margin-left:-.6em;color:#7a2518;text-shadow:0 1px 2px rgba(0,0,0,.1)}\r\n.quoteblock blockquote>.paragraph:last-child p{margin-bottom:0}\r\n.quoteblock .attribution{margin-top:.5em;margin-right:.5ex;text-align:right}\r\n.quoteblock .quoteblock{margin-left:0;margin-right:0;padding:.5em 0;border-left:3px solid rgba(0,0,0,.6)}\r\n.quoteblock .quoteblock blockquote{padding:0 0 0 .75em}\r\n.quoteblock .quoteblock blockquote:before{display:none}\r\n.verseblock{margin:0 1em 1.25em 1em}\r\n.verseblock pre{font-family:\"Open Sans\",\"DejaVu Sans\",sans;font-size:1.15rem;color:rgba(0,0,0,.85);font-weight:300;text-rendering:optimizeLegibility}\r\n.verseblock pre strong{font-weight:400}\r\n.verseblock .attribution{margin-top:1.25rem;margin-left:.5ex}\r\n.quoteblock .attribution,.verseblock .attribution{font-size:.9375em;line-height:1.45;font-style:italic}\r\n.quoteblock .attribution br,.verseblock .attribution br{display:none}\r\n.quoteblock .attribution cite,.verseblock .attribution cite{display:block;letter-spacing:-.025em;color:rgba(0,0,0,.6)}\r\n.quoteblock.abstract{margin:0 0 1.25em 0;display:block}\r\n.quoteblock.abstract blockquote,.quoteblock.abstract blockquote p{text-align:left;word-spacing:0}\r\n.quoteblock.abstract blockquote:before,.quoteblock.abstract blockquote p:first-of-type:before{display:none}\r\ntable.tableblock{max-width:100%;border-collapse:separate}\r\ntable.tableblock td>.paragraph:last-child p>p:last-child,table.tableblock th>p:last-child,table.tableblock td>p:last-child{margin-bottom:0}\r\ntable.tableblock,th.tableblock,td.tableblock{border:0 solid #dedede}\r\ntable.grid-all>thead>tr>.tableblock,table.grid-all>tbody>tr>.tableblock{border-width:0 1px 1px 0}\r\ntable.grid-all>tfoot>tr>.tableblock{border-width:1px 1px 0 0}\r\ntable.grid-cols>*>tr>.tableblock{border-width:0 1px 0 0}\r\ntable.grid-rows>thead>tr>.tableblock,table.grid-rows>tbody>tr>.tableblock{border-width:0 0 1px 0}\r\ntable.grid-rows>tfoot>tr>.tableblock{border-width:1px 0 0 0}\r\ntable.grid-all>*>tr>.tableblock:last-child,table.grid-cols>*>tr>.tableblock:last-child{border-right-width:0}\r\ntable.grid-all>tbody>tr:last-child>.tableblock,table.grid-all>thead:last-child>tr>.tableblock,table.grid-rows>tbody>tr:last-child>.tableblock,table.grid-rows>thead:last-child>tr>.tableblock{border-bottom-width:0}\r\ntable.frame-all{border-width:1px}\r\ntable.frame-sides{border-width:0 1px}\r\ntable.frame-topbot{border-width:1px 0}\r\nth.halign-left,td.halign-left{text-align:left}\r\nth.halign-right,td.halign-right{text-align:right}\r\nth.halign-center,td.halign-center{text-align:center}\r\nth.valign-top,td.valign-top{vertical-align:top}\r\nth.valign-bottom,td.valign-bottom{vertical-align:bottom}\r\nth.valign-middle,td.valign-middle{vertical-align:middle}\r\ntable thead th,table tfoot th{font-weight:bold}\r\ntbody tr th{display:table-cell;line-height:1.6;background:#f7f8f7}\r\ntbody tr th,tbody tr th p,tfoot tr th,tfoot tr th p{color:rgba(0,0,0,.8);font-weight:bold}\r\np.tableblock>code:only-child{background:none;padding:0}\r\np.tableblock{font-size:1em}\r\ntd>div.verse{white-space:pre}\r\nol{margin-left:1.75em}\r\nul li ol{margin-left:1.5em}\r\ndl dd{margin-left:1.125em}\r\ndl dd:last-child,dl dd:last-child>:last-child{margin-bottom:0}\r\nol>li p,ul>li p,ul dd,ol dd,.olist .olist,.ulist .ulist,.ulist .olist,.olist .ulist{margin-bottom:.625em}\r\nul.checklist,ul.none,ol.none,ul.no-bullet,ol.no-bullet,ol.unnumbered,ul.unstyled,ol.unstyled{list-style-type:none}\r\nul.no-bullet,ol.no-bullet,ol.unnumbered{margin-left:.625em}\r\nul.unstyled,ol.unstyled{margin-left:0}\r\nul.checklist{margin-left:.625em}\r\nul.checklist li>p:first-child>.fa-square-o:first-child,ul.checklist li>p:first-child>.fa-check-square-o:first-child{width:1.25em;font-size:.8em;position:relative;bottom:.125em}\r\nul.checklist li>p:first-child>input[type=\"checkbox\"]:first-child{margin-right:.25em}\r\nul.inline{margin:0 auto .625em auto;margin-left:-1.375em;margin-right:0;padding:0;list-style:none;overflow:hidden}\r\nul.inline>li{list-style:none;float:left;margin-left:1.375em;display:block}\r\nul.inline>li>*{display:block}\r\n.unstyled dl dt{font-weight:400;font-style:normal}\r\nol.arabic{list-style-type:decimal}\r\nol.decimal{list-style-type:decimal-leading-zero}\r\nol.loweralpha{list-style-type:lower-alpha}\r\nol.upperalpha{list-style-type:upper-alpha}\r\nol.lowerroman{list-style-type:lower-roman}\r\nol.upperroman{list-style-type:upper-roman}\r\nol.lowergreek{list-style-type:lower-greek}\r\n.hdlist>table,.colist>table{border:0;background:none}\r\n.hdlist>table>tbody>tr,.colist>table>tbody>tr{background:none}\r\ntd.hdlist1,td.hdlist2{vertical-align:top;padding:0 .625em}\r\ntd.hdlist1{font-weight:bold;padding-bottom:1.25em}\r\n.literalblock+.colist,.listingblock+.colist{margin-top:-.5em}\r\n.colist>table tr>td:first-of-type{padding:.4em .75em 0 .75em;line-height:1;vertical-align:top}\r\n.colist>table tr>td:first-of-type img{max-width:initial}\r\n.colist>table tr>td:last-of-type{padding:.25em 0}\r\n.thumb,.th{line-height:0;display:inline-block;border:solid 4px #fff;-webkit-box-shadow:0 0 0 1px #ddd;box-shadow:0 0 0 1px #ddd}\r\n.imageblock.left,.imageblock[style*=\"float: left\"]{margin:.25em .625em 1.25em 0}\r\n.imageblock.right,.imageblock[style*=\"float: right\"]{margin:.25em 0 1.25em .625em}\r\n.imageblock>.title{margin-bottom:0}\r\n.imageblock.thumb,.imageblock.th{border-width:6px}\r\n.imageblock.thumb>.title,.imageblock.th>.title{padding:0 .125em}\r\n.image.left,.image.right{margin-top:.25em;margin-bottom:.25em;display:inline-block;line-height:0}\r\n.image.left{margin-right:.625em}\r\n.image.right{margin-left:.625em}\r\na.image{text-decoration:none;display:inline-block}\r\na.image object{pointer-events:none}\r\nsup.footnote,sup.footnoteref{font-size:.875em;position:static;vertical-align:super}\r\nsup.footnote a,sup.footnoteref a{text-decoration:none}\r\nsup.footnote a:active,sup.footnoteref a:active{text-decoration:underline}\r\n#footnotes{padding-top:.75em;padding-bottom:.75em;margin-bottom:.625em}\r\n#footnotes hr{width:20%;min-width:6.25em;margin:-.25em 0 .75em 0;border-width:1px 0 0 0}\r\n#footnotes .footnote{padding:0 .375em 0 .225em;line-height:1.3334;font-size:.875em;margin-left:1.2em;text-indent:-1.05em;margin-bottom:.2em}\r\n#footnotes .footnote a:first-of-type{font-weight:bold;text-decoration:none}\r\n#footnotes .footnote:last-of-type{margin-bottom:0}\r\n#content #footnotes{margin-top:-.625em;margin-bottom:0;padding:.75em 0}\r\n.gist .file-data>table{border:0;background:#fff;width:100%;margin-bottom:0}\r\n.gist .file-data>table td.line-data{width:99%}\r\ndiv.unbreakable{page-break-inside:avoid}\r\n.big{font-size:larger}\r\n.small{font-size:smaller}\r\n.underline{text-decoration:underline}\r\n.overline{text-decoration:overline}\r\n.line-through{text-decoration:line-through}\r\n.aqua{color:#00bfbf}\r\n.aqua-background{background-color:#00fafa}\r\n.black{color:#000}\r\n.black-background{background-color:#000}\r\n.blue{color:#0000bf}\r\n.blue-background{background-color:#0000fa}\r\n.fuchsia{color:#bf00bf}\r\n.fuchsia-background{background-color:#fa00fa}\r\n.gray{color:#606060}\r\n.gray-background{background-color:#7d7d7d}\r\n.green{color:#006000}\r\n.green-background{background-color:#007d00}\r\n.lime{color:#00bf00}\r\n.lime-background{background-color:#00fa00}\r\n.maroon{color:#600000}\r\n.maroon-background{background-color:#7d0000}\r\n.navy{color:#000060}\r\n.navy-background{background-color:#00007d}\r\n.olive{color:#606000}\r\n.olive-background{background-color:#7d7d00}\r\n.purple{color:#600060}\r\n.purple-background{background-color:#7d007d}\r\n.red{color:#bf0000}\r\n.red-background{background-color:#fa0000}\r\n.silver{color:#909090}\r\n.silver-background{background-color:#bcbcbc}\r\n.teal{color:#006060}\r\n.teal-background{background-color:#007d7d}\r\n.white{color:#bfbfbf}\r\n.white-background{background-color:#fafafa}\r\n.yellow{color:#bfbf00}\r\n.yellow-background{background-color:#fafa00}\r\nspan.icon>.fa{cursor:default}\r\na span.icon>.fa{cursor:inherit}\r\n.admonitionblock td.icon [class^=\"fa icon-\"]{font-size:2.5em;text-shadow:1px 1px 2px rgba(0,0,0,.5);cursor:default}\r\n.admonitionblock td.icon .icon-note:before{content:\"\\f05a\";color:#19407c}\r\n.admonitionblock td.icon .icon-tip:before{content:\"\\f0eb\";text-shadow:1px 1px 2px rgba(155,155,0,.8);color:#111}\r\n.admonitionblock td.icon .icon-warning:before{content:\"\\f071\";color:#bf6900}\r\n.admonitionblock td.icon .icon-caution:before{content:\"\\f06d\";color:#bf3400}\r\n.admonitionblock td.icon .icon-important:before{content:\"\\f06a\";color:#bf0000}\r\n.conum[data-value]{display:inline-block;color:#fff!important;background-color:rgba(0,0,0,.8);-webkit-border-radius:100px;border-radius:100px;text-align:center;font-size:.75em;width:1.67em;height:1.67em;line-height:1.67em;font-family:\"Open Sans\",\"DejaVu Sans\",sans-serif;font-style:normal;font-weight:bold}\r\n.conum[data-value] *{color:#fff!important}\r\n.conum[data-value]+b{display:none}\r\n.conum[data-value]:after{content:attr(data-value)}\r\npre .conum[data-value]{position:relative;top:-.125em}\r\nb.conum *{color:inherit!important}\r\n.conum:not([data-value]):empty{display:none}\r\ndt,th.tableblock,td.content,div.footnote{text-rendering:optimizeLegibility}\r\nh1,h2,p,td.content,span.alt{letter-spacing:-.01em}\r\np strong,td.content strong,div.footnote strong{letter-spacing:-.005em}\r\np,blockquote,dt,td.content,span.alt{font-size:1.0625rem}\r\np{margin-bottom:1.25rem}\r\n.sidebarblock p,.sidebarblock dt,.sidebarblock td.content,p.tableblock{font-size:1em}\r\n.exampleblock>.content{background-color:#fffef7;border-color:#e0e0dc;-webkit-box-shadow:0 1px 4px #e0e0dc;box-shadow:0 1px 4px #e0e0dc}\r\n.print-only{display:none!important}\r\n@media print{@page{margin:1.25cm .75cm}\r\n*{-webkit-box-shadow:none!important;box-shadow:none!important;text-shadow:none!important}\r\na{color:inherit!important;text-decoration:underline!important}\r\na.bare,a[href^=\"#\"],a[href^=\"mailto:\"]{text-decoration:none!important}\r\na[href^=\"http:\"]:not(.bare):after,a[href^=\"https:\"]:not(.bare):after{content:\"(\" attr(href) \")\";display:inline-block;font-size:.875em;padding-left:.25em}\r\nabbr[title]:after{content:\" (\" attr(title) \")\"}\r\npre,blockquote,tr,img,object,svg{page-break-inside:avoid}\r\nthead{display:table-header-group}\r\nsvg{max-width:100%}\r\np,blockquote,dt,td.content{font-size:1em;orphans:3;widows:3}\r\nh2,h3,#toctitle,.sidebarblock>.content>.title{page-break-after:avoid}\r\n#toc,.sidebarblock,.exampleblock>.content{background:none!important}\r\n#toc{border-bottom:1px solid #ddddd8!important;padding-bottom:0!important}\r\n.sect1{padding-bottom:0!important}\r\n.sect1+.sect1{border:0!important}\r\n#header>h1:first-child{margin-top:1.25rem}\r\nbody.book #header{text-align:center}\r\nbody.book #header>h1:first-child{border:0!important;margin:2.5em 0 1em 0}\r\nbody.book #header .details{border:0!important;display:block;padding:0!important}\r\nbody.book #header .details span:first-child{margin-left:0!important}\r\nbody.book #header .details br{display:block}\r\nbody.book #header .details br+span:before{content:none!important}\r\nbody.book #toc{border:0!important;text-align:left!important;padding:0!important;margin:0!important}\r\nbody.book #toc,body.book #preamble,body.book h1.sect0,body.book .sect1>h2{page-break-before:always}\r\n.listingblock code[data-lang]:before{display:block}\r\n#footer{background:none!important;padding:0 .9375em}\r\n#footer-text{color:rgba(0,0,0,.6)!important;font-size:.9em}\r\n.hide-on-print{display:none!important}\r\n.print-only{display:block!important}\r\n.hide-for-print{display:none!important}\r\n.show-for-print{display:inherit!important}}\r\n\r\n      </style>\r\n      <link href=\'https://fonts.googleapis.com/css?family=Noto+Serif\' rel=\'stylesheet\' type=\'text/css\'>\r\n      <link href=\'https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic\' rel=\'stylesheet\' type=\'text/css\'>\r\n      <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\">\r\n      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/default.min.css\">\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/highlight.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/asciidoc.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/yaml.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/dockerfile.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/makefile.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/go.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/rust.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/haskell.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/typescript.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/scss.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/less.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/handlebars.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/groovy.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/scala.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/bash.min.js\"></script>\r\n      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/languages/ini.min.js\"></script>\r\n      <script>hljs.initHighlightingOnLoad();</script>\r\n    </head>\r\n    <body>\r\n      <div id=\"wrapper\">\r\n        <div class=\"article\">\r\n          <div class=\"sect5\">\r\n<h6 id=\"_この練習問題で使用するテーブル\">この練習問題で使用するテーブル</h6>\r\n<div id=\"__asciidoctor-preview-1__\" class=\"paragraph\">\r\n<p>図書管理システムで使用するデータベースを例にとって考えてみましょう。</p>\r\n</div>\r\n<div id=\"__asciidoctor-preview-2__\" class=\"paragraph\">\r\n<p><strong>図書テーブル</strong></p>\r\n</div>\r\n<table id=\"__asciidoctor-preview-3__\" class=\"tableblock frame-all grid-all spread\">\r\n<colgroup>\r\n<col style=\"width: 16.6666%;\">\r\n<col style=\"width: 16.6666%;\">\r\n<col style=\"width: 16.6666%;\">\r\n<col style=\"width: 16.6666%;\">\r\n<col style=\"width: 16.6666%;\">\r\n<col style=\"width: 16.667%;\">\r\n</colgroup>\r\n<thead>\r\n<tr>\r\n<th class=\"tableblock halign-left valign-top\">書誌番号</th>\r\n<th class=\"tableblock halign-left valign-top\">タイトル</th>\r\n<th class=\"tableblock halign-left valign-top\">著者名</th>\r\n<th class=\"tableblock halign-left valign-top\">出版年</th>\r\n<th class=\"tableblock halign-left valign-top\">資料区分番号</th>\r\n<th class=\"tableblock halign-left valign-top\">分類番号</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">112194</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">ホーキング、宇宙を語る</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">スティーヴン・ウィリアム・ホーキング</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1988</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">4</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">114541</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">精霊の守り人</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">上橋　菜穂子</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1996</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">141970</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">コンピュータはなぜ動くのか</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">矢沢　久雄</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2003</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">NULL</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">215867</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">怖い絵</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">中野　京子</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2013</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">7</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">246637</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">鹿の王　上</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">上橋　菜穂子</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2014</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">246638</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">鹿の王　下</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">上橋　菜穂子</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2014</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">247998</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">火花</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">又吉　直樹</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2015</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">272096</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">銀河鉄道の夜</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">宮沢　賢治</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2016</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">155527</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">すばる　2018年8月号</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">NULL</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2018</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">174040</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">Newton　2018年8月号</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">NULL</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2018</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">4</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">180325</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">銀河鉄道の夜</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">杉井　ギサブロー</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1985</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">3</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">7</p></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div id=\"__asciidoctor-preview-4__\" class=\"paragraph\">\r\n<p><strong>資料区分テーブル</strong></p>\r\n</div>\r\n<table id=\"__asciidoctor-preview-5__\" class=\"tableblock frame-all grid-all spread\">\r\n<colgroup>\r\n<col style=\"width: 50%;\">\r\n<col style=\"width: 50%;\">\r\n</colgroup>\r\n<thead>\r\n<tr>\r\n<th class=\"tableblock halign-left valign-top\">資料区分番号</th>\r\n<th class=\"tableblock halign-left valign-top\">資料区分名</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">図書</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">雑誌</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">3</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">視聴覚資料</p></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div id=\"__asciidoctor-preview-6__\" class=\"paragraph\">\r\n<p><strong>分類テーブル</strong></p>\r\n</div>\r\n<table id=\"__asciidoctor-preview-7__\" class=\"tableblock frame-all grid-all spread\">\r\n<colgroup>\r\n<col style=\"width: 50%;\">\r\n<col style=\"width: 50%;\">\r\n</colgroup>\r\n<thead>\r\n<tr>\r\n<th class=\"tableblock halign-left valign-top\">分類番号</th>\r\n<th class=\"tableblock halign-left valign-top\">分類名</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">1</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">哲学</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">2</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">歴史</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">3</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">社会科学</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">4</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">自然科学</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">5</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">技術工学</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">6</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">産業</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">7</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">芸術美術</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">8</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">言語</p></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">9</p></td>\r\n<td class=\"tableblock halign-left valign-top\"><p class=\"tableblock\">文学</p></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n        </div>\r\n      </div>\r\n    </body>\r\n  </html>\r\n', NULL, 999, '2018-08-05 12:31:04', 999, '2018-08-05 12:31:04');

-- --------------------------------------------------------

--
-- テーブルの構造 `text_no`
--

CREATE TABLE `text_no` (
  `section_id` int(11) NOT NULL,
  `text_id` int(11) NOT NULL,
  `no` int(11) DEFAULT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `text_no`
--

INSERT INTO `text_no` (`section_id`, `text_id`, `no`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 1, NULL, 999, '2018-08-08 18:20:45', 999, '2018-08-08 18:20:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`question_id`,`no`,`type`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `chapter_subject_id` (`subject_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `question_default`
--
ALTER TABLE `question_default`
  ADD PRIMARY KEY (`question_id`,`no`);

--
-- Indexes for table `question_no`
--
ALTER TABLE `question_no`
  ADD PRIMARY KEY (`section_id`,`question_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`text_id`);

--
-- Indexes for table `text_no`
--
ALTER TABLE `text_no`
  ADD PRIMARY KEY (`section_id`,`text_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `text`
--
ALTER TABLE `text`
  MODIFY `text_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
