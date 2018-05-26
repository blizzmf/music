<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui" %>
<!DOCTYPE html>
<c:url var="addAction" value="/doc/${pageContext.request.userPrincipal.name}"/>
<ui:html title="${pageContext.request.userPrincipal.name} на BlzMusic" active="">
    <div class="page_root">
        <div class="container">
            <c:if test="${true}">
                <div class="row">
                    <div class="col-lg-3">
                        <img class="img-circle" width="150" height="150"
                             src="img/user/${pageContext.request.userPrincipal.name}.jpg">
                    </div>
                    <div class="col-lg-5">
                        <div class="text">
                            <h4 class="albInfo" style="display: inline">Моя музыка</h4>
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
                                <input class="btn btn-primary" type="submit"/>
                            </p>
                        </form:form>
                    </div>
                </div>
                <div class="tabs">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">Треки</a></li>
                        <li><a href="#tab2" data-toggle="tab">Альбомы</a></li>
                        <li><a href="#tab3" data-toggle="tab">Исполнители</a></li>
                        <li><a href="#tab4" data-toggle="tab">Концерты</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1">
                            <c:if test="${!empty musics}">
                                <c:forEach items="${musics}" var="music">
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
                                                        <div class="track_meta"><a href="bandInfo.html?id=${alb.band.id}">${alb.band.name}</a></div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                            <div class="track_end">
                                                <div class="track_end_hover">
                                                        <a href="removeMusicFromCart?id=${music.id}&username=${pageContext.request.userPrincipal.name}"
                                                           title="Удалить">
                                                            <span class="fa fa-trash" aria-hidden="true"></span>
                                                        </a>
                                                </div>
                                                <div class="track_dest">$${music.cost}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="tab-pane fade" id="tab2">
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
                                                <a href="removeAlbumFromCart?id=${a.id}&username=${pageContext.request.userPrincipal.name}"
                                                   title="Удалить из Моей музыки" aria-label="Left Align" >
                                                    <span class="fa fa-trash fa-2x" aria-hidden="true"></span>
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
                        <div class="tab-pane fade" id="tab3">
                            <c:if test="${!empty bands}">
                                <c:forEach items="${bands}" var="b" varStatus="loop">
                                    <div class="album">
                                        <div class="album_cover">
                                            <img src="img/${b.name}.jpg" alt=""
                                                 class="img-circle" width="200" height="200">
                                        </div>
                                        <div class="album_hover">
                                            <div class="album_hover_action">
                                                <a href="removeBandFromCart?id=${b.id}&username=${pageContext.request.userPrincipal.name}"
                                                   title="Удалить из Моей музыки" aria-label="Left Align" >
                                                    <span class="fa fa-trash fa-2x" aria-hidden="true"></span>
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
                        <div class="tab-pane fade" id="tab4">
                            <div class="user_concert">
                                <c:if test="${!empty concert}">
                                    <c:forEach items="${concert}" var="c" varStatus="loop">
                                        <div class="concert_inhouse">
                                            <a href="concertInfo.html?id=${c.id}"><img src="img/${c.band.name}.jpg"
                                                                                       alt=""
                                                                                       class="img-rounded" width="278"
                                                                                       height="180">
                                            </a>
                                            <div class="concert_inhouse_cotent">
                                                <div class="concert_date">
                                                    <span class="concert_day">${c.day}</span>
                                                    <span class="concert_month">${c.month}</span>
                                                </div>
                                                <div class="concert_details">
                                                    <a href="concertInfo.html?id=${c.id}">${c.band.name}</a><br>
                                                    <span class="concert_address">${c.city}
                                                        <span class="separator">&nbsp;</span>
                                                        ${c.place}
                                                    </span>
                                                    <span class="concert_rating"><span class="separator">&nbsp;</span>${c.age}+</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
        <ui:footer></ui:footer>
    </div>
</ui:html>
