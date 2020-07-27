<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
        <%!
            String s_usuario = "", s_clave = "";
        %>

    </head>
    <body>
        <%
            s_usuario = request.getParameter("user");
            s_clave = request.getParameter("password");

            if (s_usuario.equals("ADMIN") && s_clave.equals("12345")) {
                response.sendRedirect("Menu.jsp");
            } else {
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
