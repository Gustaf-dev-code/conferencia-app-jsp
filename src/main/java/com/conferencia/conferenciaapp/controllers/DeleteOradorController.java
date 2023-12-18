package com.conferencia.conferenciaapp.controllers;

import com.conferencia.conferenciaapp.dao.IOradorDAO;
import com.conferencia.conferenciaapp.dao.implement.OradorDAOMysqlImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/DeleteOradorController")
public class DeleteOradorController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("idOrador"));//viene como String -> Long.parseLong()

        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();

        //eliminar
        try {
            dao.delete(id);
            //mensaje de exito
            req.setAttribute("success", List.of("Se he eliminado el orador con id:" + id));
        } catch (Exception e) {
            e.printStackTrace();
            //mensaje de error
            req.setAttribute("erorrs", List.of("NO se he eliminado el orador :" + e.getMessage()));
        }//ctrl+t

        //ahora redirect!!!!
        getServletContext().getRequestDispatcher("/DashboardOradorController").forward(req, resp);


    }
}
