<%@page import="com.newlecture.jspprj.model.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.jspprj.dao.jdbc.JdbcNoticeDao"%>
<%@page import="com.newlecture.jspprj.dao.NoticeDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="new" uri="http://www.newlecture.com/jsp/tags/control"%>
<%@taglib prefix="ui"  tagdir="/WEB-INF/tags" %>
<%
	int npage=1;
	String query="";
	String field="TITLE";

	String _page=request.getParameter("p");
	String _query = request.getParameter("q");
	String _field = request.getParameter("f");
	
	if(_page != null && !_page.equals(""))
		npage=Integer.parseInt(_page);
	
	if(_query != null && !_query.equals(""))
		query=_query;
	
	if( _field != null && ! _field.equals(""))
		field= _field;
	
	NoticeDao noticeDao = new JdbcNoticeDao();
	
   List<Notice> list = noticeDao.getNotices(npage, query, field);
   pageContext.setAttribute("list", list);
   pageContext.setAttribute("total", noticeDao.getSize(""));
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bind.css" rel="stylesheet" type="text/css" />
    <link href="css/notice.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="modernizr.js"></script>
</head>
<body>
    <header id="header">
        <div class="content-wrapper">
            <h1 id="logo"><a href="../index.html"><img src="../images/logo.png" alt="뉴렉처 온라인" /></a></h1>
            <section class="header-item-container">
                <h1 class="hidden">머리말</h1>
                <nav id="main-menu">
                    <h1 class="hidden">메인메뉴</h1>
                    <ul class="clearfix">
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">학습가이드</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">뉴렉과정</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">강좌선택</a></li>
                    </ul>
                </nav>

                <div id="lecture-search-form">
                    <h3 class="hidden">강좌검색 폼</h3>
                    <form>
                        <fieldset>
                            <legend class="hidden">검색필드</legend>
                            <label id="lecture-search-input-label" for="subject">과정검색</label>
                            <input id="lecture-search-input" class="g1" type="text" name="subject" />
                            <input id="lecture-search-button" type="submit" value="검색" />
                        </fieldset>
                    </form>
                </div>

                <nav id="member-menu">
                    <h1 class="hidden">회원메뉴</h1>
                    <ul class="clearfix">
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../index.html">홈</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../joinus/login.html">로그아웃</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../joinus/join.html">회원가입</a></li>                        
                    </ul>
                </nav>

                <nav id="my-menu">
                    <h1 class="hidden">고객센터메뉴</h1>
                    <ul class="clearfix">
                        <li class="my-menu-item"><a class="my-menu-item-text" href=""><img src="../images/txt-mypage.png" alt="마이페이지" /></a></li>
                        <li class="my-menu-item"><a class="my-menu-item-text" href="notice.html"><img src="../images/txt-customer.png" alt="고객센터" /></a></li>
                    </ul>
                </nav>
            </section>
        </div>
    </header>

    <div id="visual">
        <div class="content-wrapper">
            
        </div>
    </div>

    <div id="body">
        <div class="content-wrapper clearfix">            
            <aside class="aside-menu-group">
                <h1 class="aside-menu-group-title">고객센터</h1>

                <nav class="aside-main-menu">
                    <h1 class="hidden">고객센터 메뉴</h1>
                    <ul>
                        <li class="aside-menu-item"><a href="">공지사항</a></li>
                        <li class="aside-menu-item"><a href="">1:1고객문의</a></li>
                        <li class="aside-menu-item"><a href="">학습안내</a></li>
                    </ul>
                </nav>

                <nav class="aside-menu">
                    <h1>추천사이트</h1>
                    <ul class="aside-menu-list">
                        <li><img src="../images/answeris.png" alt="앤서이즈" /></li>
                        <li><img src="../images/w3c.png" alt="W3C" /></li>
                        <li><img src="../images/microsoft.png" alt="마이크로소프트" /></li>
                    </ul>
                </nav>

            </aside>

            <main id="main">                
                <h2 id="main-title">공지사항</h2>
                            
                <div id="breadcrumb">
                    <h3 class="hidden">현재경로</h3>
                    <ol>
                        <li class="breadcrumb-item">home</li>
                        <li class="breadcrumb-item">고객센터</li>
                        <li class="breadcrumb-item">공지사항</li>
                    </ol>
                </div>
                
                <div id="notice-search-container" class="space-top-l text-right">
                    <div id="search-form">
                        <h3 class="hidden">공지사항 검색 폼</h3>
                        <form action="notice.jsp" method="get">
                            <fieldset>
                                <legend class="hidden">공지사항 검색 필드</legend>
                                <label for="field" class="hidden">검색분류</label>
                                <select class="search-field" name="field">
                                    <option ${param.f== 'TITLE' ? 'selected' : ''} value="TITLE">제목</option>
                                    <option ${param.f== 'WRITER' ? 'selected' : '' } value="WRITER">작성자</option>
                                    <option ${param.f== 'CONTENT' ? 'selected' : '' } value=" CONTENT">내용</option>
                                </select>
                                <label name="f"  for="query" class="hidden">검색어필드</label>
                                <input class="search-input" type="text" name="q"  value="${param.q}"/>                         
                                      <input class="search-input" type="hidden" name="p"  value="1"/>
                                <input class="search-button" type="submit" value="검색" />
                            </fieldset>
                        </form>
                    </div>
                </div>

                <div class="board space-top">
                    <h3 class="hidden">공지사항 목록</h3>
                    
                    <table class="board-table">
                        <thead>
                            <tr class="board-row">
                                <th class="board-cell board-cell-hd num">번호</th>
                                <th class="board-cell board-cell-hd title title-hd">제목</th>
                                <th class="board-cell board-cell-hd writer">작성자</th>
                                <th class="board-cell board-cell-hd date">작성일</th>
                                <th class="board-cell board-cell-hd hit">조회수</th>
                            </tr>
                        </thead>
                        <%-- <% while (rs.next()) {%> --%>
               <c:forEach var="n" items="${list}">
               <tbody>
                  <tr class="board-row">
                     <td class="board-cell num">${n.code}</td>
                     <td class="board-cell title"><a
                        href="noticeDetail.jsp?c=${n.code}">${n.title}</a></td>
                     <td class="board-cell writer">${n.writer}</td>
                     <td class="board-cell date">${n.regdate}</td>
                     <td class="board-cell hit">${n.hit}</td>
                  </tr>
               </tbody>
               </c:forEach>
               <%-- <%} %> --%>
                    </table>                    
                </div>

                <div id="indexer-container" class=" space-top text-right">
                    <div id="indexer">
                        <h3 class="hidden">현재 페이지</h3>
                        <p><span class="text-highlight" id="s1">1</span>/2 page</p>
                    </div>
                </div>

                <div id="pager-container" class="space-top text-center">
                    <div class="pager">
                        <h3 class="hidden">페이저</h3>
                        <p class="pager-item"><img src="../images/btn-prev.png" alt="이전" /></p>
                       <ui:pager  total="
                       ${total}"/>
                        <p class="pager-item"><img src="../images/btn-next.png" alt="다음" /></p>
                    </div>
                </div>
            </main>            
        </div>     
    </div>

    <footer id="footer">
        <div class="content-wrapper clearfix">
            <div id="logo-footer-container">
                <h2 id="logo-footer"><img src="../images/logo-footer.png" alt="회사정보" /></h2>
            </div>
            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">소유자정보</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title item-newline">주소</dt>
                        <dd class="company-info-item item-data">서울특별시 동대문구</dd>
                        <dt class="company-info-item item-title item-newline">관리자메일</dt>
                        <dd class="company-info-item item-data">admin@newlecture.com</dd>
                        <dt class="company-info-item item-title">전화번호</dt>
                        <dd class="company-info-item item-data">02-111-0000</dd>
                        <dt class="company-info-item item-title item-newline">상호</dt>
                        <dd class="company-info-item item-data">뉴렉처</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">저작권정보</h3>
                    <p>Copyright@newlecture.com 2013-2015 ....</p>
                </div>
            </div>
        </div>
    </footer>

    <!--<aside id="quick-menu">
        <h1>QUICK MENU</h1>
        <nav>
            <h1>자주가는 메뉴</h1>
            <ul>
                <li>강의실</li>
                <li>채팅방</li>
                <li>스케줄</li>
            </ul>
        </nav>

        <nav>
            <h1>관리자 메뉴</h1>
            <p>QUICK MENU 관리하기</p>
        </nav>

        <nav>
            <h1>스크롤 메뉴</h1>
            <p>top</p>
        </nav>
    </aside>-->
</body>
</html>
