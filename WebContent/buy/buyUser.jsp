<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户页面</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<p>欢迎</p>
<ul class="nav nav-pills">
	<li class="active"><a href="buyMain.jsp?name=user">主页</a></li>
	<li><a href="buyerUserInfor.jsp">我的信息</a></li>
	<li><a href="#">我的购买</a></li>
	<li><a href="#">我的快递</a></li>
	<li class="navbar-right"><a href="/supermarket/index.jsp">退出</a>
   	</li>
</ul>

<table class="table table-striped">
  <caption>订单信息</caption>
  <thead>
    <tr>
      <th>订单编号</th>
      <th>下单时间</th>
      <th>订单状态</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>（暂）11</td>
      <td>（暂）2017/3/21</td>
      <td>（暂）待送达</td>
    </tr>
  </tbody>
</table>


</body>
</html>