<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ attribute name="active"%>
<nav class="navbar navbar-inverse bg-inverse">
	<div class="container" id="con">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="welcome.html"><b>Blz</b>Music<i class="fa fa-music"></i></a>
		</div>
		<form class="navbar-form navbar-left" role="search"
			  action="search.html" method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="search" name="search"
					   placeholder="Трек, альбом, исполнитель">
			</div>
			<button type="submit" class="btn btn-link"><i class="fa fa-search"></i></button>
		</form>
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav">
				<li ${active eq 'artist'      ? ' class="active"' : ''}><a
					href="artist.html">Артисты<span class="sr-only"></span></a></li>
				<li ${active eq 'band'    ? ' class="active"' : ''}><a
					href="band.html">Группы <span class="sr-only">(current)</span></a></li>
				<li ${active eq 'music' ? ' class="active"' : ''}><a
					href="music.html?username=${pageContext.request.userPrincipal.name}">Музыка</a></li>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<li ${active eq 'genre'       ? ' class="active"' : ''}><a
						href="genre.html">Жанры</a></li>

					<li ${active eq 'add'        ? ' class="active"' : ''}><a
						href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-expanded="false">Добавить<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="addArtist.html"> Артист </a></li>
							<li class="divider"></li>
							<li><a href="addMusic.html"> Музыка </a></li>
							<li class="divider"></li>
							<li><a href="addBand.html"> Группа </a></li>
							<li class="divider"></li>
							<li><a href="addGenre.html"> Жанр </a></li>
							<li class="divider"></li>
							<li><a href="addAlbum.html"> Альбом </a></li>
						</ul></li>
				</sec:authorize>
			</ul>

			<ul class="nav navbar-nav pull-right">
				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<li class="nav-item">
						<div id="login">
							<a href="<c:url value='/login'/>"> <span
								class="glyphicon glyphicon-log-in" aria-hidden="true"></span>Login
							</a>
						</div>
					</li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li>
						<div id="cart">
							<a href="cart.html?username=${pageContext.request.userPrincipal.name}">
									<span class="fa fa-heart"
										  aria-hidden="true"></span>&nbspМоя музыка
							</a>
							<img class="img-circle" width="42" height="42"
								 src="img/user/${pageContext.request.userPrincipal.name}.jpg">
						</div></li>
					<li class="nav-item">
						<form id="logoutForm" method="POST" action="logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<div style="display: inline;">
							<a onclick="document.forms['logoutForm'].submit()"><span
								class="glyphicon glyphicon-log-out" aria-hidden="true"></span>Logout</a>

						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
