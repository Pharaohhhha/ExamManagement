<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${basePath}">
<%@include file="../../css-common.jsp"  %>
<%@include file="../../js-common.jsp"  %>
<title>蓝桥在线考试系统</title>
</head>
<body>
<div id="wrapper">
<%-- <h1>路径：${basePath }</h1> --%>


						
						<div class="row  border-bottom white-bg dashboard-header"></div>

						<!--             主要内容开始 -->
						<div style="width: 100%;">
						
					<form action="techCate/testSelectAllCourse" method="post" name="myForm" id="myForm">
									<table align="center">
										<tr>
											<td><strong>课程：</strong></td>
											<td><select id="courseId" name="courseId"
												style="width: 80">
											</select></td>
											<td>
												<button id="worning" type="button"
														data-toggle="modal" data-target="#myModa" style="margin-left: 10px" onclick="save()">新增</button>
											</td>
										</tr>
									</table>
									<br />


									<table class="table table-condensed">
										<tr>
											<td width="3%">&nbsp;</td>
											<td width="97%">
												<table width='450' border='1' id="tech" class="table table-hover" style="text-align:center" >
													<tr>
														<td style="width:'150';text-align:center">序号</td>
														<td style="width:'200' ;text-align:center">知识点</td>
														<td style="text-align:center">操作</td>	
													</tr>
													
												</table>
												<table align="center">

													<!-- 分页链拉 -->

													<tr>
														<td colspan='3' >
															<c:if test="${not empty techPage}">
																<ul class="pagination">
																	<li><a href="techCate/selectTechCategroy?pageNo=1">«</a></li>
																	<c:if test="${techPage.pageNo gt 3}">
																		<li><a href="javascript:void(0)">....</a></li>
																	</c:if>
																	<c:if test="${techPage.pageNo-2 ge 1}">
																		<li><a href="techCate/selectTechCategroy?pageNo=${techPage.pageNo-2}">${techPage.pageNo-2}</a></li>
																	</c:if>
																	<c:if test="${techPage.pageNo-1 ge 1}">
																		<li><a href="techCate/selectTechCategroy?pageNo=${techPage.pageNo-1}">${techPage.pageNo-1}</a></li>
																	</c:if>
																	<li  class="active"><a href="techCate/selectTechCategroy?pageNo=${techPage.pageNo}">${techPage.pageNo}</a></li>
																	<c:if test="${techPage.pageNo+1 le techPage.totalPage}">
																		<li><a href="techCate/selectTechCategroy?pageNo=${techPage.pageNo+1}">${techPage.pageNo+1}</a></li>
																	</c:if>
																	<c:if test="${techPage.pageNo+2 le techPage.totalPage}">
																		<li><a href="techCate/selectTechCategroy?pageNo=${techPage.pageNo+2}">${techPage.pageNo+2}</a></li>
																	</c:if>
																	<c:if test="${techPage.pageNo+2 lt techPage.totalPage}">
																		<li><a href="javascript:void(0)">....</a></li>
																	</c:if>
																	<li><a href="techCate/selectTechCategroy?pageNo=${techPage.totalPage}">»</a></li>
																</ul>
															</c:if>
														</td>
													</tr>
												</table>
												
											</td>
										</tr>
										<tr>
											<td colspan="2"></td>
										</tr>
									</table>
									
									
					</form>


						</div>

						<!--             主要内容结束 -->
					</div>
					
					
								<div class="ibox-content">
									<div class="modal inmodal fade" id="myModal6" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">Close</span>
													</button>
													<h4 class="modal-title">修改知识点</h4>
												</div>
												
													<div class="modal-body">
														<input type="text" id="techCtgr1">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-white"
															data-dismiss="modal">取消</button>
														<button type="button" id="update" class="btn btn-primary" data-dismiss="modal">确认</button>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="ibox-content">
									<div class="modal inmodal fade" id="myModa" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">Close</span>
													</button>
													<h4 class="modal-title">增加知识点</h4>
												</div>
												
													<div class="modal-body">
														<input type="text" id="techCtgr">
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-white"
															data-dismiss="modal">取消</button>
														<button type="button" id="insert" class="btn btn-primary" data-dismiss="modal">确认</button>
												
													</div>
										</div>
									</div>
								</div>
							</div>

		</div>
		
<script type="text/javascript">
	//用于新增课程时刷新页面使用
	var tempFlush;	
		
	$(function() {
		/* 查询出课程 */
		$.get("techCate/testSelectAllCourse", function(data) {
			var select = $("#courseId");
			var opt = $("<option></option>").attr("value", "").html("请选择课程");
			select.append(opt);
			$.each(data, function(i, item) {
				var option = $("<option></option>").attr("value", item.id)
						.html(item.courseName);
				select.append(option);
			});
		}, "json");
		
		
		/*  通过课程关联查询出知识点*/
		$("#courseId").change(function() {
							var courseId = $(this).val();
							//alert(courseId);
							tempFlush = courseId;
							$.post("techCate/selectTechCategroy",
									{'courseId':courseId},
									function(data) {							
											if ($("#tech tr").length > 1) {
												$("#tech tr").nextAll()
														.remove();
											}
											$.each(data,function(i,item){
												$("#tech").append(
														"<tr><td>"+ item.id+ "</td><td>" + item.techCtgr + "</td>" +
														"    <td><button type=\"button\" onclick=\"delt(this)\" value = \""
																+ item.id + "\">删除</button>&nbsp;&nbsp;<button type=\"button\" data-toggle=\"modal\" onclick=\"updt(this);\" data-target=\"#myModal6\">更新</button></td></tr>");
											})
											}, "json");
						});
		
	});
    $(function () {
		$("#selectBySelective").click(function () {
							var courseId = $("#courseId").val();
							var techCtgr=$("#selectBySelective").val;
							//alert(courseId);
							tempFlush = courseId;
							$.post("techCate/selectBySelective", {'courseId':courseId},{'techCtgr':techCtgr}, function(data) {
									if ($("#tech tr").length > 1) {
										$("#tech tr").nextAll()
											.remove();
									}
									$.each(data,function(i,item){
										$("#tech").append(
											"<tr><td>"+ item.id+ "</td><td>" + item.techCtgr + "</td>" +
											"    <td><button type=\"button\"  onclick=\"delt(this)\" value = \""
											+ item.id + "\">删除</button>&nbsp;&nbsp;<button type=\"button\" data-toggle=\"modal\" onclick=\"updt(this);\" data-target=\"#myModal6\">更新</button></td></tr>");
									})
								}, "json");
        })
    })

    var tempFlush;
    /*警告没有选择课程时的新增
    /* 插入知识点 */
    $(function(){
        var tempFlush;
        $("#insert").click(function(){
            var id = $("#courseId").val();
            var c = $("#techCtgr").val();
            $.post("techCate/insertTechCategroy",{"techCtgr":c,"courseId":id},function(data){
                location.href = "questCatagory_input.jsp";
                $(arrtd[1]).html(c);
            });
        });

    });

    var tempFlush;
		/*  更新知识点的名称*/
		$(function(){
			$("#update").click(function(){
				var arrtd = _tr.children();
				var id = $(arrtd[0]).text(); 
				var m =  $("#techCtgr1");
				var c = $("#techCtgr1").val();
				 $.post("techCate/updateTechCategroy",{"techCtgr":c,"id":id},function(data){
					 
				}) 
					 $(arrtd[1]).html(c);
			}) 
		}) 
		  function updt(upbtn){
			_tr = $(upbtn).parent().parent();
			
		}  
		
		/* 删除知识点 */
		function delt(delbtn){
			var tr1 = $(delbtn).parent().parent().css({'display':'none'});
			var arrtd = tr1.children();
			var d = $(arrtd[0]).text();
			$.post("techCate/deleteTechCategroy",{"id":d},function(data){
				
			}) 
		}  
		
		function save(){
			if(document.myForm.courseId.value==""){
                $(".ibox-content").hide();
				alert("课程名不能为空");
				return false;
			}else {

			}
		}
	
</script>
	</body>
</html>