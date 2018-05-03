<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ui"%>
<%@ attribute name="title" %>
<%@ attribute name="active" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Bootstrap -->
    <ui:link href="/css/bootstrap.min.css" />

    <ui:link href="/css/css.css" />

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css" rel="stylesheet" />
     <script src="js/tagcanvas.min.js" type="text/javascript"></script>
    <c:if test="${not empty title}"><title><spring:message code="${title}" text="${title}" /></title></c:if>
</head>
<body>
    <ui:nav active="${active}" />

    <div class="container">
        <jsp:doBody />
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
     <script type="text/javascript">
    window.onload = function() {
        try {
            TagCanvas.textColour = '#000';
            TagCanvas.outlineColour = '#000';
            TagCanvas.textHeight = 20;
            TagCanvas.Start('myCanvas');
        } catch(e) {
             // something went wrong, hide the canvas container
             document.getElementById('myCanvasContainer').style.display = 'none';
         }
     };
 </script>
    <style>
    body{
        padding-top: 100px;
    }
    <style>
    #myCanvas {
    margin: auto 0 !important;
    border: 1px solid black !important;
    }
   </style>
</body>
</html>
