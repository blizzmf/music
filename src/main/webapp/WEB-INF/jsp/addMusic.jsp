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
					<td>
                     <span class="input_view">
                        <span class="input_label">ID</span>
                    </span>
                    </td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td>
                 <span class="input_view">
                    <span class="input_label">Название песни</span>
                </span>
                </td>
				<td><form:input class="form-control input_controller" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
			</tr>
			<tr>
				<td>
                 <span class="input_view">
                    <span class="input_label">Продолжительность песни</span>
                </span>
                </td>
				<td><form:input class="form-control input_controller" path="duration" pattern="\d+(\.\d{2})?"/></td>
			</tr>
			<tr>
				<td>
                 <span class="input_view">
                    <span class="input_label">Формат песни</span>
                </span>
                </td>
				<td><form:input class="form-control input_controller" path="musFormat" pattern="[A-Za-z]{,4}" /></td>
			</tr>
			<tr>
				<td>
                 <span class="input_view">
                    <span class="input_label">Стоимость песни</span>
                </span>
                </td>
				<td><form:input class="form-control input_controller" path="cost" pattern="\d+(\.\d{2})?" /></td>
			</tr>
			<tr>
                <td>
                     <span class="input_view">
                        <span class="input_label">Артист</span>
                    </span>
                </td>
                <td>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <div class="positPic">
                                <select class="form-control form-control-sm" name="musicArtist">
                                    <option value=""></option>
                                        <c:forEach items="${artists}" var="a">
                                            <option value="${a.surName}">${a.surName}</option>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
             <tr>
                 <td>
                    <span class="input_view">
                        <span class="input_label">Альбом</span>
                    </span>
                 </td>
                <td>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <div class="positPic">
                                <select class="form-control form-control-sm" name="musicAlbum">
                                    <option value=""></option>
                                        <c:forEach items="${albums}" var="a">
                                            <option value="${a.name}">${a.name}</option>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
			<tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Трек</span>
                    </span>
                </td>
				<td>
                    <input name="file" id="fileToUpload" type="file" accept=".mp3, .flac"/>
				</td>
			</tr>
			<tr>
                <td></td>
				<td colspan="2">
					<c:if test="${!empty one.name}">
						<input type="submit" class="btn btn-primary"
							value="<spring:message text="Изменить"/>" />
					</c:if>
					<c:if test="${empty one.name}">
						<input type="submit" class="btn btn-primary"
							value="<spring:message text="Добавить"/>" />
					</c:if>
				</td>
			</tr>
		</table>
	</form:form>
</ui:html>
