<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agregarNotaAlumno.aspx.cs" Inherits="upanasis.agregarNotaAlumno" %>

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
    <button id="btnGuardarNotas" type="button" class="btn btn-primary btn-lg btn-block">Guardar</button>
    <button type="button" onclick="location.reload()" class="btn btn-secondary btn-lg btn-block">Cancelar</button>

</div>
    

    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    
    <script>
        $(document).ready(function () {
            var contador = 0;
            var selectUnidad;
            var arrayidCursoAsignado = new Array();
            var arrayValorNotas = new Array();

            var parametros = { "idUser": localStorage.getItem("Userid") };
            $.ajax({
                type: "POST",
                url: "servicio.asmx/listCursosAsignados",
                data: JSON.stringify(parametros),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    $.each(response.d, function (i, item) {
                        $('#nombreAlumno').html(item.user);
                        $('#contenidoNotas').append(
                                "<div class='form-group row'>" +
                                    "<label for='inputNota' class='col-sm-2 col-form-label'>"+item.nombre+"</label>"    +
                                    "<div class='col-sm-10'>"   +
                                      "<input id='txtNota"+contador+"' type='number' class='form-control'>"    +
                                    "</div>"+
                                  "</div>"
                            );

                        arrayidCursoAsignado.push(item.id);
                        contador++;
                    });
                    console.log(arrayidCursoAsignado);
                },
                error: function (r) {

                },
                failure: function (r) {

                }
            });//fin select grado

            $('#selectUnidad').change(function () {
                selectUnidad = $(this).val();
            });

            $('#btnGuardarNotas').click(function () {
                for (var i = 0; i < contador; i++){
                    arrayValorNotas.push(parseInt($('#txtNota'+i).val()));
                }
                console.log(arrayValorNotas);
                console.log(selectUnidad);

                for (var i = 0; i < contador; i++) {
                    var parametros = { "idCursoAsig": arrayidCursoAsignado[i], "valor": arrayValorNotas[i], "unidad": selectUnidad };
                    $.ajax({
                        type: "POST",
                        url: "servicio.asmx/agregarNota",
                        data: JSON.stringify(parametros),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            console.log("nota ingresada");
                        },
                        error: function (r) {

                        },
                        failure: function (r) {

                        }
                    });//fin ingresar Notas
                }

                //vaciamos array
                arrayValorNotas = [];
                location.reload();
            });

        });
    </script>
