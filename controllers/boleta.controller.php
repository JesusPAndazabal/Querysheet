<?php

session_start();


require_once '../models/Boletas.php';
require_once '../models/Empleados.php';
require_once '../models/Instituciones.php';
require_once '../models/Campos.php';
require_once '../models/Serverside.php';


if(isset($_GET['op'])){

    $boleta = new Boleta();
    $empleado = new Empleado();
    $institucion = new Institucion();
    $campo = new Campo();




if($_GET['op'] == 'listadoBoletas'){
  $data = $serverSide->get("vs_boletas", "idboleta", array("idboleta", "idempleado", "empleado", "codigodni", "idinstitucion", "nombre","codactual","activo","anio","mes","usuarioregistro","usuariomodifico","montoimponible"));
}

if($_GET['op'] == 'listadoBoletasRevisar'){
  $data = $serverSide->get("vs_boletasRevisar", "idboleta", array("idboleta", "idempleado", "empleado", "codigodni", "idinstitucion", "nombre","codactual","activo","anio","mes" ,"comentario","usuarioregistro","usuariomodifico"));
}

if($_GET['op'] == 'listadoBoletasObservadas'){
  $data = $serverSide->get("vs_boletasObservadas", "idboleta", array("idboleta", "idempleado", "empleado", "codigodni", "idinstitucion", "nombre","codactual","activo","anio","mes", "comentario", "usuarioregistro","usuariomodifico"));
}

if($_GET['op'] == 'listarHistoricoBoletas'){
  $data = $serverSide->get("vs_historico" , "idhistorico" , array("idhistorico" , "idboleta" , "empleado" , "nombre" , "activo" , "anio" , "mes" , "encargado" , "fecha" , "accion"));
}

//Operacion para validar la boleta 
if($_GET['op'] == 'validarBoleta'){
  $data = $boleta->validarBoleta(["idempleado" => $_GET['idempleado'] , "anio" => $_GET['anio'] , "mes" => $_GET['mes']]);

  if(count($data) == 0){
    echo 2;
    return true;
  }else{
    echo 1;
    return false;
  }
}


function listarUltimoRegistro($data){
  if(count($data) <= 0){
      echo "<td>No hay datos</>";
  }else{
    foreach($data as $row){

      $activo = $row["activo"];

      if( $activo == 'Activo'){
        $activo= "<span id = 'color' class='badge bg-primary text-ligth '>Activo</span>";
      }elseif($activo == 'Pensionista'){
        $activo = "<span id = 'color' class='badge bg-warning text-ligth'>Pensionista</span>";
      }


        echo "
            <tr>
              <td>{$row['idboleta']}</td>
              <td>{$row['empleado']}</td>
              <td>{$row['nombre']}</td>
              <td class='text-center'>$activo</td>
              <td>{$row['cargo']}</td>
              <td>{$row['nivel']}</td>
              <td>{$row['anio']}</td>
              <td>{$row['mes']}</td>
              <td>{$row['montoimponible']}</td>
              <td class='text-left'>  
                    <a class='btn btn-success   montos ' href='#' data-anio ='{$row['anio']}' data-idboleta='{$row['idboleta']}'>Registrar Montos<i class='fas fa-file-invoice-dollar ml-2'></i></a> 
              </td>
            </tr>
        ";
    }
  }
}

function listadoBoletasEmpleado($data){

  if(count($data) <= 0){
      echo "<td>No hay datos</>";
  }
  else{
      foreach($data as $row){

        if( $row['activo'] == '1'){
          $row['activo'] = "Activo";
          $row['activo'] = "<span id = 'color' class='badge bg-primary text-ligth '>{$row['activo']}</span>";
        }elseif($row['activo'] == '0'){
            $row['activo'] = "Pensionista";
            $row['activo'] = "<span id = 'color' class='badge bg-warning text-ligth'>{$row['activo']}</span>";
        }

        if($row['nivel'] == 'I'){
          $row['nivel'] = "Inicial";
        }elseif($row['nivel'] == 'P'){
          $row['nivel'] = "Primaria";
        }elseif($row['nivel'] == 'S'){
          $row['nivel'] = 'Secundaria';
        }elseif($row['nivel'] == 'N'){
          $row['nivel'] = "Nocturno";
        }elseif($row['nivel'] == 'C'){
          $row['nivel'] = "Cetpro";
        }

        if($row['mes'] == '1'){
          $row['mes'] = 'Enero';
        }elseif($row['mes'] == '2'){
          $row['mes'] = 'Febrero';
        }elseif($row['mes'] == '3'){
          $row['mes'] = "Marzo";
        }elseif($row['mes'] == '4'){
          $row['mes'] = "Abril";
        }elseif($row['mes'] == '5'){
          $row['mes'] = "Mayo";
        }elseif($row['mes'] == '6'){
          $row['mes'] = 'Junio';
        }elseif($row['mes'] == '7'){
          $row['mes'] = "Julio";
        }elseif($row['mes'] == '8'){
          $row['mes'] = "Agosto";
        }elseif($row['mes'] == '9'){
          $row['mes'] = 'Setiembre';
        }elseif($row['mes'] == '10'){
          $row['mes'] = "Octubre";
        }elseif($row['mes'] == '11'){
          $row['mes'] = "Noviembre";
        }elseif($row['mes'] == '12'){
          $row['mes'] = "Diciembre";
        }

        $cheque = $row['cheque'];


          echo "
              <tr>
                <td>{$row['idboleta']}</td>
                <td>{$row['empleado']}</td>
                <td>{$row['codigomodular']}</td>
                <td>{$row['nombre']}</td>
              ";
                if($row['anio'] >= 2004){
                  echo " <td class='text-center'>{$row['codactual']}</td> ";
                }else{
                  echo "<td class='text-center'>{$row['codlegacy']}</td>";
                }
              echo "
                <td class='text-center'>{$row['activo']}</td>
                <td>{$row['anio']}</td>
                <td>{$row['mes']}</td>
                <td class='text-center'>  
                      <a class='btn btn-outline-success btn-sm   montos '  data-anio ='{$row['anio']}' href='#' data-idboleta='{$row['idboleta']}'><i class='fas fa-file-invoice-dollar mr-1'> </i>Montos</a>
                      <a  class='btn btn-outline-warning btn-sm  editar ' title='Editar' href='#' data-idboleta='{$row['idboleta']}'><i class='fas fa-edit'></i></a>  
                </td>
              </tr>
          ";
      }
  }
}

if($_GET['op'] == 'obtenerBoletas'){
  $data = $boleta->obtenerBoleta(["idboleta" => $_GET['idboleta']]);
  
  if($data){
    echo json_encode($data);
  }
}

if($_GET['op'] == 'obtenerBoletasR'){
  $data = $boleta->obtenerBoletaR(["idboleta" => $_GET['idboleta']]);
  
  if($data){
    echo json_encode($data);
  }
}

if($_GET['op'] == 'obtenerBoletasO'){
  $data = $boleta->obtenerBoletaO(["idboleta" => $_GET['idboleta']]);
  
  if($data){
    echo json_encode($data);
  }
}

if($_GET['op'] == 'buscarfechaEmpleados'){

  $data;


    $data = $boleta->buscarfechaEmpleados(["anio" => $_GET['anio'], "search" => $_GET['search']]);
    
    buscarBoletas($data);
}

if($_GET['op'] == 'buscarfechaEmpleadosRevisar'){

  $data;

    $data = $boleta->buscarfechaEmpleadosRevisar(["anio" => $_GET['anio'], "search" => $_GET['search']]);
    
    buscarBoletasRevisadas($data);
}

if($_GET['op'] == 'buscarfechaObservadas'){

  $data;

    $data = $boleta->buscarfechaObservadas(["anio" => $_GET['anio'], "search" => $_GET['search']]);
    
    buscarBoletasRevisadas($data);
}

if($_GET['op'] == 'buscarAnioEmpleados'){

  $data;

    $data = $boleta->buscarAnioEmpleados(["anio" => $_GET['anio'] ,  "search" => $_GET['search'] ]);


  listadoBoletasEmpleado($data);
}

if($_GET['op'] == 'buscarcodigoModular'){

  $data = [
    "codigomodular" => $_GET['codigomodular']
  ];

  $resultado = $empleado->buscarcodigoModular($data);
  
  if($resultado){
    echo json_encode($resultado[0]);
  }
}

if($_GET['op'] == 'buscarEmpleados'){
  
  $data = [
    "search" => $_GET['search']
  ];

  $resultado = $empleado->buscarEmpleados($data);
  
  if($resultado){
    echo json_encode($resultado[0]);
  }
}

if($_GET['op'] == 'buscarInstituciones'){
  
  echo json_encode ($institucion->buscarInstituciones(["search" => $_GET['search']]));

  
}

if($_GET['op'] == 'busquedaEmpleados'){
  
  echo json_encode ($empleado->busquedaEmpleados(["search" => $_GET['search']]));

    
}

if($_GET['op'] == 'buscarCampos'){
  echo json_encode ($campo->buscarCampos(["search" => $_GET['search']]));
}

if($_GET['op'] == 'listarUltimoRegistro') {
  
  $data;

  $data = $boleta->listarUltimoRegistro(["limit" => '1']);

  listarUltimoRegistro($data);
  
}

if($_GET['op'] == 'registrarBoletas'){

  $datosEnviar = [
      "idempleado"         => $_GET['idempleado'],
      "idinstitucion"      => $_GET['idinstitucion'],
      "idusuarioregistro"  => $_SESSION['idusuario'],
      "activo"             => $_GET['activo'],
      "tipoempleado"       => $_GET['tipoempleado'],
      "nivel"              => $_GET['nivel'],
      "cargo"              => $_GET['cargo'],
      "anio"               => $_GET['anio'],
      "mes"                => $_GET['mes'],
      "montoimponible"     => $_GET['montoimponible'],
      "cantidad"           => $_GET['cantidad'],
      "comentario"         => $_GET['comentario']
  ];

  $boleta->registrarBoletas($datosEnviar);
}

if($_GET['op'] == 'actualizarBoletas'){

    $datosEnviar = [
      "idboleta"           => $_GET['idboleta'],
      "idempleado"         => $_GET['idempleado'],
      "idinstitucion"      => $_GET['idinstitucion'],
      "idusuariomodifico"  => $_GET['idusuariomodifico'],
      "activo"             => $_GET['activo'],
      "tipoempleado"       => $_GET['tipoempleado'],
      "nivel"              => $_GET['nivel'],
      "cargo"              => $_GET['cargo'],
      "anio"               => $_GET['anio'],
      "mes"                => $_GET['mes'],
      "montoimponible"     => $_GET['montoimponible'],
      "cantidad"           => $_GET['cantidad'],
      "comentario"         => $_GET['comentario']
  ];

  $boleta->actualizarBoletas($datosEnviar);
}

if($_GET['op'] == 'boletaRevisada'){
  $data;

  $data = $boleta->boletaRevisada(["idboleta" => $_GET['idboleta']]);
}

if($_GET['op'] == 'boletaObservada'){
  $data;

  $data = $boleta->boletaObservada(["idboleta" => $_GET['idboleta']]);
}

if($_GET['op'] == 'boletaRevision'){
  $data;

  $data = $boleta->boletaRevision(["idboleta" => $_GET['idboleta']]);
}

if($_GET['op'] == 'eliminarBoleta'){
  $data;

  $data = $boleta->eliminarBoletas(["idboleta" => $_GET['idboleta']]);
}

  
} //Fin de isset

?>