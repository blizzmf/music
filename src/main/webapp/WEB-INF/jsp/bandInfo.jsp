<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui" %>
<!DOCTYPE html>
<ui:html title="${band.name}" active="band">
    <div class="container">
    <div class="row">
        <div class="col-lg-3">
            <img class="img-circle" width="200" height="200"
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
                    <div class="content_info">
                        <a href="editBand.html?id=${band.id}" title="Рдактировать группу">
                            <span class="fa fa-pencil" aria-hidden="true"></span>
                        </a>
                    </div>
                    <div class="content_info">
                        <a href="<c:url value='/band/remove/${band.id}'/>" title="Удалить группу">
                            <span class="fa fa-trash" aria-hidden="true"></span>
                        </a>
                    </div>
                    <div class="content_info">
                        <a href="BandToCart.html?id=${band.id}&username=${pageContext.request.userPrincipal.name}"
                           title="Добавить в корзину">
                            <span class="fa fa-heart" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
            </sec:authorize>
        </div>
    </div>
    <div class="tabs">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#bandTab1" data-toggle="tab">Главное</a></li>
            <li><a href="#bandTab2" data-toggle="tab">Треки</a></li>
            <li><a href="#bandTab3" data-toggle="tab">Альбомы</a></li>
            <li><a href="#bandTab4" data-toggle="tab">Похожие</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="bandTab1">
            </div>
            <div class="tab-pane fade" id="bandTab2">
                <c:if test="${!empty band}">
                    <c:forEach items="${band.albums}" var="alb">
                        <c:forEach items="${alb.musics}" var="music">
                            <div class="track">
                                <div class="track_start">
                                    <c:if test="${!empty music.albums}">
                                        <c:forEach items="${music.albums}" var="alb">
                                        <div class="track__cover"><img src="img/album/${alb.name}.jpg" width="42"
                                                                       height="42">
                                        </div>

                                        <%--<div id="bub${music.id}" class="track_bub"></div>--%>
                                        <div class="track_play_hover">
                                                <%--<button class="btn_play" id="btn${music.id}" type="button">--%>
                                                <%--<span class="fa fa-play" aria-hidden="true"></span>--%>
                                                <%--</button>--%>
                                                <%--<button class="btn_pause" id="btn_pause${music.id}" type="button">--%>
                                                <%--<span class="fa fa-pause" aria-hidden="true"></span>--%>
                                                <%--</button>--%>
                                        </c:forEach>
                                    </c:if>
                                    </div>
                                </div>
                                <div class="track_info">
                                    <div class="track_info_secondery">
                                        <c:if test="${!empty music.albums}">
                                            <c:forEach items="${music.albums}" var="alb">
                                                <div class="track_name" title="${music.name}">
                                                    <a href="albumInfo.html?id=${alb.id}">${music.name}</a>
                                                </div>
                                                <div class="track_meta"><a
                                                        href="bandInfo.html?id=${alb.band.id}">${alb.band.name}</a>
                                                </div>
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
                    </c:forEach>
                </c:if>
            </div>
            <div class="tab-pane fade" id="bandTab3">
                <c:if test="${!empty albums}">
                    <c:forEach items="${albums}" var="a" varStatus="loop">
                        <div class="album">
                            <div class="album_cover">
                                <a href="albumInfo.html?id=${a.id}"><img src="img/album/${a.name}.jpg" alt=""
                                                                         class="img-rounded" width="200" height="200">
                                </a>
                            </div>
                            <div class="album_hover">
                                <div class="album_hover_action">
                                    <a href="AlbumToCart.html?id=${album.id}&username=${pageContext.request.userPrincipal.name}"
                                       title="Добавить из Моей музыки" aria-label="Left Align">
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
                    </c:forEach>
                </c:if>
            </div>
            <div class="tab-pane fade" id="bandTab4">
                <c:if test="${!empty similar}">
                    <c:forEach items="${similar}" var="b" varStatus="loop">
                        <div class="album">
                            <div class="album_cover">
                                <img src="img/${b.name}.jpg" alt=""
                                     class="img-circle" width="200" height="200">
                            </div>
                            <div class="album_hover">
                                <div class="album_hover_action">
                                    <a href="BandToCart.html?id=${band.id}&username=${pageContext.request.userPrincipal.name}"
                                       title="Удалить из Моей музыки" aria-label="Left Align">
                                        <span class="fa fa-heart fa-2x" aria-hidden="true"></span>
                                    </a>
                                </div>
                                <div class="band_overlap"></div>
                            </div>
                            <div class="album_title">
                                <a href="bandInfo.html?id=${b.id}">${b.name}</a>
                            </div>
                            <c:forEach items="${b.genres}" var="g" varStatus="loop">
                                <div class="album_band"><a href="genreInfo.html?id=${g.id}">${g.name}</a></div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
            <%--<hr>--%>
            <%--<div class="row">--%>
            <%--<h1>Альбомы</h1>--%>
            <%--<c:forEach items="${albums}" var="a" varStatus="loop">--%>
            <%--<div class="col-lg-3">--%>
            <%--<a href="albumInfo.html?id=${a.id}"> <img--%>
            <%--src="img/album/${a.name}.jpg" alt="" class="img-rounded"--%>
            <%--width="200" height="200">--%>
            <%--</a> <a href="albumInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>--%>
            <%--</div>--%>
            <%--</c:forEach>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
            <%--<h1>Похожие исполнители</h1>--%>
            <%--<c:forEach items="${similar}" var="a" varStatus="loop">--%>
            <%--<c:if test="${a.id != band.id}">--%>
            <%--<div class="col-lg-3">--%>
            <%--<a href="bandInfo.html?id=${a.id}"> <img--%>
            <%--src="img/${a.name}.jpg" alt="" class="img-rounded" width="200"--%>
            <%--height="200">--%>
            <%--</a> <a href="bandInfo.html?id=${a.id}"><p class="albumName">${a.name}</p></a>--%>
            <%--</div>--%>
            <%--</c:if>--%>
            <%--</c:forEach>--%>
            <%--</div>--%>
    </div>
</ui:html>
