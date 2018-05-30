<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="addArtist" active="Artist">
    <c:url var="addAction" value="/addArtist/add" />
    <hr>
    <div align="center">
       <form:form class="well form-inline" action="${addAction}" commandName="one">
        <table class="table">
            <c:if test="${!empty one.surName}">
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
                        <span class="input_label">Имя</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" path="name" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
            </tr>
            <tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Фамилия</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" path="surName" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
            </tr>
            <tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Отчество</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" path="secName" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
            </tr>
            <tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Специализация</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" path="spec" pattern="[A-Za-zА-Яа-яЁё]{,20}" /></td>
            </tr>
             <tr>
                <td>
                    <span class="input_view">
                        <span class="input_label">Дата рождения</span>
                    </span>
                </td>
                <td><form:input class="form-control input_controller" path="formatDate" pattern="[0-9]{4}.[0-9]{2}.[0-9]{2}" /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><c:if test="${!empty one.surName}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Изменить"/>" />
                    </c:if> <c:if test="${empty one.surName}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Добавить"/>" />
                    </c:if></td>
            </tr>
        </table>
    </form:form>
    </div>
</ui:html>
