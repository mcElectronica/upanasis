<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tipo de Usuario</title>
    <link href="css/seleccionuser.css" rel="stylesheet" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
   
</head>
<body>
    <form id="form1" runat="server">
    <div class="seleccionuser">
        <asp:LinkButton id="btnestudiante" href="loginestudiante.aspx" CssClass="btn btn-primary" runat="server" >SOY ESTUDIANTE</asp:LinkButton><br />
        <asp:LinkButton id="btndocente" href="logindocente.aspx" CssClass="btn btn-primary" runat="server" >SOY DOCENTE</asp:LinkButton>

     </div>
    </form>
</body>
</html>
s