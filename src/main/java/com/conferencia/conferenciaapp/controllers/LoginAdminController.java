package com.conferencia.conferenciaapp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/LoginAdminController")
public class LoginAdminController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //capturo los parametros que viene en el request enviado por el form
        String nombre= req.getParameter("nombre");//name de input
        String password = req.getParameter("password");
        String nombreGuardado = "admin";
        String passwordGuardado = "cac";
        if(nombre == null || "".equals(nombre)) {
            //ahora redirect!!!!
            getServletContext().getRequestDispatcher("/lista-oradores").forward(req, resp);
        }
        if( nombre.equals(nombreGuardado) && password.equals(passwordGuardado) ) {
            // si el user y la contraseña se validan y estan ok te deja entrar al dashboard
            getServletContext().getRequestDispatcher("/DashboardOradorController").forward(req, resp);
        }else {
            //ahora redirect!!!!
            getServletContext().getRequestDispatcher("/lista-oradores").forward(req, resp);
        }



    }
}
