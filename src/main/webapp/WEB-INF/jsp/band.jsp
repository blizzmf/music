<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="band" active="band">
 <div class="container">
        <c:if test="${true}">
            <c:forEach items="${bands}" var="b">
                    <div class="col-lg-3">
                       <a href="bandInfo.html?id=${b.id}"><img src="img/${b.name}.jpg" alt="" class="img-circle" width="200" height="200"></a>
                        <div class="text">
                            <h3 style="display:inline">
                            <a href="bandInfo.html?id=${b.id}"><p class="albumName" style="text-indent: 0px">${b.name}</p></a></h3>
                        </div>
	                        <div class="albInfo">
	                        <c:forEach items="${b.genres}" var="b" varStatus="loop">
	                            <a href="genreInfo.html?id=${b.id}"><p class="albInfo">${b.name}</p></a>
	                            <c:if test="${!loop.last}">,</c:if>
	                            <c:if test="${loop.last}"></c:if>
	                        </c:forEach>
	                        </div>
                    </div>
            </c:forEach>
        </c:if>
    </div>
</ui:html>
