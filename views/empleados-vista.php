<link href="dist/css/other/styleempleados.css" rel="stylesheet" >

<div class="callout callout-success">
  <h4 class="text-center">Módulo de Empleados<i class="fas fa-user-tie ml-2"></i></h4>
</div>

<div class="card border-dark" id="card-docentes">
    <div class="card-body table-responsive p-4">
        <!-- Button para abrir el modal -->
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#modal-empleados" id="abrir-modal-empleados">
        Agregar nuevo Empleado<i class="fas fa-user-tie ml-2"></i>
        </button>

        <!-- Modal para el registro de Instituciones-->
        <div class="modal fade" id="modal-empleados" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-success">
                        <h5 class="modal-title" id="staticBackdropLabel">Registro de Empleados</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form autocomplete="off" id="formulario-empleado">
                            <div class="row">
                                <div class="col-md-5">
                                    <label for="">Apellidos :</label>
                                    <input type="text" class="form-control" id="apellidos">
                                </div>
                                <div class="col-md-5">
                                    <label for="">Nombres</label>
                                    <input type="text" class="form-control" id="nombres">
                                </div>
                                <div class="col-md-2">
                                    <label for="">Cód. Modular:</label>
                                    <input type="text" class="form-control" id="codigomodular" maxlength = "8">
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="">Código Dni :</label>
                                    <input type="text" class="form-control" id="codigodni" maxlength = "10">
                                </div>
                                <div class="col-md-4">
                                    <label for="">Teléfono :</label>
                                    <input type="text" class="form-control" id="telefono" placeholder = "Opcional">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success" id="btn-registrar-empleados">Registrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!--  -->
        <table class="table table-valign-middle table-striped " id="tabla-empleados">
            <thead>
            <tr>
                <th>Id</th>
                <th>Código Modular</th>
                <th>Código Dni</th>
                <th>Empleado</th>
                <th>Usuario Registro</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody id="datos-empleados">
                <!-- Se carga de forma asincrona -->
            </tbody>
        </table>
    </div>
</div><!-- Fin del card -->


<!-- Configuracion de alertas personalizadas -->
<script src="dist/js/configAlerts.js"></script> 

<!-- Datatable -->
<script src="dist/js/dataTableConfig.js"></script>

<script src="dist/js/other/empleados.js"></script>


