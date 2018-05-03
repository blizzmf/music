<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<c:url var="addAction" value="/doc/${pageContext.request.userPrincipal.name}" />
<ui:html title="bandInfo" active="">
<div class="container">
	<c:if test="${true}">
		<div class="row">
			<div class="col-lg-3">
				<img class="img-circle" width="150" height="150"
					src="img/user/${pageContext.request.userPrincipal.name}.jpg">
			</div>
			<div class="col-lg-5">
				<div class="text">
					<h4 class="albInfo" style="display: inline">Моя корзина</h4>
					<br>
					<h1 style="display: inline">
						<b>${pageContext.request.userPrincipal.name}</b>
					</h1>
				</div>
				<form:form action="${addAction}">
					<p>
						<label for="image">Сформировать отчетность</label>
					</p>
					<p>
						<input class="btn btn-primary" type="submit" />
					</p>
				</form:form>
			</div>
		</div>
		<hr>
		<div class="row">
			<h1>Альбомы</h1>
			<br>
			<c:forEach items="${albums}" var="a" varStatus="loop">
				<div class="col-lg-3">
					<a href="albumInfo.html?id=${a.id}"><img
						src="img/album/${a.name}.jpg" alt="" class="img-rounded"
						width="200" height="200">
					</a> <a href="removeAlbumFromCart?id=${a.id}&username=${pageContext.request.userPrincipal.name}" title="Удалить из корзины" aria-label="Left Align">
                            <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
                    </a>
					<a href="albumInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<h1>Треки</h1>
			<br>
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
                    <td>${music.cost} $</td>
                    <td>
                     <a href="removeMusicFromCart?id=${music.id}&username=${pageContext.request.userPrincipal.name}" title="Удалить из корзины">
                         <button type="button" class="btn btn-default"
                            aria-label="Left Align">
                            <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
                        </button>
                    </a>
                </td>
                </tr>
            </c:forEach>
        </table>
		</div>
	</c:if>
</div>
</ui:html>
