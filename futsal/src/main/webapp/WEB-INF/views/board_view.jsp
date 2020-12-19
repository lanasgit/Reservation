<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO"%>
<%
	String cpage = (String)request.getAttribute("cpage");	
	BoardTO to = (BoardTO)request.getAttribute("to");	
	
	String seq = to.getSeq();
	String hit = to.getHit();
	String name = to.getName();
	String subject = to.getSubject();
	String content = to.getContent().replaceAll("\n", "<br>");
	String email = to.getEmail();
	String wdate = to.getWdate();
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Futsal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/board_view.css" />
	</head>
	<body>
		<div class="con_title">
			<p style="margin: 0px;">
				<img style="vertical-align: middle" src="images/home_icon.gif" /> &gt; 문의 게시판
			</p>
		</div>
		<div class="con_txt">
			<div class="contents_sub">
				<div class="board_view">
					<table>
					<tr>
						<th width="10%">제목</th>
						<td width="60%"><%=subject %></td>
						<th width="10%">등록일</th>
						<td width="20%"><%=wdate %></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><%=name %>(<%=email %>)</td>
						<th>조회</th>
						<td><%=hit %></td>
					</tr>
					<tr>
						<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%=content %></td>
					</tr>
					</table>
				</div>
		
				<div class="btn_area">
					<div class="align_left">
						<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do?cpage=<%=cpage %>'" />
					</div>
					<div class="align_right">
						<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?cpage=<%=cpage %>&seq=<%=seq %>'" />
						<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?cpage=<%=cpage %>&seq=<%=seq %>'" />
					</div>
				</div>	
			</div>
		</div>
	</body>
</html>