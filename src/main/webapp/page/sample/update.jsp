<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>Bootstrap 模板</title>
		<link href="/resources/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">

	</head>

	<body>
		<div id="main-container" class="container-fluid">
			<div class="page-content">
				<div class="panel panel-default">
					<div class="panel-body">
						<!-- 标题 -->
						<div class="row">
							<div class="col-md-12">
								<h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;">数据更新</h4>
							</div>
						</div>
						<form class="form-horizontal" role="form" id="form1" style="padding-top:10px ;" action="/sample/update" method="post" enctype="multipart/form-data">
							<div class="row ">
								<div class="col-md-5">
									<div class="form-group">
										<label class="col-sm-3 control-label" for="name"> 姓名:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="name" name="name" value="${result.name}" />

											<input type="hidden"  id="id" name="id" value="${result.id}" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="birthday"> 出生日期:</label>
										<div class="col-sm-9">
											<input type="date" class="form-control" id="birthday" name="birthday"  value="<fmt:formatDate value="${result.birthday}" pattern="yyyy-MM-dd"/>" />
										</div>
									</div>
								
									<div class="form-group">
										<label class="col-sm-3 control-label" for="phone"> 手机号:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="phone" name="phone" value="${result.phone}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="hobbies1"> 爱好:</label>
										<div class="col-sm-9">
											<div class="control-group">
												<label class="checkbox-inline">

													<input type="checkbox" id="hobbies1" name="hobbies" value="爬山" ${result.hobbies.contains("爬山")?"checked":""} > 爬山
												</label>
												<label class="checkbox-inline">
													<input type="checkbox" id="hobbies2" name="hobbies" value="上树"  ${result.hobbies.contains("上树")?"checked":""}> 上树
												</label>
											</div>
										</div>
									</div>	
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="nation"> 民族 :</label>

										<div class="col-sm-9">
											<select class="form-control" id="nation" name="nation">
												<option value="汉族" ${result.nation.equals("汉族")?"selected":""}>汉族</option>
												<option value="蒙族" ${result.nation.equals("蒙族")?"selected":""}>蒙族</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="height"> 身高:</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="height" name="height" readonly placeholder="身高(米)" value="${result.height}"/>
										</div>
									</div>
							
									<div class="form-group">
										<label class="col-sm-3 control-label" for="email"> 邮箱:</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="email" name="email" placeholder="邮箱地址" value="${result.email}" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="sex"> 性别:</label>
										<div class="col-sm-9">
											<div class="control-group">
												<label class="radio-inline">
													<input type="radio" id="sex1" name="sex" value="男" ${result.sex.equals("男")?"checked":""}> 男
												</label>
												<label class="radio-inline">
													<input type="radio" id="sex2" name="sex" value="女" ${result.sex.equals("女")?"checked":""}> 女
												</label>
											</div>
										</div>
									</div>
								
								</div>

								<!-- md-2会导致input超出边界 -->
								<div class="col-md-3">
									<div class="form-group" >
										<!-- 通过absolute脱离标准流，opacity透明 -->
										<input type="file" accept="image/*" name="photo" style="position: absolute;height: 140px;opacity: 0" onchange="imgPreview(this)">
										<!-- 图片预览 -->
										<img id="preview" class="img-responsive img-thumbnail center-block"  style="width: 140px;height: 170px;" src="/sample/photo?fileName=${result.photoPath}">
									</div>
								</div>
							</div>
							
							<div class="row" style="padding-left: 40px;padding-right: 40px;">
								<div class="col-md-12">
									 <fieldset>
										<legend><h4>个人介绍</h4></legend>
										<div id="selfIntroEditor" class="col-sm-12">
											${result.selfIntro}
										</div>

										<input type="hidden" name="selfIntro" id="selfIntro" />
									</fieldset>
								</div>
							</div>

							<div class="row" style="margin-top: 20px;">
								<div class="col-md-12">
									<div class="col-sm-2" style="margin-left: calc((65% - 10px) / 2)">
										<button type="submit" class="btn btn-default " style="border-radius: 4px;padding-left:20px;padding-right:20px;float: right">确定</button>
									</div>
									<div class="col-sm-1">
										<button type="button" class="btn  btn-default " id="cancel" style="border-radius: 4px">取消</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<!-- Bootstrp3 需要 jQuery1.9-3  -->
		<script src="/resources/jquery/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
		<script src="/resources/bootstrap/3.3.7/js/bootstrap.js"></script>
		<!-- 富文本编辑器 -->
		<script src="/resources/js/wangEditor.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(document).ready(function() {
				//返回查询页面
				$('#cancel').click(function() {
					window.history.back(-1);
				});

				//提交form表达
				$('#form1').submit(function() {
					alert(editor.txt.html());
					$('#selfIntro').val(editor.txt.html());
				});
			});
		</script>
		<script>
			function imgPreview(phone){
		        //判断是否支持FileReader
		        if (window.FileReader) {
		            var reader = new FileReader();
		        } else {
		            alert("当前浏览器不支持图片预览！");
		        }
		
		        //获取文件
		        var file = phone.files[0];
		        var imageType = /^image\//;
		        //是否是图片，input的accept属性只是在浏览文件时可以过滤，但是限制不了文件类型，还是可以选择非图片文件的
		        if (!imageType.test(file.type)) {
		            alert("请选择图片！");
		            return;
		        }
		        //读取完成
		        reader.onload = function(e) {
		            //获取图片dom
		            var img = document.getElementById("preview");
		            //图片路径设置为读取的图片
		            img.src = e.target.result;
		        };
				// 开始读取文件完成，完成后result属性中将包含一个data: URL格式的Base64字符串以表示所读取文件的内容。
		        reader.readAsDataURL(file);
		    }

		</script>
		<script type="text/javascript">
			var E = window.wangEditor
			var editor = new E("#selfIntroEditor");
			$(document).ready(function() {
				// 设置编辑区域高度为 200px
				editor.config.height = 140;
				
				// 配置菜单栏，删减菜单，调整顺序
				editor.config.menus = [
				    'bold',
				    'head',
				    'link',
				    'italic',
				    'underline'
				]
				
				editor.create();
			});
			
			// 获取内容：editor.txt.html();
		</script>
	</body>
</html>

