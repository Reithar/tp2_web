<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/css/estilos.css"/>" rel="stylesheet"/>
     </head>
    <body>
        <h1>Iniciar sesion</h1>
        <form name="j_security_form" method="post" action="j_security_check">
            <p>Usuario: <input type="text" name="j_username"></p>
            <p>Clave: <input type="password" name="j_password"></p>
            
            <p><button type="submit">Ingresar</button></p>
        </form>
        <hr>
        
        <a href="<c:url value="/home/index"/>">volver al area publica</a>
    </body>
</html>
