\<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registro.aspx.cs" Inherits="registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <link href="css/estilologin.css" rel="stylesheet" />
    <title>Registro Estudiante</title>
</head>
<body>
    <form class="form-horizontal" action="#">
  <div class="form-group">
    <label class="control-label" for="nombre">Primer Nombre:</label>
    <input type="text" class="form-control" id="pnombre"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="snombre">Segundo Nombre:</label>
    <input type="text" class="form-control" id="snombre"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="papellido">Primer Apellido:</label>
    <input type="text" class="form-control" id="papellido"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="snombre">Segundo Apellido:</label>
    <input type="text" class="form-control" id="sapellido"/>
  </div>
  
  <div class="form-group">
    <label class="control-label" for="email">Correo Electronico</label>
    <input type="email" class="form-control" id="email"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="pwd">Usuario:</label>
    <input type="text" class="form-control" id="user"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="pwd">Contrasenia:</label>
    <input type="password" class="form-control" id="pass"/>
  </div>
  <div class="checkbox">
    <label class="control-label"><input type="checkbox"/> Recuerdame</label>
  </div>
  <button id="btnRegistro" type="button" class="btn btn-primary btn-lg btn-block">Registrarme</button>
</form> 
    <script src="js/jquery-3.3.1.min.js"></script>

    <script>
        $(function() {

            $('#btnRegistro').click(function () {

                var parametros = {
                    "pnombre": $('#pnombre').val(),
                    "snombre": $('#snombre').val(),
                    "papellido": $('#papellido').val(),
                    "sapellido": $('#sapellido').val(),
                    "email": $('#email').val(),
                    "tipo": 2,
                    "user": $('#user').val(),
                    "pass": $('#pass').val(),

                };
                $.ajax({
                    type: "POST",
                    url: "servicio.asmx/insertarUsuario",
                    data: JSON.stringify(parametros),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        console.log("registrado correctamente");
                        window.location.href = "loginestudiante.aspx";
                    },
                    error: function (r) {

                    },
                    failure: function (r) {

                    }
                });
            });
        });
    
    </script>
</body>
</html>
