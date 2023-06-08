<?php

session_start();
  
$months = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
$current_date = date('Y-m-d', time());
?>

    <div class='callout callout-success'>
    <h3 class='text-center'>Dashboard <i class='fas fa-chart-bar ml-2'></i></h3>
    </div>

    <div class='row'>
    <div class='col-4' style="margin-bottom:30%;">
          <div class="info-box mb-3">
              <span class="info-box-icon bg-warning"> <i class='fas fa-table'></i></span>

              <div class="info-box-content">
              <h4>Registrar Boletas</h4>
              <p>Registro de Boletas , háberes y descuentos</p>
              <a href='main.php?view=registrarboletas-vista' class='small-box-footer'>Ir al Mòdulo<i class='fas fa-arrow-circle-right ml-2'></i></a>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success"> <i class='fas fa-search-plus'></i></span>

              <div class="info-box-content">
              <h4>Consulta de Boletas </h4>
              <p>Busqueda y gestión de boletas registradas</p>
              <a href='main.php?view=consultaboletas-vista' class='small-box-footer'>Ir al Módulo<i class='fas fa-arrow-circle-right ml-2'></i></a>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger"><i class="fas fa-school"></i></span>

              <div class="info-box-content">
              <h4>Registro de instituciones</h4>
              <p>Gestión de las Instituciones</p>
              <a href='main.php?view=instituciones-vista' class='small-box-footer'>Ir al Módulo<i class='fas fa-arrow-circle-right ml-2'></i></a>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
            <div class="info-box mb-3">
              <span class="info-box-icon bg-info"><i class="fas fa-user-tie"></i></span>

              <div class="info-box-content">
              <h4>Registro de empleados</h4>
              <p>Gestión de las empleados</p>
              <a href='main.php?view=empleados-vista' class='small-box-footer'>Ir al Módulo<i class='fas fa-arrow-circle-right ml-2'></i></a>
              </div>
              <!-- /.info-box-content -->
          </div>
            <!-- /.info-box -->

    </div><!-- Fin del col -->
    <div class='col-8'>

      <div class='card'>
        <div class='card-header bg-success'>
          <h3 class='card-title'>Filtrar por Fechas</h3>
          <div class='card-tools'>
            <!-- Buttons, labels, and many other things can be placed here! -->
            <!-- Here is a label for example -->

          </div>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class='card-body'>
          <div class='row'>
            <div class='col-md-3'>
              <select class='form-control rounded-0' id='year-start'>
                <option value=''>Año Inicial</option>";
                <?php
                for ($i = 2020; $i <= $current_date; $i++) {
                  echo "
                    <option value='{$i}'>{$i}</option>
                    ";
                }
                ?>
              </select>
            </div>
            <div class='col-md-3'>
              <select class='form-control rounded-0' id='month-start'>
                <option value=''>Mes</option>";
                <?php
                for ($i = 1; $i <= 12; $i++) {
                  echo "
                    <option value='{$i}'>{$months[$i - 1]}</option>
                    ";
                }
                ?>
                
              </select>
            </div>
            <div class='col-md-3'>
              <select class='form-control rounded-0' id='year-end'>
                <option value=''>Año</option>";
                <?php
                for ($i = 2020; $i <= $current_date; $i++) {
                  echo "
                    <option value='{$i}'>{$i}</option>
                    ";
                }
                ?>
              </select>
            </div>
            <div class='col-md-3'>
              <select class='form-control rounded-0' id='month-end'>
                <option value=''>Mes</option>";
                <?php
                for ($i = 1; $i <= 12; $i++) {
                  echo "
                    <option value='{$i}'>{$months[$i - 1]}</option>
                    ";
                } 
                ?>
                
              </select>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
        <div class='card-footer'>
            <div class='row'>
            <div class='col-md-12 text-right'>
              <button type='button' id='default' class='btn btn btn-secondary'>Reiniciar</button>
              <button type='button' id='filtered' class='btn btn btn-success'>Consultar</button>
            </div>
          </div>
        </div>
        <!-- /.card-footer -->
      </div><!-- Fin del card -->
      
      <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button class="nav-link active" id="nav-home-tab" data-toggle="tab" data-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Grafico 1 : Estado de la boleta <i class="fas fa-chart-line ml-2"></i></button>
          <button class="nav-link" id="nav-profile-tab" data-toggle="tab" data-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Grafico 2 : Boletas registradas por usuario <i class="fas fa-chart-line ml-2"></i></button>
          <button class="nav-link" id="nav-contact-tab" data-toggle="tab" data-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Grafico 3 : Usuario por nivel de acceso <i class="fas fa-chart-line ml-2"></i></button>
        </div>
      </nav>
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <canvas id='boletasEstado'  class='chart-responsive'></canvas>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
          <canvas id='boletasUsuario'  class='chart-responsive'></canvas>
        </div>
        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
        <canvas id='nivelesUsuario'  class='chart-responsive'></canvas>
        </div>
      </div>
      <!-- /.card -->
      <div class='tab-content' id='nav-tabContent'>
        <div class='tab-pane fade show active' id='list-home' role='tabpanel' aria-labelledby='list-home-list'>
         
          
        </div>
        <div class='tab-pane fade' id='list-profile' role='tabpanel' aria-labelledby='list-profile-list'>
          
          
        </div>
        <div class='tab-pane fade' id='list-messages' role='tabpanel' aria-labelledby='list-messages-list'>
    
        </div>
        <div class='tab-pane fade' id='list-settings' role='tabpanel' aria-labelledby='list-settings-list'>...</div>
      </div>
    </div>
    </div>
<script src="dist/js/colors-chart.js"></script>
<script src="dist/js/options-chart.js"></script>
<script src="dist/js/other/graficos.js"></script>
 