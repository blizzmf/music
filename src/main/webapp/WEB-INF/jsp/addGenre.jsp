<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="addGenre" active="Genre">

    <c:url var="addAction" value="/addGenre/add"/>
    <div align="center">
       <form:form class="well form-inline" action="${addAction}" commandName="one">
        <table class="table">
            <c:if test="${!empty one.name}">
                <tr>
                    <td></td>
                    <td><form:label path="id">
                            <spring:message text="ID" />
                        </form:label></td>
                    <td><form:input path="id" readonly="true" size="8"
                            disabled="true" /> <form:hidden path="id" /></td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Название жанра</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" pattern="[A-Za-zА-Яа-яЁё]{,15}" path="name" /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><c:if test="${!empty one.name}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Изменить"/>" />
                    </c:if> <c:if test="${empty one.name}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Добавить"/>" />
                    </c:if></td>
            </tr>
        </table>
    </form:form>
    </div>
</ui:html>
