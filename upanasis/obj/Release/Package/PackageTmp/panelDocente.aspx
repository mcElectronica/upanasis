<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panelDocente.aspx.cs" Inherits="panelDocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/seleccionuser.css" rel="stylesheet" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">Sistema de Notas Upana</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          
          <li class="nav-item">
            <a class="nav-link" href="#">Docente</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <button class="btn btn-primary btn-lg btn-block" id="btnCerrarSesionDocente" type="button">Cerrar Sesion</button>
        </form>
      </div>
    </nav>
    <br />
    <br />
    <div id="contenedor" class="container-fluid">
      <div class="row">
        <div class="col">
          <select id="selectCarrera" class="form-control">
              <option>Seleccione Carrera</option>
            </select>
        </div>
        <div class="col">
          <select id="selectGrado" class="form-control">
              <option>Seleccione Grado</option>
            </select>
        </div>
      </div>
        <br />
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Apellido</th>
              <th scope="col">Asignar Notas</th>
            </tr>
          </thead>
          <tbody id="bodyTable">
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Otto</td>
              <td>@mdo</td>
            </tr>
          </tbody>
        </table>
    </div>

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>

    <script>
        $(document).ready(function () {
            var carrera;
            var grado;
            var cuerpoTable;
            var countfile;

            //LOGIN
            if(sessionStorage.getItem("username") == null && sessionStorage.getItem("userpassword") == null) {
                window.location.href="logindocente.aspx";
            };

            $('#btnCerrarSesionDocente').click(function () {
                sessionStorage.removeItem("username");
                sessionStorage.removeItem("userpassword");

                console.log(sessionStorage.getItem("username"));
                console.log(sessionStorage.getItem("userpassword"));

                location.reload();
            });
            //FIN LOGIN

            //llenar select carrera
            $.ajax({
                type: "POST",
                url: "servicio.asmx/getCarrera",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    $.each(response.d, function (i, item) {
                        $('#selectCarrera').append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    
                },
                error: function (r) {

                },
                failure: function (r) {

                }
            });// fin select carrera

            $('#selectCarrera').change(function () {
                $('#selectGrado').html("<option selected>Seleccionar Grado</option>");
                carrera = $(this).val();
                console.log("Carrera: " + carrera);
                //llenar select grado
                var parametros = { "id": carrera};
                $.ajax({
                    type: "POST",
                    url: "servicio.asmx/getGrado",
                    data: JSON.stringify(parametros),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $.each(response.d, function (i, item) {
                            $('#selectGrado').append('<option value="' + item.id + '">' + item.nombre + '</option>');
                        });

                    },
                    error: function (r) {

                    },
                    failure: function (r) {

                    }
                });//fin select grado
            });

            $('#selectGrado').change(function () {
                $('#bodyTable').html("");
                grado = $(this).val();
                console.log("Grado: " + grado);
                var parametros = { "idGrado": grado };
                //llevar tabla de Alumnos
                $.ajax({
                    type: "POST",
                    url: "servicio.asmx/listAlumnos",
                    data: JSON.stringify(parametros),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        countfile = 1;
                        $.each(response.d, function (i, item) {
                            cuerpoTable = "<tr>" +
                                              "<th scope='row'>"+countfile+"</th>" +
                                              "<td>"+item.pnombre + item.snombre+"</td>" +
                                              "<td>"+item.papellido + item.sapellido+"</td>" +
                                              "<td><a href='" + item.id + "' type='button' class='btnNota btn btn-outline-secondary'>Agregar Notas</a></td>" +
                                              "<td><a href='" + item.id + "' type='button' class='btnVerNota btn btn-outline-secondary'>Ver Notas</a></td>" +
                                            "</tr>";
                            $('#bodyTable').append(cuerpoTable);
                            countfile++;
                        });

                        $('.btnNota').click(function (event) {
                            event.preventDefault();
                            var iduser = $(this).attr('href');
                            console.log("id: " + iduser);
                            localStorage.setItem("Userid", iduser);

                            //cambio de contenido 
                            $.ajax({
                                mimeType: 'text/html; charset=utf-8',
                                type: "GET",
                                url: "agregarNotaAlumno.aspx",
                                contentType: "application/json; charset=utf-8",
                                dataType: "html",
                                async: true,
                                success: function (response) {
                                    console.log(response);
                                    $('#contenedor').html(response);

                                },
                                error: function (r) {

                                },
                                failure: function (r) {

                                }
                            });//fin cambio de contenido

                            
                        });

                        $('.btnVerNota').click(function (event) {
                            event.preventDefault();
                            var iduser = $(this).attr('href');
                            console.log("id: " + iduser);
                            localStorage.setItem("Userid", iduser);

                            //cambio de contenido 
                            $.ajax({
                                mimeType: 'text/html; charset=utf-8',
                                type: "GET",
                                url: "verNotas.aspx",
                                contentType: "application/json; charset=utf-8",
                                dataType: "html",
                                async: true,
                                success: function (response) {
                                    console.log(response);
                                    $('#contenedor').html(response);

                                },
                                error: function (r) {

                                },
                                failure: function (r) {

                                }
                            });//fin cambio de contenido


                        });

                    },
                    error: function (r) {

                    },
                    failure: function (r) {

                    }
                });//fin llenar table de Alumnos
            });
            
        });

    </script>

</body>
</html>
