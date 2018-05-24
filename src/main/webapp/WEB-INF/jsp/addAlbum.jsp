<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="addAlbum" active="Band">
<c:url var="addAction" value="/addAlbum/add" />
<hr>
<div align="center">
	<form:form class="well form-inline" action="${addAction}"
		enctype="multipart/form-data" commandName="one">
		<table class="table">
			<c:if test="${!empty one.name}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="name">
						<spring:message text="Название альбома" />
					</form:label></td>
				<td><form:input class="form-control" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
			</tr>
			<tr>
				<td><form:label path="formatDate">
						<spring:message text="Дата релиза альбома" />
					</form:label></td>
				<td><form:input class="form-control" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" /></td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<label class="control-label col-sm-2" for="albumArtist">Артист:</label>
						<div class="col-sm-2">
							<div style="margin-left: 62px">
								<select class="selectpicker" name="albumArtist">
									<option value=""></option>
									<c:if test="${true}">
										<c:forEach items="${artists}" var="a">
											<option value="${a.name}">${a.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
					</div>
				</td>
			</tr>
			         <tr>
                <td>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="albumBand">Группа:</label>
                        <div class="col-sm-2">
                            <div style="margin-left: 62px">
                                <select class="selectpicker" name="albumBand">
                                    <option value=""></option>
                                    <c:if test="${true}">
                                        <c:forEach items="${bands}" var="a">
                                            <option value="${a.name}">${a.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
			<tr>
				<td>
					<p>
						<label for="image">Выберите обложку альбома</label>
					</p>
					<p>
						<input name="file" id="fileToUpload" type="file" accept=".jpg, .jpeg, .png" />
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty one.name}">
						<input type="submit" class="btn btn-primary"
							value="<spring:message text="Изменить"/>" />
					</c:if> <c:if test="${empty one.name}">
						<input type="submit" class="btn btn-primary"
							value="<spring:message text="Добавить"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
</div>
</ui:html>
