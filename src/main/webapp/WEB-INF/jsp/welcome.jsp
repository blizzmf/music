<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<ui:html title="Welcom" active="">
<h1>Популярные группы</h1>
<div>
	<c:forEach items="${similar}" var="a" varStatus="loop">
			<div class="col-lg-3">
				<a href="bandInfo.html?id=${a.id}"> <img src="img/${a.name}.jpg"
					alt="" class="img-rounded" width="200" height="200">
				</a> <a href="bandInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>
			</div>
	</c:forEach>
</div>
<h1>Последние добавленные треки</h1>
<br>
<section>
	<c:if test="${!empty musics}">
		<table class="table">
			<tr>
				<th>Название</th>
				<th>Длительность</th>
				<th>Формат аудио</th>
				<th>Стоимость</th>
				<th></th>
			</tr>
			<c:forEach items="${musics}" var="music">
				<tr>
					<td>${music.name}</td>
					<td>${music.duration}</td>
					<td>${music.musFormat}</td>
					<td>${music.cost}$</td>
			</c:forEach>
		</table>
	</c:if>
</section>
</ui:html>