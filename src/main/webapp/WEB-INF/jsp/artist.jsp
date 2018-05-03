<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<ui:html title="artist" active="artist">
<hr>
<section>
	<div class="container">
		<div class="row centered">
			<div class="col-lg-8 col-lg-offset-2">
				<h1>Артисты</h1>
			</div>
		</div>
	</div>

	<c:if test="${!empty artistList}">
		<table class="table">
			<tr>
			<th>Полное имя</th>
				<th>Специальность</th>
				<th>День рождения</th>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<th></th>
					<th></th>
				</sec:authorize>
			</tr>
			<c:forEach items="${artistList}" var="artist">
				<tr>
					<td>${artist.surName}${artist.name}${artist.secName}</td>
					<td>${artist.spec}</td>
					<td>${artist.birthday}</td>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<td><a href="editArtist.html?id=${artist.id}">
								<button type="button" class="btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
								</button>
						</a></td>
					
					<td><a href="<c:url value='/remove/${artist.id}'/>">
							<button type="button" class="btn btn-default"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
							</button>
					</a></td>
					</sec:authorize>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</section>
</ui:html>