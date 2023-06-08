<?php

session_start();


?>

<link href="dist/css/other/styleconsulta-boletas.css" rel="stylesheet" >

<div class="callout callout-success">
  <h3 class="text-center">Boletas Registradas<i class="fas fa-search ml-2 "></i></h3>
</div>

<!-- Modal que contiene el detalle de las boletas -->
<div class="modal fade" id="modal-detalle" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header"  style="background-color:#329261; color:white">
        <h5 class="modal-title " id="staticBackdropLabel"> Tabla de Remuneraciones</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div class="container">
                <div class="row row-cols-4">
                    <div class="col">
                        <label for="">Monto Imponible:</label>
                        <input type="text" class="form-control"  id="montoimponible" disabled>
                    </div>
                    <div class="col">
                        <label for="">Total Háberes:</label>
                        <input type="text" class="form-control" id="totalhaberes" disabled>
                    </div>
                    <div class="col">
                        <label for="">Total Descuento:</label>
                        <input type="text" class="form-control" id="totaldescuento" disabled>
                    </div>
                    <div class="col">
                        <label for="">Líquido:</label>
                        <input type="text" class="form-control" id="totalliquido" disabled>
                    </div>
                </div>
            </div><hr>

            <div class="row mb-2">
          <div class="col-md-12">
            <div class="alert alert-light alert-dismissible fade show" role="alert">
              <strong>Encargado de Registro : </strong> <span class ="text-bold"id="encargado"  >Hola</span>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        </div>  
            
            <div class="row">
                <div class="col-md-6">
                  <div class="card">
                    <div class="card-header bg-secondary">
                      Ingresos
                    </div>
                    <div class="card-body">
                      <table class="table table-sm table-striped" id="tabla-ingresos">
                              <thead>
                              <tr>
                                  <th>Nombre</th>
                                  <th>Monto</th>
                              </tr>
                              </thead>
                              <tbody id="datos-ingresos">
                                  <!-- Se carga de forma asincrona -->
                              </tbody>
                          </table>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                      <div class="card-header bg-secondary">
                        Egresos
                      </div>
                      <div class="card-body">
                        <table class="table table-sm table-striped" id="tabla-egresos">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Monto</th>
                            </tr>
                            </thead>
                            <tbody id="datos-egresos">
                                <!-- Se carga de forma asincrona -->
                            </tbody>
                        </table>
                      </div>
                    </div><!-- Fin del card -->                 
                </div><!-- Fin del 2 col -->         
            </div><!-- Fin del row -->
      </div>
     



      <div class="modal-footer">

      
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div><!-- Fin del Modal del detalle -->

  <ol class="breadcrumb float-sm bg-light" style = "font-size:15px;">

    <li class="breadcrumb-item active" aria-current="page">Boletas Registradas</li>
    <?php
        if($_SESSION['nivelacceso'] == "Administrador"){
            echo "
                <li class='breadcrumb-item' aria-current='page' ><a href='main.php?view=revisionBoletas-vista'>Boletas por Revisar</a></li>
            ";
        }else{
            echo "
                <li class='breadcrumb-item' aria-current='page'><a href='main.php?view=revisionBoletasEmpleado-vista'>Boletas Observadas</a></li>
            ";
        }

    ?>
    
  </ol>

<div class="card" id="card-filtros">
  <div class="card-header card-outline card-success">
  <h2 class="card-title text-bold">Filtros de Busqueda<i class="fas fa-search ml-2"></i></h2>
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

<div class="card">
      <div class="card-body table-responsive p-5">
            <table class="table table-valign-middle table-striped" id="tabla-boletas" style="font-size:15px">
                <thead>
                <tr>
                    <th>Nª</th>
                    <th>idempleado</th>
                    <th>Empleado</th>
                    <th>Cód. Módular</th>
                    <th>idinstitución</th>
                    <th>Institución</th>
                    <th>Cód. Institución</th>
                    <th>Tipo</th>
                    <th>Año</th>
                    <th>Mes</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody id="datos-boletas">
                    <!-- Se carga de forma asincrona -->
                </tbody>
            </table>
      </div>
    </div>

<!-- Modal para imprimir el Reporte - Constancias de Ingresos y Egresos-->
<div class="modal fade" id="modalConstancias" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered ">
    <div class="modal-content">
      <div class="modal-header bg-success">
        <h5 class="modal-title" id="staticBackdropLabel">Documentos a Imprimir</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

                <button type="button" class="btn btn-primary mb-2" id="btn-reporte">Imprimir Reporte de Boleta</button><br>   

                <button type="button" class="btn btn-secondary" id="btn-constancia">Imprimir Constancia de Ingresos y Egresos</button>

  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!--  <div class="row">
  <div class="col-md-6">
      <input type="text" class="form-control" id="min" placeholder ="fechainicial" >
  </div>
  <div class="col-md-6">
        <input type="text" class="form-control" id="max" placeholder="fechafin">
        <button class="btn btn-primary" id="btn-prueba">Hola</button>
  </div>
</div>
 -->
 


<script src="dist/js/dataTableConfig.js"></script>
<script src="dist/js/other/consulta-boletas.js"></script>
