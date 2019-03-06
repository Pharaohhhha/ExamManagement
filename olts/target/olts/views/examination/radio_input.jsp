<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>蓝桥在线考试系统</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <script src="vendor/js/jquery-2.2.4.js" type="text/javascript"></script>
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <script type="text/javascript">

        $(function () {
            $(".endExam").click(function () {
                $.ajax({
                    url:"admin/endExam",
                    type:"post" ,
                    success:function(result){
                        $(".examInfo").html(result)
                    },
                    error:function(){
                    }
                });
            })
        })

        /**
         * 载入试卷编号
         */
        function selectValidExamNo(){
            $.post("admin/selExamNo",function(date){
// 			查看试卷之前把上一次显示的列表删除
                $("#showExnoUl").find("li").remove();
                var ul = $("#showExnoUl"); //显示的试卷编号列表的<UL>
                $.each(date, function(i,item){
                    var li = $("<li></li>")
                    var selItem = $("<input/>",{type:"radio", name:"selExamNo", value:item.examNo});
                    selItem.click(function(){
                        $("#examNo").val($(this).val());
                    });
                    li.append(selItem);
                    li.append("<lable>" + item.examNo + "</lable>");
                    ul.append(li);
                });
            });
            if($("#selExnoBtn").val()== "选择" ){
                $("#selExnoBtn").val("隐藏");
                $("#showExnoDiv").show();
            }else{
                $("#selExnoBtn").val("选择");
                $("#showExnoDiv").hide();
            }
        }

    </script>
</head>

<body class="">
    <div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="images/icons/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">james</strong>
                             </span> <span class="text-muted text-xs block">老师 <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profile</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li>
                    <a href="layouts.html"><i class="fa fa-diamond"></i> <span class="nav-label">考试管理</span><span class="fa arrow"></span></a>
                    <ul>
                        <li><a href="javascript:void(0);" src="views/examination/examination_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考试</a></li>
                        <c:if test="${true }">
                            <li><a href="javascript:void(0);" src="views/examination/csp_answer_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>主观题阅卷</a></li>
                            <li><a href="javascript:void(0);" src="views/examination/export_score_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>查看成绩</a></li>
                            <li><a href="javascript:void(0);" src="views/examination/exam_manage_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考卷维护</a></li>
                        </c:if>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">试题新增</span><span class="fa arrow"></span></a>
                    <ul>
                        <li><a href="views/question/index1.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>试题新增</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-envelope"></i> <span class="nav-label">试题查询 </span><span class="fa arrow"></span></a>
                    <ul>
                        <li><a href="showExamRadio" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考试</a></li>
                        <c:if test="${true }">
                            <li><a href="showFspAnswerRadio" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>主观题阅卷</a></li>
                            <li><a href="views/examination/export_score_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>查看成绩</a></li>
                            <li><a href="views/examination/exam_manage_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考卷维护</a></li>
                        </c:if>
                    </ul>
                </li>
                <li>
                    <a href="metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">分类管理</span> <span class="fa arrow"></span> </a>
                    <ul>
                        <li><a href="javascript:void(0);" src="secure/questCatagory!findAllCatagory.action" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>课程名</a></li>
                        <li><a href="javascript:void(0);" src="views/catagory/questCatagory_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>知识点</a></li>
                    </ul>
                </li>
                <li>
                    <a href="widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                    <ul>
                        <c:if test="${true }">
                            <li><a href="javascript:void(0);" src="views/user/importExcel_input.jsp" class="cs-navi-tab" title="从excle文件中导入"><img src="images/icons/ns_doc.gif"/>批量导入用户</a></li>
                            <li><a href="javascript:void(0);" src="secure/userInfo!findByType.action" class="cs-navi-tab" title="删除和修改"><img src="images/icons/ns_doc.gif"/>批量操作用户</a></li>
                        </c:if>
                        <li><a href="javascript:void(0);" src="views/user/user_input.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>修改用户信息</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="../../../../../04高级_框架笔记/inspinia/search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">欢迎来到考试系统！</span>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                </li>
                <li>
                    <a href="login.jsp">
                        <i class="fa fa-sign-out"></i> 退出本系统
                    </a>
                </li>
            </ul>
        </nav>
        </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2></h2>蓝桥在线考试系统</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="">主页</a>
                        </li>
				  <!-- 这里手动改下标题 -->
                        <li>
                            <a href="">试卷管理</a>
                        </li>
                        <li class="active">
                            <strong>考试</strong>
                        </li>
                    </ol>
                </div>
            </div>


			
			
           <!-- 这里放你们JSP的DIV -->
            <div style="width: 100%; height: 750px;">
                <div style="width:30%;margin-left:35%;text-align: center;">
                    <form action="admin/beginExam" method="post">
                        <h2>考试编号</h2>
                        <div class="input-group">
                            <input type="text" name="examNo" id="examNo" value="" class="form-control">
                            <span class="input-group-btn">
										<input type="button" class="btn btn-primary" name="selExnoBtn" id="selExnoBtn" value="选择" onclick="selectValidExamNo()">
									</span>
                        </div>
                        <div id="showExnoDiv" >
                            <ul id="showExnoUl" style="list-style-type:none;padding-left:0;margin-top:15px;margin-bottom:0"></ul>
                        </div>
                        <p class="examInfo">${success }</p>
                        <input type="submit" class="btn btn-primary" value="发布考试" style="margin-top: 15px"/>
                        <input type="button" class="btn btn-primary endExam" value="结束考试" style="margin-top: 15px"/>
                        <input type="reset" class="btn btn-primary" value="重置试卷" style="margin-top: 15px"/>
                    </form>
                </div>
            </div>



            <div class="footer">
                <div class="pull-right">
                    10GB of <strong>250GB</strong> Free.
                </div>
                <div>
                    <strong>Copyright</strong> Example Company &copy; 2018-2019
                </div>
            </div>
        </div>
        </div>
    <!-- Mainly scripts -->
    <script src="vendor/js/jquery-2.1.1.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="vendor/js/inspinia.js"></script>
    <script src="vendor/js/plugins/pace/pace.min.js"></script>
</body>

</html>
