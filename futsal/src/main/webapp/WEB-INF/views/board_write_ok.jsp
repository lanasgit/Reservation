<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if (flag == 1) {
		out.println("alert('글이 작성되었습니다.');");
		out.println("location.href='list.do';");
	} else {
		out.println("alert('[오류] 관리자 문의');");
		out.println("history.back();");
	}
	out.println("</script>");
%>