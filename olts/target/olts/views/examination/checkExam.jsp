<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/10/10
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="vendor/js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="vendor/js/bootstrap.min.js" type="text/javascript"></script>

    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <title>阅卷</title>


    <script type="text/javascript">
        $(function () {
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
                    $('#title_no').empty();
                    $('#title_no').append($('#exam_no').val());

                    //加载填空题
                    $('#fill_in_gaps').empty();
                    $('#fill_in_gaps').append('<hr>');
                    $('#fill_in_gaps').append('<h4>填空题</h4>');
                    $.get("examination/loadFsq_question",{"questionType":4},function (data) {
                        $.each(data, function (i, item) {
                            $('#fill_in_gaps').append('<li>'+item.question+'<br>'+
                                item.stdAnswer + '<span class="badge badge-primary">以上为标准答案</span>' +
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
                                item.stdAnswer + '<span class="badge badge-primary">以上为标准答案</span>' +
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
                                item.stdAnswer + '<span class="badge badge-primary">以上为标准答案</span>' +
                                '</li>');
                        });
                    },'json');


                },'json');
            })
        })
    </script>




</head>
<body>


<div class="container" style="background-color: oldlace">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        选择考试编号
    </button>
    <hr>
    <h3 id="title_no" style="text-align:center"></h3>
    <ol id="fill_in_gaps"></ol>
    <ol id="simple_answer"></ol>
    <ol id="program"></ol>


</div>

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
</body>
</html>
