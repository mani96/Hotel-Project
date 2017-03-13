<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="includes/header.jsp" %>

</head>

<body>
 <!---------------------------navigation + slider--------------------->
    <%@include file="includes/navigation.jsp" %>
	<!-----------------------------------------check form-------------------------------->
        <%@include file="includes/checkAvailability.jsp" %>
	<!---------------------------------Gallery + Map------------------------------------------------------>
        <%@include file="includes/GalleryMap.jsp" %>
        
        <!-------------------footer------------------------>
    <div class="footer-clean">
        <footer>
      <%@include file="includes/Footer.jsp" %>
        </footer>
		
    </div>
   
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.min.js"></script>
     <script src="${pageContext.request.contextPath}/assets/js/rooms.js"></script>
	
	
</body>

</html>