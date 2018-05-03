<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="href" %>
<c:url var="_href_" value="${href}" /><link href="${_href_}" rel="stylesheet" type="text/css"></link>