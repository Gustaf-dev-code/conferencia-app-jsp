const pricing = document.getElementById("pricing");
window.addEventListener("scroll", () => {
  if (window.scrollY > 0) {
    pricing.style.paddingTop = "90px";
    pricing.style.transition = "all 0.5s ease";
  } else {
    pricing.style.paddingTop = "0px";
    pricing.style.transition = "all 0.5s ease";
  }
});

const inputs = document.querySelectorAll(".input-container input");
const labels = document.querySelectorAll(".input-container label .txt");

inputs.forEach((input, index) => {
  input.addEventListener("focus", () => {
    labels[index].classList.add("focused");
  });

  input.addEventListener("blur", () => {
    if (input.value === "") {
      labels[index].classList.remove("focused");
    }
  });
});

//Delete btn
const deleteBtn = document.querySelector(".delete-btn");

// Agregar un controlador de eventos al botón
deleteBtn.addEventListener("click", (event) => {
  event.preventDefault();
  deleteBtn.classList.toggle("active");
});

const clickOutBtn = document.addEventListener("click", (event) => {
  if (!deleteBtn.contains(event.target)) {
    // El clic ocurrió fuera del botón, quitar la clase "active"
    deleteBtn.classList.remove("active");
  }
});

//Summary btn
const summaryBtn = document.querySelector(".summary-btn");
summaryBtn.addEventListener("click", (event) => {
  event.preventDefault();
  summaryBtn.classList.add("animate");

  setTimeout(() => {
    //Quitar la clase "animate" después de 600ms
    summaryBtn.classList.remove("animate");
  }, 600);
});

//Tickets form validation

const ticketForm = document.getElementById("ticket-form"); //Se obtiene el formulario
const formInputs = document.querySelectorAll("#ticket-form input"); //Se obtienen los inputs del formulario
const category = document.getElementById("category");

const expresions = {
  nameRegex: /^(?=[\p{L} ]{3,40}$)[\p{L}]+(?: [\p{L}]+)*$/u, //Expresión regular para validar el nombre
  emailRegex: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/, //Expresión regular para validar el correo que consta de 3 partes: nombre de usuario, símbolo @ y dominio
};

const fields = {
  name: false,
  lastname: false,
  email: false,
  quantity: false,
  category: false,
};

const validateForm = (event) => {
  switch (
    event.target.name //Se obtiene el nombre del input que activó el evento y se evalúa. Target es el elemento que activó el evento
  ) {
    case "name":
      validateField(
        expresions.nameRegex,
        event.target,
        "name",
        "first-inputs",
        "El campo Nombre solo recibe texto y no acepta más de un espacio entre palabras"
      );
      break;
    case "lastname":
      validateField(
        expresions.nameRegex,
        event.target,
        "lastname",
        "first-inputs",
        "El campo Apellido solo recibe texto y no acepta más de un espacio entre palabras"
      );
      break;
    case "email":
      validateField(
        expresions.emailRegex,
        event.target,
        "email",
        "email-container",
        "El correo solo puede contener letras, números, puntos, guiones y guiones bajos. Formato: correo@correo.xyz"
      );
      break;
    case "quantity":
      validateQuantity(
        "quantity",
        "second-inputs",
        "El campo cantidad no puede estar vacío."
      );
      break;
  }
};

formInputs.forEach((input) => {
  input.addEventListener("keyup", validateForm); //Se agrega un evento a cada input del formulario que se activa cuando se suelta una tecla
  input.addEventListener("blur", validateForm); //Se agrega un evento a cada input del formulario que se activa cuando se pierde el foco
});

const toastContainer = document.getElementById("toast-container");

const summaryButton = document.querySelector(".summary-btn");

const modal = document.querySelector(".modal");
const modalClose = document.querySelector(".modal-close");

modalClose.addEventListener("click", (event) => {
  event.preventDefault();
  modal.classList.remove("active");
});

const getValueInputs = (event) => {
  const name = document.getElementById("name").value;
  const lastname = document.getElementById("lastname").value;
  const email = document.getElementById("email").value;
  const quantity = document.getElementById("quantity").value;
  const categorySelect = document.getElementById("category");
  const selectedCategory =
    categorySelect.options[categorySelect.selectedIndex].text;

  const ticketValue = 200;
  let discount;
  let totalDiscount;
  let total;
  if (selectedCategory === "Estudiante") {
    discount = 0.8;
    totalDiscount = ticketValue * quantity * discount;
    total = ticketValue * quantity - totalDiscount;
  } else if (selectedCategory === "Trainee") {
    discount = 0.5;
    totalDiscount = ticketValue * quantity * discount;
    total = ticketValue * quantity - totalDiscount;
  } else if (selectedCategory === "Junior") {
    discount = 0.15;
    totalDiscount = ticketValue * quantity * discount;
    total = ticketValue * quantity - totalDiscount;
  }

  const modalName = document.getElementById("modal-name");
  const modalLastname = document.getElementById("modal-lastname");
  const modalEmail = document.getElementById("modal-email");
  const modalQuantity = document.getElementById("modal-quantity");
  const modalCategory = document.getElementById("modal-category");
  const modalTotalDiscount = document.getElementById("modal-total-discount");
  const modalTotal = document.getElementById("modal-total");

  modalName.textContent = name;
  modalLastname.textContent = lastname;
  modalEmail.textContent = email;
  modalQuantity.textContent = quantity;
  modalCategory.textContent = selectedCategory;
  modalTotalDiscount.textContent = "$" + totalDiscount;
  modalTotal.textContent = "$" + total;
};

summaryButton.addEventListener("click", (event) => {
  event.preventDefault();
  if (
    fields.name &&
    fields.lastname &&
    fields.email &&
    fields.quantity &&
    fields.category
  ) {
    modal.classList.add("active");
    getValueInputs(event);
  }
});

summaryButton.addEventListener("click", (event) => {
  event.preventDefault();

  if (
    fields.name &&
    fields.lastname &&
    fields.email &&
    fields.quantity &&
    fields.category
  ) {
    ticketForm.reset();
    addToast({
      type: "success",
      title: "Ticket creado!",
      description: "operación exitosa",
      autoClose: true,
    });

    document.querySelectorAll("#ticket-form .valid-input").forEach((icon) => {
      icon.classList.remove("valid-input");
    });
  } else {
    addToast({
      type: "error",
      title: "Error",
      description: "Faltan campos por llenar",
      autoClose: true,
    });
  }
});

const deleteButton = document.querySelector(".delete-btn");

deleteButton.addEventListener("click", (event) => {
  event.preventDefault();
  const inputs = document.querySelectorAll("#ticket-form input");
  inputs.forEach((input) => {
    input.value = "";
  });

  document.querySelectorAll("#ticket-form .valid-input").forEach((icon) => {
    icon.classList.remove("valid-input");
  });

  document.querySelectorAll("#ticket-form .error-input").forEach((icon) => {
    icon.classList.remove("error-input");
  });

  document
    .querySelectorAll("#ticket-form .error-message")
    .forEach((messageBox) => {
      messageBox.remove();
    });
});

toastContainer.addEventListener("click", (event) => {
  const toastId = event.target.closest("div.toast")?.id;

  if (event.target.closest("button.close-btn")) {
    //closest busca el elemento más cercano que cumpla con el selector
    toastClose(toastId);
  }
});

const toastClose = (id) => {
  document.getElementById(id)?.classList.add("closing"); //el signo de interrogación es para que no marque error si no encuentra el elemento
};

const addToast = ({ type, title, description, autoClose }) => {
  const newToast = document.createElement("div");
  newToast.classList.add("toast");
  newToast.classList.add(type);

  if (autoClose) {
    newToast.classList.add("autoclose");
  }

  const randomNumber = Math.floor(Math.random() * 100);
  const date = Date.now();
  const toastId = date + randomNumber;
  newToast.id = toastId;

  const icons = {
    success: `<svg
    xmlns="http://www.w3.org/2000/svg"
    fill="currentColor"
    viewBox="0 0 16 16"
  >
    <path
      d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"
    />
  </svg>`,
    error: `<svg
    xmlns="http://www.w3.org/2000/svg"
    fill="currentColor"
    viewBox="0 0 16 16"
  >
    <path
      d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
    />
  </svg>`,
  };

  const toastTemplate = `
  <div class="toast-content">
            <div class="toast-icon">
              ${icons[type]}
            </div>
            <div class="notification">
              <p class="noti-title">${title}</p>
              <p class="description">${description}
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
  `;

  newToast.innerHTML = toastTemplate;

  toastContainer.appendChild(newToast);

  //Función animación cierre del toast
  const handleClosingAnimation = (event) => {
    if (event.animationName === "closing") {
      newToast.removeEventListener("animationend", handleClosingAnimation);
      newToast.remove();
    }
  };

  if (autoClose) {
    setTimeout(() => {
      toastClose(toastId);
    }, 5000);
  }

  //Evento para detectar cuando finaliza la animación de cerrado
  newToast.addEventListener("animationend", handleClosingAnimation);
};

const validateField = (expresion, input, field, divInputs, errorMessage) => {
  if (expresion.test(input.value)) {
    document
      .getElementById(`${field}-container`)
      .classList.remove("error-input");
    document.getElementById(`${field}-container`).classList.add("valid-input");
    const svg = document.querySelector(`#${field}-container svg`);
    const newPath =
      "M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z";

    svg.querySelector("path").setAttribute("d", newPath);

    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );
    if (existingErrorMessage) {
      existingErrorMessage.style.display = "none";
    }
    fields[field] = true;
  } else {
    document.getElementById(`${field}-container`).classList.add("error-input");
    const svg = document.querySelector(`#${field}-container svg`);
    const originPath =
      "M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z";

    svg.querySelector("path").setAttribute("d", originPath);

    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );

    if (!existingErrorMessage) {
      const errorMessageDiv = document.createElement("div");
      errorMessageDiv.className = "error-message";
      const errorParagraph = document.createElement("p");
      errorParagraph.className = "error-alert";
      errorParagraph.textContent = `${errorMessage}`;
      errorMessageDiv.appendChild(errorParagraph);
      const firstInputsDiv = document.getElementById(`${divInputs}`);
      firstInputsDiv.parentNode.insertBefore(
        errorMessageDiv,
        firstInputsDiv.nextSibling
      );
    } else {
      const errorParagraph = existingErrorMessage.querySelector(".error-alert");
      errorParagraph.textContent = `${errorMessage}`;
      existingErrorMessage.style.display = "block";
    }
    fields[field] = false;
  }
};

const validateQuantity = (field, divInputs, errorMessage) => {
  const quantityInput = document.getElementById("quantity");
  if (!quantityInput.value == "") {
    document
      .getElementById(`${field}-container`)
      .classList.remove("error-input");
    document.getElementById(`${field}-container`).classList.add("valid-input");
    const svg = document.querySelector(`#${field}-container svg`);
    const newPath =
      "M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z";

    svg.querySelector("path").setAttribute("d", newPath);

    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );
    if (existingErrorMessage) {
      existingErrorMessage.style.display = "none";
    }
    fields[field] = true;
  } else {
    document.getElementById(`${field}-container`).classList.add("error-input");
    const svg = document.querySelector(`#${field}-container svg`);
    const originPath =
      "M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z";

    svg.querySelector("path").setAttribute("d", originPath);

    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );

    if (!existingErrorMessage) {
      const errorMessageDiv = document.createElement("div");
      errorMessageDiv.className = "error-message";
      const errorParagraph = document.createElement("p");
      errorParagraph.className = "error-alert";
      errorParagraph.textContent = `${errorMessage}`;
      errorMessageDiv.appendChild(errorParagraph);
      const firstInputsDiv = document.getElementById(`${divInputs}`);
      firstInputsDiv.parentNode.insertBefore(
        errorMessageDiv,
        firstInputsDiv.nextSibling
      );
    } else {
      const errorParagraph = existingErrorMessage.querySelector(".error-alert");
      errorParagraph.textContent = `${errorMessage}`;
      existingErrorMessage.style.display = "block";
    }
    fields[field] = false;
  }
};

const validateSelect = (event, field, divInputs, errorMessage) => {
  const select = event.target;
  if (select.value != "") {
    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );
    if (existingErrorMessage) {
      existingErrorMessage.style.display = "none";
    }
    fields[field] = true;
  } else {
    const existingErrorMessage = document.querySelector(
      `#${divInputs} + .error-message`
    );

    if (!existingErrorMessage) {
      const errorMessageDiv = document.createElement("div");
      errorMessageDiv.className = "error-message";
      const errorParagraph = document.createElement("p");
      errorParagraph.className = "error-alert";
      errorParagraph.textContent = `${errorMessage}`;
      errorMessageDiv.appendChild(errorParagraph);
      const firstInputsDiv = document.getElementById(`${divInputs}`);
      firstInputsDiv.parentNode.insertBefore(
        errorMessageDiv,
        firstInputsDiv.nextSibling
      );
    } else {
      const errorParagraph = existingErrorMessage.querySelector(".error-alert");
      errorParagraph.textContent = `${errorMessage}`;
      existingErrorMessage.style.display = "block";
    }
    fields[field] = false;
  }
};

const selectElement = document.getElementById("category");
selectElement.addEventListener("change", (event) => {
  validateSelect(
    event,
    "category",
    "second-inputs",
    "Selecciona una categoría válida"
  );
});

selectElement.addEventListener("blur", (event) => {
  validateSelect(
    event,
    "category",
    "second-inputs",
    "Selecciona una categoría válida"
  );
});
