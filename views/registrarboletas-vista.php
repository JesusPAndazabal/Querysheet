<link href="dist/css/other/styleregistrar-boletas.css" rel="stylesheet" >
<!-- Toastr -->
<link rel="stylesheet" href="plugins/toastr/toastr.min.css">

<div class="callout callout-success">
  <h3 class="text-center">Módulo de Registro de Boletas<i class="fas fa-registered ml-2"></i></h3>
</div>

<!-- Botones para acceso directo de registro de Instituciones y Empleados -->
 <div class="btn-group mb-4 mt-2" role="group" aria-label="Basic example">
    <a href="main.php?view=empleados-vista" class="btn btn-success" tabindex="-1" role="button" aria-disabled="true">Agregar Empleado<i class="fas fa-user-tie ml-2"></i></a>
    <a href="main.php?view=instituciones-vista" class="btn btn-success" tabindex="-1" role="button" aria-disabled="true">Agregar Institución<i class="fas fa-school ml-2"></i></a>
</div>

<!-- Card para el registro de Boletas -->
<div class="card card-secondary">
    <div class="card-header">
        <h6 class="text-center text-bold">Datos de la Boleta</h6> 
    </div><!-- fin del header-card -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <label for="">Nombres y Apellidos :</label>
                <input type="search" class="form-control" placeholder="Nombres y Apellidos"  id="datosempleado" autocomplete="off">
            </div>

            <div class="col-md-4">
                <label for="">Nombre de Institución</label>
                <input type="search" class="form-control" autocomplete = "off" placeholder="Nombre de la Institucion"  id="nombreInstitucion">
            </div>
            <!-- Fin del datos del empleado -->
            <div class="col-md-2">
                <label for="">Estado del Empleado</label>
                <select class="custom-select custom-select" id="tipo">
                    <option value="1">Activo</option>
                    <option value="0">Pensionista</option>
                </select>
            </div>
            <div class="col-md-2">
                <label for="">Tipo de Empleado</label>
                <select class="custom-select custom-select" id="tipoEmpleado">
                    <option value="">Ninguno</option>
                    <option value="C">Contratado</option>
                    <option value="N">Nombrado</option>
                </select>
            </div>
        </div><!-- Fin del 1 row -->
    <br>        
        <div class="row">
            <div class="col-md-2">
                <label for="">Nivel de Educación :</label>
                <select class="custom-select custom-select" id="nivel">
                    <option value="I">Inicial</option>
                    <option value="P" selected>Primaria</option>
                    <option value="S">Secundaria </option>
                    <option value="N">Nocturna</option>
                    <option value="C">Cetpro</option>
                </select>
            </div>
            <div class="col-md-3">
                <label for="">Cargo Empleado: </label>
                <input type="search" class="form-control" id="cargo" autocomplete = "off">
            </div>
            <div class="col-md-1">
                <label for="">Año:</label>
                <input type="text" class="form-control" id="anio" autocomplete = "off">
                
            </div>

            <div class="col-md-2">
                <label for="">Mes:</label>
                <select class="custom-select custom-select" id="mes">
                    <option value="1" selected>Enero</option>
                    <option value="2">Febrero</option>
                    <option value="3">Marzo</option>
                    <option value="4">Abril</option>
                    <option value="5">Mayo</option>
                    <option value="6">Junio</option>
                    <option value="7">Julio</option>
                    <option value="8">Agosto</option>
                    <option value="9">Setiembre</option>
                    <option value="10">Octubre</option>
                    <option value="11">Noviembre</option>
                    <option value="12">Diciembre</option>
            </select>
            </div>

            <div class="col-md-2">
                <label for="">Tipo de Boleta:</label>
                <select class="custom-select custom-select" id="cantidad">
                    <option value="U" selected>Unica</option>
                    <option value="A">Adicional</option>
            </select>
            </div>


            <div class="col-md-2">
                <label for="">Monto Imponible :</label>
                <input type="text" class="form-control" id="montoimponible" placeholder="Opcional" autocomplete = "off">
            </div>
        </div><!-- Fin del 2 row -->
    </div><!-- fin del body-card -->
    <div class="card-footer">
    <button type="button" class="btn btn-success" id="btn-registrarboletas">Registrar Boleta<i class="fas fa-registered ml-2"></i></button>
    </div><!-- fin del footer-card -->
</div><!-- fin del card -->



<!-- Card para la tabla del ultimo registro -->
<div class="card card-secondary">
    <div class="card-header">
        <h6 class="text-center text-bold">Ultimo Registro</h6>    
    </div>
    <div class="card-body">
        <div class="card-body table-responsive p-4">
            <table class="table table-valign-middle table-striped" id="tabla-ultimaBoleta">
                <thead>
                <tr>
                        <th>Id</th>
                        <th width='15%'>Empleado</th>
                        <th>Nombre Institución</th>
                        <th width='13%'>Estado de Empleado</th>
                        <th>Cargo</th>
                        <th>Nivel</th>
                        <th>Año</th>
                        <th>Mes</th>
                        <th>Monto Imponible</th>
                        <th>Registrar Montos</th>
                </tr>
                </thead>
                <tbody id="datos-ultimaBoleta">
                    <!-- Se carga de forma asincrona -->
                </tbody>
            </table>
        </div>         
    </div><!-- fin del body-card -->
</div><!-- Fin del card -->

<!-- Modal que contiene el registro de los Ingresos y Egresos-->
<div class="modal fade" id="modal-montos" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header"  style="background-color:#329261; color:white">
        <h5 class="modal-title" id="staticBackdropLabel">Formulario de registro de remuneración</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Inicio de card -->
            <div class="card ">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-2">
                            <label for="">Campo:</label>
                            <input type="search" class="form-control" id="campo" autocomplete ="off">
                        </div>
                        <div class="col-md-2">
                            <label for="">Monto :</label>
                            <input type="text" class="form-control" id="monto" autocomplete="off">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-success" id="btn-registrarConcepto">Registrar</button>
                        </div>
                        <div class="col-md-2">
                                <label for="">T. Háberes</label>
                                <input type="text" class="form-control" id="totalhaberes"disabled>
                        </div>
                        <div class="col-md-2">
                            <label for="">T. Descuentos</label>
                            <input type="text" class="form-control" id="totaldescuento"disabled>
                        </div>
                        <div class="col-md-2">
                            <label for="">Líquido</label>
                            <input type="text" class="form-control"  id="totalliquido" disabled>
                        </div>
                    </div><!-- Fin del row -->
                </div><!-- Fin del body-card -->
            </div><!-- Fin del card -->

            <!-- card que contiene las tablas de remuneraciones -->
            <div class="row">
                <!-- Tabla ingresos -->
                <div class="col-md-6">
                    <div class="card card-secondary">
                        <div class="card-header">
                            Lista de Ingresos
                        </div>
                        <div class="card-body table-responsive p-4">
                            <table class="table table-sm table-striped" id="tabla-ingresos">
                                <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Monto</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody id="datos-ingresos">
                                    <!-- Se carga de forma asincrona -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Tabla egresos -->
                <div class="col-md-6">
                    <div class="card card-secondary">
                        <div class="card-header">
                            Lista de Egresos
                        </div>
                        <div class="card-body table-responsive p-4">
                            <table class="table table-sm table-striped" id="tabla-egresos">
                                <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Monto</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody id="datos-egresos">
                                    <!-- Se carga de forma asincrona -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<!-- Configuracion de alertas personalizadas -->
<script src="dist/js/configAlerts.js"></script>

<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>

<!-- js del registro de boletas -->
<script src="dist/js/other/registrar-boletas.js"></script>

