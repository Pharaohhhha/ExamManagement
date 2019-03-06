<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body class="">
<div id="wrapper1">
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
                        <li><a href="views/examination/index1.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考试</a></li>
                        <c:if test="${true }">
                            <li><a href="showFspAnswerRadio" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>主观题阅卷</a></li>
                            <li><a href="views/examination/export_score_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>查看成绩</a></li>
                            <li><a href="views/examination/exam_manage_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考卷维护</a></li>
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
                        <li><a href="views/question/selectSmdQuestion.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>单选题查询</a></li>
                        <li><a href="views/question/selectFspQuestion.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>客观题查询</a></li>

                    </ul>
                </li>
                <li>
                    <a href="metrics.html"><i class="fa fa-pie-chart"></i> <span class="nav-label">分类管理</span> <span class="fa arrow"></span> </a>
                    <ul>
                        <li><a href="courses/selectAllCourse" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>课程名</a></li>
                        <li><a href="JSP页面模板.jsp" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>知识点</a></li>
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
                        <a href="">试题新增</a>
                    </li>
                    <li class="active">
                        <strong>新增单选题</strong>
                    </li>
                </ol>
            </div>
        </div>



        <div>
            <div id="wrapper">
                <div class="row  border-bottom white-bg dashboard-header"></div>
                <!-- 主要内容开始 -->
                <div style="width: 100%">
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-md-2 column"></div>
                            <div class="col-md-6 column">
                                <form action="courses/insertCourse" method="post" align="center" name="myForm" onsubmit="return save()">
                                    <i style="font-size: large ;color: #9B30FF">新增课程名：</i><input type="text" name="courseName" style="background-color: #EEE0E5">
                                    <tr>
                                        <td><input type="submit" value="保存" class="btn" style="background-color: #FFB5C5;height: 27px;line-height: 5px">&nbsp;&nbsp;</td>
                                        <td><input type="reset" value="重置" class="btn" style="background-color: #EE82EE;height: 27px;line-height: 5px"></td>
                                    </tr>
                                </form>
                                <br>
                                <form action="courses/selectBySelective" method="post" align="center" name="myForm2">
                                    <i style="font-size: large ;color: #9B30FF">查询课程名：</i><input type="text" name="courseName" style="background-color: #EEE0E5">
                                    <tr>
                                        <td><input type="submit" value="查询" class="btn" style="background-color: #EE82EE;height: 27px;line-height: 5px;margin-right: 66px"></td>
                                    </tr>
                                </form>
                                <br>
                                <!-- 表头 -->
                                <table width='450' border='2' class="table table-condensed">
                                    <tr style="color: #4EEE94">
                                        <td  align='center'>序号</td>
                                        <td width='150' align='center'>课程名</td>
                                        <td width='200'  align='center'>操作</td>
                                    </tr>

                                    <!-- 显示课程信息 -->
                                    <c:forEach var="c" items="${mypage}">
                                        <tr style="color: #CDAD00">
                                            <td align='center'>${c.id }</td>
                                            <td align='center' style='height: 25px;'>${c.courseName }</td>
                                            <td align='center' style='height: 25px;'>
                                                <button type="button" class="btn btn-success"
                                                        data-toggle="modal" onclick="updt(this);" data-target="#myModal6">更新
                                                </button>
                                                <button type="button"  class="btn btn-danger"
                                                        onclick="delt(this);" value="${c.id }">删除
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>

                                <!-- 课程分页-->
                                <table align="center">
                                    <tr class="page-nav">
                                        <td colspan='3'>
                                            <jsp:include page="../../paging.jsp">
                                                <jsp:param name="page" value="mypage"/>
                                            </jsp:include>
                                            <%--总${page.getTotal()}条 &nbsp;&nbsp; 第${page.getPageNum()}页/共${page.getPages()}页
                                            &nbsp;&nbsp; &nbsp;&nbsp;
                                            <c:if test="${page.getPageNum() gt 1}">
                                                <a href="house/search?pageNum=1">第一页</a> &nbsp;
                                            </c:if>
                                            <c:if test="${page.getPageNum() gt 1}">
                                                <a href="house/search?pageNum=${page.getPageNum()-1}">上一页</a>&nbsp;
                                            </c:if>
                                            <c:if test="${page.getPageNum() lt page.getPages()}">
                                                <a href="house/search?pageNum=${page.getPageNum()+1}">下一页</a>&nbsp;
                                            </c:if>
                                            <c:if test="${page.getPageNum() lt page.getPages()}">
                                                <a href="house/search?pageNum=${page.getPages()}">末页</a>&nbsp;
                                            </c:if>--%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-4 column"></div>
                        </div>
                    </div>
                </div>
                <!-- 主要内容结束 -->
            </div>


            <div class="ibox-content">
                <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span
                                        class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">修改课程名</h4>
                            </div>

                            <div class="modal-body">
                                <input type="text" id="courname">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white"
                                        data-dismiss="modal">取消</button>
                                <button type="button" id="updat" class="btn btn-primary">确认</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="right-sidebar">
                    <div class="sidebar-container">
                        <ul class="nav nav-tabs navs-3">
                            <li class="active"><a data-toggle="tab" href="#tab-1">Notes </a></li>
                            <li><a data-toggle="tab" href="#tab-2"> Projects </a></li>
                            <li><a data-toggle="tab" href="#tab-3"> Projects </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 这里放你们JSP的DIV -->




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
<script type="text/javascript">

    function delt(delbtn){
        var tr1 = $(delbtn).parent().parent().css({'display':'none'});
        var arrtd = tr1.children();
        var d = $(arrtd[0]).text();
        $.post("courses/delete",{"id":d},function(data){

        })
    }

    $(function(){
        $("#updat").click(function(){
            $("#myModal6").modal("hide");
            var arrtd = _tr.children();
            id = $(arrtd[0]).text();

            var c = $("#courname").val();

            $.post("courses/update",{"arrtd":id,"courseName":c},function(status,data){
                $(arrtd[1]).html(c);
            });
        });
    });
    function updt(upbtn){
        _tr = $(upbtn).parent().parent();
    }

    function save(){
        if( document.myForm.courseName.value =="" ){
            alert("添加的课程名不能为空");
            return false;
        }else{
            alert("保存成功");
            return true;
        }
    }

</script>

<script src="vendor/js/jquery-2.1.1.js"></script>
<script src="vendor/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="vendor/js/inspinia.js"></script>
<script src="vendor/js/plugins/pace/pace.min.js"></script>
</body>

</html>
