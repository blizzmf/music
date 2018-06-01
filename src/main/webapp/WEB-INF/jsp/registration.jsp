<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <ui:link href="/css/bootstrap.min.css" />
    <ui:link href="/css/login.css"/>
    <ui:link href="/css/add.css"/>
    

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <div class="login-form">
            <h1>Создайте свой аккаунт</h1>
            <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Логин" autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
                <i class="fa fa-user"></i>
            </div>
            </spring:bind>
            <spring:bind path="password">
            <div class="form-group">
                <form:input type="password" path="password" class="form-control" placeholder="Пароль"></form:input>
                <form:errors path="password"></form:errors>
                <i class="fa fa-lock"></i>
            </div>
            </spring:bind>
            <spring:bind path="confirmPassword">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="confirmPassword" class="form-control"
                                placeholder="Подтвердите свой пароль"></form:input>
                    <form:errors path="confirmPassword"></form:errors>
                </div>
            </spring:bind>
                <button class="log-btn" type="submit">Зарегестрироваться</button>
        </div>
    </form:form>

    <%--<form:form method="POST" modelAttribute="userForm" class="form-signin">--%>
        <%--<h2 class="form-signin-heading">Create your account</h2>--%>
        <%--<spring:bind path="username">--%>
            <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
                <%--<form:input type="text" path="username" class="form-control" placeholder="Username"--%>
                            <%--autofocus="true"></form:input>--%>
                <%--<form:errors path="username"></form:errors>--%>
            <%--</div>--%>
        <%--</spring:bind>--%>

        <%--<spring:bind path="password">--%>
            <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
                <%--<form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>--%>
                <%--<form:errors path="password"></form:errors>--%>
            <%--</div>--%>
        <%--</spring:bind>--%>

        <%--<spring:bind path="confirmPassword">--%>
            <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
                <%--<form:input type="password" path="confirmPassword" class="form-control"--%>
                            <%--placeholder="Confirm your password"></form:input>--%>
                <%--<form:errors path="confirmPassword"></form:errors>--%>
            <%--</div>--%>
        <%--</spring:bind>--%>

        <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>--%>
    <%--</form:form>--%>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>