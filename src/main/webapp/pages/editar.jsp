<%@page import="com.conferencia.conferenciaapp.domain.Orador"%>
<%@page import="java.util.List"%>
<%
    Orador orador = (Orador)request.getAttribute("orador"); // levanto el departamento que viene del controller
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/conferencia_app_war_exploded/css/app.css" />
    <title>Conf Bs As</title>

    <style>
        body{
            height:100vh;
            display: grid;
            grid-template-areas: "header"
		                             "main"
		                             "footer";

        }
        header{
            grid-area: header;
            height: 100%;
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
                <a href="/conferencia_app_war_exploded/index.jsp">
                    <img
                            src="/conferencia_app_war_exploded/assets/img/codoacodo_logo.png"
                            alt="logo de codo a codo 4.0"
                    />
                </a>
                <h2>Conf Bs As</h2>
            </div>
            <nav class="nav">
                <ul>
                    <li><a href="/conferencia_app_war_exploded/index.jsp#conferencia">La conferencia</a></li>
                    <li><a href="/conferencia_app_war_exploded/index.jsp#oradores">Los oradores</a></li>
                    <li><a href="/conferencia_app_war_exploded/index.jsp#honolulu">El lugar y la fecha</a></li>
                    <li>
                        <a href="/conferencia_app_war_exploded/index.jsp#formulario">Conviertete en orador</a>
                    </li>
                    <li><a href="/conferencia_app_war_exploded/pages/comprar-tickets.jsp">Comprar tickets</a></li>
                </ul>
            </nav>
            <div class="hamburguer">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
        </div>
    </header>
    <main class="mb-5">
        <section class="container mt-5" id="form-orador">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <h2 class="titulo-gral">Modificar datos del Orador</h2>

                    <form action="<%=request.getContextPath()%>/UpdateOradorController" method="POST">
                        <div class="row gx-2">
                            <div class="col-md mb-3">
                                <input type="hidden" name="id" value="<%=orador.getId()%>">
                                <input type="text" class="form-control"
                                       name="nombre"
                                       placeholder="Nombre"
                                       aria-label="Nombre"
                                       id="validationCustom02"
                                       value="<%=orador.getNombre()%>"
                                       required>
                            </div>
                            <div class="col-md mb-3">
                                <input type="text" class="form-control" name="apellido" placeholder="Apellido" aria-label="Apellido"
                                       value="<%=orador.getApellido()%>"
                                       required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <input type="email" class="form-control" name="mail" placeholder="Email" aria-label="Email"
                                       value="<%=orador.getMail()%>"
                                       required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
		                            <textarea class="form-control" name="tema" id="exampleFormControlTextarea1" rows="4"

                                              placeholder="<%=orador.getTema()%>"

                                              required><%=orador.getTema()%> </textarea>
                                <div id="emailHelp" class="form-text mb-3">Recuerda incluir un título para tu charla.</div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-lg btn-form">Modificar</button>
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
