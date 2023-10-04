package servlets;

/**
 *
 * @author Jorge, Leidy, Valentina 
 */

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import com.umariana.expocachorros.ExpoPerros;
import static com.umariana.expocachorros.ExpoPerros.darPerros;
import com.umariana.expocachorros.Perro;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "SvPerro", urlPatterns = {"/SvPerro"})
@MultipartConfig
public class SvPerro extends HttpServlet {

    public void init() throws ServletException {
    }

    //Metodo para buscar un perro por nombre de lista
    private Perro buscarPerroPorNombre(String nombre) {
        
        for (Perro perro : darPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro; //Si se encuentra al perro este retorna
            }
        }
        // Sino lo encuentra retorna null
        return null; 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         // Implementa la lógica para buscar el perro en la lista
        String nombre = request.getParameter("nombre");
        Perro perro = buscarPerroPorNombre(nombre);
        if (perro != null) {
            
            // Genera la respuesta HTML con los detalles del perro
            String perroHtml = "<h2>Nombre: " + perro.getNombre() + "</h2>"
                    
                    + "<p>Raza: " + perro.getRaza() + "</p>"
                    
                    + "<p>Puntos: " + perro.getPuntos() + "</p>"
                    
                    + "<p>Edad (meses): " + perro.getEdad() + "</p>"
                    
                    + "<img src='imagenes/" + perro.getImagen() + "' alt='" + perro.getNombre() + "' width='100%'/>";
            
            response.setContentType("text/html");
            response.getWriter().write(perroHtml);
        } else {
            //Ponemos eto por si no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("Perro no encontrado");
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recoger datos del archivo      
        Part imagenPart = request.getPart("imagen");
        System.out.println("imagenPart" + imagenPart);

        // el nombre del archivo
        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        
        // Donde se almacenara el archivo
        String uploadDirectory = getServletContext().getRealPath("imagenes");
        System.out.println("uploadDirectory: " + uploadDirectory);

        //Ruta del archivo
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }

        // obtenemos variables del formulario
        String nombre = request.getParameter("nombre");
        
        String raza = request.getParameter("raza");
        
        String imagen = fileName;

        String puntosStr = request.getParameter("puntos");
        
        String edadStr = request.getParameter("edad");

       
        try {
            int puntos = Integer.parseInt(puntosStr);
            int edad = Integer.parseInt(edadStr);
 
            Perro miPerro = new Perro(nombre, raza, imagen, puntos, edad);
            // lista de los perros
            ServletContext servletContext = getServletContext();
            ArrayList<Perro> misPerros = ExpoPerros.cargarPerros(servletContext);

            // Agregar un perro 
            misPerros.add(miPerro);

            ExpoPerros.guardarPerro(misPerros, servletContext);

            request.setAttribute("misPerros", misPerros);

            request.getRequestDispatcher("index.jsp").forward(request, response);// Redireccionar a la web 
        } catch (NumberFormatException e) {
            e.printStackTrace();
            
            System.out.println("Error al convertir puntos o edad a entero: " + e.getMessage());
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvPerro.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
