<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<ui:html title="Genre" active="genre">
<hr>
<section>
    <div class="container">
        <div class="row centered">
            <div class="col-lg-8 col-lg-offset-2">
                <h1>Жанры</h1>
            </div>
        </div>
    </div>

	<c:if test="${!empty genres}">
		<table class="table">
			<tr>
				<th>ID</th>
				<th>Название</th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach items="${genres}" var="genre">
				<tr>
					<td>${genre.id}</td>
					<td>${genre.name}</td>
					<td>
					    <a href="editGenre.html?id=${genre.id}">
						    <button type="button" class="btn btn-default"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
							</button>
						</a>
					</td>
					<td>
					 <a href="<c:url value='/genre/remove/${genre.id}'/>">
					     <button type="button" class="btn btn-default"
							aria-label="Left Align">
							<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
						</button>
	                </a>
				</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</section>
</ui:html>