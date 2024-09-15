/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.Valoracion;
import mundo.gestionarValoracion;

/**
 *
 * @author 
 */
@WebServlet(name = "sv_receptor", urlPatterns = {"/sv_receptor"})
public class sv_receptor extends HttpServlet {
    private gestionarValoracion gestiona = new gestionarValoracion();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recoger los datos del formulario
        String nombre = request.getParameter("nombre");
        String fecha = request.getParameter("fecha");
        String correo = request.getParameter("correo");
        String negocio = request.getParameter("negocio");
        String puntuacion = request.getParameter("puntuacion");
        
        //agregar la valoracion
        gestiona.agregarValoracion(nombre, fecha, correo, negocio, puntuacion);
        //listar valoraciones
        List<Valoracion> listaValoracion = gestiona.listarValoraciones();
        //enviar la lista
        request.setAttribute("listaValoracion", listaValoracion);
        //redirige a la pagina listar
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Servlet que recibe y procesa datos del formulario de evaluación";
    }

}
