<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>蓝桥在线考试系统</title>
    <base href="${pageContext.request.contextPath}/">
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <script src="vendor/js/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="vendor/js/plugins/codemirror/codemirror.js"></script>
    <script src="vendor/js/plugins/codemirror/mode/javascript/javascript.js"></script>
    <script src="vendor/js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="vendor/js/bootstrap.min.js" type="text/javascript"></script>

    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="vendor/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <script type="text/javascript">
        $(function(){



            $('[data-toggle="popover"]').popover();

            //进入时先显示模态框
            $('#myModal').modal({
                show: true,
                backdrop:'static'
            });

            //加载考试编号下拉列表
            $.get("examination/selExam",function(data){
                var select =$("#exam_no");
                var opt = $("<option></option>").attr("value","");
                select.append(opt);
                $.each(data, function(i, item){
                    var option = $("<option></option>").attr("value",item.examNo).html(item.examNo);
                    select.append(option);
                });
            },"json");

            //选择完编号后隐藏模态框 加载试卷内容
            $('#selExnoBtn').click(function () {
                $('#myModal').modal('hide');

                $.get("examination/selExamByNo",{"examNo": $('#exam_no').val()}, function (resp) {

                    //加载单选题
                    $('#single_question').empty();
                    $('#single_question').append('<h4>单选题  (每题2分)</h4>');
                    $.get("examination/loadSmd_question",{"questionType":1},function (data) {

                        $.each(data, function (i, item) { // foreach item, item={id:,name:""}

                            //加载选项
                            $.get("examination/loadSmd_options",{"questionId":item.id},function (opts) {
                                $('#single_question').append('<li>'+item.question+'<br>');
                                $('#single_question').append('A.' + opts.optionA + '<br>');
                                $('#single_question').append('B.' + opts.optionB + '<br>');
                                $('#single_question').append('C.' + opts.optionC + '<br>');
                                $('#single_question').append('D.' + opts.optionD + '<br>');
                                if (opts.optionE != null){
                                    $('#single_question').append('E.' + opts.optionE + '<br>');
                                }

                                $('#single_question').append(
                                    '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="A"> A  '+
                                    '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="B"> B  '+
                                    '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="C"> C  '+
                                    '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="D"> D  '
                                );
                                if (opts.optionE != null){
                                    $('#single_question').append(
                                        '<input type="radio" class="custom-control-input"  name="'+ item.id +'" value="E">  E');
                                }
                                $('#single_question').append('<br>');
                            },'json');
                        });
                    },'json');

                    //加载多选题
                    $('#multiple_question').empty();
                    $('#multiple_question').append('<hr>');
                    $('#multiple_question').append('<h4>多选题</h4>');
                    $.get("examination/loadSmd_question",{"questionType":2},function (data) {
                        $.each(data, function (i, item) {

                            //加载选项
                            $.get("examination/loadSmd_options",{"questionId":item.id},function (opts) {
                                $('#multiple_question').append('<li>'+item.question+'<br>');
                                $('#multiple_question').append('A.' + opts.optionA + '<br>');
                                $('#multiple_question').append('B.' + opts.optionB + '<br>');
                                $('#multiple_question').append('C.' + opts.optionC + '<br>');
                                $('#multiple_question').append('D.' + opts.optionD + '<br>');
                                if (opts.optionE != null){
                                    $('#multiple_question').append('E.' + opts.optionE + '<br>');
                                }

                                $('#multiple_question').append(
                                    '<input type="checkbox" class="custom-control-input"  name=smd_"'+ item.id +'" value="A"> A  '+
                                    '<input type="checkbox" class="custom-control-input"  name=smd_"'+ item.id +'" value="B"> B  '+
                                    '<input type="checkbox" class="custom-control-input"  name=smd_"'+ item.id +'" value="C"> C  '+
                                    '<input type="checkbox" class="custom-control-input"  name=smd_"'+ item.id +'" value="D"> D  '
                                );
                                if (opts.optionE != null){
                                    $('#multiple_question').append(
                                        '<input type="checkbox" class="custom-control-input"  name="smd_'+ (i+1) + '" value="E">  E');
                                }
                                $('#multiple_question').append('<br>');
                            },'json');
                        });
                    },'json');

                    //加载判断题
                    $('#ture_flase_question').empty();
                    $('#ture_flase_question').append('<hr>');
                    $('#ture_flase_question').append('<h4>判断题</h4>');
                    $.get("examination/loadSmd_question",{"questionType":3},function (data) {
                        $.each(data, function (i, item) {
                            $('#ture_flase_question').append('<li>'+item.question+'<br>'+
                                '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="true">  Ture'+
                                '<input type="radio" class="custom-control-input"  name=smd_"'+ item.id +'" value="true">  Flase'+
                                '</li>');
                        });
                    },'json');

                    //加载填空题
                    $('#fill_in_gaps').empty();
                    $('#fill_in_gaps').append('<hr>');
                    $('#fill_in_gaps').append('<h4>填空题</h4>');
                    $.get("examination/loadFsq_question",{"questionType":4},function (data) {
                        $.each(data, function (i, item) {
                            $('#fill_in_gaps').append('<li>'+item.question+'<br>'+
                                '<input type="text" class="form-control" name=fsq_"'+ item.id +'" onkeydown="if(event.keyCode==13){return false;}">' +
                                '</li>');
                        });
                    },'json');

                    //加载简答题
                    $('#simple_answer').empty();
                    $('#simple_answer').append('<hr>');
                    $('#simple_answer').append('<h4>简答题</h4>');
                    $.get("examination/loadFsq_question",{"questionType":5},function (data) {
                        $.each(data, function (i, item) {
                            $('#simple_answer').append('<li>'+item.question+'<br>'+
                                '<input type="text" class="form-control" name=fsq_"'+ item.id +'" onkeydown="if(event.keyCode==13){return false;}">' +
                                '</li>');
                        });
                    },'json');

                    //加载编程题
                    $('#program').empty();
                    $('#program').append('<hr>');
                    $('#program').append('<h4>编程题</h4>');
                    $.get("examination/loadFsq_question",{"questionType":6},function (data) {
                        $.each(data, function (i, item) {
                            $('#program').append('<li>'+item.question+'<br>'+
                                '<textarea class="form-control" rows="5" name=fsq_"'+ item.id +'" >'
                            );
                        });
                    },'json');


                },'json');
            })

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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${logUser.user_name}</strong>
                             </span> <span class="text-muted text-xs block"> <c:if test="${logUser.user_type !=null}">老师</c:if>
                                <c:if test="${logUser.user_type ==null}">学生</c:if>
                               <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>性别：${logUser.gender}</li>
                            <li>QQ:${logUser.qq}</li>
                            <li>专业:${logUser.marjor}</li>
                            <li>最高学历:${logUser.edu_Background}</li>
                            <li>手机:${logUser.mobile}</li>
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
                        <c:if test="${logUser.user_type !=null }">
                            <li><a href="showFspAnswerRadio" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>主观题阅卷</a></li>
                            <li><a href="views/examination/export_score_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>查看成绩</a></li>
                            <li><a href="views/examination/exam_manage_input.jsp" src="" class="cs-navi-tab"><img src="images/icons/ns_doc.gif"/>考卷维护</a></li>
                        </c:if>
                    </ul>
                </li>
                <c:if test="${logUser.user_type !=null}">
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
                </c:if>
                <li>
                    <a href="widgets.html"><i class="fa fa-flask"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                    <ul>
                        <c:if test="${logUser.user_type !=null }">
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
                        <li>
                            <a href="">试题新增</a>
                        </li>
                        <li class="active">
                            <strong>新增单选题</strong>
                        </li>
                    </ol>
                </div>
            </div>



            <div class="container" style="background-color: oldlace">

                <!-- 按钮：用于打开模态框 -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    选择考试编号
                </button>
                <hr>
                <%--考卷主体部分--%>
                <form action="${pageContext.request.contextPath}/examination/postAnswers" method="post">
                    <ol id="single_question"></ol>
                    <ol id="multiple_question"></ol>
                    <ol id="ture_flase_question"></ol>
                    <ol id="fill_in_gaps"></ol>
                    <ol id="simple_answer"></ol>
                    <ol id="program"></ol>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#alertModal">
                        提交答题卡
                    </button>
                    <br><br><br>

                    <!-- 模态框 -->
                    <div class="modal fade" id="alertModal">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">

                                <!-- 模态框头部 -->
                                <div class="modal-header">
                                    <h4 class="modal-title">确认提交么</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- 模态框主体 -->
                                <div class="modal-body">
                                    <button type="submit" class="btn btn-primary">确认</button>
                                </div>

                                <!-- 模态框底部 -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                </div>

                            </div>
                        </div>
                    </div>

                </form>


                <!-- 模态框 -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- 模态框头部 -->
                            <div class="modal-header">
                                <h4 class="modal-title">选择考试编号</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- 模态框主体 -->
                            <div class="modal-body">
                                <div style="width: 100%; height: 300px;">
                                    <div style="width:30%;margin-left:35%;text-align: center;">
                                        <form action="examination/showStuFspAnswer" method="get">
                                            <h2>试卷编号</h2>
                                            <div class="input-group">
                                                <select class="select2_demo_1 form-control" name="exam_no" id="exam_no" style="width: 200px">

                                                </select>
                                                <span class="input-group-btn">
                                        <input type="button" class="btn btn-primary" name="selExnoBtn" id="selExnoBtn" value="选择">
                                    </span>
                                            </div>
                                            <div id="showExnoDiv" >
                                                <ul id="showExnoUl" style="list-style-type:none;padding-left:0;margin-top:15px;margin-bottom:0"></ul>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- 模态框底部 -->
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>--%>
                            </div>

                        </div>
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


    <!-- Sweet alert -->
    <script src="vendor/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>

</html>
