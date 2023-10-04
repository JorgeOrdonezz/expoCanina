/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Jorge, Leidy, Valentina 
 */

package servlets;

import com.umariana.expocachorros.ExpoPerros;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Intentamos hacer el servelt para eliminar pero no funciono
public class SvEliminar {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String nombrePerro = request.getParameter("nombre");

    ExpoPerros.eliminarPerro(nombrePerro);
    response.sendRedirect("index.jsp");
}

    
}
