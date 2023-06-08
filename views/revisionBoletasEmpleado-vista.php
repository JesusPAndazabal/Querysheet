<link href="dist/css/other/styleconsulta-boletas.css" rel="stylesheet" >


<div class="callout callout-danger">
  <h3 class="text-center">Boletas Observadas<i class="fas fa-check-circle ml-2"></i></h3>
</div>


<!-- Columna que contiene el filtro de busqueda para la consulta de boletas -->

  <ol class="breadcrumb float-sm bg-light" style = "font-size:15px;">
    <li class="breadcrumb-item active" aria-current="page"><a href = "main.php?view=consultaboletas-vista">Consultas registradas</a></li>
    <li class="breadcrumb-item active" aria-current="page" >Boletas Observadas</li>
  </ol>

<div class="card" id="card-filtros">
  <div class="card-header card-outline card-success">
  <h2 class="card-title text-bold">Filtros de Busqueda<i class="fas fa-search ml-2 "></i></h2>
  <div class="card-tools">
      <!-- Collapse Button -->
      <button type="button" class="btn btn-tool text-bold" data-card-widget="collapse" id="mostrarFiltro">Ocultar filtros<i class="fas fa-minus ml-2"></i></button>
    </div>
  </div>
  <div class="card-body">
    <div class="row mb-3">
        <div class="col-md-3"></div>
        <div class="col-md-2">
          <label for="">Ingrese el año:</label>
          <input type="text" class="form-control" id="buscaranio" autocomplete = "off"  data-index="8">
        </div>
        <div class="col-md-4">
            <form class="row ">
              <label for="">Ingrese el nombre del empleado:</label>
                <div class="col-md-8">
                    <input type="text" class="form-control" id="nombreempleado" autocomplete = "off"  data-index="2">
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-success" id="btn-limpiar">
                      Borrar filtro
                    <i class="fas fa-broom ml-2"></i>
                    </button>
                </div> 
            </form><!-- Fin del row -->
        </div>
    </div>
  </div><!-- Fin del body -->
</div>
    
    <!-- Card que contiene la tabla de las boletas en general-->

  <div div class="card">
    <div class="card-body table-responsive p-5">
          <table class="table table-valign-middle table-striped" id="tabla-boletas" style="font-size:15px">
              <thead>
              <tr>
                  <th>Nª</th>
                  <th>idempleado</th>
                  <th>Empleado</th>
                  <th>Codigo Dni</th>
                  <th>idinstitución</th>
                  <th>Institución</th>
                  <th>Código Actual</th>
                  <th>Tipo</th>
                  <th>Año</th>
                  <th>Mes</th>
                  <th>Comentario</th>
                  <th>Remuneración</th>
                  <th>Estado Revisión</th>
              </tr>
              </thead>
              <tbody id="datos-boletas">
                  <!-- Se carga de forma asincrona -->
              </tbody>
          </table>
    </div>
  </div>


<!-- Modal que contiene el registro de los Ingresos y Egresos-->
<div class="modal fade" id="modal-montos" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title" id="staticBackdropLabel">Formulario de Registro de remuneración</h5>
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
                </div><!-- Fin del Bodu -->
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
            <!-- <p>Recuerde revisar si el total liquido concuerda con las planillas manuscritas</p> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal-editarBoleta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title" id="staticBackdropLabel">Editar Boleta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <h6 class="text-bold">Detalle de Responsables : </h6>
        <hr>
        <div class="row">
          <div class="col-md-2 text-truncate">
            <label for="">Encarg. Registro : </label>
          </div>
          <div class="col-md-4 text-truncate">
            <span id="encargado"  >Hola</span>
          </div>
          <div class="col-md-3 text-truncate">
            <label for="">Fecha. Registro : </label>
          </div>
          <div class="col-md-3 text-truncate">
            <span id="fecharegistro">Hola</span>
          </div>
        </div>

        <div class="row">
            <div class="col-md-2 text-truncate">
              <label for="">Encarg. Modificar : </label>
            </div>
            <div class="col-md-4 text-truncate">
              <span id="encargadom">Hola</span>
            </div>
            <div class="col-md-3 text-truncate">
            <label for="">Fecha Modificación : </label>
          </div>
          <div class="col-md-3 text-truncate">
            <span id="fechamodifico">Hola</span>
          </div>
        </div>
        <hr>
        <h6 class="text-bold">Información de la boleta : </h6>
        <div class="row">
            <div class="col-md-5">
                <label for="">Nombres y Apellidos :</label>
                <input type="search" class="form-control" placeholder="Nombres y Apellidos"  id="datosempleado" autocomplete="off">
            </div>
            <div class="col-md-5">
                <label for="">Nombre de Institución</label>
                <input type="search" class="form-control" autocomplete = "off" placeholder="Nombre de la Institucion"  id="nombreInstitucion">
            </div>
            <div class="col-md-2">
                <label for="">Tipo</label>
                    <select class="custom-select custom-select" id="tipo">
                        <option value="1">Activo</option>
                        <option value="0">Pensionista</option>
                </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-5">
                <label for="">Nivel de Educación :</label>
                    <select class="custom-select custom-select" id="nivel">
                        <option value="Inicial">Inicial</option>
                        <option value="Primaria">Primaria</option>
                        <option value="Secundaria">Secundaria </option>
                        <option value="Nocturna">Nocturna</option>
                        <option value="Cetpro">Cetpro</option>
                </select>
            </div>
            <div class="col-md-5">
                <label for="">Cargo Empleado: </label>
                <input type="search" class="form-control" id="cargo">
            </div>
            <div class="col-md-2">
              <label for="">Tipo</label>
                    <select class="custom-select custom-select" id="tipoEmpleado">
                        <option value="">Ninguno</option>
                        <option value="C">Contratado</option>
                        <option value="N">Nombrado</option>
                </select>
            </div>
           
        </div>
        <div class="row mt-3">
          <div class="col-md-2">
                <label for="">Año  :</label>
                <input type="text" class="form-control" id="anio">
            </div> 
            <div class="col-md-3">
                <label for="">Mes:</label>
                    <select class="custom-select custom-select" id="mes">
                        <option value="1">Enero</option>
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
            <div class="col-md-5">
                <label for="">Tipo de Boleta:</label>
                    <select class="custom-select custom-select" id="cantidad">
                        <option value="U" selected>Unica</option>
                        <option value="C">Compuesta</option>
                </select>
            </div>
            <div class="col-md-2">
                    <label  class="text-truncate" for="">Monto Imponible :</label>
                    <input type="text" class="form-control" id="montoimponible">
                
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-success" id="btnguardar">Guardar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de Observaciones para el comentario  -->
<div class="modal" tabindex="-1" id="modal-observaciones">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title">Observaciones</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <label for="">Motivo de la Observación</label>
            <textarea class="form-control"  id="comentario" aria-label="With textarea" disabled></textarea>
            <!-- <input type="text" class ="form-control" aria-label="With textarea" id="comentario" autocomplete = "off" disabled> -->
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" id="cerrar-observacion">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btn-guardarComentario">Guardar</button> -->
      </div>
    </div>
  </div>
</div>


<script src="dist/js/other/boletasRevisarEmpleado.js"></script>