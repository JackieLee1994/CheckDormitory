<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>公告首页</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/adminia.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/adminia-responsive.css"
	rel="stylesheet" />


<link href="${pageContext.request.contextPath}/css/jquery.visualize.css"
	rel="stylesheet" />

<!--图片轮播css  -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet" />


<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>

<!--图片轮播js  -->
<script src="${pageContext.request.contextPath}/js/jquery_slide.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<%@ include file="/include/top.jsp"%>
	<div id="content">

		<div class="container">

			<div class="row">
				<%@ include file="/include/left_owner.jsp"%>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-signal"></i> 首页
					</h1>
					<div class="widget-content">
						
						<!-- 文字左移-- -->
						
						
						<style type="text/css">
.qimo8{ overflow:hidden; width:815px;}
.qimo8 .qimo {/*width:99999999px;*/width:8000%; height:30px;}
.qimo8 .qimo div{ float:left;}
.qimo8 .qimo ul{float:left; height:30px; overflow:hidden; zoom:1; }
.qimo8 .qimo ul li{float:left; line-height:30px; list-style:none;}
.qimo8 li a{margin-right:10px;color:#444444;}
</style>
<div id="demo" class="qimo8">
  <div class="qimo">
    <div id="demo1">
      <ul>
                             
  <li>5.21 我们分别做了以下工作   一、在各区域开展了捕鼠活动   二、回收旧衣物  三、对各小区的每个角落进行大扫除</li>

      </ul>
    </div>
    <div id="demo2"></div>
  </div>
</div>
<script type="text/javascript">
var demo = document.getElementById("demo");
var demo1 = document.getElementById("demo1");
var demo2 = document.getElementById("demo2");
demo2.innerHTML=document.getElementById("demo1").innerHTML;
function Marquee(){
if(demo.scrollLeft-demo2.offsetWidth>=0){
 demo.scrollLeft-=demo1.offsetWidth;
}
else{
 demo.scrollLeft++;
}
}
var myvar=setInterval(Marquee,30);
demo.onmouseout=function (){myvar=setInterval(Marquee,30);}
demo.onmouseover=function(){clearInterval(myvar);}
</script>
						
						
						<!-- -文字左移- -->
						<div style="height:40px;"></div>


						<div class="container_image">
							<a href="javascript:void(0)" tip="0" class="i_btn prev_L"></a> <a
								href="javascript:void(0)" tip="1" class="i_btn next_R"></a>
							<%-- <ul class="slide_img">
								<li class="on"><a href="javascript:void(0);"><img
										src="${pageContext.request.contextPath}/images/za8_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za4_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za3_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za1_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za2_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za6_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="${pageContext.request.contextPath}/images/za7_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
							</ul> --%>
							<ul class="slide_img">
							<c:if
											test="${notice.picurl1 !=null}">
								<li class="on"><a href="javascript:void(0);"> 
											<img
												src="${pageContext.request.contextPath}/upload/${notice.picurl1}" />
										

								</a>

									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title1}日常之美</span>
										<p>${notice.content1}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									
									
									</div></li>
									</c:if>
									<c:if
											test="${notice.picurl2 !=null}">
								<li><a href="javascript:void(0)"> 
											<img
												src="${pageContext.request.contextPath}/upload/${notice.picurl2}" />

										
								</a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title2}日常之美</span>
										<p>${notice.content2}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									
									
									</div></li>
									 </c:if>
									 
									 
									 <c:if
											test="${notice.picurl3 !=null}">
								<li>
								
								
								
								<a href="javascript:void(0)">											<img
												src="${pageContext.request.contextPath}/upload/${notice.picurl3}" />


										

								</a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title3}日常之美</span>
										<p>${notice.content3}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
											
									</div></li>
									</c:if>
									<c:if
											test="${notice.picurl4 !=null}">
								<li><a href="javascript:void(0)">
								
								
								<img
										src="${pageContext.request.contextPath}/images/za1_img.jpg" />
										
										
										
										</a>
									
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title4}日常之美</span>
										<p>${notice.content4}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
											
										
											
									</div></li>
									</c:if>	
									
									<c:if
											test="${notice.picurl5 !=null}">
								<li><a href="javascript:void(0)">
								
								<img
										src="${pageContext.request.contextPath}/images/za2_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title5}日常之美</span>
										<p>${notice.content5}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									
									
									
									</div></li>
									</c:if>
									<c:if
											test="${notice.picurl6 !=null}">
								<li><a href="javascript:void(0)">
								
								<img
										src="${pageContext.request.contextPath}/upload/${l.picurl6}" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>${notice.title6}日常之美</span>
										<p>${notice.content6}徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									
											
									
									</div></li>
									</c:if>
							</ul>



						</div>

						<script type="text/javascript">
							$(function() {

								var newopt = {
									w2 : "140",//小图宽度
									h2 : "320"//小图高度 
								};

								i_slide($(".container_image"), newopt);

							});
						</script>






					</div>

				</div>
				<!-- /span9 -->


			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /content -->


	<%@ include file="/include/bottom.jsp"%>

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
