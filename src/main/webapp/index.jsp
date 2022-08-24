<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
	HTML 的 lang 属性可用于网页或部分网页的语言。这对搜索引擎和浏览器是有帮助的。比如,谷歌浏览器根据代码<html lang="en">就会知道网页是英文的，就会问是否需要翻译成中文。
	强烈建议为 html 根元素指定 lang 属性，从而为文档设置正确的语言。这将有助于语音合成工具确定其所应该采用的发音，有助于翻译工具确定其翻译时所应遵守的规则等等。
	1:不区分大小写
-->
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<!--
        	Bootstrap 不支持 IE 古老的兼容模式。为了让 IE 浏览器运行最新的渲染模式下，建议将此 <meta> 标签加入到页面中：
        -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- 
			--initial-scale=1：初始大小比例
			--maximum-scale=1: 可以放大的比例。
			--user-scalable=no: 禁止用户手动放大或缩小网页。
		-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>Bootstrap 模板</title>

		<!-- Bootstrap -->
		<link href="./resources/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">


		<!-- 解决IE9以下版本浏览器对HTML5新增标签不识别，并导致CSS不起作用的问题 -->
			
		<!--[if lte IE 9]>
			<script src="./resources/js/html5shiv.min.js"></script>
		<![endif]-->
		
		<!-- 解决IE9以下版本浏览器不支持CSS3媒体查询的问题 -->
		<!--[if lte IE 9]>
			<script src="./resources/js/respond.min.js"></script>
		<![endif]-->	
		
	</head>

	<body>
		<div id="navbar" class="page-header container-fluid" style="margin-top:20px; padding-left:10px;">
			<div class="row">
			      <div class="col-md-10"><h4>基本增删改查模板</h4></div>
			      <div class="col-md-2">
			          <form class="form-inline" action="/logout" method="post">
			              你好： <b>admin</b>
			              <button type="submit" class="btn btn-link">注销</button>                  
			          </form>
			      </div>
			  </div>
		</div>

		<div id="main-container" class="container-fluid">
			<div class="row">
				<div id="nav" class="col-md-2 col-sm-1">
					<div class="list-group">
						<a href="#" class="list-group-item ">
							<h4 class="list-group-item-heading">一级菜单</h4>					 
						</a>
						<a href="/page/sample/table.jsp" target="contentIFrame" class="list-group-item">传统CURD</a>
					</div>
				</div>
				<div id="main-content" class="col-md-10 col-sm-11">
					<!--content iframe-->
					<div class="embed-responsive">
						<iframe class="embed-responsive-item" name="contentIFrame" id="contentIFrame" src="about:blank" allowfullscreen></iframe>
					</div>
				</div>
			</div>

		</div>

		<div id="footer" class="footer"></div>

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<!-- Bootstrp3 需要 jQuery1.9-3  -->
		<script src="./resources/jquery/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
		<script src="./resources/bootstrap/3.3.7/js/bootstrap.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$("#contentIFrame").on("load", function() {
					/*如果嵌套页面的高度大于当前的高度，则修改div的高度*/
					var frameHeight = $(this).contents().find("body").height();
					/* 使用#contentIFrame无效 */
					if ($(".embed-responsive").height() < frameHeight) {
						$(".embed-responsive").height(frameHeight);
					}
				});
			});
		</script>
	</body>

</html>
