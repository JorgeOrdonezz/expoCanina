package servlets;
/**
 *
 * @author Jorge, Leidy, Valentina 
 */
import com.umariana.expocachorros.Perro;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.umariana.expocachorros.ExpoPerros;

import javax.servlet.annotation.WebServlet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvEditarPerro", urlPatterns = {"/SvEditarPerro"})
@MultipartConfig
public class SvEditarPerro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Edita el nombre del perro
        String nombrePerroEditar = request.getParameter("perro-edit-nombre");

        // Obtiene la imagen
        Part imagenPart = request.getPart("imagen");
        System.out.println("imagenPart: " + imagenPart);

        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        // se almacenará el archivo
        String uploadDirectory = getServletContext().getRealPath("imagenes");
        System.out.println("uploadDirectory: " + uploadDirectory);

        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }

        // nuevos valores en el formulario
        String raza = request.getParameter("raza");
        String imagen = fileName;
        String puntosStr = request.getParameter("puntos");
        String edadStr = request.getParameter("edad");

       
        try {
            int puntos = Integer.parseInt(puntosStr);
            int edad = Integer.parseInt(edadStr);

            //lista de perros
            ServletContext servletContext = getServletContext();
            ArrayList<Perro> misPerros = ExpoPerros.cargarPerros(servletContext);

            Perro perroAEditar = null;
            for (Perro perro : misPerros) {
                if (perro.getNombre().equals(nombrePerroEditar)) {
                    perroAEditar = perro;
                    break;
                }
            }

            if (perroAEditar != null) {
                //  nuevos valores
                perroAEditar.setRaza(raza);
                perroAEditar.setImagen(imagen);
                perroAEditar.setPuntos(puntos);
                perroAEditar.setEdad(edad);

            
                ExpoPerros.guardarPerro(misPerros, servletContext);
                response.sendRedirect("index.jsp");
            } else {
                // Si no se encuentra el perro
                response.setContentType("text/plain");
                response.getWriter().write("Perro no encontrado");
            }
        } catch (NumberFormatException e) {
          
            
            e.printStackTrace();
            System.out.println("Error al convertir puntos o edad a entero: " + e.getMessage());
            //mensaje de error para el usuario cuando digita un caracter no compatible
        } catch (ClassNotFoundException ex) {
            
            Logger.getLogger(SvEditarPerro.class.getName()).log(Level.SEVERE, null, ex);

        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
