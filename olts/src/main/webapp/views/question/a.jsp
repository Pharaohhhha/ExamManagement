<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>蓝桥在线考试系统</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <link href="vendor/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">



    <script src="vendor/js/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="vendor/js/plugins/codemirror/codemirror.js"></script>
    <script src="vendor/js/plugins/codemirror/mode/javascript/javascript.js"></script>
    <!-- Sweet Alert -->
    <link href="vendor/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <script src="vendor/js/jquery-2.1.1.js" type="text/javascript"></script>
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>


    <![endif]-->

    <script language="javascript">
        $(function () {
            $.ajax({
                url: "question/selCourse",  // 请求URL
                type: "GET",
                data: {}, //请求的参数
                dataType: "json", // 响应的内容类型：text, html, json, script, xml, jsonp
                success: function (resp) {
                    $.each(resp, function (i, item) { // foreach item, item={id:101,name:"海淀"}
                        var opt = new Option(item.courseName, item.id);
                        $('#courseType').append(opt);
                    });
                }
            });
            $('#courseType').change(function () {
                console.log("课程编号：" + $('#courseType').val());
                $('#techCategory').empty();
                $('#techCategory').append('<option value="">知识点</option>');

                $.get("Question/selTechCategory", {"id": $('#courseType').val()}, function (resp) {
                    console.dirxml(resp);
                    $.each(resp, function (i, item) { // foreach item, item={id:101,name:"海淀"}
                        var opt = new Option(item.techCtgr, item.id);
                        $('#techCategory').append(opt);
                    });
                }, 'json');
            });



        })
        $(function () {
            if (${flaggg =="true"}) {
                swal({
                    title: "更新成功",
                    type: "success"
                });
            }
        });
        $(function () {
            if (${flagg =="true"}) {
                swal({
                    title: "删除成功",
                    type: "success"
                });
            }
        });
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
                        <a href="index.jsp">主页</a>
                    </li>
                    <!-- 这里手动改下标题 -->
                    <li>
                        <a href="index.jsp">试题查询</a>
                    </li>
                    <li class="active">
                        <strong>题查询</strong>
                    </li>
                </ol>
            </div>
        </div>




        <!-- 这里放你们JSP的DIV -->

        <div class="container">
            <div class="row clearfix" style="padding-top: 20px">
                <div class="col-md-1 column" >
                </div>
                <div class="col-md-10 column">
                    <form action="question/search">

                        <div class="row clearfix">
                            <div class="col-md-8 column">
                                <div class="input-group">
                                    <span class="glyphicon glyphicon-search input-group-addon" style="color: rgb(75,101,255);"></span>
                                    <input type="text" class="form-control" placeholder="请输入题干" name="question" value="${sessionScope.selective.question}">
                                </div>

                            </div>
                            <div class="col-md-4 column">
                                <select name="questionType" style="width: 100px ;height: 35px;border-radius: 5px">
                                    <option value=''>请选择题型</option>
                                    <option value='1'>填空题</option>
                                    <option value='2'>简答题</option>
                                    <option value='3'>编程题</option>
                                </select>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-8 column">
                                <div class="row clearfix" style="padding-top: 20px">
                                    <div class="col-md-6 column">
                                        <select id="courseType" style="width: 200px ;height: 35px;border-radius: 5px">
                                            <option value=''>课程</option>
                                        </select>

                                    </div>
                                    <div  class="col-md-6 column">
                                        <select id="techCategory" name="techCateId" style="width: 200px ;height: 35px;border-radius: 5px">
                                            <option value=''>知识点</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 column" style="margin-top:20px; ">
                                <button type="submit" class="btn btn-success" style="width: 100px">搜索</button>

                            </div>
                        </div>
                    </form>
                    <div class="row">

                        <c:forEach var="question" items="${page}" varStatus="stat">
                            <div class="col-lg-12" id="div_${fspQuestion.id}">
                                <div class="ibox float-e-margins">

                                    <div class="ibox-title">
                                        <h5>${smdquestion.question}</h5>
                                        <div class="ibox-tools">
                                            <a class="collapse-link">
                                                <i class="fa fa-chevron-up"></i>
                                            </a>
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                                <i class="fa fa-wrench"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-user">
                                                <li><a href="#">Config option 1</a>
                                                </li>
                                                <li><a href="#">Config option 2</a>
                                                </li>
                                            </ul>
                                            <a class="close-link">
                                                <i class="fa fa-times"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="ibox-content" style="display: block;">
                                        <div><p>${smdquestion.correct}</p></div>
                                        <div style="text-align: right">
                                            <a id="toUpdateBtn" questionId="${smdQuestion.id}" href="#" class="btn btn-info btn-sm"
                                               data-toggle="modal" data-target="#myModal" data-backdrop="static" >
                                                <span class="glyphicon glyphicon-refresh"></span> 更新
                                            </a>
                                                <%--<a id="toUpdateBtn" id="${fspQuestion.id}"  href="fspQuestionUpdate.jsp?qid=${fspQuestion.id}" class="btn btn-info btn-sm"--%>
                                                <%--data-toggle="modal" data-target="#myModal" data-backdrop="static">--%>
                                                <%--<span class="glyphicon glyphicon-refresh"></span> 更新--%>
                                                <%--</a>--%>
                                            <a href="javascript:void(0);" class="btn btn-danger btn-sm" id="${smdQuestion.id}" id="deleteBtn"
                                               data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                                                <span class="glyphicon glyphicon-trash"></span> 删除
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-1 column">
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="myMdal-content">
            <form action="fspQuestion/update">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                </div>
                <div class="modal-body">
                    <h3>题号：<input type="text" class="form-control" name="id" id="thisQuestionId" value="" readonly="true"></h3>
                    题干：<input type="text" class="form-control" name="question" >
                    标准答案：<input type="text" class="form-control" name="stdAnswer" >
                    题型：
                    <select name="questionType" style="width: 100px ;height: 35px;border-radius: 5px">
                        <option value=''>请选择题型</option>
                        <option value='1'>填空题</option>
                        <option value='2'>简答题</option>
                        <option value='3'>编程题</option>
                    </select>
                    <br>
                    简单描述：<input type="text" class="form-control" name="descrpt" value="">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="updateConfirmBtn" type="submit" class="btn btn-info">更新</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <form action="fspQuestion/delete">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel"> 删除确认 </h4>
                </div>
                <div class="modal-body">
                    <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                    您真的要删除编号为：<input type="number" name="id" id="questionId" readonly="ture" value="" style="width: 50px;"></span> 的试题吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="deleteConfirmBtn" type="submit" class="btn btn-primary">删除</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>删除成功！</strong>结果是成功的。
</div>
<script>
    $(function () {
        $('#deleteAlert').hide();

        //处理当模态框打开时的事件：show.bs.modal
        $('#deleteModal').on('show.bs.modal', function (event) { //event表示的是点元素产生事件，此处是<a id="deleteBtn">...</a>的事件
            // 获得触发事件的源头的元素
            console.dirxml(event.relatedTarget);
            var id = $(event.relatedTarget).attr('id');
            $('#questionId').val(id);
        })

        $('#myModal').on('show.bs.modal', function (event) { //event表示的是点元素产生事件，此处是<a id="deleteBtn">...</a>的事件
            // 获得触发事件的源头的元素
            console.dirxml(event.relatedTarget);
            var questionId = $(event.relatedTarget).attr('questionId');
            $('#thisQuestionId').val(questionId);
        });

    });


    //也可通过这种方式把其它页面的内容加入到模态框的body部分
</script>
<!-- Mainly scripts -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="vendor/js/bootstrap.min.js"></script>
<script src="vendor/js/jquery-2.1.1.js" type="text/javascript"></script>
<script src="vendor/js/inspinia.js"></script>
<script src="vendor/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="vendor/js/plugins/pace/pace.min.js"></script>
<script src="vendor/js/plugins/iCheck/icheck.min.js"></script>


<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>




<!-- Sweet alert -->
<script src="vendor/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    // Config box

    // Enable/disable fixed top navbar
    $('#fixednavbar').click(function () {
        if ($('#fixednavbar').is(':checked')) {
            $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
            $("body").removeClass('boxed-layout');
            $("body").addClass('fixed-nav');
            $('#boxedlayout').prop('checked', false);

            if (localStorageSupport) {
                localStorage.setItem("boxedlayout",'off');
            }

            if (localStorageSupport) {
                localStorage.setItem("fixednavbar",'on');
            }
        } else {
            $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
            $("body").removeClass('fixed-nav');

            if (localStorageSupport) {
                localStorage.setItem("fixednavbar",'off');
            }
        }
    });

    // Enable/disable fixed sidebar
    $('#fixedsidebar').click(function () {
        if ($('#fixedsidebar').is(':checked')) {
            $("body").addClass('fixed-sidebar');
            $('.sidebar-collapse').slimScroll({
                height: '100%',
                railOpacity: 0.9
            });

            if (localStorageSupport) {
                localStorage.setItem("fixedsidebar",'on');
            }
        } else {
            $('.sidebar-collapse').slimscroll({destroy: true});
            $('.sidebar-collapse').attr('style', '');
            $("body").removeClass('fixed-sidebar');

            if (localStorageSupport) {
                localStorage.setItem("fixedsidebar",'off');
            }
        }
    });

    // Enable/disable collapse menu
    $('#collapsemenu').click(function () {
        if ($('#collapsemenu').is(':checked')) {
            $("body").addClass('mini-navbar');
            SmoothlyMenu();

            if (localStorageSupport) {
                localStorage.setItem("collapse_menu",'on');
            }

        } else {
            $("body").removeClass('mini-navbar');
            SmoothlyMenu();

            if (localStorageSupport) {
                localStorage.setItem("collapse_menu",'off');
            }
        }
    });

    // Enable/disable boxed layout
    $('#boxedlayout').click(function () {
        if ($('#boxedlayout').is(':checked')) {
            $("body").addClass('boxed-layout');
            $('#fixednavbar').prop('checked', false);
            $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
            $("body").removeClass('fixed-nav');
            $(".footer").removeClass('fixed');
            $('#fixedfooter').prop('checked', false);

            if (localStorageSupport) {
                localStorage.setItem("fixednavbar",'off');
            }

            if (localStorageSupport) {
                localStorage.setItem("fixedfooter",'off');
            }


            if (localStorageSupport) {
                localStorage.setItem("boxedlayout",'on');
            }
        } else {
            $("body").removeClass('boxed-layout');

            if (localStorageSupport) {
                localStorage.setItem("boxedlayout",'off');
            }
        }
    });

    // Enable/disable fixed footer
    $('#fixedfooter').click(function () {
        if ($('#fixedfooter').is(':checked')) {
            $('#boxedlayout').prop('checked', false);
            $("body").removeClass('boxed-layout');
            $(".footer").addClass('fixed');

            if (localStorageSupport) {
                localStorage.setItem("boxedlayout",'off');
            }

            if (localStorageSupport) {
                localStorage.setItem("fixedfooter",'on');
            }
        } else {
            $(".footer").removeClass('fixed');

            if (localStorageSupport) {
                localStorage.setItem("fixedfooter",'off');
            }
        }
    });

    // SKIN Select
    $('.spin-icon').click(function () {
        $(".theme-config-box").toggleClass("show");
    });

    // Default skin
    $('.s-skin-0').click(function () {
        $("body").removeClass("skin-1");
        $("body").removeClass("skin-2");
        $("body").removeClass("skin-3");
    });

    // Blue skin
    $('.s-skin-1').click(function () {
        $("body").removeClass("skin-2");
        $("body").removeClass("skin-3");
        $("body").addClass("skin-1");
    });

    // Inspinia ultra skin
    $('.s-skin-2').click(function () {
        $("body").removeClass("skin-1");
        $("body").removeClass("skin-3");
        $("body").addClass("skin-2");
    });

    // Yellow skin
    $('.s-skin-3').click(function () {
        $("body").removeClass("skin-1");
        $("body").removeClass("skin-2");
        $("body").addClass("skin-3");
    });

    if (localStorageSupport) {
        var collapse = localStorage.getItem("collapse_menu");
        var fixedsidebar = localStorage.getItem("fixedsidebar");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");
        var fixedfooter = localStorage.getItem("fixedfooter");

        if (collapse == 'on') {
            $('#collapsemenu').prop('checked','checked')
        }
        if (fixedsidebar == 'on') {
            $('#fixedsidebar').prop('checked','checked')
        }
        if (fixednavbar == 'on') {
            $('#fixednavbar').prop('checked','checked')
        }
        if (boxedlayout == 'on') {
            $('#boxedlayout').prop('checked','checked')
        }
        if (fixedfooter == 'on') {
            $('#fixedfooter').prop('checked','checked')
        }
    }
</script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
</body>

</html>
