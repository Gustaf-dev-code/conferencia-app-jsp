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
@WebServlet("/UpdateOradorController")
public class UpdateOradorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //capturo los parametros que viene en el request enviado por el form
        String id = req.getParameter("id");//name de input
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
            getServletContext().getRequestDispatcher("/pages/dashboard.jsp").forward(req, resp);
            return;
        }

        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();
        Orador orador;

        orador = new Orador(Long.parseLong(id),nombre,apellido,mail,tema,activo);
        // si no usamos try catch podemos arriba poner throws Exception
        try {
            dao.update(orador);
            //aca mensaje de exito, PERO COMO UNA LISTA
            req.setAttribute("success", List.of("Orador id:" + orador.getId() + " actualizado correctamente"));
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errors", List.of("Error actualizando Orador<" + e.getMessage()));
        }


        //ahora redirect!!!!
        getServletContext().getRequestDispatcher("/DashboardOradorController").forward(req, resp);


    }
    // cuando desde el listado, por url, viene al metodo get
    //cargar el departamento y enviarlo a la jsp que va a editar los datos
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        // realizar validaciones, para los datos que vienen!!!

        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();

        Orador orador = null;
        //cargo los datos
        try {
            orador = dao.getById(Long.parseLong(id));
        } catch (Exception e) {
            e.printStackTrace();
        }

        //guardar el producto en request y pasar dicho producto a la jsp
        req.setAttribute("orador", orador);

        //redirect
        //ahora redirect!!!!
        getServletContext().getRequestDispatcher("/pages/editar.jsp").forward(req, resp);
    }
}
