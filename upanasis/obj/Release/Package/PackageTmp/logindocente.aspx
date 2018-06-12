<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logindocente.aspx.cs" Inherits="logindocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <link href="css/estilologin.css" rel="stylesheet" />
    <title>Inicio Sesion Docente</title>
</head>
<body>
    
   <form class="form-horizontal" action="panelDocente.aspx">
  <div class="form-group">
    <label class="control-label" for="email">Usuario:</label>
    <input type="email" class="form-control" id="txtUsuarioDocente"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="pwd" >Contrasenia:</label>
    <input type="password" class="form-control" id="pwdDocente"/>
  </div>
  <div class="checkbox">
    <label class="control-label"><input type="checkbox"/> Recuerdame</label>
  </div>
       <div class="checkbox">
       <a class="control-label" href="registro.aspx">NO tienes cuenta aun? Registrate Aqui</a>
  </div>
  <button id="btnLoginDocente" type="button" class="btn btn-primary btn-lg btn-block">Iniciar</button>
</form> 
    
    <script src="js/jquery-3.3.1.min.js"></script>

    <script>
        $(function() {

            $('#btnLoginDocente').click(function () {

                var parametros = { "us": $('#txtUsuarioDocente').val(), "pas": $('#pwdDocente').val(), "ti": 1};
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

                        if ($('#txtUsuarioDocente').val() == sessionStorage.getItem("username") &&
                        $('#pwdDocente').val() == sessionStorage.getItem("userpassword")) {
                            window.location.href = "panelDocente.aspx";
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
