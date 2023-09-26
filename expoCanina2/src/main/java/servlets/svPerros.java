/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 //**
 *
 * @author Jorge Andres, Leidy Cuasquer, Valentina Peñafiel
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import com.mycompany.expocanina2.Perro;
import com.mycompany.expocanina2.ExposicionPerros;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Jorge Andres
 */
@WebServlet(name = "svPerros", urlPatterns = {"/svPerros"})
public class svPerros extends HttpServlet {

    
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String imagen = request.getParameter("imagen");
        String puntosStr = request.getParameter("puntos");
        String edadStr = request.getParameter("edad");
        try {
            int puntos = Integer.parseInt(puntosStr);
            int edad = Integer.parseInt(edadStr);


            Perro Perro = new Perro(nombre, raza, imagen, puntos, edad);
ArrayList<Perro> misPerros = ExposicionPerros.cargarPerros(getServletContext());


            misPerros.add(Perro);
            ExposicionPerros.guardarPerro(misPerros);
            request.setAttribute("misPerros", misPerros);

            request.getRequestDispatcher("agregarPerros.jsp").forward(request, response);
        } catch (NumberFormatException e) {
      
            e.printStackTrace();
            System.out.println("Error al convertir puntos o edad a entero: " + e.getMessage());
    }
 }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
