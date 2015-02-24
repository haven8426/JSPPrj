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
            <h1 id="logo"><a href="../index.html"><img src="../images/logo.png" alt="����ó �¶���" /></a></h1>
            <section class="header-item-container">
                <h1 class="hidden">�Ӹ���</h1>
                <nav id="main-menu">
                    <h1 class="hidden">���θ޴�</h1>
                    <ul class="clearfix">
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">�н����̵�</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">��������</a></li>
                        <li class="main-menu-item"><a class="main-menu-item-text" href="">���¼���</a></li>
                    </ul>
                </nav>

                <div id="lecture-search-form">
                    <h3 class="hidden">���°˻� ��</h3>
                    <form>
                        <fieldset>
                            <legend class="hidden">�˻��ʵ�</legend>
                            <label id="lecture-search-input-label" for="subject">�����˻�</label>
                            <input id="lecture-search-input" class="g1" type="text" name="subject" />
                            <input id="lecture-search-button" type="submit" value="�˻�" />
                        </fieldset>
                    </form>
                </div>

                <nav id="member-menu">
                    <h1 class="hidden">ȸ���޴�</h1>
                    <ul class="clearfix">
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../index.html">Ȩ</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../joinus/login.html">�α׾ƿ�</a></li>
                        <li class="member-menu-item"><a class="member-menu-item-text" href="../joinus/join.html">ȸ������</a></li>                        
                    </ul>
                </nav>

                <nav id="my-menu">
                    <h1 class="hidden">�����͸޴�</h1>
                    <ul class="clearfix">
                        <li class="my-menu-item"><a class="my-menu-item-text" href=""><img src="../images/txt-mypage.png" alt="����������" /></a></li>
                        <li class="my-menu-item"><a class="my-menu-item-text" href="notice.html"><img src="../images/txt-customer.png" alt="������" /></a></li>
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
                <h1 class="aside-menu-group-title">������</h1>

                <nav class="aside-main-menu">
                    <h1 class="hidden">������ �޴�</h1>
                    <ul>
                        <li class="aside-menu-item"><a href="">��������</a></li>
                        <li class="aside-menu-item"><a href="">1:1������</a></li>
                        <li class="aside-menu-item"><a href="">�н��ȳ�</a></li>
                    </ul>
                </nav>

                <nav class="aside-menu">
                    <h1>��õ����Ʈ</h1>
                    <ul class="aside-menu-list">
                        <li><img src="../images/answeris.png" alt="�ؼ�����" /></li>
                        <li><img src="../images/w3c.png" alt="W3C" /></li>
                        <li><img src="../images/microsoft.png" alt="����ũ�μ���Ʈ" /></li>
                    </ul>
                </nav>

            </aside>

            <main id="main">                
                <h2 id="main-title">��������</h2>
                            
                <div id="breadcrumb">
                    <h3 class="hidden">������</h3>
                    <ol>
                        <li class="breadcrumb-item">home</li>
                        <li class="breadcrumb-item">������</li>
                        <li class="breadcrumb-item">��������</li>
                    </ol>
                </div>
                
                <div id="notice-search-container" class="space-top-l text-right">
                    <div id="search-form">
                        <h3 class="hidden">�������� �˻� ��</h3>
                        <form action="notice.jsp" method="get">
                            <fieldset>
                                <legend class="hidden">�������� �˻� �ʵ�</legend>
                                <label for="field" class="hidden">�˻��з�</label>
                                <select class="search-field" name="field">
                                    <option ${param.f== 'TITLE' ? 'selected' : ''} value="TITLE">����</option>
                                    <option ${param.f== 'WRITER' ? 'selected' : '' } value="WRITER">�ۼ���</option>
                                    <option ${param.f== 'CONTENT' ? 'selected' : '' } value=" CONTENT">����</option>
                                </select>
                                <label name="f"  for="query" class="hidden">�˻����ʵ�</label>
                                <input class="search-input" type="text" name="q"  value="${param.q}"/>                         
                                      <input class="search-input" type="hidden" name="p"  value="1"/>
                                <input class="search-button" type="submit" value="�˻�" />
                            </fieldset>
                        </form>
                    </div>
                </div>

                <div class="board space-top">
                    <h3 class="hidden">�������� ���</h3>
                    
                    <table class="board-table">
                        <thead>
                            <tr class="board-row">
                                <th class="board-cell board-cell-hd num">��ȣ</th>
                                <th class="board-cell board-cell-hd title title-hd">����</th>
                                <th class="board-cell board-cell-hd writer">�ۼ���</th>
                                <th class="board-cell board-cell-hd date">�ۼ���</th>
                                <th class="board-cell board-cell-hd hit">��ȸ��</th>
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
                        <h3 class="hidden">���� ������</h3>
                        <p><span class="text-highlight" id="s1">1</span>/2 page</p>
                    </div>
                </div>

                <div id="pager-container" class="space-top text-center">
                    <div class="pager">
                        <h3 class="hidden">������</h3>
                        <p class="pager-item"><img src="../images/btn-prev.png" alt="����" /></p>
                       <ui:pager  total="
                       ${total}"/>
                        <p class="pager-item"><img src="../images/btn-next.png" alt="����" /></p>
                    </div>
                </div>
            </main>            
        </div>     
    </div>

    <footer id="footer">
        <div class="content-wrapper clearfix">
            <div id="logo-footer-container">
                <h2 id="logo-footer"><img src="../images/logo-footer.png" alt="ȸ������" /></h2>
            </div>
            <div id="company-info-container">
                <div id="company-info">
                    <h3 class="hidden">����������</h3>
                    <dl class="clearfix">
                        <dt class="company-info-item item-title item-newline">�ּ�</dt>
                        <dd class="company-info-item item-data">����Ư���� ���빮��</dd>
                        <dt class="company-info-item item-title item-newline">�����ڸ���</dt>
                        <dd class="company-info-item item-data">admin@newlecture.com</dd>
                        <dt class="company-info-item item-title">��ȭ��ȣ</dt>
                        <dd class="company-info-item item-data">02-111-0000</dd>
                        <dt class="company-info-item item-title item-newline">��ȣ</dt>
                        <dd class="company-info-item item-data">����ó</dd>
                    </dl>
                </div>

                <div id="copyright">
                    <h3 class="hidden">���۱�����</h3>
                    <p>Copyright@newlecture.com 2013-2015 ....</p>
                </div>
            </div>
        </div>
    </footer>

    <!--<aside id="quick-menu">
        <h1>QUICK MENU</h1>
        <nav>
            <h1>���ְ��� �޴�</h1>
            <ul>
                <li>���ǽ�</li>
                <li>ä�ù�</li>
                <li>������</li>
            </ul>
        </nav>

        <nav>
            <h1>������ �޴�</h1>
            <p>QUICK MENU �����ϱ�</p>
        </nav>

        <nav>
            <h1>��ũ�� �޴�</h1>
            <p>top</p>
        </nav>
    </aside>-->
</body>
</html>
