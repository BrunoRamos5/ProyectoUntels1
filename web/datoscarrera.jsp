<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <style>
        body {background-image: url("imagenes/fondito1.jpg");
              background-repeat: no-repeat;
              background-size: cover;        
     
        }
        
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <%! 
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
        String s_accion;
        String s_idcarrera;
        String s_nombre;
        String s_encargado;
        String s_telefono;

        %>
    </head>
    <body>
        
        <%  
             try {
            
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcarrera = request.getParameter("f_idcarrera");
                if ( s_accion != null && s_accion.equals("M1")){
                    consulta = " select nombre, encargado, telefono "
                            + " from carrera "
                            + " where "
                            + " idcarrera = " + s_idcarrera;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
              
                    %>
                    
         <form name="EditarCarreraForm" action="datoscarrera.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-2" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Editar Carrera</th>                      
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important">Nombres: </td>
                        <td><input type="text" name="f_nombre" value=" <% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Encargado: </td>
                        <td><input type="text" name="f_encargado" value=" <% out.print(rs.getString(2)); %>" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Telefono: </td>
                        <td><input type="text" name="f_telefono" value=" <% out.print(rs.getString(3)); %>" maxlength="30" size="25" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idcarrera" value="<%out.print(s_idcarrera);%>" />
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>            
         <%
          
            }
         }else{ 

        %>           
                    
               
        
        <form name="AgregarEstudianteForm" action="datoscarrera.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-2" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Agregar Estudiante</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important">Nombres: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Encargado: </td>
                        <td><input type="text" name="f_encargado" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Telefono: </td>
                        <td><input type="text" name="f_telefono" value="" maxlength="30" size="25" /></td>
                    </tr>                   
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                                                   
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
            
         } 

        %>
        
        <table border="1" cellspacing="0" cellpadding="" align="center" class="table text-center col-7" style="font-size: 12px; margin-top:30px !important">
            <thead class="thead-dark">
            <tr>
                <th colspan="6" >Datos Carrera</th>
            </tr>    
                <th class="text-center">#</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Encargado</th>
                <th class="text-center">Telefono</th>
                <th class="text-center" colspan="2">Acciones</th>
                
            </thead>   
        <%

                if (s_accion !=null) {
                    if (s_accion.equals("E")) {
                            consulta =    " delete from carrera "
                                        + " where  "
                                        + " idcarrera = " + s_idcarrera +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    
                }else if(s_accion.equals("C")){
                            s_nombre = request.getParameter("f_nombre");
                            s_encargado = request.getParameter("f_encargado");
                            s_telefono = request.getParameter("f_telefono");
                                                       
                            consulta =    " insert into "
                                        + " carrera (nombre, encargado, telefono)"
                                        + " values('"+ s_nombre +"','"+ s_encargado +"','"+ s_telefono +"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_encargado = request.getParameter("f_encargado");
                            s_telefono = request.getParameter("f_telefono");
                            consulta =  "   update carrera  "
                                        + " set  "
                                        + " nombre = '"+ s_nombre + "', "
                                        + " encargado = '"+ s_encargado +"', "
                                        + " telefono = '"+ s_telefono +"' "
                                        + " where "
                                        + " idcarrera = " + s_idcarrera + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                }
               
                consulta = " Select idcarrera, nombre, encargado, telefono "
                        + " from carrera";
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
        
                while (rs.next()){
                ide = rs.getString(1);
                num++;
        %>         
        <tr style="background-color: #ffffff !important">
            <td><%out.print(num);%></td>
            <td><%out.print(rs.getString(2));%></td> 
            <td><%out.print(rs.getString(3));%></td> 
            <td><%out.print(rs.getString(4));%></td> 
            <td style="background-color: #ea3e36"><a style="text-decoration: none;color:white" href="datoscarrera.jsp?f_accion=E&f_idcarrera=<%out.print(ide);%>"><i class='bx bx-trash'></i></a></td>
            <td style="background-color: #1080be"><a style="text-decoration: none;color:white" href="datoscarrera.jsp?f_accion=M1&f_idcarrera=<%out.print(ide);%>"><i class='bx bx-edit-alt'></i></a></td>
        </tr>
                    
        <% 
                }
                    rs.close();
                    pst.close();
                    cn.close();
            }catch(Exception e){
                out.print("ERROR SQL");
            }
         %>
    </table>
    </body>
</html>
