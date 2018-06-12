<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginestudiante.aspx.cs" Inherits="loginestudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <link href="css/estilologin.css" rel="stylesheet" />
    <title>Inicio Sesion Estudiante</title>
</head>
<body>
     <form class="form-horizontal">
      <div class="form-group">
        <label class="control-label" for="email">usuario:</label>
        <input type="text" class="form-control" id="txtUsuarioEstudiante"/>
      </div>
      <div class="form-group">
        <label class="control-label" for="pwd">Contrasenia:</label>
        <input type="password" class="form-control" id="pwd"/>
      </div>
      <div class="checkbox">
        <label class="control-label"><input type="checkbox"/> Recuerdame</label>
      </div>
             <div class="checkbox">
           <a class="control-label" href="registro.aspx">NO tienes cuenta aun? Registrate Aqui</a>
      </div>
      <button id="btnLoginEstudiante" type="button" class="btn btn-primary btn-lg btn-block">Iniciar</button>
    </form>
     
    
    <script src="js/jquery-3.3.1.min.js"></script>

    <script>
        $(function() {

            $('#btnLoginEstudiante').click(function () {

                var parametros = { "us": $('#txtUsuarioEstudiante').val(), "pas": $('#pwd').val(), "ti": 2};
                $.ajax({
                    type: "POST",
                    url: "servicio.asmx/RegistroAlumno",
                    data: JSON.stringify(parametros),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        $.each(response.d, function (i, item) {
                            sessionStorage.setItem("username", item.user);
                            sessionStorage.setItem("userpassword", item.pass);
                           

                        });
                        
                        console.log(sessionStorage.getItem("username"));
                        console.log(sessionStorage.getItem("userpassword"));

                        if ($('#txtUsuarioEstudiante').val() == sessionStorage.getItem("username") &&
                        $('#pwd').val() == sessionStorage.getItem("userpassword")) {
                            window.location.href = "panelEstudiante.aspx";
                        } else {
                            console.log("nombre y contrase;a invalidos");
                        }
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
