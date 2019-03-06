<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/14
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<div>
    <a href="../index.jsp" class="btn btn-info">返回</a>
</div>
<div>
    <table class="table">
        <thead>
            <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>密码</td>
                <td>电话</td>
                <td>邮箱</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${page}">
            <tr>
                <td>${u.userId}</td>
                <td>${u.userName}</td>
                <td>${u.password}</td>
                <td>${u.phone}</td>
                <td>${u.email}</td>
                <td>${u.roleName}</td>
            </tr>
        </c:forEach>
        </tbody>
            <tfoot>
            <tr>
                <td colspan="6" class="text-right">
                    总${page.getTotal()}条 &nbsp;&nbsp; 第${page.getPageNum()}页/共${page.getPages()}页&nbsp;&nbsp;每页显示：2
                    &nbsp;&nbsp; &nbsp;&nbsp;
                    <c:if test="${page.getPageNum() gt 1}">
                        <a href="search?pageNum=1">第一页</a> &nbsp;
                    </c:if>
                    <c:if test="${page.getPageNum() gt 1}">
                        <a href="search?pageNum=${page.getPageNum()-1}">上一页</a>&nbsp;
                    </c:if>
                    <c:if test="${page.getPageNum() lt page.getPages()}">
                        <a href="search?pageNum=${page.getPageNum()+1}">下一页</a>&nbsp;
                    </c:if>
                    <c:if test="${page.getPageNum() lt page.getPages()}">
                        <a href="search?pageNum=${page.getPages()}">末页</a>&nbsp;
                    </c:if>
                </td>
            </tr>
            </tfoot>
    </table>
</div>
</body>
</html>
