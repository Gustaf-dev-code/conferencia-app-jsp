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
@WebServlet("/SearchSpeakerByTopicController")
public class SearchSpeakerByTopicController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // levantamos el tema a buscar
        String temaBuscar = req.getParameter("temabuscar");
        //interface = new class que implementa la interface
        IOradorDAO dao = new OradorDAOMysqlImpl();
        List<Orador> oradores = new ArrayList<>();

        try {
            oradores = dao.search(temaBuscar);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace(); //  muestra por consola el error
        }
        req.setAttribute("listado", oradores);
        // este bloque de codigo lo vamos a usar en todos lados, redirecciona al index.jsp
        getServletContext().getRequestDispatcher("/listado.jsp").forward(req, resp);

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
