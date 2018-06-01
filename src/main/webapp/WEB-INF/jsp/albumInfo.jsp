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
					<div class="content_info">
					<a href="editAlbum.html?id=${album.id}" title="Редактировать альбом">
							<span class="fa fa-pencil" aria-hidden="true"></span>
					</a>
					</div>
					<div class="content_info">
						<a href="<c:url value='/album/remove/${album.id}'/>" title="Удалить альбом">
							<span class="fa fa-trash" aria-hidden="true"></span>
						</a></sec:authorize>
					</div>
					<div class="content_info">
						<a href="AlbumToCart.html?id=${album.id}&username=${pageContext.request.userPrincipal.name}" title="Добавить в корзину">
								<span class="fa fa-heart"
									aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<section>
			<c:if test="${!empty album.musics}">
				<c:forEach items="${album.musics}" var="music">
					<div class="track">
						<div class="track_start">
							<c:if test="${!empty music.albums}">
								<c:forEach items="${music.albums}" var="alb">
									<div class="track__cover"><img src="img/album/${alb.name}.jpg" width="42"
																   height="42"></div>
									<%--<div class="track_bub"></div>--%>
									<div class="track_play_hover">
										<%--<button class="btn_play" id="btnn${music.id}" type="button">--%>
											<%--<span class="fa fa-play" aria-hidden="true"></span>--%>
										<%--</button>--%>
									</div>
								</c:forEach>
							</c:if>
						</div>
						<div class="track_info">
							<div class="track_info_secondery">
								<c:if test="${!empty music.albums}">
									<c:forEach items="${music.albums}" var="alb">
										<div class="track_name" title="${music.name}">
											<a href="albumInfo.html?id=${alb.id}">${music.name}</a>
										</div>
										<div class="track_meta"><a href="bandInfo.html?id=${alb.band.id}">${alb.band.name}</a></div>
									</c:forEach>
								</c:if>
							</div>
							<div class="track_end">
								<div class="track_end_hover">
									<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
										<a href="editMusic.html?id=${music.id}" title="Редактировать">
											<span class="fa fa-pencil" aria-hidden="true"></span>
										</a>
										<a href="deleteMusic?id=${music.id}&username=${pageContext.request.userPrincipal.name}"
										   title="Удалить">
											<span class="fa fa-trash" aria-hidden="true"></span>
										</a>
									</sec:authorize>
									<a href="MusicToCart.html?id=${music.id}&username=${pageContext.request.userPrincipal.name}"
									   title="Добавить в корзину">
										<span class="fa fa-heart" aria-hidden="true"></span>
									</a>
								</div>
								<div class="track_dest">$${music.cost}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</section>
        <br>
        <br>
        <section>
            <c:if test="${!empty similarAlbum}">
                <h4>Альбомы этого жанра</h4>
                <c:forEach items="${similarAlbum}" var="a" varStatus="loop">
                    <c:if test="${album.name != a.name}">
                    <div class="album">
                        <div class="album_cover">
                            <a href="albumInfo.html?id=${a.id}"><img src="img/album/${a.name}.jpg" alt=""
                                                                     class="img-rounded" width="200" height="200">
                            </a>
                        </div>
                        <div class="album_hover">
                            <div class="album_hover_action">
                                <a href="AlbumToCart.html?id=${album.id}&username=${pageContext.request.userPrincipal.name}"
                                   title="Добавить в Моей музыки" aria-label="Left Align" >
                                    <span class="fa fa-heart fa-2x" aria-hidden="true"></span>
                                </a>
                            </div>
                            <div class="album_hover_overlap"></div>
                        </div>
                        <div class="album_title">
                            <a href="albumInfo.html?id=${a.id}">${a.name}</a>
                        </div>
                        <div class="album_band"><a href="bandInfo.html?id=${a.band.id}">${a.band.name}</a></div>
                        <div class="album_year">${a.releaseDate}</div>
                    </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </section>
		<br>
		<br>
		<section>
            <c:if test="${!empty band.albums}">
                <c:if test="${album.name != band.albums.iterator().next().name}">
                    <h4>Другие альбомы исполнителя</h4>
                </c:if>
				<c:forEach items="${band.albums}" var="a" varStatus="loop">
					<c:if test="${album.name != a.name}">
					<div class="album">
						<div class="album_cover">
							<a href="albumInfo.html?id=${a.id}"><img src="img/album/${a.name}.jpg" alt=""
																	 class="img-rounded" width="200" height="200">
							</a>
						</div>
						<div class="album_hover">
							<div class="album_hover_action">
								<a href="AlbumToCart.html?id=${album.id}&username=${pageContext.request.userPrincipal.name}"
								   title="Добавить в Моей музыки" aria-label="Left Align" >
									<span class="fa fa-heart fa-2x" aria-hidden="true"></span>
								</a>
							</div>
							<div class="album_hover_overlap"></div>
						</div>
						<div class="album_title">
							<a href="albumInfo.html?id=${a.id}">${a.name}</a>
						</div>
						<div class="album_band"><a href="bandInfo.html?id=${a.band.id}">${a.band.name}</a></div>
						<div class="album_year">${a.releaseDate}</div>
					</div>
					</c:if>
				</c:forEach>
			</c:if>
		</section>
		<%--<div class="row">--%>
			<%--<div class="col-lg-5">--%>
				<%--<h1>Треки</h1>--%>
				<%--<c:if test="${!empty album.musics}">--%>
					<%--<table class="table">--%>
						<%--<c:forEach items="${album.musics}" var="a">--%>
							<%--<tr>--%>
								<%--<td>${a.name}</td>--%>
								<%--<c:forEach items="${a.artists}" var="art">--%>
								<%--<td>${art.surName}${art.name}${art.secName}</td>--%>
								<%--</c:forEach>--%>
								<%--<td>${a.cost} $</td>--%>
								<%--<td><a href="MusicToCart.html?id=${a.id}&username=${pageContext.request.userPrincipal.name}" title="Добавить в корзину">--%>
										<%--<button type="button" class="btn btn-default"--%>
											<%--aria-label="Left Align">--%>
											<%--<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>--%>
										<%--</button>--%>
								<%--</a></td>--%>
							<%--</tr>--%>
						<%--</c:forEach>--%>
					<%--</table>--%>
				<%--</c:if>--%>
			<%--</div>--%>
		<%--</div>--%>
	</c:if>
</div>
</ui:html>
