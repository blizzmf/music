<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <ui:link href="/css/bootstrap.min.css"/>
    <ui:link href="/css/login.css"/>
    <ui:link href="/css/add.css"/>
    <ui:link href="/css/font-awesome.min.css" />

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/login.js"></script>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>

<div class="container">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <div class="login-form">
            <h1>BlzMusic</h1>
            <div class="form-group ${error != null ? 'has-error' : ''}">
                <%--<span>${message}</span>--%>
                <input name="username" type="text" class="form-control" placeholder="Логин" autofocus="true"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <i class="fa fa-user"></i>
            </div>
            <div class="form-group">
                <input name="password" type="password" class="form-control" placeholder="Пароль"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <span>${error}</span>
                <i class="fa fa-lock"></i>
            </div>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
            <a class="link" href="${contextPath}/registration">Регистрация</a>
            <button class="log-btn" type="submit">Вход</button>
        </div>
    </form>
    <%--<form method="POST" action="${contextPath}/login" class="form-signin">--%>
        <%--<h2 class="form-heading">Log in</h2>--%>

        <%--<div class="form-group ${error != null ? 'has-error' : ''}">--%>
            <%--<span>${message}</span>--%>
            <%--<input name="username" type="text" class="form-control" placeholder="Username"--%>
                   <%--autofocus="true"/>--%>
            <%--<input name="password" type="password" class="form-control" placeholder="Password"/>--%>
            <%--<span>${error}</span>--%>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

            <%--<button class="log-btn" type="submit">Log In</button>--%>
            <%--<h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>--%>
        <%--</div>--%>
    <%--</form>--%>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>