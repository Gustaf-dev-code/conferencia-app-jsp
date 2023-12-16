<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/comprar-tickets.css" />
    <title>Comprar tickets - Conf Bs As</title>
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
            <li><a href="./comprar-tickets.html">Comprar tickets</a></li>
          </ul>
        </nav>
        <div class="hamburguer">
          <div class="bar"></div>
          <div class="bar"></div>
          <div class="bar"></div>
        </div>
      </div>
    </header>
    <main>
      <section id="pricing">
        <div class="pricing-cards">
          <h1>Tickets</h1>
          <div class="cards">
            <div class="cards-inner">
              <div class="card">
                <h2>Estudiante</h2>
                <p>Descuento:</p>
                <h3>80%</h3>
                <ul role="list" class="card-bullets">
                  <li>Presentar documentación</li>
                  <li>Incluye Refrigerio</li>
                </ul>
              </div>

              <div class="card">
                <h2>Trainee</h2>
                <p>Descuento:</p>
                <h3>50%</h3>
                <ul role="list" class="card-bullets">
                  <li>Presentar documentación</li>
                  <li>Incluye Refrigerio</li>
                  <li>Incluye libreta del evento</li>
                </ul>
              </div>

              <div class="card">
                <h2>Junior</h2>
                <p>Descuento:</p>
                <h3>15%</h3>
                <ul role="list" class="card-bullets">
                  <li>Presentar documentación</li>
                  <li>Incluye Refrigerio</li>
                  <li>Incluye polera del evento</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section id="form">
        <div class="left">
          <div class="info">
            <h1>Conferencia de Programación - Codo a Codo</h1>
            <p>
              Un evento que contará con la participación de grandes exponentes
              del desarrollo de software y que brindarán tips, información
              relevante, actualizaciones y mucho más. No te lo puedes perder!
            </p>
          </div>
        </div>
        <div class="right">
          <form action="" id="ticket-form">
            <div class="info">
              <h2>Valor Ticket: <span>$200</span></h2>
              <p>Solicitar ticket</p>
            </div>
            <div class="inputs" id="first-inputs">
              <div class="input-container" id="name-container">
                <input type="text" id="name" name="name" autocomplete="off" />
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 16 16"
                  class="icon-state"
                >
                  <path
                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"
                  />
                </svg>
                <label for="name"><span class="txt">Nombre(s):</span></label>
              </div>

              <div class="input-container" id="lastname-container">
                <input
                  type="text"
                  id="lastname"
                  name="lastname"
                  autocomplete="off"
                />
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 16 16"
                  class="icon-state"
                >
                  <path
                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"
                  />
                </svg>
                <label for="lastname"
                  ><span class="txt">Apellidos:</span></label
                >
              </div>
            </div>
            <div class="input-container" id="email-container">
              <input type="text" id="email" name="email" autocomplete="off" />
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 16 16"
                class="icon-state"
              >
                <path
                  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"
                />
              </svg>
              <label for="email"><span class="txt">Correo:</span></label>
            </div>
            <div class="inputs" id="second-inputs">
              <div class="input-container" id="quantity-container">
                <input type="number" id="quantity" name="quantity" min="1" />
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  viewBox="0 0 16 16"
                  class="icon-state"
                >
                  <path
                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"
                  />
                </svg>
                <label for="quantity"><span class="txt">Cantidad:</span></label>
              </div>
              <div class="select-container" id="select-container">
                <label for="category">Categoría:</label>
                <select id="category" required>
                  <option value="">--------</option>
                  <option value="student">Estudiante</option>
                  <option value="trainee">Trainee</option>
                  <option value="junior">Junior</option>
                </select>
              </div>
            </div>
            <!-- <div class="error-message">
              <p class="error-alert">
                Seleccione una de las opciones de categoría.
              </p>
            </div> -->
            <div class="buttons">
              <a href="#" class="delete-btn"
                ><span></span>
                <p>Borrar</p></a
              >
              <button type="submit" class="summary-btn">Resumen</button>
            </div>
          </form>
        </div>
      </section>
      <div class="toast-container" id="toast-container">
        <!-- <div class="toast success" id="1">
          <div class="toast-content">
            <div class="toast-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 16 16"
              >
                <path
                  d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"
                />
              </svg>
            </div>
            <div class="notification">
              <p class="noti-title">Exito!</p>
              <p class="description">La operación fue exitosa.</p>
            </div>
          </div>
          <button class="close-btn">
            <div class="toast-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 16 16"
              >
                <path
                  d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                />
              </svg>
            </div>
          </button>
        </div> -->
        <!-- <div class="toast error" id="2">
          <div class="toast-content">
            <div class="toast-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 16 16"
              >
                <path
                  d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                />
              </svg>
            </div>
            <div class="notification">
              <p class="noti-title">Error!</p>
              <p class="description">
                Hubo un error al intentar procesar la operación.
              </p>
            </div>
          </div>
          <button class="close-btn">
            <div class="toast-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="currentColor"
                viewBox="0 0 16 16"
              >
                <path
                  d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                />
              </svg>
            </div>
          </button>
        </div> -->
      </div>
      <section class="modal">
        <div class="modal-container">
          <a href="#" class="modal-close">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 16 16"
            >
              <path
                d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"
              />
            </svg>
          </a>
          <img
            src="../assets/img/codoacodo.png"
            alt="logo codo a codo"
            class="modal-img"
          />
          <h2 class="modal-title">Resumen Ticket</h2>
          <div class="group-modal">
            <h5 class="modal-subtitle">Nombre:</h5>
            <p class="modal-paragraph" id="modal-name"></p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Apellido:</h5>
            <p class="modal-paragraph" id="modal-lastname"></p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Correo:</h5>
            <p class="modal-paragraph" id="modal-email"></p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Categoría:</h5>
            <p class="modal-paragraph" id="modal-category"></p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Cantidad:</h5>
            <p class="modal-paragraph" id="modal-quantity"></p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Precio unidad:</h5>
            <p class="modal-paragraph">$200</p>
          </div>
          <div class="group-modal">
            <h5 class="modal-subtitle">Descuento:</h5>
            <p class="modal-paragraph" id="modal-total-discount"></p>
          </div>
          <div class="group-modal" id="total">
            <h5 class="modal-subtitle">Total a Pagar:</h5>
            <p class="modal-paragraph" id="modal-total"></p>
          </div>
        </div>
      </section>
    </main>
    <jsp:include page="../footer.jsp" />
    <script src="../js/script.js"></script>
    <script src="../js/tickets.js"></script>
  </body>
</html>
