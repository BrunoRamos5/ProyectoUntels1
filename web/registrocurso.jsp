<%-- 
    Document   : registrocurso
    Created on : 26/07/2020, 03:48:43 AM
    Author     : Usuario
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Curso</title>
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
        String s_idcurso;
        String s_codigo_curso;
        String s_nombre;
        String s_horas;
        String s_creditos;
        String s_estado;

        %>
    </head>
    <body>
        
        <%  
             try {
            
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcurso = request.getParameter("f_idcurso");
                if ( s_accion != null && s_accion.equals("M1")){
                    consulta = "select codigo_curso, nombre, horas, creditos, estado "
                            + " from curso"
                            + " where "
                            + " idcurso = " + s_idcurso;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
              
                    %>
                    
         <form name="EditarCursoForm" action="registrocurso.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-2" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Editar Curso</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important"> Codigo_Curso: </td>
                        <td><input type="text" name="f_codigo_curso" value=" <% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important"> Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="25"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Horas: </td>
                        <td><input type="text" name="f_horas" value="<% out.print(rs.getString(3)); %>" maxlength="9" size="15"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Creditos: </td>
                        <td><input type="text" name="f_creditos" value="<% out.print(rs.getString(4)); %>" maxlength="12" size="8"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idcurso" value="<%out.print(s_idcurso);%>" />
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>            
         <%
          
            }
         }else{ 

        %>           
                    
        <form name="AgregarCursoForm" action="registrocurso.jsp"method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-2" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Agregar Curso</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important">Codigo_Curso: </td>
                        <td><input type="text" name="f_codigo_curso" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="40" size="25"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Horas: </td>
                        <td><input type="text" name="f_horas" value="" maxlength="9" size="15"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Creditos: </td>
                        <td><input type="text" name="f_creditos" value="" maxlength="12" size="8"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
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
                <th colspan="8" >Datos Curso</th>
            </tr>    
                <th class="text-center">#</th>
                <th class="text-center">Codigo_Curso</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Horas</th>
                <th class="text-center">Creditos</th>
                <th class="text-center">Estado</th>
                <th class="text-center" colspan="2">Acciones</th>
                
            </thead>   
        <%
                 if (s_accion !=null) {
                    if (s_accion.equals("E")) {
                        try{
                        consulta =    " delete from curso "
                                        + " where  "
                                        + " idcurso = " + s_idcurso +"; ";
                            out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                        catch(Exception e){
                            
                            out.print("<script>alert('¡ERROR!')</script>");
                       
                        }   
                }else if(s_accion.equals("C")){
                            s_codigo_curso = request.getParameter("f_codigo_curso");
                            s_nombre = request.getParameter("f_nombre");
                            s_horas = request.getParameter("f_horas");
                            s_creditos = request.getParameter("f_creditos");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =    " insert into "
                                        + " curso (codigo_curso, nombre, horas, creditos, estado)"
                                        + " values('"+ s_codigo_curso +"','"+ s_nombre +"','"+ s_horas +"','"+ s_creditos +"','"+s_estado+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                            s_codigo_curso = request.getParameter("f_codigo_curso");
                            s_nombre = request.getParameter("f_nombre");
                            s_horas = request.getParameter("f_horas");
                            s_creditos = request.getParameter("f_creditos");
                            s_estado = request.getParameter("f_estado");
                            consulta =  "   update curso "
                                        + " set  "
                                        + " codigo_curso = '"+ s_codigo_curso +"', "
                                        + " nombre = '" + s_nombre + "', "
                                        + " horas = '" + s_horas + "', "
                                        + " creditos = '" + s_creditos + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idcurso = " + s_idcurso + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                }
                }
            
                
                consulta = " Select idcurso, codigo_curso, nombre, horas, creditos, estado "
                        + " from curso";
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String idc;
        
                while (rs.next()){
                idc = rs.getString(1);
                num++;
        %>         
        <tr style="background-color: #ffffff !important">
            <td><%out.print(num);%></td> 
            <td><%out.print(rs.getString(2));%></td> 
            <td><%out.print(rs.getString(3));%></td> 
            <td><%out.print(rs.getString(4));%></td> 
            <td><%out.print(rs.getString(5));%></td> 
            <td><%out.print(rs.getString(6));%></td> 
            <td style="background-color: #ea3e36"><a style="text-decoration: none;color:white" href="registrocurso.jsp?f_accion=E&f_idcurso=<%out.print(idc);%>"><i class='bx bx-trash'></i></a></td>
            <td style="background-color: #1080be"><a style="text-decoration: none;color:white" href="registrocurso.jsp?f_accion=M1&f_idcurso=<%out.print(idc);%>"><i class='bx bx-edit-alt'></i></a></td>
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
