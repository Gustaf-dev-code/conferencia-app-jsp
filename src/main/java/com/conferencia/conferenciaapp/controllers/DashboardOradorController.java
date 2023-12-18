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
@WebServlet("/DashboardOradorController")
public class DashboardOradorController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();
        List<Orador> oradores = new ArrayList<>();

        try {
            oradores = dao.findAll();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace(); //  muestra por consola el error
        }
        req.setAttribute("listado", oradores);
        // este bloque de codigo lo vamos a usar en todos lados, redirecciona
        getServletContext().getRequestDispatcher("/pages/dashboard.jsp").forward(req, resp);
        //En resumen, la línea de código en cuestión redirige la solicitud actual
        //a un archivo JSP llamado "index.jsp", lo que significa que el control
        //se transferirá a ese archivo y se generará una respuesta basada
        //en el contenido del JSP. Esto permite separar la lógica
        //de presentación de la lógica de negocio en una aplicación web Java
        //que sigue el patrón MVC.

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
