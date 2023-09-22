<%-- 
    Document   : agregarPerro
    Created on : 20/09/2023, 4:50:03 p. m.
    Author     : Sistemas
--%>
<style>
    /* styles.css */
/* Estilos para el formulario */
.form-control {
    margin-bottom: 10px;
}

/* Estilos para la tabla */
.table {
    width: 100%;
}

/* Estilos para el encabezado de la tabla */
.table thead {
    background-color: #f5f5f5;
}
</style>
   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "templates/header.jsp" %>
<!-- Image and text -->
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="imagenes/perros.jpg" width="880" height="100" class="d-inline-block align-top" alt="">
 
  </a>
</nav>
        
        <div class = "container text-center">  <!-- clase contenedora --> 
            <h1>Exposicion Canina</h1>
            <div class = "row"  > <!-- clase row  -->
                <div class = "col"  >
                <div class = "card card-body"> <!-- targeta de trabajo -->
                   <form action="SvVideo" method="POST">         
            
                    <label for="nombre">Nombre:</label>
                    <input type="text" name="nombre" class = "form-control"><br>

                    <label for="raza">Raza:</label>
                    <input type="text" name="raza" class = "form-control"><br>

                    <label for="imagen">Imagen:</label>
                    <input type="text" name="imagen" class = "form-control"><br>
                    
                    <label for="puntos">Puntos:</label>
                    <input type="text" name="puntos" class ="form-control"><br>

                    <label for="edad">Edad:</label>
                    <input type="text" name="edad" class ="form-control"><br>


                    <input type="submit" value="Agregar perro" class ="form-control">
                </form>  
                <a href="index.jsp">Volver al menu</a> 
                </div>
            </div>
            
                
                
            <div class = "col-md-8"  >
                <table class="table table-bordered">
                    <thead><!-- comment -->
                        <tr><!-- comment -->
                            <th> Nombre </th>
                            <th> Raza </th>
                            <th> Imagen </th>
                            <th> Puntos </th>
                            <th> Edad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>  </td>
                            <td> </td>
                            <td> </td>
                            <td>  </td>
                            <td>  </td>
                            
                        </tr>
                                                <tr>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            
                        </tr>
                                                <tr>
                            <td> </td>
                            <td> </td>
                            <td>  </td>
                            <td>  </td>
                            <td>  </td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
<form>
  
            
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>            
 <%@include file= "templates/footer.jsp" %>