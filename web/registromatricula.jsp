<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DATOS MATRICULA</title>
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
        <style>
            body {background-image: url("imagenes/fondito1.jpg");
                  background-repeat: no-repeat;
                  background-size: cover;        
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <%! 
        //Definicion de variables
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
        String s_accion;
        String s_idmatricula;
        String s_semestre;
        String s_estudiante;
        String s_carrera;
        String s_curso;
        %>
    </head>
    <body>
        <%  
             try {  
                ConectaBd bd = new ConectaBd();     
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idmatricula = request.getParameter("f_idmatricula");
                if ( s_accion != null && s_accion.equals("M1")){
                    consulta = " SELECT semestre , idestudiante , idcarrera, idcurso "
                            + " FROM matricula "
                            + " where idmatricula = "+ s_idmatricula;
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        <form name="EditarMatriculaForm" action="registromatricula.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-2" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Editar Matricula</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important">Semestres: </td>
                        <td><input type="text" name="f_semestre" value="<% out.print(rs.getString(1)); %>" maxlength="6" size="25" /></td>
                    </tr>

                    <tr>
                        <td style="background-color: #ffffff !important">Estudiante : </td>
                        <td><input type="text" name="f_estudiante" value="<% out.print(rs.getString(2)); %>" maxlength="30" size="25"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Curso: </td>
                        <td><input type="text" name="f_curso" value="<% out.print(rs.getString(3)); %>" maxlength="24" size="20"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Carrera: </td>
                        <td><input type="text" name="f_carrera" value="<% out.print(rs.getString(4)); %>" maxlength="24" size="20"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idmatricula" value="<%out.print(s_idmatricula);%>" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>            
        <%
           }
        }else{ 
        %>           
        <form name="AgregarMatriculaForm" action="registromatricula.jsp" method="GET">
            <table border="1" cellspacing="0" cellpadding="" align="center" class="table col-3" style="font-size: 12px; margin-top:30px !important">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center" colspan="2">Agregar Matricula</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="background-color: #ffffff !important">Semestre: </td>
                        <td><input type="text" name="f_semestre" value="" maxlength="6" size="25" /></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Estudiante: </td>
                        <td><input type="text" name="f_estudiante" value="" maxlength="30" size="25"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Curso: </td>
                        <td><input type="text" name="f_curso" value="" maxlength="24" size="20"/></td>
                    </tr>
                    <tr>
                        <td style="background-color: #ffffff !important">Carrera: </td>
                        <td><input type="text" name="f_carrera" value="" maxlength="24" size="20"/></td>
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
                    <th colspan="7" >Datos Matricula</th>
                </tr>    
            <th class="text-center">#</th>
            <th class="text-center">Semestre</th>
            <th class="text-center">Estudiante</th>
            <th class="text-center">Curso</th>
            <th class="text-center">Carrera</th>
            <th class="text-center" colspan="2">Acciones</th>
        </thead>   
        <% 
                if (s_accion !=null) {
                    if (s_accion.equals("E")) {
                        try{
                        consulta =        " delete from matricula "
                                        + " where  "
                                        + " idmatricula = " + s_idmatricula  +";";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                        catch(Exception e){
                            
                            out.print("<script>alert('¡ERROR!')</script>");
                       
                        }   
                }else if(s_accion.equals("C")){
                            s_semestre = request.getParameter("f_semestre");
                            s_estudiante = request.getParameter("f_estudiante");
                            s_carrera = request.getParameter("f_carrera");
                            s_curso = request.getParameter("f_curso");
                            
                            consulta =    " insert into "
                                        + " matricula (semestre, idestudiante , idcarrera , idcurso)"
                                        + " values('"+ s_semestre +"','"+ s_estudiante +"','"+ s_carrera +"','"+ s_curso+"');  ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                            s_semestre = request.getParameter("f_semestre");
                            s_estudiante = request.getParameter("f_estudiante");
                            s_carrera = request.getParameter("f_carrera");
                            s_curso = request.getParameter("f_curso");
                            consulta =  "   update matricula  "
                                        + " set  "
                                        + " semestre = '"+ s_semestre +"', "
                                        + " idestudiante = '" + s_estudiante + "', "
                                        + " idcarrera = '" + s_carrera + "', "
                                        + " idcurso = '" + s_curso + "'  "
                                        + " where"
                                        + " idmatricula = " + s_idmatricula+ "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();     
                    }
                }
                consulta = " SELECT mat.idmatricula , mat.semestre ,est.nombre , cur.nombre , car.nombre "
                        + " FROM matricula as mat , estudiante as est , " 
                        + " curso as cur , carrera as car where mat.idestudiante = est.idestudiante "
                        + " and mat.idcurso = cur.idcurso and mat.idcarrera = car.idcarrera order by idmatricula" ;
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
            <td><%out.print(rs.getString(5));%></td> 
            <td style="background-color: #ea3e36"><a style="text-decoration: none;color:white" href="registromatricula.jsp?f_accion=E&f_idmatricula=<%out.print(ide);%>"><i class='bx bx-trash'></i> </a></td>
            <td style="background-color: #1080be"><a style="text-decoration: none;color:white" href="registromatricula.jsp?f_accion=M1&f_idmatricula=<%out.print(ide);%>"><i class='bx bx-edit-alt'></i> </a></td>
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
