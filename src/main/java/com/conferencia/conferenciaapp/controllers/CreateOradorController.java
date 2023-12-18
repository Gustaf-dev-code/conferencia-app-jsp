package com.conferencia.conferenciaapp.controllers;
import com.conferencia.conferenciaapp.dao.IOradorDAO;
import com.conferencia.conferenciaapp.dao.implement.OradorDAOMysqlImpl;
import com.conferencia.conferenciaapp.domain.Orador;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CreateOradorController")
public class CreateOradorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //capturo los parametros que viene en el request enviado por el form
        String nombre= req.getParameter("nombre");//name de input
        String apellido = req.getParameter("apellido");//name de input
        String mail = req.getParameter("mail");
        String tema = req.getParameter("tema");
        String activo = "S";//name de input


        //validaciones!
        List<String> errores = new ArrayList<>();
        if(nombre == null || "".equals(nombre)) {
            errores.add("Nombre vacío");
        }
        if(apellido== null || "".equals(apellido)) {
            errores.add("Apellido vacío");
        }
        if(mail== null || "".equals(mail)) {
            errores.add("Mail vacío");
        }
        if(tema== null || "".equals(tema)) {
            errores.add("Tema vacío");
        }

        if(!errores.isEmpty()) {
            req.setAttribute("errors", errores);
            //vuelvo a la jsp con la lista de errores cargadas
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();

        // como llego a la base de datos si quiero pedir datos de un orador?


        Orador orador = new Orador(nombre,apellido,mail,tema,activo);

        // si no usamos try catch podemos arriba poner throws Exception
        try {
            dao.create(orador); // cuando se crea el orador se le setea el id que se levanta de la base
            req.setAttribute("success", List.of("Alta de Orador exitosa"));
        }catch (Exception e) {
            //si falla volver al nuevo.jsp
            e.printStackTrace();

        }
        //ahora redirect!!!!
        getServletContext().getRequestDispatcher("/lista-oradores").forward(req, resp);

    }
}
