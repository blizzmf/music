<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="band" active="band">
 <div class="container">
     <c:if test="${!empty bands}">
         <c:forEach items="${bands}" var="b" varStatus="loop">
             <div class="album">
                 <div class="album_cover">
                     <img src="img/${b.name}.jpg" alt=""
                          class="img-circle" width="200" height="200">
                 </div>
                 <div class="album_hover">
                     <div class="album_hover_action">
                         <a href="BandToCart.html?id=${b.id}&username=${pageContext.request.userPrincipal.name}"
                            title="Добавить из Моей музыки" aria-label="Left Align" >
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
</ui:html>
