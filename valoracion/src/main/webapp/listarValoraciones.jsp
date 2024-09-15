<%@page import="java.util.List"%>
<%@page import="mundo.Valoracion"%>
<%@include  file="lib/header.jsp" %>

<h3>Sistema gestion de Valoraciones</h3> 
<div class="container p-8">
    <div class="row">
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
                         <td>Editar Borrar</td>
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