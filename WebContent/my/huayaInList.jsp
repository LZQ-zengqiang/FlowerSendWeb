<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int rows = (Integer) request.getAttribute("rows");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的花芽充值信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="../static/must.jsp" />
</head>

<body>

	<jsp:include page="header.jsp" />
	<jsp:include page="left.jsp" />
	<% 
	String info=(String)request.getAttribute("info");
	if(info!=null&&!info.equals(""))
	{
		out.print("<script type=\"text/javascript\">alert(\""+info+"\");</script>");
	}
	%>
	<div class="content"">
		<div class="admin">
			<h1 class="title">我的花芽充值记录</h1>
			<div class="welcome">花芽，尽情花呀</div>
		</div>
		<div class="row">
			<p> 有记录<%=rows %>条</p>
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="col-md-2 sortable">充值处理号</th>
							<th class="col-md-2 sortable">时间</th>
							<th class="col-md-2 sortable"><span class="line"></span>
								充值金额</th>
							<th class="col-md-2 sortable"><span class="line"></span> 花芽数
							</th>
							
						</tr>
					</thead>
					<tbody>
						<%
							List<HuayaPurchase> list = (List) request.getAttribute("huayaInList");
							for (HuayaPurchase hp : list) {

								out.print("<tr class=\"first\">");
								out.print("<td>" + hp.getSerialnumber() + "</td>");
								out.print("<td>" + hp.getTime() + "</td>");
								out.print("<td>" + hp.getMoney() + "</td>");
								out.print("<td>" + hp.getAmount() + "</td>");
								out.print("</tr>");

							}
							
							
						%>
					</tbody>
				</table>
			</div>
		</div>


	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
