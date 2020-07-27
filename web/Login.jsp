
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="./styles/styles-login.css" />
        <!--Estylos de box icon-->
        <link
            href="https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css"
            rel="stylesheet"
            />

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <title>Untels</title>
    </head>
    <body>

        <div class="container">
            <div class="login">
                <header class="header">
                    <h1>LOGIN</h1>
                </header>
                <form class="form" action="${pageContext.request.contextPath}/Valida.jsp" method="post">
                    <h2>INGRESAR</h2>
                    <label for="user">Usuario</label>
                    <input type="text" name="user" id="user" />
                    <label for="password">Contraseña</label>
                    <input type="password" name="password" id="password"/>
                    <button class="logIn" type="submit">ACEPTAR</button>
                </form>
            </div>
        </div>
        <i class='bx bx-loader-alt'></i>
        
    </body>
</html>
