<%@include  file="lib/header.jsp" %>   
<%@page import="java.util.List"%>
<%@page import="mundo.Valoracion"%>
d
<h3>Sistema gestion de Valoraciones</h3> 
<div class="container p-8">
    <div class="row">
<h3>Sistema gestion de Valoraciones</h3> 

        <div class="col-md-4">
            <div class="card card-body">
                <form action="sv_receptor " method="POST">
                    <label>Nombre:</label>
                    <input class="form-control" type="text" id="nombre" name="nombre"><br>
                    <label>Fecha:</label>
                    <input class="form-control" type="date" id="fecha" name="fecha"><br>
                     <label>Correo:</label>
                    <input class="form-control" type="text" id="correo" name="correo"><br>
                    <label>Negocio:</label>
                     <select class="form-control" name="negocio">
                    <option id="0">Seleccione</option>
                    <option id="1">Mr.Pollo</option>
                    <option id="2">LA MERCED</option>
                </select><br>
                <label for="puntuacion">Puntuacion:</label>
                <select class="form-control" name="puntuacion">
                    <option id="1">1</option>
                    <option id="2">2</option>
                    <option id="3">3</option>
                    <option id="4">4</option>
                    <option id="5">5</option>
                    <option id="6">6</option>
                    <option id="7">7</option>
                    <option id="8">8</option>
                    <option id="9">9</option>
                    <option id="10">10</option>
                </select><br>
                <input class="form-control btn btn-success btn-block" type="submit" value="Evaluar">
                </form>
            </div>
        </div>
            <div class="col-md-8">
            <div class="card card-body">
                <a href="index.jsp">Agregar nueva valoración</a> 
                <table border="1">  
                    <thead>  
                      <tr>
                          <th>Nombre</th> 
                          <th>Fecha</th>
                          <th>Correo</th>
                          <th>Negocio</th>
                          <th>Puntuacion</th>
                          <th>Acciones</th>
                      </tr>
                    <thead> 
                    <thead>
                    <tbody>
                    <%
                     //obtener la lista de valoraciones
                     List<Valoracion>listaValoracion=(List<Valoracion>)request.getAttribute("listaValoracion");
                     //verificar
                     if(listaValoracion!=null){
                         for(Valoracion v:listaValoracion){%>
                         <tr>  
                         <td><%= v.getNombre()%></td>     
                         <td><%= v.getFecha()%></td>
                         <td><%= v.getCorreo()%></td>
                         <td><%= v.getNegocio()%></td>
                         <td><%= v.getPuntuacion()%></td>
                         <td>
                             <a class="btn btn-secondary" href="sv_editarVal?id"<%= v.getCorreo()%>><i class="fa-solid fa-marker"></i></a>
                             <a class="btn btn-danger" href="sv_borrarVal?id"<%= v.getCorreo()%>><i class="fa-solid fa-trash"></i></a>
                             <a class="btn btn-success" href="sv_verVal?id"<%= v.getCorreo()%>><i class="fa-solid fa-eye"></i></a>
                         </td>
                      </tr>                      
                       <% }
                        }else{
                       %>
                       <tr> 
                           <td colspan="6">No hay datos que mostar</td>
                       </tr>
                       <%}%>
     
                    
                    </tbody>  
                </table>       
            </div>
        </div>
    </div>
</div>
<%@include file="lib/footer.jsp" %>