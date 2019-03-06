<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <nav>
        <ul class="pagination pagination-sm">
            <li>
                <a href="courses/selectBySelective?pageNo=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:if test="${requestScope[param.page].getPageNum() gt 3}">
                <li><a href="javascript:void(0)" style="cursor: text;">...</a></li>
            </c:if>
            <c:if test="${requestScope[param.page].getPageNum()-2 ge 1}">
                <li><a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPageNum()-2}">${requestScope[param.page].getPageNum()-2}</a></li>
            </c:if>

            <c:if test="${requestScope[param.page].getPageNum()-1 ge 1 }">
                <li><a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPageNum()-1}">${requestScope[param.page].getPageNum()-1}</a></li>
            </c:if>
            <li class="active"><a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPageNum()}">${requestScope[param.page].getPageNum()}</a></li>
            <c:if test="${requestScope[param.page].getPageNum()+1 le requestScope[param.page].getPages()}">
                <li><a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPageNum()+1}">${requestScope[param.page].getPageNum()+1}</a></li>
            </c:if>
            <c:if test="${requestScope[param.page].getPageNum()+2 le requestScope[param.page].getPages()}">
                <li><a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPageNum()+2}">${requestScope[param.page].getPageNum()+2}</a></li>
            </c:if>
            <c:if test="${requestScope[param.page].getPageNum()+2 lt requestScope[param.page].getPages()}">
                <li><a href="javascript:void(0)" style="cursor: text;">...</a></li>
            </c:if>
            <li>
                <a href="courses/selectBySelective?pageNum=${requestScope[param.page].getPages()}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
