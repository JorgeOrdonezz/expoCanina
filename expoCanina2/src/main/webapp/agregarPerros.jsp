<%@page import="com.mycompany.expocanina2.ExposicionPerros"%>
<%@page import="com.mycompany.expocanina2.Perro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<%@include file= "templates/header.jsp" %>
        
 <!--author:Jorge Andres, Leidy Cuasquer, Valentina Peñafiel.-->
 
 <!--para la imagen de los perros se debe usar una barra de boostrap-->
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="imagenes/perros.jpg" width="875" height="150" class="d-inline-block align-top" alt="">    
  </a>
</nav>

 <!--toda esta parte trata acerca de la tabla y sus columnas-->
        <div class="container p-4"> 
            <div class="row">
            <div class="col-md-4">  
                <div class="card card-body"> 
                
             <!--todo el codigo de aqui en adelante sirve para registrar los datos del perro-->
                    <h3>Insertar nuevo perro</h3>
                  <form action="svPerros" method="POST">         
                    <!--espacio para agregar el nombre del perro-->
                    <div class="input-group mb-3">
                      <label class="input-group-text" for="nombre">Nombre:</label>
                      <input type="text" name ="nombre" class="form-control">
                    </div>                                            
                 
                      <div class="input-group mb-3">
                      <label class="input-group-text" for="raza">Raza:</label>
                      <input type="text" name="raza" class="form-control">
                    </div>
                   
                      <div class="input-group mb-3">
                      <label class="input-group-text" for="imagen">Imagen:</label>
                      <input type="text" name="imagen" class="form-control"  >
                    </div>
                                   
                          <div class="input-group mb-3">
                      <label class="input-group-text" for="puntos">Puntos:</label>
                        <select name="puntos" class="form-select" >
                          <option selected>0</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>                          
                        </select>                  
                       </div>
                     
                      <div class="input-group mb-3">
                      <label class="input-group-text" for="edad">Edad:</label>
                      <input type="text" name="edad"  class="form-control"   >
                    </div>
                      <!-- esta es la parte para tener un boton que agregue a la lista todos los datos del perro --> 
                      <input type="submit" value="Agregar perro" class ="form-control"</>
                </form><br>
                
                
                <a href="index.jsp">Volver al Menu</a> 
                </div>    
            </div> 
             
                
                <!-- LO anterior ingresado se guarda en la lista de acá -->
            <div class="col-md-8">
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>foto</th>
                            <th>Puntos</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                             
                                ServletContext context = request.getServletContext();
                                ArrayList<Perro> darPerros = ExposicionPerros.cargarPerros(context);

                                
                                if (darPerros != null) {
                                    for (Perro perro : darPerros) { %>
                            <tr>
                                <td><%= perro.getNombre() %></td>
                                
                                <td><%= perro.getRaza() %></td>
                                
                                <td><%= perro.getImagen() %></td>
                                
                                <td><%= perro.getPuntos() %></td>
                                
                                <td><%= perro.getEdad() %></td>
                                <td></td>
                                
                            </tr>
                            <%
                                }
                                }
                            %>
                       </tbody> 
                       </table>
                </div>
               </div>  
            </div>    
       <%@include file= "templates/footer.jsp" %>