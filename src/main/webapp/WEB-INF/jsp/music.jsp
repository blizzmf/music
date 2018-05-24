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
        <div class="container">
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
                <c:forEach items="${pop}" var="music">
                    <div class="track">
                        <div class="track_start">
                            <c:if test="${!empty music.albums}">
                            <c:forEach items="${music.albums}" var="alb">
                            <div class="track__cover"><img src="img/album/${alb.name}.jpg" width="42" height="42"></div>

                            <div id="bub${music.id}" class="track_bub"></div>
                            <div class="track_play_hover">
                                <button class="btn_play" id="btn${music.id}" type="button">
                                    <span class="fa fa-play" aria-hidden="true"></span>
                                </button>
                                <button class="btn_pause" id="btn_pause${music.id}" type="button">
                                    <span class="fa fa-pause" aria-hidden="true"></span>
                                </button>
                                <script>
                                    btn${music.id}.onclick = function () {
                                        $(document).ready(function () {
                                            $("#pic_play").html('<img src="img/album/${alb.name}.jpg" width="42" height="42"></a>');
                                           // $("#bub${music.id}").css('display', 'block');
                                            $("#mus_name").html('<a href="albumInfo.html?id=${alb.id}">${music.name}</a>');
                                            $("#band_name").text('${alb.name}');
                                            //$("#jquery_jplayer_1").jPlayer( "clearMedia" );
                                            var e = document.getElementById("mus_name");
                                            var txt = e.innerText;
                                            //if($("#current_time").text() == '' && txt == "${music.name}"){
                                                $("#jquery_jplayer_1").jPlayer("setMedia", {
                                                    mp3: "/mus/${music.name}.mp3"
                                                });
                                          //  }
                                            $("#jquery_jplayer_1").jPlayer("play", $("#current_time").text());
                                            $("#btn${music.id}").css("display", "none");
                                            $("#btn_pause${music.id}").css("display", "inline-block");
                                            /* while(1){
                                                $("#bub${music.id}").css('width', '1px');
                                                $("#bub${music.id}").css('height', '1px');
                                            }*/
                                        });
                                    };
                                    btn_pause${music.id}.onclick = function () {
                                        $(document).ready(function () {
                                            $("#btn_pause${music.id}").css("display", "none");
                                            $("#btn${music.id}").css("display", "inline-block");
                                            $("#jquery_jplayer_1").jPlayer("pause", $("#current_time").text());
                                        });
                                    };
                                </script>
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
                                        <div class="track_meta">${alb.band.name}</div>
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
        <h1 class="header1">Последние добавленные треки</h1>
        <br>
        <section>
            <c:if test="${!empty musics}">
                <c:forEach items="${musics}" var="music">
                    <div class="track">
                        <div class="track_start">
                            <c:if test="${!empty music.albums}">
                                <c:forEach items="${music.albums}" var="alb">
                                    <div class="track__cover"><img src="img/album/${alb.name}.jpg" width="42"
                                                                   height="42"></div>
                            <div class="track_bub"></div>
                            <div class="track_play_hover">
                                <button class="btn_play" id="btnn${music.id}" type="button">
                                    <span class="fa fa-play" aria-hidden="true"></span>
                                </button>
                                <script>
                                    btnn${music.id}.onclick = function () {
                                        $(document).ready(function () {
                                            $("#pic_play").html('<img src="img/album/${alb.name}.jpg" width="42" height="42"></a>');

                                            $("#mus_name").html('<a href="albumInfo.html?id=${alb.id}">${music.name}</a>');
                                            $("#band_name").text('${alb.name}');
                                            //$("#jquery_jplayer_1").jPlayer( "clearMedia" );
                                            $("#jquery_jplayer_1").jPlayer("setMedia", {
                                                mp3: "/mus/${music.name}.mp3"
                                            });
                                            $("#jquery_jplayer_1").jPlayer("play", 0);
                                        });
                                    };
                                </script>
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
                                        <div class="track_meta">${alb.band.name}</div>
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
        <ui:footer></ui:footer>
    </div>
</ui:html>
