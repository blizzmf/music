<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui" %>
<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>


<!DOCTYPE html>
<ui:html title="Music" active="music">
    <div class="page_root">
        <div class="container" data-b="2">
            <h1 class="header1"><b>Рекомендации</b></h1>
            <c:forEach items="${recomend}" var="rec">
                <div class="col-lg-3">
                    <a href="bandInfo.html?id=${rec.id}"><img
                            src="img/${rec.name}.jpg" alt="" class="img-circle" width="200"
                            height="200"></a>
                    <div class="text">
                        <h3 style="display: inline">
                            <a href="bandInfo.html?id=${rec.id}"><p class="albumName"
                                                                    style="text-indent: 0px">${rec.name}</p></a>
                        </h3>
                    </div>
                    <div class="albInfo">
                        <c:forEach items="${rec.genres}" var="g" varStatus="loop">
                            <a href="genreInfo.html?id=${g.id}"><p class="albInfo">${g.name}</p></a>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
        <h1 class="header1">Популярная музыка</h1>
        <br>
        <section>
            <c:if test="${!empty pop}">
 <%--           <table class="table">
                <tr>
                    <th></th>
                    <th>Название</th>
                    <th>Длительность</th>
                    <th>Формат аудио</th>
                    <th>Стоимость</th>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <th></th>
                        <th></th>
                    </sec:authorize>
                    <th></th>
                </tr>--%>
                <c:forEach items="${pop}" var="music">
                    <div class="track">
                        <div class="track_start">
                            <c:if test="${!empty music.albums}">
                                <c:forEach items="${music.albums}" var="alb">
                                    <div class="track__cover"><img src="img/album/${alb.name}.jpg" width="42" height="42"></div>
                                </c:forEach>
                            </c:if>
                            <div class="track_bub"></div>
                            <div class="track_play_hover">
                                <button class="btn_play" id="btn${music.id}" type="button">
                                    <span class="fa fa-play" aria-hidden="true"></span>
                                </button>
                                <script>
                                    btn${music.id}.onclick = function () {
                                        $(document).ready(function () {
                                            //$("#jquery_jplayer_1").jPlayer( "clearMedia" );
                                            $("#jquery_jplayer_1").jPlayer("setMedia", {
                                                mp3: "/mus/${music.name}.mp3"
                                            });
                                            $("#jquery_jplayer_1").jPlayer("play", 0);
                                        });
                                    };
                                </script>
                            </div>

                        </div>
                        <div class="track_info">
                            <div class="track_info_secondery">
                                <c:if test="${!empty music.albums}">
                                    <c:forEach items="${music.albums}" var="alb">
                                    <div class="track_name" title="${music.name}">
                                        <a href="albumInfo.html?id=${alb.id}">${music.name}</a>
                                    </div>
                                        <div class="track_meta">${alb.band.name}</div>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN')">--%>
                                <%--<a href="editMusic.html?id=${music.id}" title="Редактировать">--%>
                                    <%--<button type="button" class="btn btn-default"--%>
                                            <%--aria-label="Left Align">--%>
                                        <%--<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>--%>
                                    <%--</button>--%>
                                <%--</a>--%>
                                <%--<a href="deleteMusic?id=${music.id}&username=${pageContext.request.userPrincipal.name}"--%>
                                        <%--title="Удалить">--%>
                                    <%--<button type="button" class="btn btn-default"--%>
                                            <%--aria-label="Left Align">--%>
                                <%--<span class="glyphicon glyphicon-remove-sign"--%>
                                      <%--aria-hidden="true"></span>--%>
                                    <%--</button>--%>
                                <%--</a>--%>
                            <%--</sec:authorize>--%>
                            <%--<a href="MusicToCart.html?id=${music.id}&username=${pageContext.request.userPrincipal.name}"--%>
                                    <%--title="Добавить в корзину">--%>
                                <%--<button type="button" class="btn btn-default"--%>
                                        <%--aria-label="Left Align">--%>
                                <%--<span class="glyphicon glyphicon-shopping-cart"--%>
                                      <%--aria-hidden="true"></span>--%>
                                <%--</button>--%>
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
        <h1 class="header1">Последние добавленные треки</h1>
        <br>
        <section>
            <c:if test="${!empty musics}">
                <table class="table">
                    <tr>
                        <th></th>
                        <th>Название</th>
                        <th>Длительность</th>
                        <th>Формат аудио</th>
                        <th>Стоимость</th>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                            <th></th>
                            <th></th>
                        </sec:authorize>
                        <th></th>
                    </tr>
                    <c:forEach items="${musics}" var="music">
                        <tr>
                            <td>
                                <button id="btn${music.id}" type="button" class="btn btn-default"
                                        aria-label="Left Align">
                                    <span class="fa fa-play-circle fa-2x" aria-hidden="true"></span>
                                </button>
                                <script>
                                    btn${music.id}.onclick = function () {
                                        $(document).ready(function () {
                                            //$("#jquery_jplayer_1").jPlayer( "clearMedia" );
                                            $("#jquery_jplayer_1").jPlayer("setMedia", {
                                                mp3: "/mus/${music.name}.mp3"
                                            });
                                            $("#jquery_jplayer_1").jPlayer("play", 0);
                                        });
                                    };
                                </script>
                            </td>
                            <td>${music.name}</td>
                            <td>${music.duration}</td>
                            <td>${music.musFormat}</td>
                            <td>${music.cost}$</td>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <td><a href="editMusic.html?id=${music.id}" title="Редактировать">
                                    <button type="button" class="btn btn-default"
                                            aria-label="Left Align">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                    </button>
                                </a></td>
                                <td><a
                                        href="deleteMusic?id=${music.id}&username=${pageContext.request.userPrincipal.name}"
                                        title="Удалить">
                                    <button type="button" class="btn btn-default"
                                            aria-label="Left Align">
									<span class="glyphicon glyphicon-remove-sign"
                                          aria-hidden="true"></span>
                                    </button>
                                </a></td>
                            </sec:authorize>
                            <td><a
                                    href="MusicToCart.html?id=${music.id}&username=${pageContext.request.userPrincipal.name}"
                                    title="Добавить в корзину">
                                <button type="button" class="btn btn-default"
                                        aria-label="Left Align">
								<span class="glyphicon glyphicon-shopping-cart"
                                      aria-hidden="true"></span>
                                </button>
                            </a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </section>
        <ui:footer></ui:footer>
    </div>
</ui:html>
