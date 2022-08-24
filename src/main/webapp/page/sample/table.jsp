<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="panel panel-default">
				<div class="panel-body">
					<!-- 标题 -->
					<div class="row">
						<div class="col-md-12">
							<h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;">信息列表</h4>
						</div>
					</div>

					<div class="row" style="margin-top:20px;" id="search-div">
						<div class="col-md-12">
							<form class="form-inline">
								<div class="form-group">
									<input type="text" class="form-control" name="name" placeholder="姓名" value="${param.name}">

								</div>
								<button type="button" id="search" class="btn btn-default">搜索</button>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h4 style="margin-bottom:0px;padding-bottom:10px;border-bottom: 1px solid #e3e3e3;"></h4>
						</div>
					</div>
					<div class="row" style="margin-top:15px;">
						<div class="col-md-12">
							<div class="btn-group" role="group" aria-label="...">

								<button type="button" class="btn btn-default" id="addRecord">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新建
								</button>

								<button type="button" class="btn btn-default"  id="updRecord">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改
								</button>

								<button type="button" class="btn btn-default"  id="delRecord">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
								</button>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top:10px;">
						<div class="col-md-12 table-responsive">
							<table id="result-table" class="table  table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th class="center">
											<input type="checkbox" /> <span class="lbl"></span>
										</th>
										<th>姓名</th>
										<th>出生日期</th>
										<th>民族</th>
										<th>爱好</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.list}" var="sample">
										<tr>
											<td><label>
													<input type="checkbox" name="ids" value="${sample.id}" />
												</label>
											</td>
											<td>
												${sample.name}
											</td>
											<td>
												<fmt:formatDate value="${sample.birthday}" pattern="yyyy-MM-dd"/>

											</td>
											<td>
												${sample.nation}
											</td>
											<td>
												${sample.hobbies}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5">共计${result.total}条|${result.pages}页，当前第${result.pageNum}页，每页显示<select name="pageSize"><option value="1">1</option></select>条</div>

						<div class="col-md-7">
							<ul class="pagination pagination-sm pull-right" style="margin: 0px;">
								<c:if test="${result.isFirstPage}">
									<li class="disabled">
										<a href="#">首页</a>
									</li>
									<li class="disabled">
										<a href="#">上一页</a>
									</li>
								</c:if>
								<c:if test="${!result.isFirstPage}">
									<li>
										<a href="#" onclick="pageLoad(1)">首页</a>
									</li>
									<li class="previous"  onclick="pageLoad(${result.prePage})">
										<a href="#">上一页</a>
									</li>
								</c:if>


								<c:forEach items="${result.navigatepageNums}" var="pageNum">
									<li>
										<a href="#"  onclick="pageLoad(${pageNum})">${pageNum}</a>
									</li>
								</c:forEach>

								<c:if test="${result.isLastPage}">
									<li class="disabled">
										<a href="#">下一页</a>
									</li>
									<li class="disabled">
										<a href="#">尾页</a>
									</li>
								</c:if>
								<c:if test="${!result.isLastPage}">
									<li class="next">
										<a href="#" onclick="pageLoad(${result.nextPage})">下一页</a>
									</li>
									<li class="">
										<a href="#"  onclick="pageLoad(${result.pages})">尾页</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<!-- Bootstrp3 需要 jQuery1.9-3  -->
		<script src="/resources/jquery/jquery-3.3.1.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
		<script src="/resources/bootstrap/3.3.7/js/bootstrap.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			/* 基础路径，如：http://localhost:8080 */
			var baseUrl = "/";
			$(document).ready(function() {
				//全选复选框
				$('#result-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function() {
					var th_checked = this.checked;
					//closest：从元素本身开始，在DOM 树上逐级向上级元素匹配，并返回最先匹配的祖先元素。
					//find：得到当前匹配的元素集合中每个元素的后代。
					$(this).closest('table').find('tbody > tr').each(function() {
						$(this).find('input[type=checkbox]').eq(0).prop('checked', th_checked);
					});
				});
			});

			//注册更新按钮的事件
			$(document).ready(function() {

				//注册新建按钮的事件
				$('#addRecord').on('click', function() {
					load(baseUrl + 'page/sample/form.jsp');
				});

				$('#updRecord').on('click', function() {
					var keyCheckBoxs = $('#result-table> tbody > tr > td input[type=checkbox]:checked');
					if (keyCheckBoxs.length == 1) {
						var params = $('#result-table> tbody > tr > td input[type=checkbox]:checked').serialize();
						load(baseUrl + 'sample/get', params);
					} else if (keyCheckBoxs.length == 0) {
						alert('请选中更新的记录');
					} else {
						alert('选中太多的记录');
					}
				});
				$('#delRecord').on('click', function() {
					var keyCheckBoxs = $('#result-table > tbody > tr > td input[type=checkbox]:checked');
					if (keyCheckBoxs.length != 0) {
						var paramsDelete = $('#result-table > tbody > tr > td input[type=checkbox]:checked').serialize();
						var paramsSearch = $('#search-div input,select').serialize();
						load(baseUrl + 'sample/delete', paramsDelete + '&' + paramsSearch);
					} else {
						alert('请选中删除的记录');
					}
				});

				//查询，先序列化查询条件，然后发送查询请求
				$('#search').click(function() {
					var params = $('#search-div input,select').serialize();
					params += "&pageNum=1";
					load(baseUrl + "sample/search", params);
				});

				//清空查询条件
				$('#clearButton').click(function() {
					$('input,select').val('');
				});
			});

			/*分页查询，加载指定页号的页面*/
			function pageLoad(pageNum) {
				var params = $('#search-div input,select').serialize();
				params += "&pageNum=" + pageNum;
				load(baseUrl  + "sample/search", params);
			}

    		/*显示详细数据，点击id查看详情数据*/
			function loadShowPage(id) {
				var params = "ids=" + id;
				load(baseUrl + "get/show", params);
			}

			/*加载对应页面*/
			function load(url, params) {
				if (params != undefined) {
					url = url + "?" + params
				}
				$(window.parent.document).find("#contentIFrame").attr("src", url);
			}
		</script>
	</body>
</html>
