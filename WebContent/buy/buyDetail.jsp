<%@ page language="java" contentType="text/html; charset=utf-8" 
import="main.java.com.backend.buyerEnd.model.*"
import="java.util.*" pageEncoding="utf-8" 
import="main.java.com.backend.buyerEnd.service.*"
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
    .desc {font-size:22px;color:#555;padding:10px}
    .addToCart {border-radius:6px;font-size:28px;padding:10px;color:#FFF;background:#ff9933;}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>支农网上生鲜超市</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String flag=(String)request.getParameter("flag");
    HttpSession sess=request.getSession();
    String goodsId=(String)sess.getAttribute("goodsId"+flag);
    String goodsType=(String)sess.getAttribute("goodsType"+flag);
    String sellerId=(String)sess.getAttribute("sellerId"+flag);
    String userName=(String)sess.getAttribute("userName");
    DetailService svc=new DetailService();
    Goods goods=svc.getGoodsByGoodsId(goodsId);
    String goodsName=goods.getGoodsName();
    String goodsIntro=goods.getGoodsIntro();
    String storeWay=goods.getStoreWay();
    String sourceArea=goods.getSourceArea();
    int goodsSize=goods.getgoodsSize();
    //String name = request.getSession().getAttribute("sname").toString();//name即为由login传值的登录名
    //String presearchinfo = request.getSession().getAttribute("searchinfo").toString();  //搜索的信息  
%>
<div class="container">


    <!--     第一部分 -->
    <div id="header">
        <div class="row clearfix">
            <div class="col-md-12 column" style="background: #33eeff">
                <table>
                    <tr>
                        <td>logo</td>
                        <td>个人信息管理以及购买物品管理。个人信息包括查看、修改等；购买管理包括：购买的商品，以及物流等的查询</td>
                    </tr>
                    <tr>
                        <td>一排宣传的照片</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <!--     第二部分 导航栏 -->
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
                                <jsp:useBean id="goodsTypes" class="main.java.com.backend.buyerEnd.search.SearchBean" />
                                    <%  ArrayList<String> allType=new ArrayList<>(); 
                                        allType=goodsTypes.getAllType();
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

    <!--     第三部分 -->
    <div class="detail-view">
        <ol class="breadcrumb">
            <li><a href="#">主页</a></li>
            <li><a href="#"><%=goodsType%></a></li>
            <li class="active"><%=goodsName%></li> 
        </ol>
        <div class="details">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <div class="main-img">
                        <%String str="../resources/images/"+goodsName+".jpg";
                        %>
                        <img src=<%=str %> width="100%">
                    </div>
                </div>
                <div class="col-md-6 column">
                    <div class="goods-info">
                        <h1><%=goodsName%></h1>
                        <div class="desc" style="padding-bottom:30px"><%=goodsIntro%></div>
                        <div class="desc">
                            <div class="container" style="background:#EEE;width:100%">
                                <div class="row clearfix">
                                    <div class="col-md-2 column">
                                        <div class="desc" style="padding-top:20px;padding-right: 0px">价格</div>
                                    </div>
                                    <div class="col-md-4 column">
                                        <div class="desc" style="color:#ff9933;font-size:32px">￥<%=goodsPrice%></div>  
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        <div class="desc">
                            <div class="container" >
                                <div class="row clearfix">
                                    <div class="col-md-1 column">
                                        <div class="desc" style="padding-top:20px">数量</div>
                                    </div>
                                    <div class="col-md-5 column">
                                        <div class="desc">
                                            <script type="text/javascript">
                                                var out=document.getElementById('out');
                                                out.innerHTML=1;
                                                function minus() {
                                                    var out=document.getElementById('out');
                                                    if(out.innerHTML>0)out.innerHTML--;
                                                }
                                                function plus() {
                                                    var out=document.getElementById('out');
                                                    if(out.innerHTML<100000)out.innerHTML++;
                                                }
                                            </script>
                                            <input type="button" id="btn1" value="-" onclick="minus()" style="out-line:none;" />
                                                <!-- <img src="/Content/img/minus.png"> -->
                                            <a id="out" value=1></a>
                                            <input type="button" id="btn2" value="+" onclick="plus()" style="out-line:none;"/>
                                                <!-- <img src="/Content/img/plus.png"> -->
                                        </div>
                                    </div>
                                </div>
                            
                           
                            </div>
                        </div>

                        <div class="addToCart" style="width:40%">&nbsp;&nbsp;&nbsp;加入购物车</div>
                        <div class="desc">
                        </br>
                                <li>
                                    <label>产地</label> <%=sourceArea%>
                                </li>
                                <li>
                                    <label>保质期</label> 
                                </li>
                                <li>
                                    <label>规格</label> <%=goodsSize%>
                                </li>
                                <li>
                                    <label>储存条件</label> <%=storeWay%>
                                </li>
                        </div>
                    </div>
                </div>
            </div>
        </div>
           
           
        </div>

        </br>
        <div class="bt-content">
                <ul class="nav nav-tabs">
                <li class="active"><a style="font-size: 25px">商家简介</a></li></br>
                </br></br></br>
</ul>
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