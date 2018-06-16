<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<ui:html title="Genre" active="genre">
    <hr>
    <section>
        <div class="headerwrap">
            <div class="genreTitle">
                <h1>Жанры</h1>
            </div>
        </div>
        <div class="tabs">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#genreTab1" data-toggle="tab">Жанры</a></li>
                <li><a href="#genreTab2" data-toggle="tab">Описание</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="genreTab1">
                    <c:if test="${!empty genres}">
                        <table class="table">
                            <tr>
                                <th>ID</th>
                                <th>Название</th>
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                    <th></th>
                                    <th></th>
                                </sec:authorize>
                            </tr>
                            <c:forEach items="${genres}" var="genre">
                                <tr>
                                    <td>${genre.id}</td>
                                    <td><a href="genreInfo.html?id=${genre.id}">${genre.name}</a></td>
                                    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                        <td>
                                            <a href="editGenre.html?id=${genre.id}">
                                                <span class="fa fa-pencil" aria-hidden="true"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<c:url value='/genre/remove/${genre.id}'/>">
                                                <span class="fa fa-trash" aria-hidden="true"></span>
                                            </a>
                                        </td>
                                    </sec:authorize>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
                <div class="tab-pane fade" id="genreTab2">
                    <c:if test="${!empty genres}">
                        <table class="table">
                            <tr>
                                <th>Название</th>
                                <th>Описание</th>
                            </tr>
                            <c:forEach items="${genres}" var="genre">
                                <tr>
                                    <td><a href="genreInfo.html?id=${genre.id}">${genre.name}</a></td>
                                    <td>${genre.description} - <a style="color: #07c!important;" target="_blank" href = "https://yandex.by/search/?text=${genre.name}">ещё в интернете</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
</ui:html>