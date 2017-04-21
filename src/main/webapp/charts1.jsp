<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>极客学院-SpringMVC实现CRM客户关系管理系统</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="./css/bootstrap.min.css" rel="stylesheet" />
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="./css/font-awesome.css" rel="stylesheet" />
<link href="./css/adminia.css" rel="stylesheet" />
<link href="./css/adminia-responsive.css" rel="stylesheet" />


<link href="./css/jquery.visualize.css" rel="stylesheet" />

<!--图片轮播css  -->
<link href="./css/style.css" rel="stylesheet" />
<link href="./css/reset.css" rel="stylesheet" />


<script src="./js/jquery-1.7.2.min.js"></script>

<!--图片轮播js  -->
<script src="./js/jquery_slide.js"></script>
<script src="./js/bootstrap.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<%@ include file="include/top.jsp"%>
	<div id="content">

		<div class="container">

			<div class="row">
				<%@ include file="include/left_owner.jsp"%>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-signal"></i> 首页
					</h1>
					<div class="widget-content">
						<div style="height:40px;"></div>


						<div class="container_image">
							<a href="javascript:void(0)" tip="0" class="i_btn prev_L"></a> <a
								href="javascript:void(0)" tip="1" class="i_btn next_R"></a>
							<ul class="slide_img">
								<li class="on"><a href="javascript:void(0);"><img
										src="images/za8_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za4_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za3_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za1_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za2_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za6_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
								<li><a href="javascript:void(0)"><img
										src="images/za7_img.jpg" /></a>
									<div class="icon"></div>
									<div class="bg"></div>
									<div class="info">
										<i></i> <span>日常之美</span>
										<p>徐汇艺术馆作为沪上首批向公众免费开放的区级公益性美术馆，亲历并见证了整个上海乃至全国的美术馆发展历程。在建馆十周年之际，徐汇艺术馆历时四个月，通过开展“
											徐汇·我在这里等时光”
											摄影作品大赛、“衡山路街景”长卷少儿绘画集体创作、“美术馆里上美术课”等系列活动和展览，综合呈现十年来各方面工作的积累和成果。</p>
									</div></li>
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


		<%@ include file="include/bottom.jsp"%>

		<!-- Le javascript
================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
