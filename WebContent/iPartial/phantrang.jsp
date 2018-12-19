<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Phan trang -->
<%
	long count = 0;
	if (session.getAttribute("checkTimKiem") != null) {
		count = list.size();
	} else {
		count = dao.count();
	}

	long start = Long.parseLong(pid) * recordPerPage + 1;
	long end = Long.parseLong(pid) * recordPerPage + recordPerPage <= count
			? Long.parseLong(pid) * recordPerPage + recordPerPage
			: count;

	String trangdau = "<<";
	String trangcuoi = ">>";
	String trangtruoc = "<";
	String trangsau = ">";

	long count_page = 0;
	if (count >= recordPerPage)
		count_page = count % recordPerPage > 0 ? count / recordPerPage : count / recordPerPage - 1;
	long current_page = Long.parseLong(pid);

	long min = current_page - 3;
	if (min < 0)
		min = 0;
	long max = current_page + 3;
	if (max > count_page)
		max = count_page;
	long previous = current_page - 1;
	if (previous < 0)
		previous = 0;
	long next = count_page + 1;
	if (next > count_page)
		next = count_page;
%>

<span>Hiển thị kết quả từ <%=start%> đến <%=end%>, danh sách có <%=list.size()%>
	mục, CSDL có <%=count%> mục. <br />

</span>
<div class="text-right">
	<ul class="pagination">
		<li><a href="<%=p1%>&page=<%=0%>&recordPerPage=<%=recordPerPage%>"><%=trangdau%></a></li>
		<li><a href="<%=p1%>&page=<%=previous%>&recordPerPage=<%=recordPerPage%>"><%=trangtruoc%></a></li>
		<%
			for (long p = min; p <= max; p++) {
		%>

		<li <%if (p == Long.parseLong(pid)) {%> class="active" <%}%>><a
			href="<%=p1%>&page=<%=p%>&recordPerPage=<%=recordPerPage%>"><%=p + 1%></a></li>
		<%
			}
		%>
		<li><a href="<%=p1%>&page=<%=next%>&recordPerPage=<%=recordPerPage%>"><%=trangsau%></a></li>
		<li><a href="<%=p1%>&page=<%=count_page%>&recordPerPage=<%=recordPerPage%>"><%=trangcuoi%></a></li>
	</ul>
</div>
<!-- ket thuc phan trang -->