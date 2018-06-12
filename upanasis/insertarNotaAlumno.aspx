<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertarNotaAlumno.aspx.cs" Inherits="upanasis.insertarNotaAlumno" %>

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

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>

    <script>
        $(document).ready(function () {
            //LOGIN
            if (sessionStorage.getItem("username") == null && sessionStorage.getItem("userpassword") == null) {
                window.location.href = "logindocente.aspx";
            };

            $('#btnCerrarSesionDocente').click(function () {
                sessionStorage.removeItem("username");
                sessionStorage.removeItem("userpassword");

                console.log(sessionStorage.getItem("username"));
                console.log(sessionStorage.getItem("userpassword"));

                location.reload();
            });
            //FIN LOGIN
        });

    </script>

</body>
</html>
