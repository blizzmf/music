<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="bandInfo" active="band">
<div class="container">
	<c:if test="${true}">
		<div class="row">
			<div class="col-lg-3">
				<img class="img-circle" width="280" height="250"
					src="img/${band.name}.jpg">
			</div>
			<div class="col-lg-5">
				<div class="text">
					<h4 class="albInfo" style="display: inline">Исполнитель</h4>
					<br>
					<h1 style="display: inline">
						<b>${band.name}</b>
					</h1>
				</div>
				<div class="text">
					<div class="albInfo">
						<c:forEach items="${band.genres}" var="b" varStatus="loop">
							<a href="genreInfo.html?id=${b.id}"><p class="albInfo">${b.name}</p></a>
							<c:if test="${!loop.last}">,</c:if>
							<c:if test="${loop.last}"></c:if>
						</c:forEach>
					</div>
				</div>
				<div class="text">${band.descript}</div>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<div class="text">
					<a href="editBand.html?id=${band.id}" title="Рдактировать группу">
						<button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						</button>
					</a> <a href="<c:url value='/band/remove/${band.id}'/>" title="Удалить группу">
						<button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
						</button></a>
				</div>
				</sec:authorize>
			</div>
		</div>
		<hr>
		<div class="row">
			<h1>Альбомы</h1>
			<c:forEach items="${albums}" var="a" varStatus="loop">
				<div class="col-lg-3">
					<a href="albumInfo.html?id=${a.id}"> <img
						src="img/album/${a.name}.jpg" alt="" class="img-rounded"
						width="200" height="200">
					</a> <a href="albumInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<h1>Похожие исполнители</h1>
			<c:forEach items="${similar}" var="a" varStatus="loop">
				<c:if test="${a.id != band.id}">
					<div class="col-lg-3">
						<a href="bandInfo.html?id=${a.id}"> <img
							src="img/${a.name}.jpg" alt="" class="img-rounded" width="200"
							height="200">
						</a> <a href="bandInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
</div>
</ui:html>
