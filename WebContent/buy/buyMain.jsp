<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" import="main.java.com.backend.buyerEnd.model.*"
         import="javax.servlet.http.*" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>支农网上生鲜超市</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String name = request.getSession().getAttribute("sname").toString();//name即为由login传值的登录名
%>

<div class="container">

    <!--     第一部分 -->
    <div id="header">
        <div class="row clearfix">
            <div class="col-md-12 column" style="background: #ffffff">
                <table>
                    <tr>
                        <td><img alt="" src="images/logo.jpg" /></div></td>
                        <td>
                        <ul class="nav nav-pills">
						<li class="active"><a href="buyMain.jsp">主页<% request.getSession().setAttribute("sname",name); %></a></li>
						<li><a href="buyerUserInfor.jsp">我的信息<% request.getSession().setAttribute("sname",name); %></a></li>
						<li><a href="#">我的购买</a></li>
						<li><a href="buyUser.jsp">我的快递<% request.getSession().setAttribute("sname",name); %></a></li>
						<li class="navbar-right"><a href="/supermarket/index.jsp">退出</a>
   						</li>
						</ul>
						</td>
                    </tr>
                    <tr>
                        <td>一排宣传的照片</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <!--     第二部分  导航栏-->
    <div id="topmenu">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle"
                                    data-toggle="collapse" data-target="#example-navbar-collapse">
                                <span class="sr-only">切换导航</span> <span class="icon-bar"></span>
                                <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="buyMain.jsp">首页</a>
                        </div>
                        <div class="collapse navbar-collapse" id="example-navbar-collapse">
                            <ul class="nav navbar-nav">
                            	<jsp:useBean id="goodsType" class="main.java.com.backend.buyerEnd.search.SearchBean" />
                            		<% 	ArrayList<String> allType=new ArrayList<String>(); 
                            			allType=goodsType.getAllType();
                            			int cntType=allType.size();
                            			for (int i=0;i<cntType;i++) {
                            				String typeName=allType.get(i);
                            		%>
                            			<li><a href="#"><%=typeName%></a></li>
                            		<%} %>
                            </ul>
                            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/search.do" method="post">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="请输入你想要搜索的商品类别或商品名称" name="searchinfo">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
                        </div>                        
                    </div>
                </nav>
            </div>            
        </div>        
    </div>
    
    <!-- 轮播框 -->
	<center>
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
				    <img src="../resources/images/top1.png" alt="First slide">
					<!-- <img src="/wp-content/uploads/2014/07/slide1.png" alt="First slide">  -->
				</div>
				<div class="item">
					<img src="../resources/images/top2.png" alt="Second slide">
					<!--<img src="/wp-content/uploads/2014/07/slide2.png" alt="Second slide">  -->
				</div>
				<div class="item">
					<img src="../resources/images/top3.png" alt="Third slide">
					<!--<img src="/wp-content/uploads/2014/07/slide3.png" alt="Third slide">  -->
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" 
			   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" 
			   data-slide="next">&rsaquo;</a>
		</div> 
	</center>
	
	<br />			
	
	<!-- 商品展示 -->
			
    <div class="row">
    	<jsp:useBean id="allgoods" class="main.java.com.backend.buyerEnd.search.SearchBean" />
	    	<% 	ArrayList<Goods> allGoods=new ArrayList<Goods>(); 
	    		allGoods=allgoods.loadAllGoods();
	            int l=allGoods.size();
	            HttpSession sess=request.getSession();
	            sess.setAttribute("userName", name);
	            String str="../resources/images/";	            
	            for (int i=0;i<l;i++){
	            	Goods tmp=allGoods.get(i);
	            	String goodsName=tmp.getGoodsName().trim();
	            	String picPath=str+goodsName+".jpg";
	            	String detailPath="../buy/buyDetail.jsp?flag="+i;
	            	sess.setAttribute("goodsName"+i, tmp.getGoodsName());
	            	sess.setAttribute("goodsId"+i, tmp.getGoodsID());
	            	sess.setAttribute("goodsType"+i, tmp.getGoodsType());
	            	sess.setAttribute("sellerId"+i, tmp.getSellerID());	           	
			%>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<div class="caption">	
							<a href=<%=detailPath %>>		
								<center><img src=<%=picPath %> height="80px" width="120px"/></center>
								<h3>商品名称:<%=goodsName%></h3>
								<h4>价格：¥<%=tmp.getGoodsPrice() %>元</h4>
								<h5>产地：<%=tmp.getSourceArea() %></h5>
								<h6>类别：<%=tmp.getGoodsType() %></h6>
							
							</a>
						</div>
					</div>
				</div>
			<% } %>
	</div>

    <!--     第三部分 -->
    <div id="content">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-8 column" style="background: blue">
                        <p>显示更新产品介绍，包括类别，定价等，以及进行购买</p>
                    </div>
                    <div class="col-md-4 column" style="background: blue">
                        <p>最新优秀宣传的产品等</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--     第四部分 -->
    <div id="footer">
        <div class="row clearfix">
            <div class="col-md-12 column" style="background: red">
                <p>介绍一下网站基本信息，友情链接等</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>