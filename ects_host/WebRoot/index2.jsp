<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<link rel="stylesheet" type="text/css" href="style3.css" />
  <%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <script src="js/style.js"></script>
    <script src="js/QIndex.js"></script>

    <link rel="icon" href="http://img07.taobaocdn.com/tps/i7/T1bZNxXjXjXXXXXXXX.png" type="image/x-icon" />
	

	
    
    
<style type="text/css">
<!--
body,td,th {
	font-size: 0.7em;
}
-->
</style></head>
<body  onload=InitialiseAutoScrollArea()>
<p><span class="clear"><span class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=6"></a></span></span></p>
<div id="main">
  <p><a href="#"><img src="images/logo.gif"  title="" border="0" /></a></p>
  
 <div id="menu">
        <ul>                                                                       
        <li ><a href="index.html">主页</a></li>
        
        <li><a href="${pageContext.request.contextPath}/productList.do">商品列表</a></li>
         <li><a href="${pageContext.request.contextPath}/search.jsp">搜索商品</a></li>
        
        <li><a href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
        <c:if test="${user != null}">        	
        	<li><a href="${pageContext.request.contextPath}/orderList.do">订单列表</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">订单列表</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
	 </ul>
  </div>


 
 <div class="private"> 
		<div class="qBox"> 
			<div class="head_auto" id="index_login_div"> 
				<!--登录前-->	
				<div class="login_pre"> 
					<div class="publicid"></div> 
					<div class="welcome">欢迎！</div> 
					<div class="form">			
						<div class="user"><input onfocus="if(typeof QIndex !== 'undefined') QIndex.userInter('F','user',this);"  onblur="if(typeof QIndex !== 'undefined') QIndex.userInter('B','user',this)" onkeypress="if(event.keyCode == 13)QIndex.logon();" id="username" name="username" tabindex="1" type="text" value="Email或昵称" /></div> 
						<div class="pwd"><input onfocus="if(typeof QIndex !== 'undefined') QIndex.userInter('F','pwd',this)" tabindex="2" type="text" id="password" name="password" value="登录密码"  /></div> 
						<div class="remember"><input id="forever" name="forever" type="checkbox" checked="checked" tabindex="-1"><label for="forever">记住我</label></div>		     
						<div class="ok"><input type="button" onclick="if(typeof QIndex !== 'undefined') QIndex.logon();" value="登 录" tabindex="3"></div>	
					</div> 
					<div class="assist"> 
						<div class="item"><a  charset="100-320-01-01" href="#" class="arrow">免费注册</a></div> 
					</div> 
					<div class="clear"></div> 
				</div> 
			</div> 
			<div id="index_cookielist_div"> 
			</div> 
	</div><!--box end--> 
  </div><!-- .private --> 
 
 
<div id="mall-search">
  <form name="searchTop" action="http://list.mall.taobao.com/search_dispatcher.htm" class="clearfix">
  <fieldset>
        <legend>搜索</legend>
                    <div id="J_SelectTypes" class="search-type">
                        <a class="active" href="#">商品</a>
                        <a data-type="s" href="#">店铺</a>
                    </div>
                    <div class="input clearfix">
                      <input type="text" name="q" id="mq" tabindex="9" />
              <span><button type="submit">搜索</button></span>
                        <input type="hidden" name="user_action" value="initiative" />
                        <input type="hidden" name="at_topsearch" value="1" />
                        <input type="hidden" name="sort" value="st" />
                        <input id="J_Type" type="hidden" name="type" />
                        <input id="J_Cat" type="hidden" name="cat" />
                    </div>
      </fieldset>
    </form>
  </div>
</div>

<div id="content">
 
  <div class="layout grid-s210m0">
        <div class="col-main">
            <div class="main-wrap">
                <div id="J_ComboSlide">
                  <div class="combo-slide">
             <ul class="slide-list">
            
            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680073&width=770&height=300"></li>
            <li class="J_ECPM" data="pid=mm_12852562_1778064_8320217&width=770&height=300"></li>
            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680077&width=770&height=300"></li>
            <li class="J_ECPM" data="pid=mm_12852562_1778064_8320218&width=770&height=300"></li>
            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680082&width=770&height=300"></li>
                        
        </ul>
    </div>
    <div class="combo-slide-trigger">
        <div class="entity">
            <ol class="trigger"> 
            
                            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680103"></li>
                            <li class="J_ECPM" data="pid=mm_12852562_1778064_8683814"></li>
                            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680111"></li>
                            <li class="J_ECPM" data="pid=mm_12852562_1778064_8683815"></li>
                            <li class="J_ECPM" data="pid=mm_12852562_1778064_8680116"></li>
                        
            </ol>
        </div>
        <b class="l"></b>
        <b class="r"></b>
    </div>
</div>            </div>
        </div>



        <div class="col-sub">
            <div id="J_Category" class="mall-category">
    <h2 class="title"><a href="#" >所有商品分类</a></h2>
<div class="entity">
    <div class="items">
        <ul class="item"> 
            
                <li class="J_MenuItem"><a class="c1" href="#" ><s></s><i></i>潮流服饰</a></li>
            
            
                <li class="J_MenuItem"><a class="c2" href="#" ><s></s><i></i>精品鞋包</a></li>
            
            
                <li class="J_MenuItem"><a class="c3" href="#" ><s></s><i></i>美容护肤</a></li>
            
            
                <li class="J_MenuItem"><a class="c4" href="#" ><s></s><i></i>珠宝饰品</a></li>
            
        </ul>
        <ul class="item"> 
            
                <li class="J_MenuItem"><a class="c5" href="#" ><s></s><i></i>运动户外</a></li>
            
            
                <li class="J_MenuItem"><a class="c6" href="#" ><s></s><i></i>手机数码</a></li>
            
        </ul>
        <ul class="item"> 
            
                <li class="J_MenuItem"><a class="c7" href="#" ><s></s><i></i>居家生活</a></li>
            
        </ul>
        <ul class="item"> 

                <li class="J_MenuItem"><a class="c10" href="#" ><s></s><i></i>食品保健</a></li>
            
            
                <li class="J_MenuItem"><a class="c11" href="#" ><s></s><i></i>图书音像</a></li>
            
        </ul>
    </div>

    <p class="all"><a href="#" >所有商品分类 &raquo;</a></p>

</div>    <textarea id="J_SubCategory" class="pop-subcategory hidden"><div class="shadow"><b class="tl"></b><b class="tr"></b>
<div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
             
             <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#" title="T恤" >T恤</a><a href="#" title="衬衫" >衬衫</a><a href="#" title="小西装" >小西装</a><a href="#" title="连衣裙" >连衣裙</a><a href="#" title="半身裙" >半身裙</a><a href="#" title="针织衫" >针织衫</a><a href="#" title="卫衣" >卫衣</a><a href="#" title="风衣" >风衣</a><a href="#" title="外套" >外套</a><a href="#" title="裤子" >裤子</a><a href="#" title="牛仔裤" >牛仔裤</a><a href="#" title="雪纺衫" >雪纺衫</a> <a href="#" title="文胸" >文胸</a><a href="#" title="睡衣" >睡衣</a><a href="#" title="睡裙" >睡裙</a><a href="#" title="情侣睡衣" >情侣睡衣</a><a href="#" title="塑身衣" >塑身衣</a><a href="#" title="抹胸" >抹胸</a><a href="#" title="吊带背心" >吊带背心</a><a href="#" title="内裤" >内裤</a><a href="#" title="男内裤" >男内裤</a><a href="#" title="袜子" >袜子</a><a href="#" title="内衣配件" >内衣配件</a> <a href="#" title="T恤" >T恤</a><a href="#" title="POLO衫" >POLO衫</a><a href="#" title="背心" >背心</a><a href="#" title="休闲衬衫" >休闲衬衫</a><a href="#" title="商务衬衫" >商务衬衫</a><a href="#" title="牛仔裤" >牛仔裤</a><a href="#" title="休闲裤" >休闲裤</a><a href="#" title="中/短裤" >中/短裤</a><a href="#" title="西装" >西装</a><a href="#" title="卫衣" >卫衣</a> <a href="#" title="女士腰带" >女士腰带</a><a href="#" title="腰链" >腰链</a><a href="#" title="帽子" >帽子</a><a href="#" title="男士皮带" >男士皮带</a><a href="#" title="领带" >领带</a><a href="#" title="胸花" >胸花</a><a href="#" title="运动颈环" >运动颈环</a><a href="#" title="丝巾" >丝巾</a><a href="#" title="法力藤" >法力藤</a>             
             </dd>
         </dl>
         
    </div>
    
       
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
            
            <div class="lst-top J_HotView hidden">
             </div>
            
             <dd>
             
             <a href="#"  title="女鞋">女鞋</a><a href="#"  title="高跟鞋">高跟鞋</a><a href="#"  title="坡跟凉鞋">坡跟凉鞋</a><a href="#"  title="凉鞋">凉鞋</a><a href="#"  title="单鞋">单鞋</a><a href="#"  title="鱼嘴鞋">鱼嘴鞋</a><a href="#"  title="凉拖">凉拖</a><a href="#"  title="帆布鞋">帆布鞋</a><a href="#"  title="及踝靴">及踝靴</a><a href="#"  title="靴子">靴子</a><a href="#"  title="高帮鞋">高帮鞋</a><a href="#"  title="男鞋">男鞋</a><a href="#"  title="休闲鞋">休闲鞋</a><a href="#"  title="商务皮鞋">商务皮鞋</a><a href="#"  title="登山鞋">登山鞋</a><a href="#"  title="帆布鞋">帆布鞋</a><a href="#"  title="低帮鞋">低帮鞋</a><a href="#"  title="凉鞋/凉拖">凉鞋/凉拖</a> <a href="#"  title="手袋">手袋</a><a href="#"  title="男包">男包</a><a href="#"  title="单肩包">单肩包</a><a href="#"  title="后背包">后背包</a><a href="#"  title="斜挎包">斜挎包</a><a href="#"  title="真皮包">真皮包</a><a href="#"  title="帆布包">帆布包</a><a href="#"  title="运动包">运动包</a><a href="#"  title="胸包">胸包</a><a href="#"  title="旅行箱包">旅行箱包</a><a href="#"  title="拉杆箱">拉杆箱</a><a href="#"  title="钱包">钱包</a><a href="#"  title="腰包">腰包</a><a href="#"  title="卡套小包">卡套小包</a><a href="#"  title="手拿包">手拿包</a>             
             </dd>
         </dl>
                  
    </div>
    
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
             
             <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#"  title="洁面">洁面</a><a href="#"  title="化妆水">化妆水</a><a href="#"  title="精华液">精华液</a><a href="#"  title="乳液">乳液</a><a href="#"  title="防晒">防晒</a><a href="#"  title="面膜">面膜</a><a href="#"  title="眼霜">眼霜</a><a href="#"  title="护唇膏">护唇膏</a><a href="#"  title="BB霜">BB霜</a><a href="#"  title="隔离霜">隔离霜</a><a href="#"  title="粉底液">粉底液</a><a href="#"  title="粉饼">粉饼</a><a href="#"  title="蜜粉">蜜粉</a><a href="#"  title="腮红">腮红</a><a href="#"  title="眼线">眼线</a><a href="#"  title="眼影">眼影</a><a href="#"  title="眉笔">眉笔</a><a href="#"  title="睫毛膏">睫毛膏</a><a href="#"  title="唇彩">唇彩</a><a href="#"  title="指甲油">指甲油</a><a href="#"  title="卸妆">卸妆</a> <a href="#"  title="香水套装">香水套装</a><a href="#"  title="女士香水">女士香水</a><a href="#"  title="男士香水">男士香水</a> <a href="#"  title="护发美发">护发美发</a><a href="#"  title="洗浴护体">洗浴护体</a><a href="#"  title="瘦身丰胸">瘦身丰胸</a>  <a href="#"  title="纯露/花水">纯露/花水</a><a href="#"  title="单方精油">单方精油</a><a href="#"  title="复方精油">复方精油</a> <a href="#"  title="化妆工具">化妆工具</a><a href="#"  title="美发工具">美发工具</a><a href="#"  title="时尚假发">时尚假发</a><a href="#"  title="洁面">洁面</a><a href="#"  title="须后水">须后水</a><a href="#"  title="乳液">乳液</a><a href="#"  title="套装">套装</a>             
             </dd>
         </dl>
         
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
            
            <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#"  title="项链">项链</a><a href="#"  title="耳饰">耳饰</a><a href="#"  title="戒指">戒指</a><a href="#"  title="手链/手镯">手链/手镯</a><a href="#"  title="发饰">发饰</a><a href="#"  title="胸针">胸针</a><a href="#"  title="脚链">脚链</a><a href="#"  title="情侣对饰">情侣对饰</a><a href="#"  title="戒指">戒指</a><a href="#"  title="项链">项链</a><a href="#"  title="耳环">耳环</a><a href="#"  title="手链">手链</a><a href="#"  title="套装">套装</a><a href="#"  title="挂件">挂件</a><a href="#"  title="手镯">手镯</a><a href="#"  title="戒指">戒指</a><a href="#"  title="耳钉">耳钉</a><a href="#"  title="套装">套装</a><a href="#"  title="戒指">戒指</a><a href="#"  title="项链">项链</a><a href="#"  title="耳环">耳环</a><a href="#"  title="手链">手链</a><a href="#"  title="套装">套装</a><a href="#"  title="项链">项链</a><a href="#"  title="戒指">戒指</a><a href="#"  title="耳环">耳环</a><a href="#"  title="手链">手链</a><a href="#"  title="18K金">18K金</a><a href="#"  title="项坠">项坠</a><a href="#"  title="耳环">耳环</a><a href="#"  title="戒指">戒指</a><a href="#"  title="手链">手链</a><a href="#"  title="套装">套装</a><a href="#"  title="全国联保">全国联保</a><a href="#"  title="石英表">石英表</a><a href="#"  title="电子表">电子表</a><a href="#"  title="光动能表">光动能表</a><a href="#"  title="自动机械表">自动机械表</a><a href="#"  title="人工动能表">人工动能表</a><a href="#"  title="机械表">机械表</a>             
             </dd>
         </dl>
         
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
         
         <div class="lst-top J_HotView hidden">
             </div>
         
		  <dd>
          
	<a href="#"  title="凉鞋">凉鞋</a><a href="#"  title="沙滩鞋">沙滩鞋</a><a href="#"  title="帆布鞋">帆布鞋</a><a href="#"  title="板鞋">板鞋</a><a href="#"  title="篮球鞋">篮球鞋</a><a href="#"  title="足球鞋">足球鞋</a><a href="#"  title="网球鞋">网球鞋</a><a href="#"  title="羽球鞋">羽球鞋</a><a href="#"  title="跑步鞋">跑步鞋</a><a href="#"  title="休闲鞋">休闲鞋</a><a href="#"  title="户外鞋">户外鞋</a><a href="#"  title="登山鞋">登山鞋</a><a href="#"  title="泳装">泳装</a><a href="#"  title="T恤">T恤</a><a href="#"  title="卫衣">卫衣</a><a href="#"  title="裤子">裤子</a><a href="#"  title="瑜伽服">瑜伽服</a><a href="#"  title="运动套装">运动套装</a><a href="#"  title="户外服饰">户外服饰</a><a href="#"  title="羽毛球">羽毛球</a><a href="#"  title="乒乓球">乒乓球</a><a href="#"  title="羽毛球">羽毛球</a><a href="#"  title="篮球">篮球</a><a href="#"  title="网球">网球</a><a href="#"  title="高尔夫">高尔夫</a><a href="#"  title="足球">足球</a><a href="#"  title="台球">台球</a><a href="#"  title="游泳装备">游泳装备</a><a href="#"  title="瑜伽周边">瑜伽周边</a><a href="#"  title="健身器材">健身器材</a><a href="#"  title="户外装备">户外装备</a><a href="#"  title="帐蓬/睡袋">帐蓬/睡袋</a><a href="#"  title="户外背包">户外背包</a><a href="#"  title="运动护具">运动护具</a><a href="#"  title="极限运动">极限运动</a><a href="#"  title="户外镜">户外镜</a>             
             </dd>
         </dl>
                  
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
              
              <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#"  title="直板">直板</a><a href="#"  title="翻盖">翻盖</a><a href="#"  title="智能">智能</a><a href="#"  title="配件">配件</a><a href="#"  title="入门">入门</a><a href="#"  title="游戏">游戏</a><a href="#"  title="上网本">上网本</a><a href="#"  title="配件">配件</a><a href="#"  title="卡片">卡片</a><a href="#"  title="单反">单反</a><a href="#"  title="摄像机">摄像机</a><a href="#"  title="配件">配件</a><a href="#"  title="MP3">MP3</a><a href="#"  title="MP4">MP4</a><a href="#"  title="录音笔">录音笔</a><a href="#"  title="配件">配件</a><a href="#"  title="键鼠">键鼠</a><a href="#"  title="音箱">音箱</a><a href="#"  title="显示器">显示器</a><a href="#"  title="DIY装机">DIY装机</a><a href="#"  title="打印">打印</a><a href="#"  title="耗材">耗材</a><a href="#"  title="一体机">一体机</a><a href="#"  title="文具">文具</a><a href="#"  title="优盘">优盘</a><a href="#"  title="包包">包包</a><a href="#"  title="上网卡">上网卡</a><a href="#"  title="散热">散热</a><a href="#"  title="掌机">掌机</a><a href="#"  title="手柄">手柄</a><a href="#"  title="方向盘">方向盘</a><a href="#"  title="摇杆">摇杆</a>             
             </dd>
         </dl>
                  
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
     
     <div class="lst-top J_HotView hidden">
             </div>
     
             <dd>
             
             <a href="#"  title="枕头">枕头</a><a href="#"  title="驱蚊">驱蚊</a><a href="#"  title="洗发">洗发</a><a href="#"  title="洗浴用具">洗浴用具</a><a href="#"  title="洗衣晒衣">洗衣晒衣</a><a href="#"  title="杯子">杯子</a><a href="#"  title="餐具">餐具</a><a href="#"  title="日用品">日用品</a><a href="#"  title="玩具">玩具</a><a href="#"  title="玩具">玩具</a><a href="#"  title="公仔">公仔</a><a href="#"  title="桌游">桌游</a><a href="#"  title="魔术类">魔术类</a><a href="#"  title="鲜花">鲜花</a><a href="#"  title="卡通花">卡通花</a><a href="#"  title="软件">软件</a><a href="#"  title="礼品">礼品</a><a href="#"  title="文具">文具</a><a href="#"  title="益智">益智</a><a href="#"  title="书包">书包</a><a href="#"  title="运动">运动</a> <a href="#"  title="剃须刀">剃须刀</a><a href="#"  title="耳机">耳机</a><a href="#"  title="音响">音响</a><a href="#"  title="话筒">话筒</a><a href="#"  title="卧具">卧具</a><a href="#"  title="坐具">坐具</a><a href="#"  title="架/箱">架/箱</a><a href="#"  title="桌类">桌类</a><a href="#"  title="几类">几类</a><a href="#"  title="充气">充气</a><a href="#"  title="办公">办公</a><a href="#"  title="组合">组合</a> <a href="#"  title="墙贴">墙贴</a><a href="#"  title="工具">工具</a><a href="#"  title="照明">照明</a><a href="#"  title="清洁">清洁</a><a href="#"  title="单车">单车</a> <a href="#"  title="餐具">餐具</a>            
             </dd>
         </dl>
         
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
             
             <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#"  title="龙井">龙井</a><a href="#"  title="普洱">普洱</a><a href="#"  title="花茶">花茶</a><a href="#"  title="铁观音">铁观音</a><a href="#"  title="咖啡">咖啡</a><a href="#"  title="粉粉">粉粉</a><a href="#"  title="藕粉">藕粉</a><a href="#"  title="奶茶">奶茶</a><a href="#"  title="饮料">饮料</a><a href="#"  title="红酒">红酒</a><a href="#"  title="黄酒">黄酒</a><a href="#"  title="白酒">白酒</a><a href="#"  title="烈酒">烈酒</a><a href="#"  title="啤酒">啤酒</a><a href="#"  title="蜜饯">蜜饯</a><a href="#"  title="糖果">糖果</a><a href="#"  title="奶酪">奶酪</a><a href="#"  title="巧克力">巧克力</a><a href="#"  title="肉类">肉类</a><a href="#"  title="海味">海味</a><a href="#"  title="饼干">饼干</a><a href="#"  title="炒货类">炒货类</a><a href="#"  title="粮油">粮油</a><a href="#"  title="调味">调味</a><a href="#"  title="速食">速食</a><a href="#"  title="食用菌">食用菌</a><a href="#"  title="蔬果">蔬果</a><a href="#"  title="腊肉">腊肉</a><a href="#"  title="罐头">罐头</a><a href="#"  title="水产品">水产品</a><a href="#"  title="保健食品">保健食品</a>             
             </dd>
         </dl>
                  
    </div>
    
</div><div class="entity-main J_SubViewItem">
    <div class="lst-subcategory">
         <h3>商品分类：</h3>
         <dl class="J_HotMenuItem active">
             
             <div class="lst-top J_HotView hidden">
             </div>
             
             <dd>
             
             <a href="#"  title="文学">文学</a><a href="#"  title="小说">小说</a><a href="#"  title="考试">考试</a><a href="#"  title="经济">经济</a><a href="#"  title="管理">管理</a><a href="#"  title="生活">生活</a><a href="#"  title="工具书">工具书</a><a href="#"  title="杂志">杂志</a><a href="#"  title="艺术">艺术</a><a href="#"  title="科技">科技</a><a href="#"  title="语言">语言</a><a href="#"  title="计算机">计算机</a><a href="#"  title="法律">法律</a><a href="#"  title="励志">励志</a><a href="#"  title="建筑">建筑</a><a href="#"  title="政治">政治</a><a href="#"  title="传记">传记</a><a href="#"  title="文化">文化</a><a href="#"  title="科普">科普</a> <a href="#"  title="音乐">音乐</a><a href="#"  title="乐器">乐器</a><a href="#"  title="电影">电影</a><a href="#"  title="剧集">剧集</a><a href="#"  title="曲艺">曲艺</a><a href="#"  title="软件">软件</a><a href="#"  title="胎教">胎教</a><a href="#"  title="儿童">儿童</a><a href="#"  title="体育">体育</a><a href="#"  title="歌剧">歌剧</a><a href="#"  title="舞蹈">舞蹈</a><a href="#"  title="音乐会">音乐会</a><a href="#"  title="魔术">魔术</a><a href="#"  title="戏曲">戏曲</a><a href="#"  title="综艺">综艺</a><a href="#"  title="儿童剧">儿童剧</a><a href="#"  title="文房四宝">文房四宝</a><a href="#"  title="专项收藏">专项收藏</a><a href="#"  title="紫砂艺术">紫砂艺术</a><a href="#"  title="仿古艺术">仿古艺术</a><a href="#"  title="礼品收藏">礼品收藏</a><a href="#"  title="金石篆刻">金石篆刻</a>             
             </dd>
         </dl>
                  
    </div>
    
     
</div><b class="bl"></b><b class="br"></b></div></textarea>
</div>        </div>
    </div>    

<script>
/*
Copyright (c) 2009, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.net/yui/license.txt
version: 2.8.0r4
*/
if(typeof YAHOO=="undefined"||!YAHOO){var YAHOO={};}YAHOO.namespace=function(){var A=arguments,E=null,C,B,D;for(C=0;C<A.length;C=C+1){D=(""+A[C]).split(".");E=YAHOO;for(B=(D[0]=="YAHOO")?1:0;B<D.length;B=B+1){E[D[B]]=E[D[B]]||{};E=E[D[B]];}}return E;};YAHOO.log=function(D,A,C){var B=YAHOO.widget.Logger;if(B&&B.log){return B.log(D,A,C);}else{return false;}};YAHOO.register=function(A,E,D){var I=YAHOO.env.modules,B,H,G,F,C;if(!I[A]){I[A]={versions:[],builds:[]};}B=I[A];H=D.version;G=D.build;F=YAHOO.env.listeners;B.name=A;B.version=H;B.build=G;B.versions.push(H);B.builds.push(G);B.mainClass=E;for(C=0;C<F.length;C=C+1){F[C](B);}if(E){E.VERSION=H;E.BUILD=G;}else{YAHOO.log("mainClass is undefined for module "+A,"warn");}};YAHOO.env=YAHOO.env||{modules:[],listeners:[]};YAHOO.env.getVersion=function(A){return YAHOO.env.modules[A]||null;};YAHOO.env.ua=function(){var D=function(H){var I=0;return parseFloat(H.replace(/\./g,function(){return(I++==1)?"":".";}));},G=navigator,F={ie:0,opera:0,gecko:0,webkit:0,mobile:null,air:0,caja:G.cajaVersion,secure:false,os:null},C=navigator&&navigator.userAgent,E=window&&window.location,B=E&&E.href,A;F.secure=B&&(B.toLowerCase().indexOf("https")===0);if(C){if((/windows|win32/i).test(C)){F.os="windows";}else{if((/macintosh/i).test(C)){F.os="macintosh";}}if((/KHTML/).test(C)){F.webkit=1;}A=C.match(/AppleWebKit\/([^\s]*)/);if(A&&A[1]){F.webkit=D(A[1]);if(/ Mobile\//.test(C)){F.mobile="Apple";}else{A=C.match(/NokiaN[^\/]*/);if(A){F.mobile=A[0];}}A=C.match(/AdobeAIR\/([^\s]*)/);if(A){F.air=A[0];}}if(!F.webkit){A=C.match(/Opera[\s\/]([^\s]*)/);if(A&&A[1]){F.opera=D(A[1]);A=C.match(/Opera Mini[^;]*/);if(A){F.mobile=A[0];}}else{A=C.match(/MSIE\s([^;]*)/);if(A&&A[1]){F.ie=D(A[1]);}else{A=C.match(/Gecko\/([^\s]*)/);if(A){F.gecko=1;A=C.match(/rv:([^\s\)]*)/);if(A&&A[1]){F.gecko=D(A[1]);}}}}}}return F;}();(function(){YAHOO.namespace("util","widget","example");if("undefined"!==typeof YAHOO_config){var B=YAHOO_config.listener,A=YAHOO.env.listeners,D=true,C;if(B){for(C=0;C<A.length;C++){if(A[C]==B){D=false;break;}}if(D){A.push(B);}}}})();YAHOO.lang=YAHOO.lang||{};(function(){var B=YAHOO.lang,A=Object.prototype,H="[object Array]",C="[object Function]",G="[object Object]",E=[],F=["toString","valueOf"],D={isArray:function(I){return A.toString.apply(I)===H;},isBoolean:function(I){return typeof I==="boolean";},isFunction:function(I){return(typeof I==="function")||A.toString.apply(I)===C;},isNull:function(I){return I===null;},isNumber:function(I){return typeof I==="number"&&isFinite(I);},isObject:function(I){return(I&&(typeof I==="object"||B.isFunction(I)))||false;},isString:function(I){return typeof I==="string";},isUndefined:function(I){return typeof I==="undefined";},_IEEnumFix:(YAHOO.env.ua.ie)?function(K,J){var I,M,L;for(I=0;I<F.length;I=I+1){M=F[I];L=J[M];if(B.isFunction(L)&&L!=A[M]){K[M]=L;}}}:function(){},extend:function(L,M,K){if(!M||!L){throw new Error("extend failed, please check that "+"all dependencies are included.");}var J=function(){},I;J.prototype=M.prototype;L.prototype=new J();L.prototype.constructor=L;L.superclass=M.prototype;if(M.prototype.constructor==A.constructor){M.prototype.constructor=M;}if(K){for(I in K){if(B.hasOwnProperty(K,I)){L.prototype[I]=K[I];}}B._IEEnumFix(L.prototype,K);}},augmentObject:function(M,L){if(!L||!M){throw new Error("Absorb failed, verify dependencies.");}var I=arguments,K,N,J=I[2];if(J&&J!==true){for(K=2;K<I.length;K=K+1){M[I[K]]=L[I[K]];}}else{for(N in L){if(J||!(N in M)){M[N]=L[N];}}B._IEEnumFix(M,L);}},augmentProto:function(L,K){if(!K||!L){throw new Error("Augment failed, verify dependencies.");}var I=[L.prototype,K.prototype],J;for(J=2;J<arguments.length;J=J+1){I.push(arguments[J]);}B.augmentObject.apply(this,I);},dump:function(I,N){var K,M,P=[],Q="{...}",J="f(){...}",O=", ",L=" => ";if(!B.isObject(I)){return I+"";}else{if(I instanceof Date||("nodeType" in I&&"tagName" in I)){return I;}else{if(B.isFunction(I)){return J;}}}N=(B.isNumber(N))?N:3;if(B.isArray(I)){P.push("[");for(K=0,M=I.length;K<M;K=K+1){if(B.isObject(I[K])){P.push((N>0)?B.dump(I[K],N-1):Q);}else{P.push(I[K]);}P.push(O);}if(P.length>1){P.pop();}P.push("]");}else{P.push("{");for(K in I){if(B.hasOwnProperty(I,K)){P.push(K+L);if(B.isObject(I[K])){P.push((N>0)?B.dump(I[K],N-1):Q);}else{P.push(I[K]);}P.push(O);}}if(P.length>1){P.pop();}P.push("}");}return P.join("");},substitute:function(Y,J,R){var N,M,L,U,V,X,T=[],K,O="dump",S=" ",I="{",W="}",Q,P;for(;;){N=Y.lastIndexOf(I);if(N<0){break;}M=Y.indexOf(W,N);if(N+1>=M){break;}K=Y.substring(N+1,M);U=K;X=null;L=U.indexOf(S);if(L>-1){X=U.substring(L+1);U=U.substring(0,L);}V=J[U];if(R){V=R(U,V,X);}if(B.isObject(V)){if(B.isArray(V)){V=B.dump(V,parseInt(X,10));}else{X=X||"";Q=X.indexOf(O);if(Q>-1){X=X.substring(4);}P=V.toString();if(P===G||Q>-1){V=B.dump(V,parseInt(X,10));}else{V=P;}}}else{if(!B.isString(V)&&!B.isNumber(V)){V="~-"+T.length+"-~";T[T.length]=K;}}Y=Y.substring(0,N)+V+Y.substring(M+1);}for(N=T.length-1;N>=0;N=N-1){Y=Y.replace(new RegExp("~-"+N+"-~"),"{"+T[N]+"}","g");}return Y;},trim:function(I){try{return I.replace(/^\s+|\s+$/g,"");}catch(J){return I;}},merge:function(){var L={},J=arguments,I=J.length,K;for(K=0;K<I;K=K+1){B.augmentObject(L,J[K],true);}return L;},later:function(P,J,Q,L,M){P=P||0;J=J||{};var K=Q,O=L,N,I;if(B.isString(Q)){K=J[Q];}if(!K){throw new TypeError("method undefined");}if(O&&!B.isArray(O)){O=[L];}N=function(){K.apply(J,O||E);};I=(M)?setInterval(N,P):setTimeout(N,P);return{interval:M,cancel:function(){if(this.interval){clearInterval(I);}else{clearTimeout(I);}}};},isValue:function(I){return(B.isObject(I)||B.isString(I)||B.isNumber(I)||B.isBoolean(I));}};B.hasOwnProperty=(A.hasOwnProperty)?function(I,J){return I&&I.hasOwnProperty(J);}:function(I,J){return !B.isUndefined(I[J])&&I.constructor.prototype[J]!==I[J];};D.augmentObject(B,D,true);YAHOO.util.Lang=B;B.augment=B.augmentProto;YAHOO.augment=B.augmentProto;YAHOO.extend=B.extend;})();YAHOO.register("yahoo",YAHOO,{version:"2.8.0r4",build:"2449"});
(function(){YAHOO.env._id_counter=YAHOO.env._id_counter||0;var E=YAHOO.util,L=YAHOO.lang,m=YAHOO.env.ua,A=YAHOO.lang.trim,d={},h={},N=/^t(?:able|d|h)$/i,X=/color$/i,K=window.document,W=K.documentElement,e="ownerDocument",n="defaultView",v="documentElement",t="compatMode",b="offsetLeft",P="offsetTop",u="offsetParent",Z="parentNode",l="nodeType",C="tagName",O="scrollLeft",i="scrollTop",Q="getBoundingClientRect",w="getComputedStyle",a="currentStyle",M="CSS1Compat",c="BackCompat",g="class",F="className",J="",B=" ",s="(?:^|\\s)",k="(?= |$)",U="g",p="position",f="fixed",V="relative",j="left",o="top",r="medium",q="borderLeftWidth",R="borderTopWidth",D=m.opera,I=m.webkit,H=m.gecko,T=m.ie;E.Dom={CUSTOM_ATTRIBUTES:(!W.hasAttribute)?{"for":"htmlFor","class":F}:{"htmlFor":"for","className":g},DOT_ATTRIBUTES:{},get:function(z){var AB,x,AA,y,Y,G;if(z){if(z[l]||z.item){return z;}if(typeof z==="string"){AB=z;z=K.getElementById(z);G=(z)?z.attributes:null;if(z&&G&&G.id&&G.id.value===AB){return z;}else{if(z&&K.all){z=null;x=K.all[AB];for(y=0,Y=x.length;y<Y;++y){if(x[y].id===AB){return x[y];}}}}return z;}if(YAHOO.util.Element&&z instanceof YAHOO.util.Element){z=z.get("element");}if("length" in z){AA=[];for(y=0,Y=z.length;y<Y;++y){AA[AA.length]=E.Dom.get(z[y]);}return AA;}return z;}return null;},getComputedStyle:function(G,Y){if(window[w]){return G[e][n][w](G,null)[Y];}else{if(G[a]){return E.Dom.IE_ComputedStyle.get(G,Y);}}},getStyle:function(G,Y){return E.Dom.batch(G,E.Dom._getStyle,Y);},_getStyle:function(){if(window[w]){return function(G,y){y=(y==="float")?y="cssFloat":E.Dom._toCamel(y);var x=G.style[y],Y;if(!x){Y=G[e][n][w](G,null);if(Y){x=Y[y];}}return x;};}else{if(W[a]){return function(G,y){var x;switch(y){case"opacity":x=100;try{x=G.filters["DXImageTransform.Microsoft.Alpha"].opacity;}catch(z){try{x=G.filters("alpha").opacity;}catch(Y){}}return x/100;case"float":y="styleFloat";default:y=E.Dom._toCamel(y);x=G[a]?G[a][y]:null;return(G.style[y]||x);}};}}}(),setStyle:function(G,Y,x){E.Dom.batch(G,E.Dom._setStyle,{prop:Y,val:x});},_setStyle:function(){if(T){return function(Y,G){var x=E.Dom._toCamel(G.prop),y=G.val;if(Y){switch(x){case"opacity":if(L.isString(Y.style.filter)){Y.style.filter="alpha(opacity="+y*100+")";if(!Y[a]||!Y[a].hasLayout){Y.style.zoom=1;}}break;case"float":x="styleFloat";default:Y.style[x]=y;}}else{}};}else{return function(Y,G){var x=E.Dom._toCamel(G.prop),y=G.val;if(Y){if(x=="float"){x="cssFloat";}Y.style[x]=y;}else{}};}}(),getXY:function(G){return E.Dom.batch(G,E.Dom._getXY);},_canPosition:function(G){return(E.Dom._getStyle(G,"display")!=="none"&&E.Dom._inDoc(G));},_getXY:function(){if(K[v][Q]){return function(y){var z,Y,AA,AF,AE,AD,AC,G,x,AB=Math.floor,AG=false;if(E.Dom._canPosition(y)){AA=y[Q]();AF=y[e];z=E.Dom.getDocumentScrollLeft(AF);Y=E.Dom.getDocumentScrollTop(AF);AG=[AB(AA[j]),AB(AA[o])];if(T&&m.ie<8){AE=2;AD=2;AC=AF[t];if(m.ie===6){if(AC!==c){AE=0;AD=0;}}if((AC===c)){G=S(AF[v],q);x=S(AF[v],R);if(G!==r){AE=parseInt(G,10);}if(x!==r){AD=parseInt(x,10);}}AG[0]-=AE;AG[1]-=AD;}if((Y||z)){AG[0]+=z;AG[1]+=Y;}AG[0]=AB(AG[0]);AG[1]=AB(AG[1]);}else{}return AG;};}else{return function(y){var x,Y,AA,AB,AC,z=false,G=y;if(E.Dom._canPosition(y)){z=[y[b],y[P]];x=E.Dom.getDocumentScrollLeft(y[e]);Y=E.Dom.getDocumentScrollTop(y[e]);AC=((H||m.webkit>519)?true:false);while((G=G[u])){z[0]+=G[b];z[1]+=G[P];if(AC){z=E.Dom._calcBorders(G,z);}}if(E.Dom._getStyle(y,p)!==f){G=y;while((G=G[Z])&&G[C]){AA=G[i];AB=G[O];if(H&&(E.Dom._getStyle(G,"overflow")!=="visible")){z=E.Dom._calcBorders(G,z);}if(AA||AB){z[0]-=AB;z[1]-=AA;}}z[0]+=x;z[1]+=Y;}else{if(D){z[0]-=x;z[1]-=Y;}else{if(I||H){z[0]+=x;z[1]+=Y;}}}z[0]=Math.floor(z[0]);z[1]=Math.floor(z[1]);}else{}return z;};}}(),getX:function(G){var Y=function(x){return E.Dom.getXY(x)[0];};return E.Dom.batch(G,Y,E.Dom,true);},getY:function(G){var Y=function(x){return E.Dom.getXY(x)[1];};return E.Dom.batch(G,Y,E.Dom,true);},setXY:function(G,x,Y){E.Dom.batch(G,E.Dom._setXY,{pos:x,noRetry:Y});},_setXY:function(G,z){var AA=E.Dom._getStyle(G,p),y=E.Dom.setStyle,AD=z.pos,Y=z.noRetry,AB=[parseInt(E.Dom.getComputedStyle(G,j),10),parseInt(E.Dom.getComputedStyle(G,o),10)],AC,x;if(AA=="static"){AA=V;y(G,p,AA);}AC=E.Dom._getXY(G);if(!AD||AC===false){return false;}if(isNaN(AB[0])){AB[0]=(AA==V)?0:G[b];}if(isNaN(AB[1])){AB[1]=(AA==V)?0:G[P];}if(AD[0]!==null){y(G,j,AD[0]-AC[0]+AB[0]+"px");}if(AD[1]!==null){y(G,o,AD[1]-AC[1]+AB[1]+"px");}if(!Y){x=E.Dom._getXY(G);if((AD[0]!==null&&x[0]!=AD[0])||(AD[1]!==null&&x[1]!=AD[1])){E.Dom._setXY(G,{pos:AD,noRetry:true});}}},setX:function(Y,G){E.Dom.setXY(Y,[G,null]);},setY:function(G,Y){E.Dom.setXY(G,[null,Y]);},getRegion:function(G){var Y=function(x){var y=false;if(E.Dom._canPosition(x)){y=E.Region.getRegion(x);}else{}return y;};return E.Dom.batch(G,Y,E.Dom,true);},getClientWidth:function(){return E.Dom.getViewportWidth();},getClientHeight:function(){return E.Dom.getViewportHeight();},getElementsByClassName:function(AB,AF,AC,AE,x,AD){AF=AF||"*";AC=(AC)?E.Dom.get(AC):null||K;if(!AC){return[];}var Y=[],G=AC.getElementsByTagName(AF),z=E.Dom.hasClass;for(var y=0,AA=G.length;y<AA;++y){if(z(G[y],AB)){Y[Y.length]=G[y];}}if(AE){E.Dom.batch(Y,AE,x,AD);}return Y;},hasClass:function(Y,G){return E.Dom.batch(Y,E.Dom._hasClass,G);},_hasClass:function(x,Y){var G=false,y;if(x&&Y){y=E.Dom._getAttribute(x,F)||J;if(Y.exec){G=Y.test(y);}else{G=Y&&(B+y+B).indexOf(B+Y+B)>-1;}}else{}return G;},addClass:function(Y,G){return E.Dom.batch(Y,E.Dom._addClass,G);},_addClass:function(x,Y){var G=false,y;if(x&&Y){y=E.Dom._getAttribute(x,F)||J;if(!E.Dom._hasClass(x,Y)){E.Dom.setAttribute(x,F,A(y+B+Y));G=true;}}else{}return G;},removeClass:function(Y,G){return E.Dom.batch(Y,E.Dom._removeClass,G);},_removeClass:function(y,x){var Y=false,AA,z,G;if(y&&x){AA=E.Dom._getAttribute(y,F)||J;E.Dom.setAttribute(y,F,AA.replace(E.Dom._getClassRegex(x),J));z=E.Dom._getAttribute(y,F);if(AA!==z){E.Dom.setAttribute(y,F,A(z));Y=true;if(E.Dom._getAttribute(y,F)===""){G=(y.hasAttribute&&y.hasAttribute(g))?g:F;
y.removeAttribute(G);}}}else{}return Y;},replaceClass:function(x,Y,G){return E.Dom.batch(x,E.Dom._replaceClass,{from:Y,to:G});},_replaceClass:function(y,x){var Y,AB,AA,G=false,z;if(y&&x){AB=x.from;AA=x.to;if(!AA){G=false;}else{if(!AB){G=E.Dom._addClass(y,x.to);}else{if(AB!==AA){z=E.Dom._getAttribute(y,F)||J;Y=(B+z.replace(E.Dom._getClassRegex(AB),B+AA)).split(E.Dom._getClassRegex(AA));Y.splice(1,0,B+AA);E.Dom.setAttribute(y,F,A(Y.join(J)));G=true;}}}}else{}return G;},generateId:function(G,x){x=x||"yui-gen";var Y=function(y){if(y&&y.id){return y.id;}var z=x+YAHOO.env._id_counter++;if(y){if(y[e]&&y[e].getElementById(z)){return E.Dom.generateId(y,z+x);}y.id=z;}return z;};return E.Dom.batch(G,Y,E.Dom,true)||Y.apply(E.Dom,arguments);},isAncestor:function(Y,x){Y=E.Dom.get(Y);x=E.Dom.get(x);var G=false;if((Y&&x)&&(Y[l]&&x[l])){if(Y.contains&&Y!==x){G=Y.contains(x);}else{if(Y.compareDocumentPosition){G=!!(Y.compareDocumentPosition(x)&16);}}}else{}return G;},inDocument:function(G,Y){return E.Dom._inDoc(E.Dom.get(G),Y);},_inDoc:function(Y,x){var G=false;if(Y&&Y[C]){x=x||Y[e];G=E.Dom.isAncestor(x[v],Y);}else{}return G;},getElementsBy:function(Y,AF,AB,AD,y,AC,AE){AF=AF||"*";AB=(AB)?E.Dom.get(AB):null||K;if(!AB){return[];}var x=[],G=AB.getElementsByTagName(AF);for(var z=0,AA=G.length;z<AA;++z){if(Y(G[z])){if(AE){x=G[z];break;}else{x[x.length]=G[z];}}}if(AD){E.Dom.batch(x,AD,y,AC);}return x;},getElementBy:function(x,G,Y){return E.Dom.getElementsBy(x,G,Y,null,null,null,true);},batch:function(x,AB,AA,z){var y=[],Y=(z)?AA:window;x=(x&&(x[C]||x.item))?x:E.Dom.get(x);if(x&&AB){if(x[C]||x.length===undefined){return AB.call(Y,x,AA);}for(var G=0;G<x.length;++G){y[y.length]=AB.call(Y,x[G],AA);}}else{return false;}return y;},getDocumentHeight:function(){var Y=(K[t]!=M||I)?K.body.scrollHeight:W.scrollHeight,G=Math.max(Y,E.Dom.getViewportHeight());return G;},getDocumentWidth:function(){var Y=(K[t]!=M||I)?K.body.scrollWidth:W.scrollWidth,G=Math.max(Y,E.Dom.getViewportWidth());return G;},getViewportHeight:function(){var G=self.innerHeight,Y=K[t];if((Y||T)&&!D){G=(Y==M)?W.clientHeight:K.body.clientHeight;}return G;},getViewportWidth:function(){var G=self.innerWidth,Y=K[t];if(Y||T){G=(Y==M)?W.clientWidth:K.body.clientWidth;}return G;},getAncestorBy:function(G,Y){while((G=G[Z])){if(E.Dom._testElement(G,Y)){return G;}}return null;},getAncestorByClassName:function(Y,G){Y=E.Dom.get(Y);if(!Y){return null;}var x=function(y){return E.Dom.hasClass(y,G);};return E.Dom.getAncestorBy(Y,x);},getAncestorByTagName:function(Y,G){Y=E.Dom.get(Y);if(!Y){return null;}var x=function(y){return y[C]&&y[C].toUpperCase()==G.toUpperCase();};return E.Dom.getAncestorBy(Y,x);},getPreviousSiblingBy:function(G,Y){while(G){G=G.previousSibling;if(E.Dom._testElement(G,Y)){return G;}}return null;},getPreviousSibling:function(G){G=E.Dom.get(G);if(!G){return null;}return E.Dom.getPreviousSiblingBy(G);},getNextSiblingBy:function(G,Y){while(G){G=G.nextSibling;if(E.Dom._testElement(G,Y)){return G;}}return null;},getNextSibling:function(G){G=E.Dom.get(G);if(!G){return null;}return E.Dom.getNextSiblingBy(G);},getFirstChildBy:function(G,x){var Y=(E.Dom._testElement(G.firstChild,x))?G.firstChild:null;return Y||E.Dom.getNextSiblingBy(G.firstChild,x);},getFirstChild:function(G,Y){G=E.Dom.get(G);if(!G){return null;}return E.Dom.getFirstChildBy(G);},getLastChildBy:function(G,x){if(!G){return null;}var Y=(E.Dom._testElement(G.lastChild,x))?G.lastChild:null;return Y||E.Dom.getPreviousSiblingBy(G.lastChild,x);},getLastChild:function(G){G=E.Dom.get(G);return E.Dom.getLastChildBy(G);},getChildrenBy:function(Y,y){var x=E.Dom.getFirstChildBy(Y,y),G=x?[x]:[];E.Dom.getNextSiblingBy(x,function(z){if(!y||y(z)){G[G.length]=z;}return false;});return G;},getChildren:function(G){G=E.Dom.get(G);if(!G){}return E.Dom.getChildrenBy(G);},getDocumentScrollLeft:function(G){G=G||K;return Math.max(G[v].scrollLeft,G.body.scrollLeft);},getDocumentScrollTop:function(G){G=G||K;return Math.max(G[v].scrollTop,G.body.scrollTop);},insertBefore:function(Y,G){Y=E.Dom.get(Y);G=E.Dom.get(G);if(!Y||!G||!G[Z]){return null;}return G[Z].insertBefore(Y,G);},insertAfter:function(Y,G){Y=E.Dom.get(Y);G=E.Dom.get(G);if(!Y||!G||!G[Z]){return null;}if(G.nextSibling){return G[Z].insertBefore(Y,G.nextSibling);}else{return G[Z].appendChild(Y);}},getClientRegion:function(){var x=E.Dom.getDocumentScrollTop(),Y=E.Dom.getDocumentScrollLeft(),y=E.Dom.getViewportWidth()+Y,G=E.Dom.getViewportHeight()+x;return new E.Region(x,y,G,Y);},setAttribute:function(Y,G,x){E.Dom.batch(Y,E.Dom._setAttribute,{attr:G,val:x});},_setAttribute:function(x,Y){var G=E.Dom._toCamel(Y.attr),y=Y.val;if(x&&x.setAttribute){if(E.Dom.DOT_ATTRIBUTES[G]){x[G]=y;}else{G=E.Dom.CUSTOM_ATTRIBUTES[G]||G;x.setAttribute(G,y);}}else{}},getAttribute:function(Y,G){return E.Dom.batch(Y,E.Dom._getAttribute,G);},_getAttribute:function(Y,G){var x;G=E.Dom.CUSTOM_ATTRIBUTES[G]||G;if(Y&&Y.getAttribute){x=Y.getAttribute(G,2);}else{}return x;},_toCamel:function(Y){var x=d;function G(y,z){return z.toUpperCase();}return x[Y]||(x[Y]=Y.indexOf("-")===-1?Y:Y.replace(/-([a-z])/gi,G));},_getClassRegex:function(Y){var G;if(Y!==undefined){if(Y.exec){G=Y;}else{G=h[Y];if(!G){Y=Y.replace(E.Dom._patterns.CLASS_RE_TOKENS,"\\$1");G=h[Y]=new RegExp(s+Y+k,U);}}}return G;},_patterns:{ROOT_TAG:/^body|html$/i,CLASS_RE_TOKENS:/([\.\(\)\^\$\*\+\?\|\[\]\{\}\\])/g},_testElement:function(G,Y){return G&&G[l]==1&&(!Y||Y(G));},_calcBorders:function(x,y){var Y=parseInt(E.Dom[w](x,R),10)||0,G=parseInt(E.Dom[w](x,q),10)||0;if(H){if(N.test(x[C])){Y=0;G=0;}}y[0]+=G;y[1]+=Y;return y;}};var S=E.Dom[w];if(m.opera){E.Dom[w]=function(Y,G){var x=S(Y,G);if(X.test(G)){x=E.Dom.Color.toRGB(x);}return x;};}if(m.webkit){E.Dom[w]=function(Y,G){var x=S(Y,G);if(x==="rgba(0, 0, 0, 0)"){x="transparent";}return x;};}if(m.ie&&m.ie>=8&&K.documentElement.hasAttribute){E.Dom.DOT_ATTRIBUTES.type=true;}})();YAHOO.util.Region=function(C,D,A,B){this.top=C;this.y=C;this[1]=C;this.right=D;this.bottom=A;this.left=B;this.x=B;this[0]=B;
this.width=this.right-this.left;this.height=this.bottom-this.top;};YAHOO.util.Region.prototype.contains=function(A){return(A.left>=this.left&&A.right<=this.right&&A.top>=this.top&&A.bottom<=this.bottom);};YAHOO.util.Region.prototype.getArea=function(){return((this.bottom-this.top)*(this.right-this.left));};YAHOO.util.Region.prototype.intersect=function(E){var C=Math.max(this.top,E.top),D=Math.min(this.right,E.right),A=Math.min(this.bottom,E.bottom),B=Math.max(this.left,E.left);if(A>=C&&D>=B){return new YAHOO.util.Region(C,D,A,B);}else{return null;}};YAHOO.util.Region.prototype.union=function(E){var C=Math.min(this.top,E.top),D=Math.max(this.right,E.right),A=Math.max(this.bottom,E.bottom),B=Math.min(this.left,E.left);return new YAHOO.util.Region(C,D,A,B);};YAHOO.util.Region.prototype.toString=function(){return("Region {"+"top: "+this.top+", right: "+this.right+", bottom: "+this.bottom+", left: "+this.left+", height: "+this.height+", width: "+this.width+"}");};YAHOO.util.Region.getRegion=function(D){var F=YAHOO.util.Dom.getXY(D),C=F[1],E=F[0]+D.offsetWidth,A=F[1]+D.offsetHeight,B=F[0];return new YAHOO.util.Region(C,E,A,B);};YAHOO.util.Point=function(A,B){if(YAHOO.lang.isArray(A)){B=A[1];A=A[0];}YAHOO.util.Point.superclass.constructor.call(this,B,A,B,A);};YAHOO.extend(YAHOO.util.Point,YAHOO.util.Region);(function(){var B=YAHOO.util,A="clientTop",F="clientLeft",J="parentNode",K="right",W="hasLayout",I="px",U="opacity",L="auto",D="borderLeftWidth",G="borderTopWidth",P="borderRightWidth",V="borderBottomWidth",S="visible",Q="transparent",N="height",E="width",H="style",T="currentStyle",R=/^width|height$/,O=/^(\d[.\d]*)+(em|ex|px|gd|rem|vw|vh|vm|ch|mm|cm|in|pt|pc|deg|rad|ms|s|hz|khz|%){1}?/i,M={get:function(X,Z){var Y="",a=X[T][Z];if(Z===U){Y=B.Dom.getStyle(X,U);}else{if(!a||(a.indexOf&&a.indexOf(I)>-1)){Y=a;}else{if(B.Dom.IE_COMPUTED[Z]){Y=B.Dom.IE_COMPUTED[Z](X,Z);}else{if(O.test(a)){Y=B.Dom.IE.ComputedStyle.getPixel(X,Z);}else{Y=a;}}}}return Y;},getOffset:function(Z,e){var b=Z[T][e],X=e.charAt(0).toUpperCase()+e.substr(1),c="offset"+X,Y="pixel"+X,a="",d;if(b==L){d=Z[c];if(d===undefined){a=0;}a=d;if(R.test(e)){Z[H][e]=d;if(Z[c]>d){a=d-(Z[c]-d);}Z[H][e]=L;}}else{if(!Z[H][Y]&&!Z[H][e]){Z[H][e]=b;}a=Z[H][Y];}return a+I;},getBorderWidth:function(X,Z){var Y=null;if(!X[T][W]){X[H].zoom=1;}switch(Z){case G:Y=X[A];break;case V:Y=X.offsetHeight-X.clientHeight-X[A];break;case D:Y=X[F];break;case P:Y=X.offsetWidth-X.clientWidth-X[F];break;}return Y+I;},getPixel:function(Y,X){var a=null,b=Y[T][K],Z=Y[T][X];Y[H][K]=Z;a=Y[H].pixelRight;Y[H][K]=b;return a+I;},getMargin:function(Y,X){var Z;if(Y[T][X]==L){Z=0+I;}else{Z=B.Dom.IE.ComputedStyle.getPixel(Y,X);}return Z;},getVisibility:function(Y,X){var Z;while((Z=Y[T])&&Z[X]=="inherit"){Y=Y[J];}return(Z)?Z[X]:S;},getColor:function(Y,X){return B.Dom.Color.toRGB(Y[T][X])||Q;},getBorderColor:function(Y,X){var Z=Y[T],a=Z[X]||Z.color;return B.Dom.Color.toRGB(B.Dom.Color.toHex(a));}},C={};C.top=C.right=C.bottom=C.left=C[E]=C[N]=M.getOffset;C.color=M.getColor;C[G]=C[P]=C[V]=C[D]=M.getBorderWidth;C.marginTop=C.marginRight=C.marginBottom=C.marginLeft=M.getMargin;C.visibility=M.getVisibility;C.borderColor=C.borderTopColor=C.borderRightColor=C.borderBottomColor=C.borderLeftColor=M.getBorderColor;B.Dom.IE_COMPUTED=C;B.Dom.IE_ComputedStyle=M;})();(function(){var C="toString",A=parseInt,B=RegExp,D=YAHOO.util;D.Dom.Color={KEYWORDS:{black:"000",silver:"c0c0c0",gray:"808080",white:"fff",maroon:"800000",red:"f00",purple:"800080",fuchsia:"f0f",green:"008000",lime:"0f0",olive:"808000",yellow:"ff0",navy:"000080",blue:"00f",teal:"008080",aqua:"0ff"},re_RGB:/^rgb\(([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\)$/i,re_hex:/^#?([0-9A-F]{2})([0-9A-F]{2})([0-9A-F]{2})$/i,re_hex3:/([0-9A-F])/gi,toRGB:function(E){if(!D.Dom.Color.re_RGB.test(E)){E=D.Dom.Color.toHex(E);}if(D.Dom.Color.re_hex.exec(E)){E="rgb("+[A(B.$1,16),A(B.$2,16),A(B.$3,16)].join(", ")+")";}return E;},toHex:function(H){H=D.Dom.Color.KEYWORDS[H]||H;if(D.Dom.Color.re_RGB.exec(H)){var G=(B.$1.length===1)?"0"+B.$1:Number(B.$1),F=(B.$2.length===1)?"0"+B.$2:Number(B.$2),E=(B.$3.length===1)?"0"+B.$3:Number(B.$3);H=[G[C](16),F[C](16),E[C](16)].join("");}if(H.length<6){H=H.replace(D.Dom.Color.re_hex3,"$1$1");}if(H!=="transparent"&&H.indexOf("#")<0){H="#"+H;}return H.toLowerCase();}};}());YAHOO.register("dom",YAHOO.util.Dom,{version:"2.8.0r4",build:"2449"});YAHOO.util.CustomEvent=function(D,C,B,A,E){this.type=D;this.scope=C||window;this.silent=B;this.fireOnce=E;this.fired=false;this.firedWith=null;this.signature=A||YAHOO.util.CustomEvent.LIST;this.subscribers=[];if(!this.silent){}var F="_YUICEOnSubscribe";if(D!==F){this.subscribeEvent=new YAHOO.util.CustomEvent(F,this,true);}this.lastError=null;};YAHOO.util.CustomEvent.LIST=0;YAHOO.util.CustomEvent.FLAT=1;YAHOO.util.CustomEvent.prototype={subscribe:function(B,C,D){if(!B){throw new Error("Invalid callback for subscriber to '"+this.type+"'");}if(this.subscribeEvent){this.subscribeEvent.fire(B,C,D);}var A=new YAHOO.util.Subscriber(B,C,D);if(this.fireOnce&&this.fired){this.notify(A,this.firedWith);}else{this.subscribers.push(A);}},unsubscribe:function(D,F){if(!D){return this.unsubscribeAll();}var E=false;for(var B=0,A=this.subscribers.length;B<A;++B){var C=this.subscribers[B];if(C&&C.contains(D,F)){this._delete(B);E=true;}}return E;},fire:function(){this.lastError=null;var H=[],A=this.subscribers.length;var D=[].slice.call(arguments,0),C=true,F,B=false;if(this.fireOnce){if(this.fired){return true;}else{this.firedWith=D;}}this.fired=true;if(!A&&this.silent){return true;}if(!this.silent){}var E=this.subscribers.slice();for(F=0;F<A;++F){var G=E[F];if(!G){B=true;}else{C=this.notify(G,D);if(false===C){if(!this.silent){}break;}}}return(C!==false);},notify:function(F,C){var B,H=null,E=F.getScope(this.scope),A=YAHOO.util.Event.throwErrors;if(!this.silent){}if(this.signature==YAHOO.util.CustomEvent.FLAT){if(C.length>0){H=C[0];}try{B=F.fn.call(E,H,F.obj);}catch(G){this.lastError=G;if(A){throw G;}}}else{try{B=F.fn.call(E,this.type,C,F.obj);}catch(D){this.lastError=D;if(A){throw D;}}}return B;},unsubscribeAll:function(){var A=this.subscribers.length,B;for(B=A-1;B>-1;B--){this._delete(B);}this.subscribers=[];return A;},_delete:function(A){var B=this.subscribers[A];if(B){delete B.fn;delete B.obj;}this.subscribers.splice(A,1);},toString:function(){return"CustomEvent: "+"'"+this.type+"', "+"context: "+this.scope;}};YAHOO.util.Subscriber=function(A,B,C){this.fn=A;this.obj=YAHOO.lang.isUndefined(B)?null:B;this.overrideContext=C;};YAHOO.util.Subscriber.prototype.getScope=function(A){if(this.overrideContext){if(this.overrideContext===true){return this.obj;}else{return this.overrideContext;}}return A;};YAHOO.util.Subscriber.prototype.contains=function(A,B){if(B){return(this.fn==A&&this.obj==B);}else{return(this.fn==A);}};YAHOO.util.Subscriber.prototype.toString=function(){return"Subscriber { obj: "+this.obj+", overrideContext: "+(this.overrideContext||"no")+" }";};if(!YAHOO.util.Event){YAHOO.util.Event=function(){var G=false,H=[],J=[],A=0,E=[],B=0,C={63232:38,63233:40,63234:37,63235:39,63276:33,63277:34,25:9},D=YAHOO.env.ua.ie,F="focusin",I="focusout";return{POLL_RETRYS:500,POLL_INTERVAL:40,EL:0,TYPE:1,FN:2,WFN:3,UNLOAD_OBJ:3,ADJ_SCOPE:4,OBJ:5,OVERRIDE:6,CAPTURE:7,lastError:null,isSafari:YAHOO.env.ua.webkit,webkit:YAHOO.env.ua.webkit,isIE:D,_interval:null,_dri:null,_specialTypes:{focusin:(D?"focusin":"focus"),focusout:(D?"focusout":"blur")},DOMReady:false,throwErrors:false,startInterval:function(){if(!this._interval){this._interval=YAHOO.lang.later(this.POLL_INTERVAL,this,this._tryPreloadAttach,null,true);}},onAvailable:function(Q,M,O,P,N){var K=(YAHOO.lang.isString(Q))?[Q]:Q;for(var L=0;L<K.length;L=L+1){E.push({id:K[L],fn:M,obj:O,overrideContext:P,checkReady:N});}A=this.POLL_RETRYS;this.startInterval();},onContentReady:function(N,K,L,M){this.onAvailable(N,K,L,M,true);},onDOMReady:function(){this.DOMReadyEvent.subscribe.apply(this.DOMReadyEvent,arguments);},_addListener:function(M,K,V,P,T,Y){if(!V||!V.call){return false;}if(this._isValidCollection(M)){var W=true;for(var Q=0,S=M.length;Q<S;++Q){W=this.on(M[Q],K,V,P,T)&&W;}return W;}else{if(YAHOO.lang.isString(M)){var O=this.getEl(M);if(O){M=O;}else{this.onAvailable(M,function(){YAHOO.util.Event._addListener(M,K,V,P,T,Y);});return true;}}}if(!M){return false;}if("unload"==K&&P!==this){J[J.length]=[M,K,V,P,T];return true;}var L=M;if(T){if(T===true){L=P;}else{L=T;}}var N=function(Z){return V.call(L,YAHOO.util.Event.getEvent(Z,M),P);};var X=[M,K,V,N,L,P,T,Y];var R=H.length;H[R]=X;try{this._simpleAdd(M,K,N,Y);}catch(U){this.lastError=U;this.removeListener(M,K,V);return false;}return true;},_getType:function(K){return this._specialTypes[K]||K;},addListener:function(M,P,L,N,O){var K=((P==F||P==I)&&!YAHOO.env.ua.ie)?true:false;return this._addListener(M,this._getType(P),L,N,O,K);},addFocusListener:function(L,K,M,N){return this.on(L,F,K,M,N);},removeFocusListener:function(L,K){return this.removeListener(L,F,K);},addBlurListener:function(L,K,M,N){return this.on(L,I,K,M,N);},removeBlurListener:function(L,K){return this.removeListener(L,I,K);},removeListener:function(L,K,R){var M,P,U;K=this._getType(K);if(typeof L=="string"){L=this.getEl(L);}else{if(this._isValidCollection(L)){var S=true;for(M=L.length-1;M>-1;M--){S=(this.removeListener(L[M],K,R)&&S);}return S;}}if(!R||!R.call){return this.purgeElement(L,false,K);}if("unload"==K){for(M=J.length-1;M>-1;M--){U=J[M];if(U&&U[0]==L&&U[1]==K&&U[2]==R){J.splice(M,1);return true;}}return false;}var N=null;var O=arguments[3];if("undefined"===typeof O){O=this._getCacheIndex(H,L,K,R);}if(O>=0){N=H[O];}if(!L||!N){return false;}var T=N[this.CAPTURE]===true?true:false;try{this._simpleRemove(L,K,N[this.WFN],T);}catch(Q){this.lastError=Q;return false;}delete H[O][this.WFN];delete H[O][this.FN];H.splice(O,1);return true;},getTarget:function(M,L){var K=M.target||M.srcElement;return this.resolveTextNode(K);},resolveTextNode:function(L){try{if(L&&3==L.nodeType){return L.parentNode;}}catch(K){}return L;},getPageX:function(L){var K=L.pageX;if(!K&&0!==K){K=L.clientX||0;if(this.isIE){K+=this._getScrollLeft();}}return K;},getPageY:function(K){var L=K.pageY;if(!L&&0!==L){L=K.clientY||0;if(this.isIE){L+=this._getScrollTop();}}return L;},getXY:function(K){return[this.getPageX(K),this.getPageY(K)];},getRelatedTarget:function(L){var K=L.relatedTarget;if(!K){if(L.type=="mouseout"){K=L.toElement;
}else{if(L.type=="mouseover"){K=L.fromElement;}}}return this.resolveTextNode(K);},getTime:function(M){if(!M.time){var L=new Date().getTime();try{M.time=L;}catch(K){this.lastError=K;return L;}}return M.time;},stopEvent:function(K){this.stopPropagation(K);this.preventDefault(K);},stopPropagation:function(K){if(K.stopPropagation){K.stopPropagation();}else{K.cancelBubble=true;}},preventDefault:function(K){if(K.preventDefault){K.preventDefault();}else{K.returnValue=false;}},getEvent:function(M,K){var L=M||window.event;if(!L){var N=this.getEvent.caller;while(N){L=N.arguments[0];if(L&&Event==L.constructor){break;}N=N.caller;}}return L;},getCharCode:function(L){var K=L.keyCode||L.charCode||0;if(YAHOO.env.ua.webkit&&(K in C)){K=C[K];}return K;},_getCacheIndex:function(M,P,Q,O){for(var N=0,L=M.length;N<L;N=N+1){var K=M[N];if(K&&K[this.FN]==O&&K[this.EL]==P&&K[this.TYPE]==Q){return N;}}return -1;},generateId:function(K){var L=K.id;if(!L){L="yuievtautoid-"+B;++B;K.id=L;}return L;},_isValidCollection:function(L){try{return(L&&typeof L!=="string"&&L.length&&!L.tagName&&!L.alert&&typeof L[0]!=="undefined");}catch(K){return false;}},elCache:{},getEl:function(K){return(typeof K==="string")?document.getElementById(K):K;},clearCache:function(){},DOMReadyEvent:new YAHOO.util.CustomEvent("DOMReady",YAHOO,0,0,1),_load:function(L){if(!G){G=true;var K=YAHOO.util.Event;K._ready();K._tryPreloadAttach();}},_ready:function(L){var K=YAHOO.util.Event;if(!K.DOMReady){K.DOMReady=true;K.DOMReadyEvent.fire();K._simpleRemove(document,"DOMContentLoaded",K._ready);}},_tryPreloadAttach:function(){if(E.length===0){A=0;if(this._interval){this._interval.cancel();this._interval=null;}return;}if(this.locked){return;}if(this.isIE){if(!this.DOMReady){this.startInterval();return;}}this.locked=true;var Q=!G;if(!Q){Q=(A>0&&E.length>0);}var P=[];var R=function(T,U){var S=T;if(U.overrideContext){if(U.overrideContext===true){S=U.obj;}else{S=U.overrideContext;}}U.fn.call(S,U.obj);};var L,K,O,N,M=[];for(L=0,K=E.length;L<K;L=L+1){O=E[L];if(O){N=this.getEl(O.id);if(N){if(O.checkReady){if(G||N.nextSibling||!Q){M.push(O);E[L]=null;}}else{R(N,O);E[L]=null;}}else{P.push(O);}}}for(L=0,K=M.length;L<K;L=L+1){O=M[L];R(this.getEl(O.id),O);}A--;if(Q){for(L=E.length-1;L>-1;L--){O=E[L];if(!O||!O.id){E.splice(L,1);}}this.startInterval();}else{if(this._interval){this._interval.cancel();this._interval=null;}}this.locked=false;},purgeElement:function(O,P,R){var M=(YAHOO.lang.isString(O))?this.getEl(O):O;var Q=this.getListeners(M,R),N,K;if(Q){for(N=Q.length-1;N>-1;N--){var L=Q[N];this.removeListener(M,L.type,L.fn);}}if(P&&M&&M.childNodes){for(N=0,K=M.childNodes.length;N<K;++N){this.purgeElement(M.childNodes[N],P,R);}}},getListeners:function(M,K){var P=[],L;if(!K){L=[H,J];}else{if(K==="unload"){L=[J];}else{K=this._getType(K);L=[H];}}var R=(YAHOO.lang.isString(M))?this.getEl(M):M;for(var O=0;O<L.length;O=O+1){var T=L[O];if(T){for(var Q=0,S=T.length;Q<S;++Q){var N=T[Q];if(N&&N[this.EL]===R&&(!K||K===N[this.TYPE])){P.push({type:N[this.TYPE],fn:N[this.FN],obj:N[this.OBJ],adjust:N[this.OVERRIDE],scope:N[this.ADJ_SCOPE],index:Q});}}}}return(P.length)?P:null;},_unload:function(R){var L=YAHOO.util.Event,O,N,M,Q,P,S=J.slice(),K;for(O=0,Q=J.length;O<Q;++O){M=S[O];if(M){K=window;if(M[L.ADJ_SCOPE]){if(M[L.ADJ_SCOPE]===true){K=M[L.UNLOAD_OBJ];}else{K=M[L.ADJ_SCOPE];}}M[L.FN].call(K,L.getEvent(R,M[L.EL]),M[L.UNLOAD_OBJ]);S[O]=null;}}M=null;K=null;J=null;if(H){for(N=H.length-1;N>-1;N--){M=H[N];if(M){L.removeListener(M[L.EL],M[L.TYPE],M[L.FN],N);}}M=null;}L._simpleRemove(window,"unload",L._unload);},_getScrollLeft:function(){return this._getScroll()[1];},_getScrollTop:function(){return this._getScroll()[0];},_getScroll:function(){var K=document.documentElement,L=document.body;if(K&&(K.scrollTop||K.scrollLeft)){return[K.scrollTop,K.scrollLeft];}else{if(L){return[L.scrollTop,L.scrollLeft];}else{return[0,0];}}},regCE:function(){},_simpleAdd:function(){if(window.addEventListener){return function(M,N,L,K){M.addEventListener(N,L,(K));};}else{if(window.attachEvent){return function(M,N,L,K){M.attachEvent("on"+N,L);};}else{return function(){};}}}(),_simpleRemove:function(){if(window.removeEventListener){return function(M,N,L,K){M.removeEventListener(N,L,(K));};}else{if(window.detachEvent){return function(L,M,K){L.detachEvent("on"+M,K);};}else{return function(){};}}}()};}();(function(){var EU=YAHOO.util.Event;EU.on=EU.addListener;EU.onFocus=EU.addFocusListener;EU.onBlur=EU.addBlurListener;
/* DOMReady: based on work by: Dean Edwards/John Resig/Matthias Miller/Diego Perini */
if(EU.isIE){if(self!==self.top){document.onreadystatechange=function(){if(document.readyState=="complete"){document.onreadystatechange=null;EU._ready();}};}else{YAHOO.util.Event.onDOMReady(YAHOO.util.Event._tryPreloadAttach,YAHOO.util.Event,true);var n=document.createElement("p");EU._dri=setInterval(function(){try{n.doScroll("left");clearInterval(EU._dri);EU._dri=null;EU._ready();n=null;}catch(ex){}},EU.POLL_INTERVAL);}}else{if(EU.webkit&&EU.webkit<525){EU._dri=setInterval(function(){var rs=document.readyState;if("loaded"==rs||"complete"==rs){clearInterval(EU._dri);EU._dri=null;EU._ready();}},EU.POLL_INTERVAL);}else{EU._simpleAdd(document,"DOMContentLoaded",EU._ready);}}EU._simpleAdd(window,"load",EU._load);EU._simpleAdd(window,"unload",EU._unload);EU._tryPreloadAttach();})();}YAHOO.util.EventProvider=function(){};YAHOO.util.EventProvider.prototype={__yui_events:null,__yui_subscribers:null,subscribe:function(A,C,F,E){this.__yui_events=this.__yui_events||{};var D=this.__yui_events[A];if(D){D.subscribe(C,F,E);}else{this.__yui_subscribers=this.__yui_subscribers||{};var B=this.__yui_subscribers;if(!B[A]){B[A]=[];}B[A].push({fn:C,obj:F,overrideContext:E});}},unsubscribe:function(C,E,G){this.__yui_events=this.__yui_events||{};var A=this.__yui_events;if(C){var F=A[C];if(F){return F.unsubscribe(E,G);}}else{var B=true;for(var D in A){if(YAHOO.lang.hasOwnProperty(A,D)){B=B&&A[D].unsubscribe(E,G);}}return B;}return false;},unsubscribeAll:function(A){return this.unsubscribe(A);
},createEvent:function(B,G){this.__yui_events=this.__yui_events||{};var E=G||{},D=this.__yui_events,F;if(D[B]){}else{F=new YAHOO.util.CustomEvent(B,E.scope||this,E.silent,YAHOO.util.CustomEvent.FLAT,E.fireOnce);D[B]=F;if(E.onSubscribeCallback){F.subscribeEvent.subscribe(E.onSubscribeCallback);}this.__yui_subscribers=this.__yui_subscribers||{};var A=this.__yui_subscribers[B];if(A){for(var C=0;C<A.length;++C){F.subscribe(A[C].fn,A[C].obj,A[C].overrideContext);}}}return D[B];},fireEvent:function(B){this.__yui_events=this.__yui_events||{};var D=this.__yui_events[B];if(!D){return null;}var A=[];for(var C=1;C<arguments.length;++C){A.push(arguments[C]);}return D.fire.apply(D,A);},hasEvent:function(A){if(this.__yui_events){if(this.__yui_events[A]){return true;}}return false;}};(function(){var A=YAHOO.util.Event,C=YAHOO.lang;YAHOO.util.KeyListener=function(D,I,E,F){if(!D){}else{if(!I){}else{if(!E){}}}if(!F){F=YAHOO.util.KeyListener.KEYDOWN;}var G=new YAHOO.util.CustomEvent("keyPressed");this.enabledEvent=new YAHOO.util.CustomEvent("enabled");this.disabledEvent=new YAHOO.util.CustomEvent("disabled");if(C.isString(D)){D=document.getElementById(D);}if(C.isFunction(E)){G.subscribe(E);}else{G.subscribe(E.fn,E.scope,E.correctScope);}function H(O,N){if(!I.shift){I.shift=false;}if(!I.alt){I.alt=false;}if(!I.ctrl){I.ctrl=false;}if(O.shiftKey==I.shift&&O.altKey==I.alt&&O.ctrlKey==I.ctrl){var J,M=I.keys,L;if(YAHOO.lang.isArray(M)){for(var K=0;K<M.length;K++){J=M[K];L=A.getCharCode(O);if(J==L){G.fire(L,O);break;}}}else{L=A.getCharCode(O);if(M==L){G.fire(L,O);}}}}this.enable=function(){if(!this.enabled){A.on(D,F,H);this.enabledEvent.fire(I);}this.enabled=true;};this.disable=function(){if(this.enabled){A.removeListener(D,F,H);this.disabledEvent.fire(I);}this.enabled=false;};this.toString=function(){return"KeyListener ["+I.keys+"] "+D.tagName+(D.id?"["+D.id+"]":"");};};var B=YAHOO.util.KeyListener;B.KEYDOWN="keydown";B.KEYUP="keyup";B.KEY={ALT:18,BACK_SPACE:8,CAPS_LOCK:20,CONTROL:17,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,META:224,NUM_LOCK:144,PAGE_DOWN:34,PAGE_UP:33,PAUSE:19,PRINTSCREEN:44,RIGHT:39,SCROLL_LOCK:145,SHIFT:16,SPACE:32,TAB:9,UP:38};})();YAHOO.register("event",YAHOO.util.Event,{version:"2.8.0r4",build:"2449"});YAHOO.register("yahoo-dom-event", YAHOO, {version: "2.8.0r4", build: "2449"});
/*
Copyright (c) 2009, Yahoo! Inc. All rights reserved.
Code licensed under the BSD License:
http://developer.yahoo.net/yui/license.txt
version: 2.8.0r4
*/
(function(){var B=YAHOO.util;var A=function(D,C,E,F){if(!D){}this.init(D,C,E,F);};A.NAME="Anim";A.prototype={toString:function(){var C=this.getEl()||{};var D=C.id||C.tagName;return(this.constructor.NAME+": "+D);},patterns:{noNegatives:/width|height|opacity|padding/i,offsetAttribute:/^((width|height)|(top|left))$/,defaultUnit:/width|height|top$|bottom$|left$|right$/i,offsetUnit:/\d+(em|%|en|ex|pt|in|cm|mm|pc)$/i},doMethod:function(C,E,D){return this.method(this.currentFrame,E,D-E,this.totalFrames);},setAttribute:function(C,F,E){var D=this.getEl();if(this.patterns.noNegatives.test(C)){F=(F>0)?F:0;}if(C in D&&!("style" in D&&C in D.style)){D[C]=F;}else{B.Dom.setStyle(D,C,F+E);}},getAttribute:function(C){var E=this.getEl();var G=B.Dom.getStyle(E,C);if(G!=="auto"&&!this.patterns.offsetUnit.test(G)){return parseFloat(G);}var D=this.patterns.offsetAttribute.exec(C)||[];var H=!!(D[3]);var F=!!(D[2]);if("style" in E){if(F||(B.Dom.getStyle(E,"position")=="absolute"&&H)){G=E["offset"+D[0].charAt(0).toUpperCase()+D[0].substr(1)];}else{G=0;}}else{if(C in E){G=E[C];}}return G;},getDefaultUnit:function(C){if(this.patterns.defaultUnit.test(C)){return"px";}return"";},setRuntimeAttribute:function(D){var I;var E;var F=this.attributes;this.runtimeAttributes[D]={};var H=function(J){return(typeof J!=="undefined");};if(!H(F[D]["to"])&&!H(F[D]["by"])){return false;}I=(H(F[D]["from"]))?F[D]["from"]:this.getAttribute(D);if(H(F[D]["to"])){E=F[D]["to"];}else{if(H(F[D]["by"])){if(I.constructor==Array){E=[];for(var G=0,C=I.length;G<C;++G){E[G]=I[G]+F[D]["by"][G]*1;}}else{E=I+F[D]["by"]*1;}}}this.runtimeAttributes[D].start=I;this.runtimeAttributes[D].end=E;this.runtimeAttributes[D].unit=(H(F[D].unit))?F[D]["unit"]:this.getDefaultUnit(D);return true;},init:function(E,J,I,C){var D=false;var F=null;var H=0;E=B.Dom.get(E);this.attributes=J||{};this.duration=!YAHOO.lang.isUndefined(I)?I:1;this.method=C||B.Easing.easeNone;this.useSeconds=true;this.currentFrame=0;this.totalFrames=B.AnimMgr.fps;this.setEl=function(M){E=B.Dom.get(M);};this.getEl=function(){return E;};this.isAnimated=function(){return D;};this.getStartTime=function(){return F;};this.runtimeAttributes={};this.animate=function(){if(this.isAnimated()){return false;}this.currentFrame=0;this.totalFrames=(this.useSeconds)?Math.ceil(B.AnimMgr.fps*this.duration):this.duration;if(this.duration===0&&this.useSeconds){this.totalFrames=1;}B.AnimMgr.registerElement(this);return true;};this.stop=function(M){if(!this.isAnimated()){return false;}if(M){this.currentFrame=this.totalFrames;this._onTween.fire();}B.AnimMgr.stop(this);};var L=function(){this.onStart.fire();this.runtimeAttributes={};for(var M in this.attributes){this.setRuntimeAttribute(M);}D=true;H=0;F=new Date();};var K=function(){var O={duration:new Date()-this.getStartTime(),currentFrame:this.currentFrame};O.toString=function(){return("duration: "+O.duration+", currentFrame: "+O.currentFrame);};this.onTween.fire(O);var N=this.runtimeAttributes;for(var M in N){this.setAttribute(M,this.doMethod(M,N[M].start,N[M].end),N[M].unit);}H+=1;};var G=function(){var M=(new Date()-F)/1000;var N={duration:M,frames:H,fps:H/M};N.toString=function(){return("duration: "+N.duration+", frames: "+N.frames+", fps: "+N.fps);};D=false;H=0;this.onComplete.fire(N);};this._onStart=new B.CustomEvent("_start",this,true);this.onStart=new B.CustomEvent("start",this);this.onTween=new B.CustomEvent("tween",this);this._onTween=new B.CustomEvent("_tween",this,true);this.onComplete=new B.CustomEvent("complete",this);this._onComplete=new B.CustomEvent("_complete",this,true);this._onStart.subscribe(L);this._onTween.subscribe(K);this._onComplete.subscribe(G);}};B.Anim=A;})();YAHOO.util.AnimMgr=new function(){var C=null;var B=[];var A=0;this.fps=1000;this.delay=1;this.registerElement=function(F){B[B.length]=F;A+=1;F._onStart.fire();this.start();};this.unRegister=function(G,F){F=F||E(G);if(!G.isAnimated()||F===-1){return false;}G._onComplete.fire();B.splice(F,1);A-=1;if(A<=0){this.stop();}return true;};this.start=function(){if(C===null){C=setInterval(this.run,this.delay);}};this.stop=function(H){if(!H){clearInterval(C);for(var G=0,F=B.length;G<F;++G){this.unRegister(B[0],0);}B=[];C=null;A=0;}else{this.unRegister(H);}};this.run=function(){for(var H=0,F=B.length;H<F;++H){var G=B[H];if(!G||!G.isAnimated()){continue;}if(G.currentFrame<G.totalFrames||G.totalFrames===null){G.currentFrame+=1;if(G.useSeconds){D(G);}G._onTween.fire();}else{YAHOO.util.AnimMgr.stop(G,H);}}};var E=function(H){for(var G=0,F=B.length;G<F;++G){if(B[G]===H){return G;}}return -1;};var D=function(G){var J=G.totalFrames;var I=G.currentFrame;var H=(G.currentFrame*G.duration*1000/G.totalFrames);var F=(new Date()-G.getStartTime());var K=0;if(F<G.duration*1000){K=Math.round((F/H-1)*G.currentFrame);}else{K=J-(I+1);}if(K>0&&isFinite(K)){if(G.currentFrame+K>=J){K=J-(I+1);}G.currentFrame+=K;}};this._queue=B;this._getIndex=E;};YAHOO.util.Bezier=new function(){this.getPosition=function(E,D){var F=E.length;var C=[];for(var B=0;B<F;++B){C[B]=[E[B][0],E[B][1]];}for(var A=1;A<F;++A){for(B=0;B<F-A;++B){C[B][0]=(1-D)*C[B][0]+D*C[parseInt(B+1,10)][0];C[B][1]=(1-D)*C[B][1]+D*C[parseInt(B+1,10)][1];}}return[C[0][0],C[0][1]];};};(function(){var A=function(F,E,G,H){A.superclass.constructor.call(this,F,E,G,H);};A.NAME="ColorAnim";A.DEFAULT_BGCOLOR="#fff";var C=YAHOO.util;YAHOO.extend(A,C.Anim);var D=A.superclass;var B=A.prototype;B.patterns.color=/color$/i;B.patterns.rgb=/^rgb\(([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\)$/i;B.patterns.hex=/^#?([0-9A-F]{2})([0-9A-F]{2})([0-9A-F]{2})$/i;B.patterns.hex3=/^#?([0-9A-F]{1})([0-9A-F]{1})([0-9A-F]{1})$/i;B.patterns.transparent=/^transparent|rgba\(0, 0, 0, 0\)$/;B.parseColor=function(E){if(E.length==3){return E;}var F=this.patterns.hex.exec(E);if(F&&F.length==4){return[parseInt(F[1],16),parseInt(F[2],16),parseInt(F[3],16)];}F=this.patterns.rgb.exec(E);if(F&&F.length==4){return[parseInt(F[1],10),parseInt(F[2],10),parseInt(F[3],10)];}F=this.patterns.hex3.exec(E);if(F&&F.length==4){return[parseInt(F[1]+F[1],16),parseInt(F[2]+F[2],16),parseInt(F[3]+F[3],16)];
}return null;};B.getAttribute=function(E){var G=this.getEl();if(this.patterns.color.test(E)){var I=YAHOO.util.Dom.getStyle(G,E);var H=this;if(this.patterns.transparent.test(I)){var F=YAHOO.util.Dom.getAncestorBy(G,function(J){return !H.patterns.transparent.test(I);});if(F){I=C.Dom.getStyle(F,E);}else{I=A.DEFAULT_BGCOLOR;}}}else{I=D.getAttribute.call(this,E);}return I;};B.doMethod=function(F,J,G){var I;if(this.patterns.color.test(F)){I=[];for(var H=0,E=J.length;H<E;++H){I[H]=D.doMethod.call(this,F,J[H],G[H]);}I="rgb("+Math.floor(I[0])+","+Math.floor(I[1])+","+Math.floor(I[2])+")";}else{I=D.doMethod.call(this,F,J,G);}return I;};B.setRuntimeAttribute=function(F){D.setRuntimeAttribute.call(this,F);if(this.patterns.color.test(F)){var H=this.attributes;var J=this.parseColor(this.runtimeAttributes[F].start);var G=this.parseColor(this.runtimeAttributes[F].end);if(typeof H[F]["to"]==="undefined"&&typeof H[F]["by"]!=="undefined"){G=this.parseColor(H[F].by);for(var I=0,E=J.length;I<E;++I){G[I]=J[I]+G[I];}}this.runtimeAttributes[F].start=J;this.runtimeAttributes[F].end=G;}};C.ColorAnim=A;})();
/*
TERMS OF USE - EASING EQUATIONS
Open source under the BSD License.
Copyright 2001 Robert Penner All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
YAHOO.util.Easing={easeNone:function(B,A,D,C){return D*B/C+A;},easeIn:function(B,A,D,C){return D*(B/=C)*B+A;},easeOut:function(B,A,D,C){return -D*(B/=C)*(B-2)+A;},easeBoth:function(B,A,D,C){if((B/=C/2)<1){return D/2*B*B+A;}return -D/2*((--B)*(B-2)-1)+A;},easeInStrong:function(B,A,D,C){return D*(B/=C)*B*B*B+A;},easeOutStrong:function(B,A,D,C){return -D*((B=B/C-1)*B*B*B-1)+A;},easeBothStrong:function(B,A,D,C){if((B/=C/2)<1){return D/2*B*B*B*B+A;}return -D/2*((B-=2)*B*B*B-2)+A;},elasticIn:function(C,A,G,F,B,E){if(C==0){return A;}if((C/=F)==1){return A+G;}if(!E){E=F*0.3;}if(!B||B<Math.abs(G)){B=G;var D=E/4;}else{var D=E/(2*Math.PI)*Math.asin(G/B);}return -(B*Math.pow(2,10*(C-=1))*Math.sin((C*F-D)*(2*Math.PI)/E))+A;},elasticOut:function(C,A,G,F,B,E){if(C==0){return A;}if((C/=F)==1){return A+G;}if(!E){E=F*0.3;}if(!B||B<Math.abs(G)){B=G;var D=E/4;}else{var D=E/(2*Math.PI)*Math.asin(G/B);}return B*Math.pow(2,-10*C)*Math.sin((C*F-D)*(2*Math.PI)/E)+G+A;},elasticBoth:function(C,A,G,F,B,E){if(C==0){return A;}if((C/=F/2)==2){return A+G;}if(!E){E=F*(0.3*1.5);}if(!B||B<Math.abs(G)){B=G;var D=E/4;}else{var D=E/(2*Math.PI)*Math.asin(G/B);}if(C<1){return -0.5*(B*Math.pow(2,10*(C-=1))*Math.sin((C*F-D)*(2*Math.PI)/E))+A;}return B*Math.pow(2,-10*(C-=1))*Math.sin((C*F-D)*(2*Math.PI)/E)*0.5+G+A;},backIn:function(B,A,E,D,C){if(typeof C=="undefined"){C=1.70158;}return E*(B/=D)*B*((C+1)*B-C)+A;},backOut:function(B,A,E,D,C){if(typeof C=="undefined"){C=1.70158;}return E*((B=B/D-1)*B*((C+1)*B+C)+1)+A;},backBoth:function(B,A,E,D,C){if(typeof C=="undefined"){C=1.70158;}if((B/=D/2)<1){return E/2*(B*B*(((C*=(1.525))+1)*B-C))+A;}return E/2*((B-=2)*B*(((C*=(1.525))+1)*B+C)+2)+A;},bounceIn:function(B,A,D,C){return D-YAHOO.util.Easing.bounceOut(C-B,0,D,C)+A;},bounceOut:function(B,A,D,C){if((B/=C)<(1/2.75)){return D*(7.5625*B*B)+A;}else{if(B<(2/2.75)){return D*(7.5625*(B-=(1.5/2.75))*B+0.75)+A;}else{if(B<(2.5/2.75)){return D*(7.5625*(B-=(2.25/2.75))*B+0.9375)+A;}}}return D*(7.5625*(B-=(2.625/2.75))*B+0.984375)+A;},bounceBoth:function(B,A,D,C){if(B<C/2){return YAHOO.util.Easing.bounceIn(B*2,0,D,C)*0.5+A;}return YAHOO.util.Easing.bounceOut(B*2-C,0,D,C)*0.5+D*0.5+A;}};(function(){var A=function(H,G,I,J){if(H){A.superclass.constructor.call(this,H,G,I,J);}};A.NAME="Motion";var E=YAHOO.util;YAHOO.extend(A,E.ColorAnim);var F=A.superclass;var C=A.prototype;C.patterns.points=/^points$/i;C.setAttribute=function(G,I,H){if(this.patterns.points.test(G)){H=H||"px";F.setAttribute.call(this,"left",I[0],H);F.setAttribute.call(this,"top",I[1],H);}else{F.setAttribute.call(this,G,I,H);}};C.getAttribute=function(G){if(this.patterns.points.test(G)){var H=[F.getAttribute.call(this,"left"),F.getAttribute.call(this,"top")];}else{H=F.getAttribute.call(this,G);}return H;};C.doMethod=function(G,K,H){var J=null;if(this.patterns.points.test(G)){var I=this.method(this.currentFrame,0,100,this.totalFrames)/100;J=E.Bezier.getPosition(this.runtimeAttributes[G],I);}else{J=F.doMethod.call(this,G,K,H);}return J;};C.setRuntimeAttribute=function(P){if(this.patterns.points.test(P)){var H=this.getEl();var J=this.attributes;var G;var L=J["points"]["control"]||[];var I;var M,O;if(L.length>0&&!(L[0] instanceof Array)){L=[L];}else{var K=[];for(M=0,O=L.length;M<O;++M){K[M]=L[M];}L=K;}if(E.Dom.getStyle(H,"position")=="static"){E.Dom.setStyle(H,"position","relative");}if(D(J["points"]["from"])){E.Dom.setXY(H,J["points"]["from"]);
}else{E.Dom.setXY(H,E.Dom.getXY(H));}G=this.getAttribute("points");if(D(J["points"]["to"])){I=B.call(this,J["points"]["to"],G);var N=E.Dom.getXY(this.getEl());for(M=0,O=L.length;M<O;++M){L[M]=B.call(this,L[M],G);}}else{if(D(J["points"]["by"])){I=[G[0]+J["points"]["by"][0],G[1]+J["points"]["by"][1]];for(M=0,O=L.length;M<O;++M){L[M]=[G[0]+L[M][0],G[1]+L[M][1]];}}}this.runtimeAttributes[P]=[G];if(L.length>0){this.runtimeAttributes[P]=this.runtimeAttributes[P].concat(L);}this.runtimeAttributes[P][this.runtimeAttributes[P].length]=I;}else{F.setRuntimeAttribute.call(this,P);}};var B=function(G,I){var H=E.Dom.getXY(this.getEl());G=[G[0]-H[0]+I[0],G[1]-H[1]+I[1]];return G;};var D=function(G){return(typeof G!=="undefined");};E.Motion=A;})();(function(){var D=function(F,E,G,H){if(F){D.superclass.constructor.call(this,F,E,G,H);}};D.NAME="Scroll";var B=YAHOO.util;YAHOO.extend(D,B.ColorAnim);var C=D.superclass;var A=D.prototype;A.doMethod=function(E,H,F){var G=null;if(E=="scroll"){G=[this.method(this.currentFrame,H[0],F[0]-H[0],this.totalFrames),this.method(this.currentFrame,H[1],F[1]-H[1],this.totalFrames)];}else{G=C.doMethod.call(this,E,H,F);}return G;};A.getAttribute=function(E){var G=null;var F=this.getEl();if(E=="scroll"){G=[F.scrollLeft,F.scrollTop];}else{G=C.getAttribute.call(this,E);}return G;};A.setAttribute=function(E,H,G){var F=this.getEl();if(E=="scroll"){F.scrollLeft=H[0];F.scrollTop=H[1];}else{C.setAttribute.call(this,E,H,G);}};B.Scroll=D;})();YAHOO.register("animation",YAHOO.util.Anim,{version:"2.8.0r4",build:"2449"});/*
Copyright 2010, KISSY UI Library v1.0.5
MIT Licensed
build: 557 Apr 12 19:51
*/
KISSY.add("cookie",function(d){function m(p){return typeof p==="string"&&p!==""}var n=document,j=encodeURIComponent,q=decodeURIComponent;d.Cookie={get:function(p){var g;if(m(p))if(p=n.cookie.match("(?:^| )"+p+"(?:(?:=([^;]*))|;|$)"))g=p[1]?q(p[1]):"";return g},set:function(p,g,c,f,l,h){g=j(g);var a=c;if(typeof a==="number"){a=new Date;a.setTime(a.getTime()+c*864E5)}if(a instanceof Date)g+="; expires="+a.toUTCString();if(m(f))g+="; domain="+f;if(m(l))g+="; path="+l;if(h)g+="; secure";n.cookie=p+"="+
g},remove:function(p){this.set(p,"",0)}}});
KISSY.add("json",function(d){function m(h){return h<10?"0"+h:h}function n(h){p.lastIndex=0;return p.test(h)?'"'+h.replace(p,function(a){var b=f[a];return typeof b==="string"?b:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+h+'"'}function j(h,a){var b,e,i=g,k,o=a[h];if(o&&typeof o==="object"&&typeof o.toJSON==="function")o=o.toJSON(h);if(typeof l==="function")o=l.call(a,h,o);switch(typeof o){case "string":return n(o);case "number":return isFinite(o)?String(o):"null";case "boolean":case "null":return String(o);
case "object":if(!o)return"null";g+=c;k=[];if(Object.prototype.toString.apply(o)==="[object Array]"){e=o.length;for(h=0;h<e;h+=1)k[h]=j(h,o)||"null";a=k.length===0?"[]":g?"[\n"+g+k.join(",\n"+g)+"\n"+i+"]":"["+k.join(",")+"]";g=i;return a}if(l&&typeof l==="object"){e=l.length;for(h=0;h<e;h+=1){b=l[h];if(typeof b==="string")if(a=j(b,o))k.push(n(b)+(g?": ":":")+a)}}else for(b in o)if(Object.hasOwnProperty.call(o,b))if(a=j(b,o))k.push(n(b)+(g?": ":":")+a);a=k.length===0?"{}":g?"{\n"+g+k.join(",\n"+g)+
"\n"+i+"}":"{"+k.join(",")+"}";g=i;return a}}d=d.JSON=window.JSON||{};if(typeof Date.prototype.toJSON!=="function"){Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+m(this.getUTCMonth()+1)+"-"+m(this.getUTCDate())+"T"+m(this.getUTCHours())+":"+m(this.getUTCMinutes())+":"+m(this.getUTCSeconds())+"Z":null};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()}}var q=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
p=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,g,c,f={"":"\\b","\t":"\\t","\n":"\\n","":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},l;if(typeof d.stringify!=="function")d.stringify=function(h,a,b){var e;c=g="";if(typeof b==="number")for(e=0;e<b;e+=1)c+=" ";else if(typeof b==="string")c=b;if((l=a)&&typeof a!=="function"&&(typeof a!=="object"||typeof a.length!=="number"))throw new Error("JSON.stringify");return j("",{"":h})};
if(typeof d.parse!=="function")d.parse=function(h,a){function b(e,i){var k,o,s=e[i];if(s&&typeof s==="object")for(k in s)if(Object.hasOwnProperty.call(s,k)){o=b(s,k);if(o!==undefined)s[k]=o;else delete s[k]}return a.call(e,i,s)}h=String(h);q.lastIndex=0;if(q.test(h))h=h.replace(q,function(e){return"\\u"+("0000"+e.charCodeAt(0).toString(16)).slice(-4)});if(/^[\],:{}\s]*$/.test(h.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){h=eval("("+h+")");return typeof a==="function"?b({"":h},""):h}throw new SyntaxError("JSON.parse");}});
KISSY.add("ajax",function(d){var m=document,n=d.UA;d.Ajax={request:function(){d.error("not implemented")},getScript:function(j,q,p){var g=m.getElementsByTagName("head")[0]||m.documentElement,c=m.createElement("script");c.src=j;if(p)c.charset=p;c.async=true;if(d.isFunction(q))if(n.ie)c.onreadystatechange=function(){var f=c.readyState;if(f==="loaded"||f==="complete"){c.onreadystatechange=null;q()}};else c.onload=q;g.appendChild(c)}}});
KISSY.add("swf-ua",function(d){function m(g){var c=g[0]+".";switch(g[2].toString().length){case 1:c+="00";break;case 2:c+="0";break}return c+g[2]}d=d.UA;var n=0,j;if(d.ie){try{j=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");j.AllowScriptAccess="always"}catch(q){if(j!==null)n=6}if(n===0)try{n=m((new ActiveXObject("ShockwaveFlash.ShockwaveFlash")).GetVariable("$version").replace(/[A-Za-z\s]+/g,"").split(","))}catch(p){}}else if(j=navigator.mimeTypes["application/x-shockwave-flash"])if(j=j.enabledPlugin)n=
m(j.description.replace(/\s[rd]/g,".").replace(/[a-z\s]+/ig,"").split("."));d.flash=parseFloat(n)});
KISSY.add("swf",function(d){function m(h,a,b){var e="ks-swf-"+j++,i=parseFloat(b.version)||q;i=n.flash>=i;var k=n.flash>=8&&b.useExpressInstall&&!i,o=k?c:a;a="YUISwfId="+e+"&YUIBridgeCallback="+f;var s="<object ";this.id=e;m.instances[e]=this;if((h=d.get(h))&&(i||k)&&o){s+='id="'+e+'" ';s+=n.ie?'classid="'+p+'" ':'type="'+g+'" data="'+o+'" ';s+='width="100%" height="100%">';if(n.ie)s+='<param name="movie" value="'+o+'"/>';for(var r in b.fixedAttributes)if(l.hasOwnProperty(r))s+='<param name="'+r+
'" value="'+b.fixedAttributes[r]+'"/>';for(var u in b.flashVars){r=b.flashVars[u];if(typeof r==="string")a+="&"+u+"="+encodeURIComponent(r)}s+='<param name="flashVars" value="'+a+'"/>';s+="</object>";h.innerHTML=s;this.swf=d.get("#"+e)}}var n=d.UA,j=d.now(),q=10.22,p="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",g="application/x-shockwave-flash",c="http://fpdownload.macromedia.com/pub/flashplayer/update/current/swf/autoUpdater.swf?"+j,f="KISSY.SWF.eventHandler",l={align:"",allowNetworking:"",allowScriptAccess:"",
base:"",bgcolor:"",menu:"",name:"",quality:"",salign:"",scale:"",tabindex:"",wmode:""};m.instances=(d.SWF||{}).instances||{};m.eventHandler=function(h,a){m.instances[h]._eventHandler(a)};d.augment(m,d.EventTarget);d.augment(m,{_eventHandler:function(h){var a=h.type;if(a==="log")d.log(h.message);else a&&this.fire(a,h)},callSWF:function(h,a){if(this.swf[h])return this.swf[h].apply(this.swf,a||[])}});d.SWF=m});
KISSY.add("swfstore",function(d,m){function n(c,f,l,h){var a="other",b=q.get(p),e=this;l=(l!==m?l:true)+"";h=(h!==m?h:true)+"";if(j.ie)a="ie";else if(j.gecko)a="gecko";else if(j.webkit)a="webkit";else if(j.opera)a="opera";if(!b||b==="null")q.set(p,b=Math.round(Math.random()*Math.PI*1E5));l={version:9.115,useExpressInstall:false,fixedAttributes:{allowScriptAccess:"always",allowNetworking:"all",scale:"noScale"},flashVars:{allowedDomain:g.location.hostname,shareData:l,browser:b,useCompression:h}};f||
(f=(new d.Node('<div style="height:0;width:0;overflow:hidden"></div>')).appendTo(g.body)[0]);e.embeddedSWF=new d.SWF(f,c||"swfstore.swf",l);e.embeddedSWF._eventHandler=function(i){d.SWF.prototype._eventHandler.call(e,i)}}var j=d.UA,q=d.Cookie,p="swfstore",g=document;d.augment(n,d.EventTarget);d.augment(n,{setItem:function(c,f){f=typeof f==="string"?f.replace(/\\/g,"\\\\"):d.JSON.stringify(f)+"";if(c=d.trim(c+""))try{return this.embeddedSWF.callSWF("setItem",[c,f])}catch(l){this.fire("error",{message:l})}}});
d.each(["getValueAt","getNameAt","getValueOf","getItems","getLength","removeItem","removeItemAt","clear","calculateCurrentSize","hasAdequateDimensions","setSize","getModificationDate","displaySettings"],function(c){n.prototype[c]=function(){try{return this.embeddedSWF.callSWF(c,d.makeArray(arguments))}catch(f){this.fire("error",{message:f})}}});d.SWFStore=n});
KISSY.add("datalazyload",function(d,m){function n(a,b){if(!(this instanceof n))return new n(a,b);if(b===m){b=a;a=[c]}d.isArray(a)||(a=[d.get(a)||c]);this.containers=a;this.config=d.merge(l,b||{});this.callbacks={els:[],fns:[]};this._init()}var j=d.DOM,q=d.Event,p=YAHOO.util.Dom,g=window,c=document,f={AUTO:"auto",MANUAL:"manual"},l={mod:f.MANUAL,diff:"default",placeholder:"http://a.tbcdn.cn/kissy/1.0.4/build/datalazyload/dot.gif"},h=n.prototype;d.mix(h,{_init:function(){this.threshold=this._getThreshold();
this._filterItems();this._getItemsLength()&&this._initLoadEvent()},_initLoadEvent:function(){function a(){e||(e=setTimeout(function(){b();e=null},100))}function b(){i._loadItems();if(i._getItemsLength()===0){q.remove(g,"scroll",a);q.remove(g,"resize",a)}}var e,i=this;q.on(g,"scroll",a);q.on(g,"resize",function(){i.threshold=i._getThreshold();a()});i._getItemsLength()&&d.ready(function(){b()})},_filterItems:function(){var a=this.containers,b=this.threshold,e=this.config.placeholder,i=this.config.mod===
f.MANUAL,k,o,s,r,u,t,v,w=[],x=[];k=0;for(o=a.length;k<o;++k){s=d.query("img",a[k]);r=0;for(u=s.length;r<u;++r){t=s[r];v=t.getAttribute("data-lazyload-src");if(i){if(v){t.src=e;w.push(t)}}else if(p.getY(t)>b&&!v){t.setAttribute("data-lazyload-src",t.src);t.src=e;w.push(t)}}s=d.query("textarea",a[k]);r=0;for(u=s.length;r<u;++r){t=s[r];j.hasClass(t,"ks-datalazyload")&&x.push(t)}}this.images=w;this.areaes=x},_loadItems:function(){this._loadImgs();this._loadAreaes();this._fireCallbacks()},_loadImgs:function(){var a=
this.images,b=this.threshold+p.getDocumentScrollTop(),e,i,k=[];for(e=0;i=a[e++];)p.getY(i)<=b?this._loadImgSrc(i):k.push(i);this.images=k},_loadImgSrc:function(a,b){b=b||"data-lazyload-src";var e=a.getAttribute(b);if(e&&a.src!=e){a.src=e;a.removeAttribute(b)}},_loadAreaes:function(){var a=this.areaes,b=this.threshold+p.getDocumentScrollTop(),e,i,k,o=[];for(e=0;i=a[e++];){k=i;if(p.getY(k)===m)k=i.parentNode;p.getY(k)<=b?this._loadDataFromArea(i.parentNode,i):o.push(i)}this.areaes=o},_loadDataFromArea:function(a,
b){var e=j.create(b.value);b.style.display="none";b.className="";a.insertBefore(e,b);d.UA.gecko||d.query("script",a).each(function(i){d.globalEval(i.text)})},_fireCallbacks:function(){var a=this.callbacks,b=a.els,e=a.fns,i=this.threshold+p.getDocumentScrollTop(),k,o,s,r=[],u=[];for(k=0;(o=b[k])&&(s=e[k++]);)if(p.getY(o)<=i)s.call(o);else{r.push(o);u.push(s)}a.els=r;a.fns=u},addCallback:function(a,b){if((a=d.get(a))&&typeof b==="function"){this.callbacks.els.push(a);this.callbacks.fns.push(b)}},_getThreshold:function(){var a=
this.config.diff,b=p.getViewportHeight();return a==="default"?2*b:b+a},_getItemsLength:function(){return this.images.length+this.areaes.length+this.callbacks.els.length},loadCustomLazyData:function(a,b,e){var i=this,k,o;d.isArray(a)||(a=[d.get(a)]);d.each(a,function(s){switch(b){case "textarea-data":if((k=d.get("textarea",s))&&j.hasClass(k,e||"ks-datalazyload-custom"))i._loadDataFromArea(s,k);break;default:o=s.nodeName==="IMG"?[s]:d.query("img",s);s=0;for(var r=o.length;s<r;s++)i._loadImgSrc(o[s],
e||"data-lazyload-src-custom")}})}});d.mix(n,h,true,["loadCustomLazyData","_loadImgSrc","_loadDataFromArea"]);d.DataLazyload=n});
KISSY.add("suggest",function(d,m){function n(a,b,e){if(!(this instanceof n))return new n(a,b,e);this.textInput=d.get(a);this.dataSource=b;this.JSONDataSource=d.isPlainObject(b)?b:null;this.returnedData=null;this.config=d.merge(h,e||{});this.container=null;this.queryParams=this.query="";this._timer=null;this._isRunning=false;this.dataScript=null;this._dataCache={};this._latestScriptTime="";this._onKeyboardSelecting=this._scriptDataIsOut=false;this.selectedItem=null;this._init()}var j=YAHOO.util.Dom,
q=d.DOM,p=d.Event,g=window,c=document,f=c.getElementsByTagName("head")[0],l=YAHOO.env.ua.ie,h={containerCls:"",containerWidth:"auto",resultFormat:"约%result%条结果",showCloseBtn:false,closeBtnText:"关闭",useShim:l===6,timerDelay:200,autoFocus:false,submitFormOnClickSelect:true};d.mix(n.prototype,{_init:function(){this._initTextInput();this._initContainer();this.config.useShim&&this._initShim();this._initStyle();this._initResizeEvent()},_initTextInput:function(){var a=this;a.textInput.setAttribute("autocomplete",
"off");p.on(a.textInput,"blur",function(){a.stop();a.hide()});a.config.autoFocus&&a.textInput.focus();var b=0;p.on(a.textInput,"keydown",function(e){e=e.keyCode;switch(e){case 27:a.hide();a.textInput.value=a.query;a.query.length===0&&a.textInput.blur();break;case 13:a.textInput.blur();a._onKeyboardSelecting&&a.textInput.value==a._getSelectedItemKey()&&a.fire("itemSelect");a._submitForm();break;case 40:case 38:if(b++==0){a._isRunning&&a.stop();a._onKeyboardSelecting=true;a.selectItem(e===40)}else if(b==
3)b=0;break}if(e!=40&&e!=38){a._isRunning||a.start();a._onKeyboardSelecting=false}});p.on(a.textInput,"keyup",function(){b=0})},_initContainer:function(){var a=c.createElement("div"),b=this.config.containerCls;a.className="ks-suggest-container";if(b)a.className+=" "+b;a.style.position="absolute";a.style.visibility="hidden";this.container=a;this._setContainerRegion();this._initContainerEvent();c.body.insertBefore(a,c.body.firstChild)},_setContainerRegion:function(){var a=j.getRegion(this.textInput),
b=a.left,e=a.right-b-2;e=e>0?e:0;if(c.documentMode===7&&(l===7||l===8))b-=2;else d.UA.gecko&&b++;this.container.style.left=b+"px";this.container.style.top=a.bottom+"px";this.container.style.width=this.config.containerWidth=="auto"?e+"px":this.config.containerWidth},_initContainerEvent:function(){var a=this;p.on(a.container,"mousemove",function(e){e=e.target;if(e.nodeName!="LI")e=j.getAncestorByTagName(e,"li");if(j.isAncestor(a.container,e))if(e!=a.selectedItem){a._removeSelectedItem();a._setSelectedItem(e)}});
var b=null;p.on(a.container,"mousedown",function(e){b=e.target;a.textInput.onbeforedeactivate=function(){g.event.returnValue=false;a.textInput.onbeforedeactivate=null};return false});p.on(a.container,"mouseup",function(e){if(a._isInContainer([e.pageX,e.pageY])){e=e.target;if(e==b)if(e.className=="ks-suggest-close-btn")a.hide();else{if(e.nodeName!="LI")e=j.getAncestorByTagName(e,"li");if(j.isAncestor(a.container,e)){a._updateInputFromSelectItem(e);a.fire("itemSelect");a.textInput.blur();a._submitForm()}}}})},
_submitForm:function(){if(this.config.submitFormOnClickSelect){var a=this.textInput.form;if(a){if(c.createEvent){var b=c.createEvent("MouseEvents");b.initEvent("submit",true,false);a.dispatchEvent(b)}else c.createEventObject&&a.fireEvent("onsubmit");a.submit()}}},_isInContainer:function(a){var b=j.getRegion(this.container);return a[0]>=b.left&&a[0]<=b.right&&a[1]>=b.top&&a[1]<=b.bottom},_initShim:function(){var a=c.createElement("iframe");a.src="about:blank";a.className="ks-suggest-shim";a.style.position=
"absolute";a.style.visibility="hidden";a.style.border="none";this.container.shim=a;this._setShimRegion();c.body.insertBefore(a,c.body.firstChild)},_setShimRegion:function(){var a=this.container,b=a.shim;if(b){b.style.left=parseInt(a.style.left)-2+"px";b.style.top=a.style.top;b.style.width=parseInt(a.style.width)+2+"px"}},_initStyle:function(){d.get("#ks-suggest-style")||q.addStyleSheet(".ks-suggest-container{background:white;border:1px solid #999;z-index:99999}.ks-suggest-shim{z-index:99998}.ks-suggest-container li{color:#404040;padding:1px 0 2px;font-size:12px;line-height:18px;float:left;width:100%}.ks-suggest-container li.selected{background-color:#39F;cursor:default}.ks-suggest-key{float:left;text-align:left;padding-left:5px}.ks-suggest-result{float:right;text-align:right;padding-right:5px;color:green}.ks-suggest-container li.selected span{color:#FFF;cursor:default}.ks-suggest-bottom{padding:0 5px 5px}.ks-suggest-close-btn{float:right}.ks-suggest-container li,.suggest-bottom{overflow:hidden;zoom:1;clear:both}.ks-suggest-container{*margin-left:2px;_margin-left:-2px;_margin-top:-3px}",
"ks-suggest-style")},_initResizeEvent:function(){var a=this,b;p.on(g,"resize",function(){b&&clearTimeout(b);b=setTimeout(function(){a._setContainerRegion();a._setShimRegion()},50)})},start:function(){var a=this;n.focusInstance=a;a._timer=setTimeout(function(){a.updateContent();a._timer=setTimeout(arguments.callee,a.config.timerDelay)},a.config.timerDelay);a._isRunning=true},stop:function(){n.focusInstance=null;clearTimeout(this._timer);this._isRunning=false},show:function(){if(!this.isVisible()){var a=
this.container,b=a.shim;a.style.visibility="";if(b){if(!b.style.height){a=j.getRegion(a);b.style.height=a.bottom-a.top-2+"px"}b.style.visibility=""}}},hide:function(){if(this.isVisible()){var a=this.container,b=a.shim;if(b)b.style.visibility="hidden";a.style.visibility="hidden"}},isVisible:function(){return this.container.style.visibility!="hidden"},updateContent:function(){if(this._needUpdate()){this._updateQueryValueFromInput();var a=this.query;if(d.trim(a).length)if(this._dataCache[a]!==m){this.returnedData=
"using cache";this._fillContainer(this._dataCache[a]);this._displayContainer()}else this.JSONDataSource?this.handleResponse(this.JSONDataSource[a]):this.requestData();else{this._fillContainer("");this.hide()}}},_needUpdate:function(){return this.textInput.value!=this.query},requestData:function(){var a=this;if(!l)a.dataScript=null;if(!a.dataScript){var b=c.createElement("script");b.charset="utf-8";f.insertBefore(b,f.firstChild);a.dataScript=b;if(!l){var e=(new Date).getTime();a._latestScriptTime=
e;b.setAttribute("time",e);p.on(b,"load",function(){a._scriptDataIsOut=b.getAttribute("time")!=a._latestScriptTime})}}a.queryParams="q="+encodeURIComponent(a.query)+"&code=utf-8&callback=g_ks_suggest_callback";a.fire("dataRequest");a.dataScript.src=a.dataSource+"?"+a.queryParams},handleResponse:function(a){if(!this._scriptDataIsOut){this.returnedData=a;this.fire("dataReturn");this.returnedData=this.formatData(this.returnedData);var b="";a=this.returnedData.length;if(a>0){b=c.createElement("ol");for(var e=
0;e<a;++e){var i=this.returnedData[e],k=this.formatItem(i.key,i.result);k.setAttribute("key",i.key);q.addClass(k,e%2?"even":"odd");b.appendChild(k)}b=b}this._fillContainer(b);a>0&&this.appendBottom();d.trim(this.container.innerHTML)&&this.fire("show");this._dataCache[this.query]=this.container.innerHTML;this._displayContainer()}},formatData:function(a){var b=[];if(!a)return b;if(d.isArray(a.result))a=a.result;var e=a.length;if(!e)return b;for(var i,k=0;k<e;++k){i=a[k];b[k]=typeof i==="string"?{key:i}:
d.isArray(i)&&i.length>=2?{key:i[0],result:i[1]}:i}return b},formatItem:function(a,b){var e=c.createElement("li"),i=c.createElement("span");i.className="ks-suggest-key";i.appendChild(c.createTextNode(a));e.appendChild(i);if(b!==m){a=this.config.resultFormat.replace("%result%",b);if(d.trim(a)){b=c.createElement("span");b.className="ks-suggest-result";b.appendChild(c.createTextNode(a));e.appendChild(b)}}return e},appendBottom:function(){var a=c.createElement("div");a.className="ks-suggest-bottom";if(this.config.showCloseBtn){var b=
c.createElement("a");b.href="javascript: void(0)";b.setAttribute("target","_self");b.className="ks-suggest-close-btn";b.appendChild(c.createTextNode(this.config.closeBtnText));a.appendChild(b)}d.trim(a.innerHTML)&&this.container.appendChild(a)},_fillContainer:function(a){if(a.nodeType==1){this.container.innerHTML="";this.container.appendChild(a)}else this.container.innerHTML=a;this.selectedItem=null},_displayContainer:function(){d.trim(this.container.innerHTML)?this.show():this.hide()},selectItem:function(a){var b=
this.container.getElementsByTagName("li");if(b.length!=0)if(this.isVisible()){if(this.selectedItem){a=j[a?"getNextSibling":"getPreviousSibling"](this.selectedItem);if(!a)this.textInput.value=this.query}else a=b[a?0:b.length-1];this._removeSelectedItem();if(a){this._setSelectedItem(a);this._updateInputFromSelectItem()}}else this.show()},_removeSelectedItem:function(){q.removeClass(this.selectedItem,"selected");this.selectedItem=null},_setSelectedItem:function(a){q.addClass(a,"selected");this.selectedItem=
a},_getSelectedItemKey:function(){if(!this.selectedItem)return"";return this.selectedItem.getAttribute("key")},_updateQueryValueFromInput:function(){this.query=this.textInput.value},_updateInputFromSelectItem:function(){this.textInput.value=this._getSelectedItemKey(this.selectedItem)}});d.mix(n.prototype,d.EventTarget);g.g_ks_suggest_callback=function(a){n.focusInstance&&setTimeout(function(){n.focusInstance.handleResponse(a)},0)};d.Suggest=n});
KISSY.add("switchable",function(d,m){function n(c,f){f=f||{};if(!("markupType"in f))if(f.panelCls)f.markupType=1;else if(f.panels)f.markupType=2;f=d.merge(n.Config,f);this.container=d.get(c);this.config=f;this.triggers=this.triggers||[];this.panels=this.panels||[];if(this.activeIndex===m)this.activeIndex=f.activeIndex;this._init()}var j=d.DOM,q=d.Event,p=document,g=n.prototype;n.Config={markupType:0,navCls:"ks-switchable-nav",contentCls:"ks-switchable-content",triggerCls:"ks-switchable-trigger",panelCls:"ks-switchable-panel",
triggers:[],panels:[],hasTriggers:true,triggerType:"mouse",delay:0.1,activeIndex:0,activeTriggerCls:"active",steps:1,viewSize:[]};n.Plugins=[];d.mix(g,{_init:function(){var c=this,f=c.config;c.panels.length===0&&c._parseMarkup();f.hasTriggers&&c._bindTriggers();d.each(n.Plugins,function(l){l.init&&l.init(c)})},_parseMarkup:function(){var c=this.container,f=this.config,l=f.hasTriggers,h,a=[],b=[];switch(f.markupType){case 0:if(h=d.get("."+f.navCls,c))a=j.children(h);h=d.get("."+f.contentCls,c);b=j.children(h);
break;case 1:a=d.query("."+f.triggerCls,c);b=d.query("."+f.panelCls,c);break;case 2:a=f.triggers;b=f.panels;break}c=b.length;this.length=c/f.steps;if(l&&c>0&&a.length===0)a=this._generateTriggersMarkup(this.length);this.triggers=d.makeArray(a);this.panels=d.makeArray(b);this.content=h||b[0].parentNode},_generateTriggersMarkup:function(c){var f=this.config,l=p.createElement("UL"),h,a;l.className=f.navCls;for(a=0;a<c;a++){h=p.createElement("LI");if(a===this.activeIndex)h.className=f.activeTriggerCls;
h.innerHTML=a+1;l.appendChild(h)}this.container.appendChild(l);return j.children(l)},_bindTriggers:function(){var c=this,f=c.config,l=c.triggers,h,a,b=l.length;for(a=0;a<b;a++)(function(e){h=l[e];q.on(h,"click focus",function(){c._onFocusTrigger(e)});if(f.triggerType==="mouse"){q.on(h,"mouseenter",function(){c._onMouseEnterTrigger(e)});q.on(h,"mouseleave",function(){c._onMouseLeaveTrigger(e)})}})(a)},_onFocusTrigger:function(c){if(this.activeIndex!==c){this.switchTimer&&this.switchTimer.cancel();
this.switchTo(c)}},_onMouseEnterTrigger:function(c){var f=this;if(f.activeIndex!==c)f.switchTimer=d.later(function(){f.switchTo(c)},f.config.delay*1E3)},_onMouseLeaveTrigger:function(){this.switchTimer&&this.switchTimer.cancel()},switchTo:function(c,f){var l=this.config,h=this.triggers,a=this.panels,b=this.activeIndex,e=l.steps,i=b*e,k=c*e;if(c===b)return this;if(this.fire("beforeSwitch",{toIndex:c})===false)return this;if(l.hasTriggers)this._switchTrigger(b>-1?h[b]:null,h[c]);if(f===m)f=c>b?"forward":
"forward";this._switchView(a.slice(i,i+e),a.slice(k,k+e),c,f);this.activeIndex=c;return this},_switchTrigger:function(c,f){var l=this.config.activeTriggerCls;c&&j.removeClass(c,l);j.addClass(f,l)},_switchView:function(c,f){j.css(c,"display","none");j.css(f,"display","block");this.fire("switch")},prev:function(){var c=this.activeIndex;this.switchTo(c>0?c-1:this.length-1,"backward")},next:function(){var c=this.activeIndex;this.switchTo(c<this.length-1?c+1:0,"forward")}});d.mix(g,d.EventTarget);d.Switchable=
n});
KISSY.add("switchable-autoplay",function(d){var m=d.Event,n=d.Switchable;d.mix(n.Config,{autoplay:false,interval:5,pauseOnHover:true});n.Plugins.push({name:"autoplay",init:function(j){var q=j.config;if(q.autoplay){if(q.pauseOnHover){m.on(j.container,"mouseenter",function(){j.paused=true});m.on(j.container,"mouseleave",function(){setTimeout(function(){j.paused=false},q.interval*1E3)})}j.autoplayTimer=d.later(function(){j.paused||j.switchTo(j.activeIndex<j.length-1?j.activeIndex+1:0)},q.interval*1E3,
true)}}})});
KISSY.add("switchable-effect",function(d){var m=YAHOO.util,n=d.DOM,j=m.Dom,q=d.Switchable,p;d.mix(q.Config,{effect:"none",duration:0.5,easing:m.Easing.easeNone});q.Effects={none:function(g,c,f){n.css(g,"display","none");n.css(c,"display","block");f()},fade:function(g,c,f){g.length!==1&&d.error("fade effect only supports steps == 1.");var l=this,h=l.config,a=g[0],b=c[0];l.anim&&l.anim.stop();j.setStyle(b,"opacity",1);l.anim=new m.Anim(a,{opacity:{to:0}},h.duration,h.easing);l.anim.onComplete.subscribe(function(){l.anim=null;
j.setStyle(b,"z-index",9);j.setStyle(a,"z-index",1);f()});l.anim.animate()},scroll:function(g,c,f,l){var h=this;g=h.config;c=g.effect==="scrollx";var a={};a[c?"left":"top"]={to:-(h.viewSize[c?0:1]*l)};h.anim&&h.anim.stop();h.anim=new m.Anim(h.content,a,g.duration,g.easing);h.anim.onComplete.subscribe(function(){h.anim=null;f()});h.anim.animate()}};p=q.Effects;p.scrollx=p.scrolly=p.scroll;q.Plugins.push({name:"effect",init:function(g){var c=g.config,f=c.effect,l=g.panels,h=c.steps,a=g.activeIndex*
h,b=a+h-1,e=l.length;g.viewSize=[c.viewSize[0]||l[0].offsetWidth*h,c.viewSize[0]||l[0].offsetHeight*h];if(f!=="none"){for(c=0;c<e;c++)l[c].style.display="block";switch(f){case "scrollx":case "scrolly":g.content.style.position="absolute";g.content.parentNode.style.position="relative";if(f==="scrollx"){j.setStyle(l,"float","left");g.content.style.width=g.viewSize[0]*(e/h)+"px"}break;case "fade":for(c=0;c<e;c++){j.setStyle(l[c],"opacity",c>=a&&c<=b?1:0);l[c].style.position="absolute";l[c].style.zIndex=
c>=a&&c<=b?9:1}break}}}});d.mix(q.prototype,{_switchView:function(g,c,f,l){var h=this,a=h.config.effect;(d.isFunction(a)?a:p[a]).call(h,g,c,function(){h.fire("switch")},f,l)}})});
KISSY.add("switchable-circular",function(d){function m(e,i,k,o,s){var r=this;e=r.config;i=r.length;var u=r.activeIndex,t=e.scrollType===a,v=t?p:g,w=r.viewSize[t?0:1];t=-w*o;var x={},z,y=s===h;if(z=y&&u===0&&o===i-1||s===l&&u===i-1&&o===0)t=n.call(r,r.panels,o,y,v,w);x[v]={to:t};r.anim&&r.anim.stop();r.anim=new YAHOO.util.Anim(r.content,x,e.duration,e.easing);r.anim.onComplete.subscribe(function(){z&&j.call(r,r.panels,o,y,v,w);r.anim=null;k()});r.anim.animate()}function n(e,i,k,o,s){var r=this.config.steps;
i=this.length;var u=k?i-1:0,t=(u+1)*r;for(r=u*r;r<t;r++){e[r].style.position=q;e[r].style[o]=(k?"-":f)+s*i+c}return k?s:-s*i}function j(e,i,k,o,s){var r=this.config.steps;i=this.length;var u=k?i-1:0,t=(u+1)*r;for(r=u*r;r<t;r++){e[r].style.position=f;e[r].style[o]=f}this.content.style[o]=k?-s*(i-1)+c:f}var q="relative",p="left",g="top",c="px",f="",l="forward",h="backward",a="scrollx",b=d.Switchable;d.mix(b.Config,{circular:false});b.Plugins.push({name:"circular",init:function(e){e=e.config;if(e.circular&&
(e.effect===a||e.effect==="scrolly")){e.scrollType=e.effect;e.effect=m}}})});
KISSY.add("switchable-lazyload",function(d){var m=d.DOM,n="beforeSwitch",j="img-src",q="textarea-data",p={},g=d.Switchable,c=d.DataLazyload;p[j]="data-lazyload-src-custom";p[q]="ks-datalazyload-custom";d.mix(g.Config,{lazyDataType:"",lazyDataFlag:""});g.Plugins.push({name:"autoplay",init:function(f){function l(i){var k=a.steps;i=i.toIndex*k;c.loadCustomLazyData(f.panels.slice(i,i+k),b,e);h()&&f.detach(n,l)}function h(){var i,k,o;if(b===j){i=d.query("img",f.container);k=0;for(o=i.length;k<o;k++)if(m.attr(i[k],
e))return false}else if(b===q){i=d.query("textarea",f.container);k=0;for(o=i.length;k<o;k++)if(m.hasClass(i[k],e))return false}return true}var a=f.config,b=a.lazyDataType,e=a.lazyDataFlag||p[b];!c||!b||!e||f.on(n,l)}})});KISSY.add("tabs",function(d){function m(n,j){if(!(this instanceof m))return new m(n,j);m.superclass.constructor.call(this,n,j)}d.extend(m,d.Switchable);d.Tabs=m});
KISSY.add("slide",function(d){function m(j,q){if(!(this instanceof m))return new m(j,q);q=d.merge(n,q||{});m.superclass.constructor.call(this,j,q)}var n={autoplay:true,circular:true};d.extend(m,d.Switchable);d.Slide=m});KISSY.add("carousel",function(d){function m(j,q){if(!(this instanceof m))return new m(j,q);q=d.merge(n,q||{});m.superclass.constructor.call(this,j,q)}var n={circular:true};d.extend(m,d.Switchable);d.Carousel=m});
KISSY.add("coversflow",function(d){function m(g,c){if(!(this instanceof m))return new m(g,c);c=d.merge(p,c||{});m.superclass.constructor.call(this,g,c);this._initFlow()}var n=YAHOO.util.Dom,j=d.DOM,q=d.Event,p={flowLength:4,aspectRatio:1.964,step:150,width:500,height:350,offset:0,animSpeed:50,autoSwitchToMiddle:true,hasTriggers:false,circular:true};d.extend(m,d.Switchable);d.augment(m,{_initFlow:function(){var g=this,c=g.config;g.busy=false;g.curFrame=0;g.targetFrame=0;g.zIndex=g.length;g.region=
n.getRegion(g.container);g.maxFocus=c.flowLength*c.step;g.maxHeight=g.region.height+Math.round(g.region.height/c.aspectRatio);g.middleLine=g.region.width/2;g.on("beforeSwitch",function(f){f=f.toIndex;g.perIndex=f;g.targetFrame=-f*g.config.step;return!g.busy});c.autoSwitchToMiddle?g.switchTo(Math.floor(g.length/2)):g._frame(0)},_switchView:function(){var g=this.config;if(this.targetFrame<this.curFrame-1||this.targetFrame>this.curFrame+1){this._frame(this.curFrame+(this.targetFrame-this.curFrame)/3);
this._timer=d.later(this._switchView,g.animSpeed,false,this);this.busy=true}else{this.fire("finished");this.busy=false}},_frame:function(g){var c=this.config,f=this.panels,l=this.region,h=this.middleLine-c.offset,a;this.curFrame=g;for(var b=0,e=f.length;b<e;b++){f=this.panels[b];a=b*-c.step;if(a+this.maxFocus<this.targetFrame||a-this.maxFocus>this.targetFrame)j.css(f,"visibility","hidden");else{a=Math.sqrt(1E4+g*g)+100;var i=g/a*h+h,k=c.width/c.height*90/a*h,o=0;if(k>this.maxHeight)k=this.maxHeight;
o=c.width/c.height*k;j.css(f,"left",i-72/a*h+"px");if(k&&o){j.css(f,"height",k+"px");j.css(f,"width",o+"px");j.css(f,"top",l.height/2-k/2+"px")}j.css(f,"zIndex",this.zIndex*100-Math.ceil(a));j.css(f,"visibility","visible");this._bindPanel(f,b)}this.fire("tween",{panel:f,index:b});g+=c.step}},_bindPanel:function(g,c){var f=this;q.remove(g);f.perIndex===c?q.add(g,"click",function(){return f.fire("onCurrent",{panel:g,index:c})}):q.add(g,"click",function(l){l.preventDefault();f.switchTo(c)})}});d.CoversFlow=
m});
MFP.add("category",function(k){var e=KISSY,a=YAHOO.util,f=a.Dom,n=e.Event,m=document,g="selected",b="hidden",j="DIV",o="mouseenter",c="mouseleave",i="click",d={hideDelay:0.2,view:null,subViews:null,triggers:null};function h(p,r){var q=this;if(!(q instanceof h)){return new h(p,r)}q.container=f.get(p);q.config=e.merge(d,r||{});q.config.view=f.get(r.view);q.triggers=f.getElementsByClassName(r.triggers,"LI",q.container);q._init()}function l(p,r){for(var q=0;q<p.length;q=q+1){if(p[q]===r){return q}}return -1}e.mix(h.prototype,{switchTo:function(p){var q=this;f.removeClass(q.triggers,g);f.addClass(q.triggers[p],g);f.addClass(q.subViews,b);f.removeClass(q.subViews[p],b)},show:function(){var p=this;p.container.style.zIndex=20;f.removeClass(p.view,b)},hide:function(){var p=this;p.container.style.zIndex=15;f.removeClass(p.triggers,g);f.addClass(p.view,b)},_init:function(){var q=this,p=q.config;e.each(q.triggers,function(r){n.on(r,i,function(s){s.stopPropagation();return false});n.on(r,o,function(t){t.stopPropagation();var s=l(q.triggers,r);if(!q.view){q._initView()}if(q.showTimer){clearTimeout(q.showTimer)}q.showTimer=setTimeout(function(){if(!q.hideTimer){q.switchTo(s);q.show()}},q.config.hideDelay*1000);q.hideTimer=clearTimeout(q.hideTimer)});n.on(r,c,function(s){if(q.showTimer){clearTimeout(q.showTimer)}if(q.hideTimer){return}q.hideTimer=setTimeout(function(){q.hide();q.hideTimer=clearTimeout(q.hideTimer)},q.config.hideDelay*1000)})})},_initView:function(){var q=this,p=q.config;if(!q.view){q.view=m.createElement(j);q.view.className=p.view.className;q.view.innerHTML=p.view.value;q.container.appendChild(q.view);q._initSubView()}},_initSubView:function(){var p=this,q=0;p.subViews=f.getElementsByClassName(p.config.subViews,j,p.container);e.each(p.subViews,function(u){var t=f.getElementsByClassName("J_HotMenuItem","dl",u),r=f.getElementsByClassName("J_HotView",j,u),s;s=new e.Tabs(u,{triggerType:"mouse",triggers:t,panels:r});n.on(u,o,function(){p.hideTimer=clearTimeout(p.hideTimer);p.selectedSubView=this});n.on(u,c,function(){p.hideTimer=setTimeout(function(){p.hide();p.hideTimer=clearTimeout(p.hideTimer)},p.config.hideDelay*1000)})})}});k.Category=h});
(function(){var i=KISSY,n=YAHOO.util.Dom,c=i.DOM,w=i.Event;var f=i.get("#J_Peremptory");if(!f){return}var d=i.get("#J_PereContent"),j=d.parentNode,o=i.get("#J_PereTrigger");var t=370,m=341,p=n.getY(d),r=p+m,l=1000,e=null,s="\u5173\u95ed\u5e7f\u544a",h=o.innerHTML,g="dropad",b=false,v=true;function q(A,z,B){return new YAHOO.util.Motion(A,{points:{to:[z,B]}},1,YAHOO.util.Easing.easyIn)}function a(){b=true;if("on"!=o.className){f.style.zIndex="11";j.style.height="24px"}if(v){k(3)}}function k(x){if(x===undefined){x=0.5}if("on"==o.className&&b){e=setTimeout(u,l*x)}}function u(){var z="on"==o.className?p:r,x=q(d,n.getX(d),z),y=o.className;clearTimeout(e);b=false;f.style.zIndex="16";j.style.height=t+"px";o.className=o.getAttribute("data-todo");o.innerHTML="on"==o.className?s:h;o.setAttribute("data-todo",y);x.onComplete.subscribe(a);x.animate()}w.on(o,"click",u);w.on(d,"mouseleave",function(){v=true;k()});w.on(d,"mouseenter",function(){v=false;clearTimeout(e)});j.style.height="24px";if(!i.Cookie.get(g)){e=setTimeout(u,l*3);i.Cookie.set(g,"read",1,document.domain)}})();
MFP.add("floor",function(c){var b=KISSY,a=b.Event;c.Floor={inited:[],init:function(e){if(b.indexOf(e,c.Floor.inited)>=0){return}var d={contentCls:"f-switchable",navCls:"f-trigger",lazyDataType:"img-src",autoplay:false,effect:"scrollx",circular:true},f="click";b.query(e+" div.f-carousel").each(function(h){var i=new b.Tabs(h,d);a.on(b.get("a.mall-prev",h),f,function(j){j.halt();i.prev()});a.on(b.get("a.mall-next",h),f,function(j){j.halt();i.next()});i.switchTo(Math.floor(Math.random()*(i.panels.length)))});b.query(e+" div.f-slider").each(function(h){var i=b.Slide(h,b.merge(d,{effect:"scrolly"}));i.switchTo(Math.floor(Math.random()*(i.panels.length)))});function g(i){var j=this,l=j.src,h="data-src";try{j.src=j.getAttribute(h);j.setAttribute(h,l)}catch(k){}}b.query(e+" img.J_ShowLogo").each(function(h){if(!h.getAttribute("data-ks-event-guid")){a.on(h,"mouseenter",g);a.on(h,"mouseleave",g)}});c.Floor.inited.push(e)}}});
(function(){var c=KISSY,l=c.DOM,k=c.Event,g=MFP,j=document,e="selected",h="click",b="scrolly",d,f,a=[function(){TB.Header.init()},function(){g.ECPM.init()},function(){new c.DataLazyload({mod:"manual",diff:100})},function(){new g.Category("J_Category",{view:"J_SubCategory",subViews:"J_SubViewItem",triggers:"J_MenuItem"})},function(){var o,m="active",n=c.get("#mq"),p=c.get("#J_Type");n.focus();k.on(c.get("#J_SelectTypes"),h,function(q){o=q.target;if("A"==o.tagName){p.setAttribute("value",o.getAttribute("data-type")||"p");c.each(this.getElementsByTagName("A"),function(r){l.removeClass(r,m)});l.addClass(o,m);n.focus()}q.halt()});var i=new c.Suggest(n,"http://suggest.taobao.com/sug",{containerCls:"mall-suggest-container",resultFormat:""})},function(){var m="trigger",i="slide-list";c.Slide("#J_ComboSlide",{navCls:m,contentCls:i,activeTriggerCls:e,effect:b,easing:YAHOO.util.Easing.easeOutStrong});c.Slide("#J_SalesSlide",{navCls:m,contentCls:i,activeTriggerCls:e,effect:"fade"})},function(){var i=l.get("#J_CoversFlow");if(!i){return}new c.CoversFlow(i,{offset:50,flowLength:1,width:330,height:200})},function(){var i=l.get("#J_StoaCarousel");if(!i){return}var m=new c.Tabs(i,{contentCls:"s-switchable",lazyDataType:"img-src",hasTriggers:false,autoplay:false,effect:"scrollx",easing:YAHOO.util.Easing.easeOutStrong,viewSize:[462],circular:true});k.on(c.get("a.mall-prev",i),h,function(n){n.halt();m.prev()});k.on(l.get("a.mall-next",i),h,function(n){n.halt();m.next()})},function(){var o=new c.Tabs("#J_expressway",{activeTriggerCls:e}),n="http://www.atpanel.com/jsclick?cache={cache}&xfzhyj=chzh_shchchzhzhx0",i=true;function m(p){var q=j.createElement("IFRAME");q.scrolling="no";q.frameBorder="0";q.src=p;return q}o.on("beforeSwitch",function(t){var p=t.toIndex,r=this.triggers[p].getAttribute("data-url"),q=this.panels[p];if(!i){var s=new Image;s.src=n.replace("{cache}",Math.random().toString().substring(2,9))+(p+1)}if(!l.children(q)[0]){q.innerHTML="";q.appendChild(m(r))}});o.switchTo(1);i=false}];for(d=0,f=a.length;d<f;++d){a[d]()}})();
</script>

<p>&nbsp;</p>


  <div class="qBox"> 
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
							<a  href="#" >系统消息</a> 
				  </h3> 
			  </div> 
				<div class="extend"> 
									<a href="#" >more>></a> 		
			  </div> 
			</div>
<p>&nbsp;</p>
<div id="marquees">
<!-- 这里可以放置数据库操作代码． -->
<B>Scroll Area Content Start</B> 
    

</div>
</div>
<script language="JavaScript">
marqueesHeight=150;
marqueesWidth=600;
stopscroll=false;

with(marquees){
    style.width=900;
    style.height=marqueesHeight;
    style.overflowX="visible";
    style.overflowY="hidden";
    noWrap=true;
    onmouseover=new Function("stopscroll=true");
    onmouseout=new Function("stopscroll=false");
}
document.write('<div id="templayer" style="position:absolute;z-index:1;visibility:hidden"></div>');

preTop=0; currentTop=0;

function init(){
    templayer.innerHTML="";
    while(templayer.offsetHeight<marqueesHeight){
      templayer.innerHTML+=marquees.innerHTML;
    }
    marquees.innerHTML=templayer.innerHTML+templayer.innerHTML;
    setInterval("scrollUp()",50);//越大越慢
}
document.body.onload=init;

function scrollUp(){
    if(stopscroll==true) return;
    preTop=marquees.scrollTop;
    marquees.scrollTop+=1;
    if(preTop==marquees.scrollTop){
      marquees.scrollTop=templayer.offsetHeight-marqueesHeight;
      marquees.scrollTop+=1;
    }
}
</script>
  
  
 
<div class="qBox"> 
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >热门商品</a> 
				  </h3> 
			  </div> 
				<div class="extend"> 
									<a href="#" >more>>            </a> 					
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" > 
				
				<div class="vImgColl_W"> 
 
					<div class="videos"> 
                    <ul class="video"> 
							<li class="vLink"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g1.ykimg.com/0100641F464C030670469B013691F2B277A2BA-C410-120E-8AFA-D204DE7C598D" alt="林家小妹：儿童节比赛   " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTc3NDE4OTc2" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" title="林家小妹：儿童节比赛   " target="video">林家小妹：儿童节比赛</a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-05" href="http://u.youku.com/user_show/id_UODE0MTQwODg=.html" >最新网络红人</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">9,100</span> <span title="评论" class="ico__statcomment"></span><span class="num">62</span></li> 
					  </ul>
													<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g1.ykimg.com/0100641F464C030670469B013691F2B277A2BA-C410-120E-8AFA-D204DE7C598D" alt="林家小妹：儿童节比赛   " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTc3NDE4OTc2" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" title="林家小妹：儿童节比赛   " target="video">林家小妹：儿童节比赛</a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-05" href="http://u.youku.com/user_show/id_UODE0MTQwODg=.html" >最新网络红人</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">9,100</span> <span title="评论" class="ico__statcomment"></span><span class="num">62</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-06" href="http://dv.youku.com/" target="video"></a></li> 
							<li class="vImg"><img src="http://g2.ykimg.com/0100641F464C045195E786002A22F2A2462E3E-EC6E-E28F-35E0-E00714CBD5F5" alt="怀念童年时光：三八线    " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTc3Njg4NjY4" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-06" href="http://dv.youku.com/" title="怀念童年时光：三八线    " target="video">怀念童年时光：三八线</a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-07" href="http://u.youku.com/user_show/id_UMTEwNDU4MzI=.html" >深度动画</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">11,802</span> <span title="评论" class="ico__statcomment"></span><span class="num">116</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-08" href="http://v.youku.com/v_show/id_XMTczNDU1NDQ4.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g2.ykimg.com/0100641F464BEF8305CC0E02F7D83D9A0019F6-FEF6-4C85-DB2B-1EE73D5C2282" alt="一张内存卡引发的血案     " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTczNDU1NDQ4" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-08" href="http://v.youku.com/v_show/id_XMTczNDU1NDQ4.html" title="一张内存卡引发的血案     " target="video">一张内存卡引发的血案</a></li> 
							<li class="vUser"><span class="ico__useroffical" title="官网"></span> <a charset="100-302-00-09" href="http://u.youku.com/user_show/id_UMTk5MTg4NzI0.html" >NEWSCAR2010</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">35,370</span> <span title="评论" class="ico__statcomment"></span><span class="num">66</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-10" href="http://v.youku.com/v_show/id_XMTY5MDg3OTk2.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g4.ykimg.com/0100641F464BD9A21B8411038D508263E50425-7299-A715-F963-E056ED4A2406" alt="荣威350 引领3G生活  " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTY5MDg3OTk2" class="ico__listquick"></span></li> 
							<li class="vStatus"></li> 
							<li class="vTitle"><a charset="100-302-00-10" href="http://v.youku.com/v_show/id_XMTY5MDg3OTk2.html" title="荣威350 引领3G生活  " target="video">荣威350 引领3G生活  </a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-11" href="http://u.youku.com/user_show/id_UMjM4MzcxMzM2.html" >普米米</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">2,718,768</span> <span title="评论" class="ico__statcomment"></span><span class="num">313</span></li> 
						</ul> 
							<div class="clear"></div>									</div><!--videos end--> 
				</div><!--vcoll end--> 
 
				
			</div> 
  </div> 
</div><!--box end--><!--box end--> 
 
<div class="qBox"> 
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >推荐商品</a> 
				  </h3> 
			  </div> 
				<div class="extend"> 
				  <a href="#" >more>></a> 		
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" > 
				
				<div class="vImgColl_W"> 
 
					<div class="videos"> 
													<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g1.ykimg.com/0100641F464C030670469B013691F2B277A2BA-C410-120E-8AFA-D204DE7C598D" alt="林家小妹：儿童节比赛   " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTc3NDE4OTc2" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-04" href="http://v.youku.com/v_show/id_XMTc3NDE4OTc2.html" title="林家小妹：儿童节比赛   " target="video">林家小妹：儿童节比赛</a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-05" href="http://u.youku.com/user_show/id_UODE0MTQwODg=.html" >最新网络红人</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">9,100</span> <span title="评论" class="ico__statcomment"></span><span class="num">62</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-06" href="http://dv.youku.com/" target="video"></a></li> 
							<li class="vImg"><img src="http://g2.ykimg.com/0100641F464C045195E786002A22F2A2462E3E-EC6E-E28F-35E0-E00714CBD5F5" alt="怀念童年时光：三八线    " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTc3Njg4NjY4" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-06" href="http://dv.youku.com/" title="怀念童年时光：三八线    " target="video">怀念童年时光：三八线</a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-07" href="http://u.youku.com/user_show/id_UMTEwNDU4MzI=.html" >深度动画</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">11,802</span> <span title="评论" class="ico__statcomment"></span><span class="num">116</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-08" href="http://v.youku.com/v_show/id_XMTczNDU1NDQ4.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g2.ykimg.com/0100641F464BEF8305CC0E02F7D83D9A0019F6-FEF6-4C85-DB2B-1EE73D5C2282" alt="一张内存卡引发的血案     " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTczNDU1NDQ4" class="ico__listquick"></span></li> 
							<li class="vStatus"><span class="ico__HD" title="高清"></span> </li> 
							<li class="vTitle"><a charset="100-302-00-08" href="http://v.youku.com/v_show/id_XMTczNDU1NDQ4.html" title="一张内存卡引发的血案     " target="video">一张内存卡引发的血案</a></li> 
							<li class="vUser"><span class="ico__useroffical" title="官网"></span> <a charset="100-302-00-09" href="http://u.youku.com/user_show/id_UMTk5MTg4NzI0.html" >NEWSCAR2010</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">35,370</span> <span title="评论" class="ico__statcomment"></span><span class="num">66</span></li> 
						</ul> 
																						<ul class="video"> 
							<li class="vLink"><a charset="100-302-00-10" href="http://v.youku.com/v_show/id_XMTY5MDg3OTk2.html" target="video"></a></li> 
							<li class="vImg"><img src="http://g4.ykimg.com/0100641F464BD9A21B8411038D508263E50425-7299-A715-F963-E056ED4A2406" alt="荣威350 引领3G生活  " /></li> 
							<li class="vMenu"><span id="PlayListFlag_XMTY5MDg3OTk2" class="ico__listquick"></span></li> 
							<li class="vStatus"></li> 
							<li class="vTitle"><a charset="100-302-00-10" href="http://v.youku.com/v_show/id_XMTY5MDg3OTk2.html" title="荣威350 引领3G生活  " target="video">荣威350 引领3G生活  </a></li> 
							<li class="vUser"><span class="ico__usercommon" title="会员"></span> <a charset="100-302-00-11" href="http://u.youku.com/user_show/id_UMjM4MzcxMzM2.html" >普米米</a></li> 
							<li class="vStat"><span title="播放" class="ico__statplay"></span><span class="num">2,718,768</span> <span title="评论" class="ico__statcomment"></span><span class="num">313</span></li> 
						</ul> 
							<div class="clear"></div>									</div><!--videos end--> 
				</div><!--vcoll end--> 
 
				
			</div> 
  </div> 
		</div><!--box end--><!--box end--> 
  
		<div id="footer">
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>
</div>
</body>
</html>