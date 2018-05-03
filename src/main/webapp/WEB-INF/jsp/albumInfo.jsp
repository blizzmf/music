<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="albumInfo" active="band">
<div class="container">
	<c:if test="${true}">

		<div class="row">
			<div class="col-lg-3">
				<img class="img-rounded" width="200" height="200"
					src="img/album/${album.name}.jpg">
			</div>
			<div class="col-lg-4">
				<div class="text">
					<h6 class="albInfo" style="display: inline">АЛЬБОМ</h6>
					<br>
					<h1 style="display: inline">
						<b>${album.name}</b>
					</h1>
				</div>
				<div class="text">
					<div class="albInfo">
						Исполнитель: <a href="bandInfo.html?id=${band.id}"><b>${band.name}</b></a>
					</div>
				</div>
				<div class="text">
					<div class="albInfo">${album.releaseDate}
					<span class="separator">&nbsp;</span>
					<c:forEach items="${band.genres}" var="b" varStatus="loop">
						<a href="genreInfo.html?id=${b.id}">${b.name}</a>
						<c:if test="${!loop.last}">,</c:if>
						<c:if test="${loop.last}"></c:if>
					</c:forEach>
					</div>
				</div>
				<div class="text">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<a href="editAlbum.html?id=${album.id}" title="Редактировать альбом">
						<button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						</button>
					</a> <a href="<c:url value='/album/remove/${album.id}'/>" title="Удалить альбом">
						<button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
						</button>
					</a></sec:authorize> 
					<a href="AlbumToCart.html?id=${album.id}&username=${pageContext.request.userPrincipal.name}" title="Добавить в корзину">
						<button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-shopping-cart"
								aria-hidden="true"></span>
						</button>
					</a>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-lg-5">
				<h1>Треки</h1>
				<c:if test="${!empty album.musics}">
					<table class="table">
						<c:forEach items="${album.musics}" var="a">
							<tr>
								<td>${a.name}</td>
								<c:forEach items="${a.artists}" var="art">
								<td>${art.surName}${art.name}${art.secName}</td>
								</c:forEach>
								<td>${a.cost} $</td>
								<td><a href="MusicToCart.html?id=${a.id}&username=${pageContext.request.userPrincipal.name}" title="Добавить в корзину">
										<button type="button" class="btn btn-default"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
										</button>
								</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</c:if>
</div>
</ui:html>
