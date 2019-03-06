<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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
                        <li><a href="showExamRadio" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考试</a></li>
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
                            <a href="">考试管理</a>
                        </li>
                        <li class="active">
                            <strong>考试成绩</strong>
                        </li>
                    </ol>
                </div>
            </div>


			
			
           <!-- 这里放你们JSP的DIV -->
            <div style="width: 100%; height: 750px">

                <div style="width:520px; margin:0 auto">
                    <h1>考试成绩(试卷编号：<span style="color:red">${examNo }</span>)</h1>
                    <table class="table table-condensed" >
                        <tr>
                            <th style="text-align:center;">序号</th>
                            <th style="text-align:center;">姓名</th>
                            <th style="text-align:center;">分数</th>
                            <th style="text-align:center;">性别</th>
                            <th style="text-align:center;">就读院校</th>
                            <th style="text-align:center;">专业</th>
                            <th style="text-align:center;">学历</th>

                        </tr>
                        <c:forEach var="hz" items="${list }">

                            <tr>
                                <td style="text-align:center;">${hz.userId }</td>
                                <td style="text-align:center;">${hz.oltsUser.username}</td>
                                <td style="text-align:center;">${hz.score+hz.fspScore }</td>
                                <td style="text-align:center;">${hz.oltsUser.gender }</td>
                                <td style="text-align:center;">${hz.oltsUser.graduateSchool }</td>
                                <td style="text-align:center;">${hz.oltsUser.marjor }</td>
                                <td style="text-align:center;">${hz.oltsUser.eduBackground }</td>

                            </tr>
                        </c:forEach>
                    </table>

                    <!-- 分页链拉 -->
                    <div >
                        <div>
                            <c:if test="${not empty OsPage}">
                                <ul class="pagination">
                                    <li><a href="admin/cheackGrade?pageNo=1">«</a></li>
                                    <c:if test="${OsPage.pageNo gt 3}">
                                        <li><a href="javascript:void(0)">....</a></li>
                                    </c:if>
                                    <c:if test="${OsPage.pageNo-2 ge 1}">
                                        <li><a?pageNo=${smdqPage.pageNo-2}">${OsPage.pageNo-2}</a></li>
                                    </c:if>
                                    <c:if test="${OsPage.pageNo-1 ge 1}">
                                        <li><a
                                                href="admin/cheackGrade?pageNo=${OsPage.pageNo-1}">${OsPage.pageNo-1}</a></li>
                                    </c:if>
                                    <li class="active"><a
                                            href="admin/cheackGrade?pageNo=${OsPage.pageNo}">${OsPage.pageNo}</a></li>
                                    <c:if test="${OsPage.pageNo+1 le OsPage.totalPage}">
                                        <li><a
                                                href="admin/cheackGrade?pageNo=${OsPage.pageNo+1}">${OsPage.pageNo+1}</a></li>
                                    </c:if>
                                    <c:if test="${OsPage.pageNo+2 le OsPage.totalPage}">
                                        <li><a
                                                href="admin/cheackGrade?pageNo=${OsPage.pageNo+2}">${OsPage.pageNo+2}</a></li>
                                    </c:if>
                                    <c:if test="${OsPage.pageNo+2 lt OsPage.totalPage}">
                                        <li><a href="javascript:void(0)">....</a></li>
                                    </c:if>
                                    <li><a
                                            href="admin/cheackGrade?pageNo=${OsPage.totalPage}">»</a></li>
                                </ul>
                            </c:if>
                        </div>

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
