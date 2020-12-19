<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO"%>
<%@ page import="model.BoardListTO"%>
<%@ page import="java.util.ArrayList"%>
<%
	/* 페이징 */
	BoardListTO listTO = (BoardListTO)request.getAttribute("listTO");
	
	int cpage = listTO.getCpage();
	//페이지당 나타낼 데이터 개수
	int recordPerPage = listTO.getRecordPerPage();
	//전체 데이터 개수
	int totalRecord = listTO.getTotalRecord();	
	//전체 페이지 개수
	int totalPage = listTO.getTotalPage();	
	//페이지당 나타낼 버튼이동할 수 있는 페이지 개수
	int blockPerPage = listTO.getBlockPerPage();
	//시작블록과 끝블록
	int startBlock = listTO.getStartBlock();
	int endBlock = listTO.getEndBlock();
	/* 페이징 끝 */
	
	ArrayList<BoardTO> lists = listTO.getBoardLists();

	StringBuffer strHtml = new StringBuffer();
	for (BoardTO to : lists) {
		String seq = to.getSeq();
		String hit = to.getHit();
		String name = to.getName();
		String subject = to.getSubject();
		String wdate = to.getWdate();
		int wgap = to.getWgap();
		
		strHtml.append("<tr>");
		strHtml.append("<td>&nbsp;</td>");
		strHtml.append("<td>" + seq + "</td>");
		strHtml.append("<td class='left'>");
		strHtml.append("<a href='view.do?cpage="+ cpage +"&seq="+ seq + "'>" + subject + "</a>");
		if (wgap == 0) strHtml.append("&nbsp;<img src='images/icon_hot.gif' alt='new'>");
		strHtml.append("</td>");
		strHtml.append("<td>" + name + "</td>");
		strHtml.append("<td>" + wdate + "</td>");
		strHtml.append("<td>" + hit + "</td>");
		strHtml.append("<td>&nbsp;</td>");
		strHtml.append("</tr>");
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Futsal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/board_list.css" />
	</head>
	<body>
		<div class="con_title">
			<p style="margin: 0px;">
				<img style="vertical-align: middle" src="images/home_icon.gif" /> &gt; 문의 게시판
			</p>
		</div>
		<div class="con_txt">
			<div class="contents_sub">
				<div class="board_top">
					<div class="bold">총 <span class="txt_orange"><%=totalRecord %></span>건</div>
				</div>
				<div class="board">
					<table>
					<tr>
						<th width="3%">&nbsp;</th>
						<th width="5%">번호</th>
						<th>제목</th>
						<th width="10%">글쓴이</th>
						<th width="17%">등록일</th>
						<th width="5%">조회</th>
						<th width="3%">&nbsp;</th>
					</tr>
					<!-- 게시글 시작 -->
						<%= strHtml %>
					<!-- 게시글 끝 -->
					</table>
				</div>	
				<div class="btn_area">
					<div class="align_left">
						<input type="button" value="Home" class="btn_list btn_txt02" onclick="location.href='index.jsp'" />
					</div>
					<div class="align_right">
						<input type="button" value="쓰기" class="btn_write btn_txt01" onclick="location.href='write.do?cpage=<%=cpage %>'" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="paginate_regular">
			<%
				// << 버튼 (이전 페이지 블록으로 이동)
				if (startBlock == 1) {
					out.println("<span><a>&lt;&lt;</a></span>");
				} else {
					out.println("<span><a href='list.do?cpage="+ (startBlock - blockPerPage) +"'>&lt;&lt;</a></span>");
				}
				// < 버튼 (한 페이지 앞으로 이동)
				if (cpage == 1) {
					out.println("<span><a>&lt;</a></span>");
				} else {
					out.println("<span><a href='list.do?cpage="+ (cpage - 1) +"'>&lt;</a></span>");
				}
				out.println("&nbsp;");
			%>
			<% 
				for (int i = startBlock; i <= endBlock; i++) {
					if (cpage == i) {
						out.println("<span><a>["+ i +"]</a></span>");
					} else {
						out.println("<span><a href='list.do?cpage="+ i +"'>"+ i +"</a></span>");
					}
				}
			%>
			<%	
				// > 버튼 (한 페이지 뒤로 이동)
				out.println("&nbsp;");
				if (cpage == totalPage) {
					out.println("<span><a>&gt;</a></span>");
				} else {
					out.println("<span><a href='list.do?cpage="+ (cpage + 1) +"'>&gt;</a></span>");
				}
				// >> 버튼 (다음 페이지 블록으로 이동)
				if (endBlock == totalPage) {
					out.println("<span><a>&gt;&gt;</a></span>");
				} else {
					out.println("<span><a href='list.do?cpage="+ (startBlock + blockPerPage) +"'>&gt;&gt;</a></span>");
				}
			%>
		</div>
	</body>
</html>