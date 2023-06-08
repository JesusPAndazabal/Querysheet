<link href="dist/css/other/styleinstitucion.css" rel="stylesheet" >


<div class="callout callout-success">
  <h4 class="text-center">Módulo de Instituciones<i class="fas fa-school ml-2"></i></h4>
</div>

<div class="card border-dark " id="card-institucion">
    <div class="card-body">
     <!-- Button trigger modal -->
        <button type="button" class="btn btn-success mb-4" data-toggle="modal" data-target="#modal-instituciones" id="abrir-modal-instituciones">
             Agregar nueva Institución<i class="fas fa-school ml-2"></i>
        </button>

        <!-- Modal para el registro de instituciones -->
        <div class="modal fade" id="modal-instituciones" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                <div class="modal-header bg-success">
                    <h5 class="modal-title" id="staticBackdropLabel">Registro de Instituciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Formulario de Registro  -->
                    <form autocomplete="off" id="formulario-institucion">
                        <label for="">Nombre de la Institución</label>
                        <input type="text" class="form-control" id="nombre"><br>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="">Código Anterior :</label>
                                <input type="text" class="form-control" id="codlegacy" maxlength = "8">
                            </div>
                            <div class="col-md-6">
                                <label for="">Código Nuevo :</label>
                                <input type="text" class="form-control" id="codactual" maxlength = "8">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" id="btn-registrarinstitucion">Registrar</button>
                </div>
                </div>
            </div>
        </div><!-- Fin del modal -->
        
        <!-- Tabla para el listado de instituciones -->
        <table class="table table-valign-middle table-striped" id="tabla-institucion">
            <thead>
            <tr>
                <th>Id</th>
                <th>Código Anterior</th>
                <th>Código Nuevo</th>
                <th>Nombre de la Institución</th>
                <th>Usuario Registro</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody id="datos-institucion">
                <!-- Se carga de forma asincrona -->
            </tbody>
        </table>
    </div>
</div><!-- Fin del card -->

<!-- Configuracion de alertas personalizadas -->
<script src="dist/js/configAlerts.js"></script> 

<!-- Datatable -->
<script src="dist/js/dataTableConfig.js"></script>

<!-- js de Instituciones -->
<script src="dist/js/other/instituciones.js"></script>

