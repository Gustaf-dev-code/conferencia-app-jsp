<%@page import="com.conferencia.conferenciaapp.domain.Orador"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/app.css" />
    <title>Conf Bs As</title>

    <style>
        body{
            height:100vh;
            display: grid;
            grid-template-rows: 10% 75% 15%;
            grid-template-areas: "header"
		                             "main"
		                             "footer";

        }
        header{
            grid-area: header;
            width: 100%;
            height: 100%;
            color: white;
            position: relative;
            background-color: var(--primary-color);
        }
        main{
            grid-area: main;
            overflow: auto;
        }
        footer{
            grid-area: footer;

        }
    </style>
</head>
<body>
    <header>
    <div class="header__container">
        <div class="header__leftnav">
            <a href="../index.jsp">
                <img
                        src="../assets/img/codoacodo_logo.png"
                        alt="logo de codo a codo 4.0"
                />
            </a>
            <h2>Conf Bs As</h2>
        </div>
        <nav class="nav">
            <ul>
                <li><a href="../index.jsp#conferencia">La conferencia</a></li>
                <li><a href="../index.jsp#oradores">Los oradores</a></li>
                <li><a href="../index.jsp#honolulu">El lugar y la fecha</a></li>
                <li>
                    <a href="../index.jsp#formulario">Conviertete en orador</a>
                </li>
                <li><a href="./comprar-tickets.jsp">Comprar tickets</a></li>
            </ul>
        </nav>
        <div class="hamburguer">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
    </div>
</header>
    <main class="d-flex justify-content-center align-items-center">
        <section class="mt-5 container" id="form-orador">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <h2 class="titulo-gral mb-3">LogIn</h2>

                    <form action="<%=request.getContextPath()%>/LoginAdminController" method="POST">
                        <div class="row justify-content-center">
                            <div class="col-8 mb-3 mb-4">
                                <input type="text" class="form-control" name="nombre" placeholder="Usuario" aria-label="Nombre" required>

                            </div>
                            <div class="col-8 mb-3 mb-4">
                                <input type="password" class="form-control" name="password" placeholder="Contraseña" aria-label="Password" required>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-8 mb-3">
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-lg btn-form">LogIn</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </main>
    <jsp:include page="../footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
