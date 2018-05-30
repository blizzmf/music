<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="addBand" active="Band">
<c:url var="addAction" value="/addBand/add" />
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
                        <span class="input_label">Название группы</span>
                    </span>
				</td>
				<td><form:input class="form-control input_controller" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
			</tr>
			<tr>
				<td>
					<span class="input_view">
                        <span class="input_label">Дата основания группы</span>
                    </span>
				</td>
				<td><form:input class="form-control input_controller" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" /></td>
			</tr>
			<tr>
				<td>
					<span class="input_view">
                        <span class="input_label">Описание группы</span>
                    </span>
				</td>
				<td><form:input class="form-control input_controller" path="descript" pattern="[A-Za-zА-Яа-яЁё]{,10000}" /></td>
			</tr>
			<tr>
				<td>
					<span class="input_view">
                        <span class="input_label">Жанр группы</span>
                    </span>
				</td>
				<td>
					<div class="form-group">
						<div class="col-sm-2">
							<div class="positPic">
								<select class="form-control form-control-sm" name="genreBand">
									<option value=""></option>
										<c:forEach items="${genres}" var="a">
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
                        <span class="input_label">Дата расформирования группы(необязательно)</span>
                    </span>
				</td>
				<td><form:input class="form-control input_controller" path="formatDateClose" /></td>
			</tr>
			<tr>
				<td>
					<span class="input_view">
                        <span class="input_label">Выберите обложку группы</span>
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
