<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <base href="${basePath}"/>
 <!--  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="../disable_cache.jsp" %>	
  <%@include file="../common_resource.jsp" %>	
  <title>新增单选题</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<style type="text/css">
input:required:invalid {
	background-color: red;
}
 input:required:valid {
    background-color: green;
}

.input-option{
    width: 93%;
    /* height: 34px; */
    padding: 6px 12px;
    font-size: 14px;
    /* line-height: 1.42857143; */
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
   /*  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075); */
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
   /*  -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s; */
   /*  -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s; */
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.btn-reset{padding-left:30px;padding-right:30px;}

</style>
  <!-- JavaScript Includes -->
  <script src="js/jquery-2.2.3.js"></script>
  <%-- <script src="script/html5_validate.js"></script> --%>

<script>
$(function () {
	applyCodeFmt("#question");
	
	//如果是更新不需要异步加载课程
	<%if(request.getAttribute("catagorys")==null){%>
		  loadCatagory("#catagory",false);
	<%}%>
	 $("#catagory").click(function(){
		 $(":hidden[name='catagoryId']").val($(this).val());
		 loadQuestCatagory("#catagory","#questCatagory",false);
	});
	 
	//
	$("textarea").prop("required",true);
});
</script>
</head>
<body>
<br>
<div class="container">
	<form id="radioForm" action="????.do"  role="form"  method="post">
		<input type="hidden" name="id" />
		<input type="hidden" name="catagoryId" value='??????????'/>
		<input type="hidden" name="questType" value="1"/>
		<input type="hidden" name="selectOption.id" />
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<div class="form-group">
				 <label for="question">题干：</label>
				 <textarea id="question" name="question" class="form-control" 
				 	rows="12" cols="78" required="true" placeholder="请输入单选题题干"></textarea>
				 <input type="button" id="applyCodeFmt" class="btn btn-info btn-xs" value="应用代码格式"/>
			</div>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-4 column">
			<div class="form-group">
				<label for="catagory" style="padding:0px;">课程：</label>
					<select id="catagory" name="questCatagory.catagory.id" class="form-control" size="5" required>
					</select>
			</div>
		</div>
		<div class="col-md-4 column">
			<label for="questCatagory" style="padding-left:0px;">知识点：</label>
			  	<select id="questCatagory" name="questCatagory.id" size="5" class="form-control" required></select>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<div class="form-group">
				<label class="text-center pull-left">选项</label>
				<label class="text-center col-md-10">内容</label>
				<label class="text-center pull-right">答案</label>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column" style="margin-top:10px;">
			<label style="position: relative;top:-33px;">A.</label>
			<textarea id="optionA" name="selectOption.optionA" 
					class="input-option" rows="3" cols="65" placeholder="请输入选项 A" style="resize:none;">
			</textarea>
			<label class="checkbox-inline" style="top:-33px;padding-left: 2px;">
				<input type="radio" name="correct"  value="A" checked/> 
			</label>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column" style="margin-top:10px;">
			<label style="position: relative;top:-33px;">B.</label>
			<textarea id="optionB" name="selectOption.optionB" 
					class="input-option" rows="3" cols="65" placeholder="请输入选项 B" style="resize:none;">
			</textarea>
			<label class="checkbox-inline" style="top:-33px;padding-left: 2px;">
				<input type="radio" name="correct"  value="B" checked/>
			</label>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column" style="margin-top:10px;">
			<label style="position: relative;top:-33px;">C.</label>
			<textarea id="optionC" name="selectOption.optionC" 
					class="input-option" rows="3" cols="65" placeholder="请输入选项 C" style="resize:none;">
			</textarea>
			<label class="checkbox-inline" style="top:-33px;padding-left: 2px;">
				<input type="radio" name="correct"  value="C" checked> 
			</label>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column" style="margin-top:10px;">
			<label style="position: relative;top:-33px;">D.</label>
			<textarea id="optionD" name="selectOption.optionD" 
					class="input-option" rows="3" cols="65" placeholder="请输入选项 D" style="resize:none;">
			</textarea>
			<label class="checkbox-inline" style="top:-33px;padding-left: 2px;">
				<input type="radio" name="correct"  value="D" checked/> 
			</label>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<div class="form-group text-center">
				  <button type="submit" class="btn active btn-primary btn-default">保存单选题</button>&nbsp;&nbsp;
				  <button type="reset" class="btn btn-default active btn-reset">重置</button>
			</div>
		</div>
		<div class="col-md-2 column"></div>
	</div>
	</form>
</div>

</body>
</html>
