<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="addMusic" active="Music">
<c:url var="addAction" value="/addMusic/add" />

	<form:form class="well form-inline" action="${addAction}"
			   enctype="multipart/form-data" commandName="one" style="background: white">
		<table class="table" >
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
						<spring:message text="Название песни" />
					</form:label></td>
				<td><form:input class="form-control" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
			</tr>
			<tr>
				<td><form:label path="duration">
						<spring:message text="Продолжительность песни" />
					</form:label></td>
				<td><form:input class="form-control" path="duration" pattern="\d+(\.\d{2})?"/></td>
			</tr>
			<tr>
				<td><form:label path="musFormat">
						<spring:message text="Формат песни" />
					</form:label></td>
				<td><form:input class="form-control" path="musFormat" pattern="[A-Za-z]{,4}" /></td>
			</tr>
			<tr>
				<td><form:label path="cost">
						<spring:message text="Стоимость песни" />
					</form:label></td>
				<td><form:input class="form-control" path="cost" pattern="\d+(\.\d{2})?" /></td>
			</tr>
			<tr>
                <td>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="musicArtist">Артист:</label>
                        <div class="col-sm-2">
                            <div style="margin-left: 62px">
                                <select class="form-control form-control-sm" name="musicArtist">
                                    <option value=""></option>
                                    <c:if test="${true}">
                                        <c:forEach items="${artists}" var="a">
                                            <option value="${a.surName}">${a.surName}</option>
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
                        <label class="control-label col-sm-2" for="musicAlbum">Альбом:</label>
                        <div class="col-sm-2">
                            <div style="margin-left: 62px">
                                <select class="form-control form-control-sm" name="musicAlbum">
                                    <option value=""></option>
                                    <c:if test="${true}">
                                        <c:forEach items="${albums}" var="a">
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
						<label for="fileToUpload">Выберите трек</label>
					</p>
					<p>
						<input name="file" id="fileToUpload" type="file" accept=".mp3, .flac"/>
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
</ui:html>
