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
                    <span class="input_label">Название альбома</span>
                 </span>
                </td>
				<td><form:input class="form-control input_controller" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
			</tr>
			<tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Дата релиза альбома</span>
                  </span>
                </td>
				<td><form:input class="form-control input_controller" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" /></td>
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
								<select class="form-control form-control-sm" name="albumArtist">
									<option value=""></option>
										<c:forEach items="${artists}" var="a">
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
                        <span class="input_label">Группа</span>
                    </span>
                </td>
                <td>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <div class="positPic">
                                <select class="form-control form-control-sm" name="albumBand">
                                    <option value=""></option>
                                    <c:forEach items="${bands}" var="a">
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
                        <span class="input_label">Обложка альбома</span>
                    </span>
                </td>
				<td>
                    <input name="file" id="fileToUpload" type="file" accept=".jpg, .jpeg, .png" />
				</td>
			</tr>
			<tr>
                <td></td>
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
