<%@page import="com.conferencia.conferenciaapp.domain.Orador"%>
<%@page import="java.util.List"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/app.css" />
    <title>Conf Bs As</title>
</head>
<body>
<jsp:include page="header.jsp" />
<main>
    <section id="oradores">
        <div class="titulo">
            <h3>
                <div>CONOCE A LOS</div>
                ORADORES
            </h3>
        </div>
        <div class="cards">
            <div class="orador">
                <img
                        src="./assets/img/Steve_Jobs.jpg"
                        alt="Steve Jobs"
                        loading="lazy"
                />
                <div class="etiquetas">
                    <h4>JavaScript</h4>
                    <h4>React</h4>
                </div>
                <div class="text">
                    <h3>Steve Jobs</h3>
                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                        Cupiditate molestiae culpa modi optio alias quidem tempora
                        dignissimos voluptatum, ad eveniet aut sunt corporis dolorum!
                    </p>
                </div>
            </div>
            <div class="orador">
                <img src="./assets/img/bill.jpg" alt="Bill Gates" loading="lazy" />
                <div class="etiquetas">
                    <h4>JavaScript</h4>
                    <h4>React</h4>
                </div>
                <div class="text">
                    <h3>Bill Gates</h3>
                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                        Cupiditate molestiae culpa modi optio alias quidem tempora
                        dignissimos voluptatum, ad eveniet aut sunt corporis dolorum!
                    </p>
                </div>
            </div>
            <div class="orador">
                <img
                        src="./assets/img/ada.jpeg"
                        alt="Ada Lovelace"
                        loading="lazy"
                />
                <div class="etiquetas2">
                    <h4>Negocios</h4>
                    <h4>Startups</h4>
                </div>
                <div class="text">
                    <h3>Ada Lovelace</h3>
                    <p>
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                        Cupiditate molestiae culpa modi optio alias quidem tempora
                        dignissimos voluptatum, ad eveniet aut sunt corporis dolorum!
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section id="honolulu">
        <div class="honolulu__img"></div>
        <div class="honolulu__txt">
            <h3>Bs As - Octubre</h3>
            <p>
                Buenos aires es la provincia y localidad más grande del estado de
                Argentina. En los Estados Unidos, Honolulu es la mas sureña de entre
                las principales ciudades estadounidenses. Aunque el nombre de
                Honolulu se refiere a área urbana en la costa sureste de la isla de
                Oahu, la ciudad y el condado de Honolulu han formado una
                ciudad-condado consolidada desde 1907, que cubre toda la ciudad
                (aproximadamente 600 km² de superficie).
            </p>
            <a href="#">Conocé más</a>
        </div>
    </section>
    <section id="formulario">
        <div class="formulario__titulo">
            <h3>
                <div>CONVIÉRTETE EN UN</div>
                ORADOR
            </h3>
            <p>
                Anótate como orador para dar una <span>charla ignite</span>.
                Cuéntanos de qué quieres hablar!
            </p>
        </div>
        <div class="formulario__container">
            <div class="formulario__container__input">
                <input
                        name="nombre"
                        minlength="3"
                        maxlength="30"
                        type="text"
                        required
                        placeholder="Nombre"
                />
                <input
                        name="apellido"
                        minlength="3"
                        maxlength="30"
                        type="text"
                        required
                        placeholder="Apellido"
                />
            </div>
            <textarea
                    name="comentario"
                    id=""
                    cols="30"
                    rows="10"
                    placeholder="Sobre qué quieres hablar?"
                    required
            ></textarea>
            <p>Recuerda incluir un título para tu charla</p>
            <a href="#">Enviar</a>
        </div>
    </section>
</main>
<jsp:include page="footer.jsp" />
<script src="js/script.js"></script>
</body>
</html>