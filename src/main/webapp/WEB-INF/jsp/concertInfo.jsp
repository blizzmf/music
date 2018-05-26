<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<!DOCTYPE html>
<ui:html title="${concert.band.name}" active="">
    <div class="page_root">
        <div class="concert_showcase">
            <img src="img/concert/${concert.band.name}Live.jpg" alt="" class="img-rounded" width="960" height="500">
            <div class="showcase_date">
                <span class="showcase_date_day">${concert.day}</span>
                <span class="showcase_date_month">${concert.month}</span>
                <span class="showcase_date_weekDay">${concert.dayOfWeek}</span>
            </div>
            <div class="showcase_content">
                <h1 class="showcase_title">${concert.band.name}</h1>
                <span class="showcase_address">${concert.city},${concert.place}</span>
                <span class="separator">&nbsp;</span>
                <span class="showcase_address">${concert.concertTime}</span>
                <span class="showcase_rating">
                    <span class="separator">&nbsp;</span>
                    ${concert.age}+</span>
                </span>
            </div>
        </div>
    </div>
</ui:html>
