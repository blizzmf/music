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
    <hr>
    <div id="headerwrap">
        <h1>Рекомендации</h1>
        <br>
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
    <h1>Популярная музыка</h1>
    <br>
    <section>
        <c:if test="${!empty pop}">
            <table class="table">
                <tr>
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
                <c:forEach items="${pop}" var="music">
                    <tr>
                        <td>
                            <button id="btnPlay" type="button" class="btn btn-default"
                                    aria-label="Left Align">
                                <span class="fa fa-play-circle fa-3x" aria-hidden="true"></span>
                            </button>
                            <script>
                                btnPlay.onclick = function() {
                                    alert("1");
                                    $(document).ready(function(){
                                        $("#jquery_jplayer_1").jPlayer({
                                            ready: function () {
                                                $(this).jPlayer("setMedia", {
                                                    mp3: "http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
                                                    oga: "http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg"
                                                });
                                            },
                                            swfPath: "/js",
                                            supplied: "m4a, oga"
                                        });
                                    });
                                    alert("2");
                                };
                            </script>
                                <%--<input type="button" id="btnPlay" value="Кнопка" />--%>
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
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <th></th>
                        <th></th>
                    </sec:authorize>
                    <th></th>
                </tr>
                <c:forEach items="${musics}" var="music">
                    <tr>
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

</ui:html>
