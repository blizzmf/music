<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="Добавление концерта" active="">
    <c:url var="addAction" value="/addConcert/add" />
    <div class="page_root">
        <form:form class="well form-inline dom_form" action="${addAction}"
                   enctype="multipart/form-data" commandName="one">
            <table class="table">
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
                                <select class="form-control form-control-sm" name="concertBand">
                                    <option value=""></option>
                                    <c:forEach items="${bands}" var="b">
                                        <option value="${b.name}">${b.name}</option>
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
                        <span class="input_label">Город</span>
                    </span>
                    </td>
                    <td>
                        <form:input class="form-control input_controller" path="city" pattern="[A-Za-zА-Яа-яЁё]{,20}"
                                    placeholder=""/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="input_view">
                        <span class="input_label">Место</span>
                    </span>
                    </td>
                    <td>
                        <form:input class="form-control input_controller" path="place" pattern="[A-Za-zА-Яа-яЁё]{,20}"
                                    placeholder=""/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <span class="input_view">
                        <span class="input_label">Дата концерта</span>
                    </span>
                    </td>
                    <td>
                        <form:input class="form-control input_controller" path="formatDate"
                                    pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" placeholder=""/>
                    </td>
                </tr>
                <tr>
                    <td>
                     <span class="input_view">
                        <span class="input_label">Время концерта</span>
                    </span>
                    </td>
                    <td>
                        <form:input class="form-control input_controller" path="formatTime" pattern="[0-9]{2}:[0-9]{2}" placeholder="" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <span class="input_view">
                        <span class="input_label">Возрастное ограничение</span>
                    </span>
                    </td>
                    <td>
                        <form:input class="form-control input_controller" path="age" pattern="[0-9]{2}" placeholder="" />
                    </td>
                </tr>
                <tr>
                    <td>
                    <span class="input_view">
                        <span class="input_label">Обложка концерта</span>
                    </span>

                    </td>
                    <td>
                        <input name="file" id="fileToUpload" type="file" accept=".jpg, .png"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <c:if test="${!empty one.band.name}">
                            <input type="submit" class="btn btn-primary"
                                   value="<spring:message text="Изменить"/>" />
                        </c:if>
                        <c:if test="${empty one.band.name}">
                            <input type="submit" class="btn btn-primary"
                                   value="<spring:message text="Добавить"/>" />
                        </c:if>
                    </td>
                </tr>
            </table>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Группа</span>--%>
                    <%--</span>--%>
                    <%--<div class="form-group">--%>
                        <%--<div class="col-sm-2">--%>
                            <%--<div class="positPic">--%>
                                <%--<select class="form-control form-control-sm" name="concertBand">--%>
                                    <%--<option value="">Группа</option>--%>
                                    <%--<c:forEach items="${bands}" var="b">--%>
                                        <%--<option value="${b.name}">${b.name}</option>--%>
                                    <%--</c:forEach>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Город</span>--%>
                    <%--</span>--%>
                    <%--<form:input class="form-control input_controller" path="city" pattern="[A-Za-zА-Яа-яЁё]{,20}" placeholder="Город" />--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Место</span>--%>
                    <%--</span>--%>
                    <%--<form:input class="form-control input_controller" path="place" pattern="[A-Za-zА-Яа-яЁё]{,20}" placeholder="Место" />--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Дата концерта</span>--%>
                    <%--</span>--%>
                    <%--<form:input class="form-control input_controller" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" placeholder="Дата концерта" />--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Время концерта</span>--%>
                    <%--</span>--%>
                    <%--<form:input class="form-control input_controller" path="formatTime" pattern="[0-9]{2}:[0-9]{2}" placeholder="Время концерта" />--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Возрастное ограничение</span>--%>
                    <%--</span>--%>
                    <%--<form:input class="form-control input_controller" path="age" pattern="[0-9]{2}" placeholder="Возрастное ограничение" />--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>
                    <%--<span class="input_view">--%>
                        <%--<span class="input_label">Обложка концерта</span>--%>
                    <%--</span>--%>
                    <%--<input name="file" id="fileToUpload" type="file" accept=".jpg, .png"/>--%>
                <%--</label>--%>
            <%--</div>--%>
            <%--<div class="form_field">--%>
                <%--<label class="add_input">--%>

                        <%--<input type="submit" class="btn btn-primary"--%>
                               <%--value="<spring:message text="Изменить"/>" />--%>

                        <%--<input type="submit" class="btn btn-primary"--%>
                               <%--value="<spring:message text="Добавить"/>" />--%>

                <%--</label>--%>
            <%--</div>--%>
            <%--<c:if test="${!empty one.name}">--%>
                <%--<tr>--%>
                    <%--<td><form:label path="id">--%>
                        <%--<spring:message text="ID" />--%>
                    <%--</form:label></td>--%>
                        <%--<td><form:input path="id" readonly="true" size="8"--%>
                                        <%--disabled="true" /> <form:hidden path="id" /></td>--%>
                    <%--</tr>--%>
                <%--</c:if>--%>
                <%--<tr>--%>
                    <%--<td><form:label path="name">--%>
                        <%--<spring:message text="Название группы" />--%>
                    <%--</form:label></td>--%>
                    <%--<td><form:input class="form-control" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td><form:label path="formatDate">--%>
                        <%--<spring:message text="Дата основания группы" />--%>
                    <%--</form:label></td>--%>
                    <%--<td><form:input class="form-control" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" /></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td><form:label path="descript">--%>
                        <%--<spring:message text="Описание группы" />--%>
                    <%--</form:label></td>--%>
                    <%--<td><form:input class="form-control" path="descript" pattern="[A-Za-zА-Яа-яЁё]{,10000}" /></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<div class="form-group">--%>
                            <%--<label class="control-label col-sm-2" for="genreBand">Жанр:</label>--%>
                            <%--<div class="col-sm-2">--%>
                                <%--<div style="margin-left: 62px">--%>
                                    <%--<select class="selectpicker" name="genreBand">--%>
                                        <%--<option value=""></option>--%>
                                        <%--<c:if test="${true}">--%>
                                            <%--<c:forEach items="${genres}" var="a">--%>
                                                <%--<option value="${a.name}">${a.name}</option>--%>
                                            <%--</c:forEach>--%>
                                        <%--</c:if>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td><form:label path="formatDateClose">--%>
                        <%--<spring:message text="Дата распада группы(необязательное)" />--%>
                    <%--</form:label></td>--%>
                    <%--<td><form:input class="form-control" path="formatDateClose" /></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<p>--%>
                            <%--<label for="image">Выберите обложку группы</label>--%>
                        <%--</p>--%>
                        <%--<p>--%>
                            <%--<input name="file" id="fileToUpload" type="file" accept=".jpg, .jpeg, .png" />--%>
                        <%--</p>--%>
                    <%--</td>--%>
                <%--</tr>--%>

                <%--<tr>--%>
                    <%--<td colspan="2"><c:if test="${!empty one.name}">--%>
                        <%--<input type="submit" class="btn btn-primary"--%>
                               <%--value="<spring:message text="Изменить"/>" />--%>
                    <%--</c:if> <c:if test="${empty one.name}">--%>
                        <%--<input type="submit" class="btn btn-primary"--%>
                               <%--value="<spring:message text="Добавить"/>" />--%>
                    <%--</c:if></td>--%>
                <%--</tr>--%>
            <%--</table>--%>
        </form:form>
    </div>
</ui:html>
