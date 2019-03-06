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
    <script src="vendor/js/jquery-2.2.4.js" type="text/javascript"></script>
    <script src="vendor/js/plugins/codemirror/codemirror.js"></script>
    <script src="vendor/js/plugins/codemirror/mode/javascript/javascript.js"></script>
    <!-- Sweet Alert -->
    <link href="vendor/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <script  type="text/javascript">
    $(function() {
        $.ajax({
            url: "question/load_courses",  // 请求URL
            type: "GET",
            data: {}, //请求的参数
            dataType: "json", // 响应的内容类型：text, html, json, script, xml, jsonp
            success: function (resp) {
                $.each(resp, function (i, item) { // foreach item, item={coursesid:101,name:"海淀"}
                    var opt = new Option(item.courseName, item.id);
                    $('#courses').append(opt);
                });
            }
        });
        $('#courses').change(function () {
            console.log("知识点编号：" + $('#courses').val());
            $('#techCateId').empty();
            $('#techCateId').append('<option value="">不限--</option>');

            $.get("question/load_techCategories", {"id": $('#courses').val()}, function (resp) {
                console.dirxml(resp);
                $.each(resp, function (i, item) { // foreach item, item={id:101,name:"海淀"}
                    var opt = new Option(item.techCtgr, item.id);
                    $('#techCateId').append(opt);
                });
            }, 'json');
        });
    });

    $(function () {
        if (${flag =="true"}) {
            swal({
                title: "添加成功",
                type: "success"
            });
        }
    });
    function codeAdd() {
        console.log(document.getElementById("stem").innerHTML);
        var code = "<textarea id='code1'><pre>  代码位置 <pre> </textarea>";
        /* document.getElementById("stem").removeAttribute("textarea");
         console.log(document.getElementById("stem").innerHTML);*/
        document.getElementById("stem").innerHTML=code;
    }
    $(document).ready(function(){

        var editor_one = CodeMirror.fromTextArea(document.getElementById("code1"), {
            lineNumbers: true,
            matchBrackets: true,
            styleActiveLine: true,

        });

    });
    function animationHover(element, animation){
        element = $(element);
        element.hover(
            function() {
                element.addClass('animated ' + animation);
            },
            function(){
                //wait for animation to finish before removing classes
                window.setTimeout( function(){
                    element.removeClass('animated ' + animation);
                }, 2000);
            });
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
                             </span> <span class="text-muted text-xs block"> <c:if test="${logUser.user_type !=null}">老师</c:if>
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
<c:if test="${logUser.user_type !=null }">
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



            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-1 column">
                    </div>
                    <div class="col-md-10 column">
                        <form  method="post"  action="question/insertSmdQuestion">
                            <%--<input type="hidden" name="id" />--%>
                            <input type="hidden" name="questionType" value="1"/>

                            <ul class="nav nav-tabs nav-justified">
                                <li class="active"><a href="views/question/index1.jsp">新增单选题</a></li>
                                <li><a href="views/question/index2.jsp">新增多选题</a></li>
                                <li><a href="views/question/index3.jsp">新增判断题</a></li>
                                <li><a href="views/question/index4.jsp">新增填空题</a></li>
                                <li><a href="views/question/index4.jsp">新增简答题</a></li>
                                <li><a href="views/question/index5.jsp">新增编程题</a></li>
                            </ul><br><br><br>
                            <div class="form-group">
                                <label id="question" >单选题题干</label>
                                <textarea  id="stem" class="form-control"rows="6" name="question" ></textarea><br>
                                <div class="text-center"><button type="button" onclick="codeAdd()" class="btn btn-success">复制格式代码</button></div>
                            </div>
                            <div class="row text-center">
                                <div class="form-inline">
                                    <label>课程:</label>
                                    <select  name="courses" id="courses"  class="form-control" style="width:350px;" tabindex="2">
                                        <option value=''>不限--</option>
                                    </select>
                                    &nbsp &nbsp &nbsp &nbsp
                                    <label>知识点:</label>
                                    <select  name="techCateId" id="techCateId" class="form-control" style="width:350px;" tabindex="5">
                                        <option value=''>不限--</option>
                                    </select>
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon" id="sizing-addon1" style="background-color: #9B859D">A</span>
                                    <input type="text" id="optionA" name="optionA" class="form-control" placeholder="请输入..." aria-describedby="sizing-addon1">
                                    <span class="input-group-addon">
                           <input type="radio" id="correct1" name="correct" value="A" aria-label="...">
                    </span>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon" id="sizing-addon2" style="background-color: #9B859D">B</span>
                                    <input type="text" id="optionB" name="optionB" class="form-control" placeholder="请输入..." aria-describedby="sizing-addon1">
                                    <span class="input-group-addon">
                           <input type="radio" id="correct2" name="correct" value="B" aria-label="...">
                    </span>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon" id="sizing-addon3" style="background-color: #9B859D">C</span>
                                    <input type="text" id="optionC" name="optionC" class="form-control" placeholder="请输入..." aria-describedby="sizing-addon1">
                                    <span class="input-group-addon">
                           <input type="radio" id="correct3" name="correct" value="C" aria-label="...">
                    </span>
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon" id="sizing-addon4" style="background-color: #9B859D">D</span>
                                    <input type="text" id="optionD" name="optionD" class="form-control" placeholder="请输入..." aria-describedby="sizing-addon1">
                                    <span class="input-group-addon">
                           <input class=".checkbox-primary" type="radio" id="correct4" name="correct" value="D" aria-label="...">
                    </span>
                                </div>
                            </div><br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-success  demo2">提交</button>&nbsp&nbsp&nbsp
                                <button type="reset" class="btn btn-info">重置</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-1 column">
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
