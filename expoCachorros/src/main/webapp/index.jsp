

<%@page import="com.umariana.expocachorros.ExpoPerros"%>
<%@page import="com.umariana.expocachorros.Perro"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@include file= "templates/header.jsp" %>

   <img src="imagenes/fotico.jpeg" class="img-fluid max-height-100" alt="fotico">  
   <div class="container p-4"> <!-- clase contenedora -->
    <div class="row">
     
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body"> 
                <!-- tarjeta de trabajo -->
                <h3>Agregar nuevo perro</h3>
                <!-- Enctype sirve para subir archivos-->
                <form action="SvPerro" method="POST" enctype="multipart/form-data" > 
                    <!-- Input para el nombre-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="nombre">Nombre</label>
                        <input type="text" name ="nombre" class="form-control" required>
                    </div>                                            
                    <!-- Input para la raza-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Raza</label>
                        <input type="text" name="raza" class="form-control" required>
                    </div>
                    <!-- Input para la foto-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="imagen">Imagen</label>
                        <input type="file" name="imagen" class="form-control"  required>
                    </div>
                    <!-- Input para los puntos-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="puntos">Puntos</label>
                        <select name="puntos" class="form-select" >
                            <option selected>Selecione...</option>
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
                    <!-- Input para la edad-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="edad">Edad</label>
                        <input type="text" name="edad"  class="form-control" required  >
                    </div>
                    <input type="submit" value="Agregar perro" class ="form-control"/>
                </form><br>


                
            </div>    
        </div> 
        <!-- Tabla de datos -->


        <div class="col-md-8">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        
                      </li>
                      <li class="nav-item">
               
                      </li>
                      <li class="nav-item dropdown">
                        
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="#">Edad</a></li>
                          <li><a class="dropdown-item" href="#">puntaje</a></li>
                        </ul>
                      </li>
                    </ul>
                    <form class="d-flex" action="SvPerro" method="GET">
                        <input class="form-control me-2" type="search" name="nombre" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                  </div>
                </div>
              </nav>
            <table class="table table-bordered table-light">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Raza</th>
                        <th>Imagen</th>
                        <th>Puntos</th>
                        <th>Edad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Obtener array list de la solicitud utilizando el método cargarPerros
                        ServletContext context = request.getServletContext();
                        ArrayList<Perro> darPerros = ExpoPerros.cargarPerros(context);

                        // Recorrido de la lista y asignacion de los datos en las casillas
                        if (darPerros != null) {
                            for (Perro perro : darPerros) {
                    %>
                    <tr>
                        <td><%= perro.getNombre()%></td>
                        <td><%= perro.getRaza()%></td>
                        <td><%= perro.getImagen()%></td>
                        <td><%= perro.getPuntos()%></td>
                        <td><%= perro.getEdad()%></td>
                        <td>
                            <!-- Agrega íconos FontAwesome para vista, editar y borrar -->
                           
                            <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= perro.getNombre()%>"><i class="fas fa-eye"></i></a> <!-- Icono de ventana modal -->
                            
                            <a href="#" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#editarModal"
                               data-nombre="<%= perro.getNombre()%>"
                               data-raza="<%= perro.getRaza()%>"
                               data-imagen="<%= perro.getImagen()%>"
                               data-puntos="<%= perro.getPuntos()%>"
                               data-edad="<%= perro.getEdad()%>">
                                <i class="fas fa-pencil-alt"></i>
                            </a>
                            
                            <a href="#" class="btn btn-danger" data-elimniar="<%= perro.getNombre()%>" id="eliminar"><i class="fas fa-trash-alt"></i>  </a> <!-- Icono para editar -->
                            
                        </td>

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

<!-- ventana Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Informacion del Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="perro-details">
                    <!-- Aqui se mostraran los detalles del perro -->
                </div>
            </div>
            <div class="text-aling:center" class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
  <!-- Se editaran los detalles del perro-->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Perro</h5>
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <h6 class="modal-subtitle text-muted" id="exampleModalLabel">
                    Nota: Seleccione la imagen que ya tenía previamente si desea editar otro dato distinto de la imagen, de lo contrario, el proceso no funcionará.
                </h6>
            <div class="modal-body">
                <form action="SvEditarPerro" method="POST" enctype="multipart/form-data">
                  
                    <input type="hidden" name="perro-edit-nombre" id="perro-edit-nombre" value="">


                    <!-- Para la raza del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Raza:</label>
                        <input type="text" name="raza" id="editar-raza" class="form-control">
                    </div>
                    <!-- Input para la foto (imagen actual del perro) -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="imagen">Imagen:</label>
                        <input type="file" name="imagen" class="form-control" id="imagen-perro-editar" required>
                    </div>
                    <!-- Para la puntuación del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="puntos">Puntos:</label>
                        <select name="puntos" class="form-select" id="editar-puntos">
                            <option selected>Seleccione...</option>
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
                            <!-- Agrega todas las opciones necesarias aqu? -->
                        </select>
                    </div>
                    <!-- para la edad con el valor actual del perro -->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="edad">Edad:</label>
                        <input type="text" name="edad" id="editar-edad" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    // Muestra los datos en la ventana modal
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var nombre = button.data('nombre'); // Se obtiene el nombre del perro

   
        $.ajax({
            url: 'SvPerro?nombre=' + nombre, 
            success: function (data) {
                // Actualiza el contenido con los detalles del perro
                $('#perro-details').html(data);
            },
            error: function () {
                // Indica que hay algun error
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });

</script>
<script>
    $('#eliminar').click(function(){
                
                var nombre = $(this).data('elimniar');// Obtén el nombre del perro

                // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
                $.ajax({
                    url: 'SvEliminar?nombre=' + nombre,
                    method: 'POST',
                    success: function () {

                    window.location.href = 'index.jsp';
                    },
                    error: function () {

                         }
                });
            });
</script>

<script>
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Este Boton desencadena el evento
        var nombre = button.data('nombre'); // Obton del nombre del perro
        var raza = button.data('raza'); // Obton para la raza del perro
        var imagen = button.data('imagen'); // Obton para la imagen del perro
        var puntos = button.data('puntos'); // Obton de los puntos del perro
        var edad = button.data('edad'); // Obton la edad del perro

        $('#perro-edit-nombre').val(nombre);
        $('#editar-raza').val(raza);
        $('#editar-puntos').val(puntos);
        $('#editar-edad').val(edad);
      



        $('#imagen-perro-editar').attr('src', './imagenes/' + imagen);
    });
</script>



<%@include file= "templates/fooder.jsp" %>