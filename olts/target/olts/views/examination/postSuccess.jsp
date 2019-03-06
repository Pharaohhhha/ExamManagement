<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/10/10
  Time: 14:52
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
    <title>提交成功</title>

    <script type="text/javascript">
        $(function () {
            $('#alertModal').modal({
                show: true,
                backdrop:'static'
            });
        });


    </script>


</head>
<body>









<!-- 模态框 -->
<div class="modal fade" id="alertModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <h6>提交成功</h6>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

</form>


</body>
</html>
