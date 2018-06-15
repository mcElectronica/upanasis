<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registroDocente.aspx.cs" Inherits="registroDocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <label class="control-label" for="pwd">Contrasenia:</label>
    <input type="password" class="form-control" id="pwd"/>
  </div>
  <div class="form-group">
    <label class="control-label" for="pwd">Repetir Contrasenia:</label>
    <input type="password" class="form-control" id="pwd1"/>
  </div>
  <div class="checkbox">
    <label class="control-label"><input type="checkbox"/> Recuerdame</label>
  </div>
  <button type="submit" class="btn btn-default">Registrarme</button>
</form> 
   
</body>
</html>
