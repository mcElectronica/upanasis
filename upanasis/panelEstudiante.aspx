<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panelEstudiante.aspx.cs" Inherits="panelEstudiante" %>

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
            <a class="nav-link" href="#">Estudiante</a>
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
       <h3 id="est"></h3>
        <br /> 
        <div class="row">
        <div class="col">
          <select id="selectUnidad" class="form-control">
              <option>Seleccione Unidad</option>
              <option value="PRIMERA">PRIMERA</option>
              <option value="SEGUNDA">SEGUNDA</option>
              <option value="TERCERA">TERCERA</option>
              <option value="CUARTA">CUARTA</option>
            </select>
        </div>
      </div>
        <br />
        <form id="contenidoNotas">
          
        </form>
    </div>

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>

    <script>
        $(document).ready(function () {

            var unidad;

            //LOGIN
            if (sessionStorage.getItem("username") == null && sessionStorage.getItem("userpassword") == null) {
                window.location.href = "loginestudiante.aspx";
            };

            $('#btnCerrarSesionDocente').click(function () {
                sessionStorage.removeItem("username");
                sessionStorage.removeItem("userpassword");

                location.reload();
            });
            //FIN LOGIN


            $('#est').html(localStorage.getItem("Username"));

            $('#selectUnidad').change(function () {
                unidad = $(this).val();
                $('#contenidoNotas').html("");

                //ver notas
                var parametros = { "idUser": localStorage.getItem("Userid"), "unidad": unidad };
                $.ajax({
                    type: "POST",
                    url: "servicio.asmx/verNotas",
                    data: JSON.stringify(parametros),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $.each(response.d, function (i, item) {
                            $('#nombreAlumno').html(item.user);
                            $('#contenidoNotas').append(
                                    "<div class='form-group row'>" +
                                        "<label for='inputNota' class='col-sm-2 col-form-label'>" + item.CursoAsignado + "</label>" +
                                        "<div class='col-sm-10'>" +
                                         "<label for='inputNota' class='col-sm-2 col-form-label'>" + item.valor + "</label>" +
                                        "</div>" +
                                      "</div>"
                                );


                        });
                    },
                    error: function (r) {

                    },
                    failure: function (r) {

                    }
                });//fin select grado
            });

        });

     </script>
</body>
</html>
