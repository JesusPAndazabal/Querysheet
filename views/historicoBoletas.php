
<link href="dist/css/other/styleregistrar-boletas.css" rel="stylesheet" >

<div class="callout callout-success">
  <h4 class="text-center">Módulo de Acciones <i class="fas fa-user ml-2"></i></h4>
</div>

<div class="card border-dark " id="card-institucion">
    <div class="card-header">
        <h5 class="text-uppercase text-bold">Historico de Boletas</h5>
    </div>
    <div class="card-body">        
        <table class="table table-valign-middle table-striped" id="tabla-historico">
            <thead class="bg-secondary">
            <tr>
                <th>Id</th>
                <th>IdBoleta</th>
                <th>Empleado</th>
                <th>Institución</th>
                <th>Tipo</th>
                <th>Año</th>
                <th>Mes</th>
                <th>Usuario Encargado</th>
                <th>Fecha de Modificación</th>
                <th>Acción</th>
            </tr>
            </thead>
            <tbody id="datos-historico">
                <!-- Se carga de forma asincrona -->
            </tbody>
        </table>
    </div>
</div><!-- Fin del card -->

<script src="dist/js/other/historicoBoletas.js"></script>