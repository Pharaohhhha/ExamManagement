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
        window.onload = function(){
            if($(".error").val() != ''){
                $("h3").hide();
                $(".up").hide();
                $(".examInfo").show();
            }else{
                $(".examInfo").hide();
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
            <h2 class="examNO" align="center">试卷 &nbsp;&nbsp;<small>(试卷编号:${examinations.examNo})</font></h2>
            <input type="hidden" value="${examinations.examNo}" class="examID">
            <p></p>
            <input type="hidden" value="${error }" class="error">
            <div class="widget red-bg p-lg text-center examInfo">
                <div class="m-b-md">
                    <i class="fa fa-bell fa-4x"></i>
                    <h1 class="font-bold no-margins">
                        您暂时没有考试
                    </h1>
                </div>
            </div>
            <div class="showPuestion">
                <h3>(一)单选题，每题2分，共6题，共12分。</h3>
                <div class="showSingle">
                    <c:forEach var="smd" items="${examinations.smdQuestions}" varStatus="num" begin="0">
                        <c:if test="${smd.questionType eq 1 }">
                            <p>第${num.index+1}题：${smd.question}</p>
                            <strong style="margin:0 10px 0 15px">A:</strong>${smd.options.optionA }<br>
                            <strong style="margin:0 10px 0 15px">B:</strong>${smd.options.optionB }<br>
                            <strong style="margin:0 10px 0 15px">C:</strong>${smd.options.optionC }<br>
                            <strong style="margin:0 10px 0 15px">D:</strong>${smd.options.optionD }<br>
                            <c:if test="${smd.options.optionE != null}">
                                <strong style="margin:0 10px 0 15px">E:</strong>${smd.options.optionE }<br>
                            </c:if>
                            <div class="input-group m-b" style="margin-top:10px">
								<span class="input-group-btn">
                                	<button type="button" class="btn btn-primary"><img alt="" src="images/common/answer.png"></button>
                                </span>
                                <input name="answer" type="text" class="form-control" style="width:50px">
                            </div>
                            <hr>
                        </c:if>
                    </c:forEach>
                </div>

                <h3>(二)多选题，每题4分，共1题，共4分。</h3>
                <div class="showSingle">
                    <c:forEach var="smd" items="${examinations.smdQuestions}" varStatus="num">
                        <c:if test="${smd.questionType eq 2 }">
                            <p>第${num.index}题：${smd.question}</p>
                            <strong style="margin:0 10px 0 15px">A:</strong>${smd.options.optionA }<br>
                            <strong style="margin:0 10px 0 15px">B:</strong>${smd.options.optionB }<br>
                            <strong style="margin:0 10px 0 15px">C:</strong>${smd.options.optionC }<br>
                            <strong style="margin:0 10px 0 15px">D:</strong>${smd.options.optionD }<br>
                            <c:if test="${smd.options.optionE != null}">
                                <strong style="margin:0 10px 0 15px">E:</strong>${smd.options.optionD }<br>
                            </c:if>
                            <div class="input-group m-b" style="margin-top:10px">
								<span class="input-group-btn">
                                	<button type="button" class="btn btn-primary"><img alt="" src="images/common/answer.png"></button>
                                </span>
                                <input name="answer" type="text" class="form-control" style="width:50px">
                            </div>
                            <hr>
                        </c:if>
                    </c:forEach>
                </div> <!-- 判断题部分 -->

                <h3>(三)判断题，每题1分，共1题，共1分。</h3>
                <div class="showSingle">
                    <c:forEach var="smd" items="${examinations.smdQuestions}" varStatus="num" begin="0">
                        <c:if test="${smd.questionType eq 3 }">
                            <p>第${judge.index+1}题：${smd.question}</p>
                            <div class="input-group m-b" style="margin-top:10px">
								<span class="input-group-btn">
                                	<button type="button" class="btn btn-primary"><img alt="" src="images/common/answer.png"></button>
                                </span>
                                <input name="answer" type="text" class="form-control" style="width:50px">
                            </div>
                            <hr>
                        </c:if>
                    </c:forEach>
                </div>
                <form action="admin/insertFspAnswer" method="post">
                    <input type="hidden" name="userid" value="${logUser.id}">
                    <input type="hidden" name="examid" value="${examinations.examNo}">
                    <h3>(四)填空题，每题1分，共1题，共1分。</h3>
                    <div class="showSingle">
                        <c:forEach var="fsp" items="${examinations.fspQuestions}" varStatus="num1" begin="0">
                            <c:if test="${fsp.questionType eq 4 }">
                                <p>第${num1.index+1}题：${fsp.question}</p>
                                <textarea style="width:100%;height:100px" name="${fsp.id }"></textarea>
                                <hr>
                            </c:if>
                        </c:forEach>
                    </div>
                    <h3>(五)简答题，每题1分，共1题，共1分。</h3>
                    <div class="showSingle">
                        <c:forEach var="fsp" items="${examinations.fspQuestions}" varStatus="num1" begin="0">
                            <c:if test="${fsp.questionType eq 5 }">
                                <p>第${num2.index+1}题：${fsp.question}</p>
                                <textarea style="width:100%;height:100px" name="${fsp.id }"></textarea>
                                <hr>
                            </c:if>
                        </c:forEach>
                    </div>
                    <h3>(六)编程题，每题1分，共1题，共1分。</h3>
                    <div class="showSingle">
                        <c:forEach var="fsp" items="${examinations.fspQuestions}" varStatus="num1" begin="0">
                            <c:if test="${fsp.questionType eq 6 }">
                                <p>第${num3.index+1}题：${fsp.question}</p>
                                <textarea style="width:100%;height:100px"  name="${fsp.id }" ></textarea>
                                <hr>
                            </c:if>
                        </c:forEach>
                    </div>
            </div>
            <input type="submit" value="提交试卷" class="btn btn-primary up">
            </form>
            <script type="text/javascript">
                $(function () {
                    $(".up").click(function () {
                        var cks=$("input[name='answer']");
                        var examID = $(".examID").val()
                        var asw=[];
                        var stuID = ${logUser.id}
                        for(var i=0;i<cks.length;i++){
                            if($(cks[i]).val()==''){
                                $(cks[i]).val('N')
                            }
                            var id=$(cks[i]).val();
                            asw.push(id);
                        }
                        var answer =asw.join(",");
                        $.ajax({
                            url:"admin/insertSmdAnswer",
                            type:"post" ,
                            data:{
                                "answer" : answer,
                                "userId" : stuID,
                                "examNo" : examID
                            },
                            success:function(result){
                                if ($.trim(result) == "true"){
                                    alert("提交成功")
                                }else{
                                    alert("不能重复提交，请期待下次考试")
                                }
                            },
                            error:function(){
                                alert("试卷提交失败")
                            }
                        });
                    })
                })
            </script>



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
    <script>
        $(document).ready(function(){

            $('.summernote').summernote();

        });
        var edit = function() {
            $('.click2edit').summernote({focus: true});
        };
        var save = function() {
            var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
            $('.click2edit').destroy();
        };
    </script>
</body>

</html>
