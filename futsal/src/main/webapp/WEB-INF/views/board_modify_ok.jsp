<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cpage = (String)request.getAttribute("cpage");
	String seq = (String)request.getAttribute("seq");
	int flag = (Integer)request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if (flag == 1) {
		out.println("alert('글이 수정되었습니다.');");
		out.println("location.href='view.do?cpage="+cpage+"&seq="+seq+"';");
	} else {
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>