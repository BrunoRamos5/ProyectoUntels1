<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./styles/estilosParaMenu.css" />
        <title>Menu de Registros</title>
    </head>
    <body>
        <div class="container">
            <header class="header animated fadeIn">
                <img
                    src="./imagenes/logo-universidad-nacional-tecnologica-de-lima-sur.png"
                    />
            </header>
            <div class="language">
                <h2>Seleccione alguna opción</h2>
            </div>
            <section class="section">
                <article class="section-article animated fadeIn">
                    <a href="registroestudiante.jsp">
                        <img src="./imagenes/JSP.png" width="80px" height="80px" />
                        <h2>Registro Estudiante</h2>
                    </a>
                </article>
                <article class="section-article animated fadeIn">
                    <a href="datoscarrera.jsp">
                        <img src="./imagenes/JSP.png" width="80px" height="80px" />
                        <h2>Registro Carreras</h2>
                    </a>
                </article>
                <article class="section-article animated fadeIn">
                    <a href="registrocurso.jsp">
                        <img src="./imagenes/JSP.png" width="80px" height="80px" />
                        <h2>Registro Cursos</h2>
                    </a>
                </article>
                <article class="section-article animated fadeIn">
                    <a href="registromatricula.jsp">
                        <img src="./imagenes/JSP.png" width="80px" height="80px" />
                        <h2>Registro Matricula</h2>
                    </a>
                </article>
            </section>
            <div class="language" style="margin-top: 40px;">
                <h2>Siguenos en</h2>
            </div>
            <div class="social">
                <a
                    href="https://www.instagram.com/untelsoficial/?hl=es-la"
                    target="_blank"
                    >
                    <img width="40px" src="./imagenes/instagram.png" />
                </a>
                <a
                    id="facebook"
                    href="https://www.facebook.com/untelsperu/"
                    target="_blank"
                    >
                    <img width="40px" src="./imagenes/face.png" />
                </a>
            </div>
        </div>
    </body>
</html>