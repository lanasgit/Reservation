<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO"%>
<%
	String cpage = (String)request.getAttribute("cpage");
	BoardTO to = (BoardTO)request.getAttribute("to");
	
	String seq = to.getSeq();
	String name = to.getName();
	String subject = to.getSubject();
	String content = to.getContent();
	String[] email = to.getEmail().split("@");
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Futsal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/board_write.css" />
	</head>
	<body>
		<div class="contents1">
			<div class="con_title">
				<p style="margin: 0px;">
					<img style="vertical-align: middle" src="images/home_icon.gif" /> &gt; 문의 게시판
				</p>
			</div>

			<form action="delete_ok.do" method="post">
				<input type="hidden" name="seq" value="<%=seq %>" />
				<div class="contents_sub">
					<div class="board_write">
						<table>
						<tr>
							<th>*성함</th>
							<td colspan="3"><input type="text" name="name" value="<%=name %>" class="board_write_input_100" maxlength="10" readonly /></td>
						</tr>
						<tr>
							<th>*제목</th>
							<td colspan="3"><input type="text" name="subject" value="<%=subject %>" class="board_write_input" maxlength="50" readonly /></td>
						</tr>
						<tr>
							<th>*비밀번호</th>
							<td colspan="3"><input type="password" name="password" value="" class="board_write_input_100" maxlength="15" required /></td>
						</tr>
						<tr>
							<th>*내용</th>
							<td colspan="3">
								<textarea name="content" id="content" class="board_editor_area" maxlength="1000" readonly><%=content %></textarea>
							</td>
						</tr>
						<tr>
							<th>*이메일</th>
							<td colspan="3"><input type="text" name="email1" value="<%=email[0] %>" class="board_write_input_100" readonly /> @ <input type="text" name="email2" value="<%=email[1] %>" class="board_write_input_100" readonly /></td>
						</tr>
						</table>
					</div>
					<div class="btn_area">
						<div class="align_left">
							<input type="button" value="목록" class="btn_list btn_txt02" onclick="location.href='list.do?cpage=<%=cpage %>'" />
							<input type="button" value="보기" class="btn_list btn_txt02" onclick="location.href='view.do?cpage=<%=cpage %>&seq=<%=seq %>'" />
						</div>
						<div class="align_right">
							<input type="submit" value="삭제" class="btn_write btn_txt01" />					
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>