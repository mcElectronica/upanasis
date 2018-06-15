<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verNotas.aspx.cs" Inherits="upanasis.verNotas" %>

<div>
    <h3 id="nombreAlumno"></h3>
        
        <div class="col">
          <select id="selectUnidad" class="form-control">
              <option>Seleccione Unidad</option>
              <option value="PRIMERA">PRIMERA</option>
              <option value="SEGUNDA">SEGUNDA</option>
              <option value="TERCERA">TERCERA</option>
              <option value="CUARTA">CUARTA</option>
            </select>
        </div>
    <br />
    <br />
        <form id="contenidoNotas">
          
        </form>
    <br />
    <br />
    <button onclick="location.reload()" type="button" class="btn btn-primary btn-lg btn-block"><- Regresar</button>

</div>
    

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    
    <script>
        $(document).ready(function () {

            var unidad;

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