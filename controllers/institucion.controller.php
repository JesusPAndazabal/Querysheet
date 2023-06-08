<?php

session_start();

require_once '../models/Instituciones.php';
require_once '../models/Serverside.php';


if(isset($_GET['op'])){

     $institucion = new Institucion();

    if($_GET['op'] == 'listarInstituciones'){
        $data = $serverSide->get("vs_instituciones_full", "idinstitucion", array("idinstitucion", "codlegacy", "codactual", "nombre" , "usuarioregistro"));
    }   

    if($_GET['op'] == 'obtenerInstitucion'){
        $data = $institucion->obtenerInstitucion(["idinstitucion" => $_GET['idinstitucion']]);

        if($data){
            echo json_encode($data);
        }
    }

    if($_GET['op'] == 'eliminarInstitucion'){
        $data = $institucion->eliminarInstitucion(["idinstitucion" => $_GET['idinstitucion']]);
    } 

    /* if($_GET['op'] == 'buscarNombreInstitucion'){

        $data;
        $data = $institucion->buscarNombreInstitucion(["search" => $_GET['search']]);

        listadoInstituciones($data);     
    } */

    
   
}//Fin de isset

if(isset($_POST['op'])){

    $institucion = new Institucion();

    if($_POST['op'] == 'registrarInstitucion'){
        
        $datosEnviar = [
            "idusuarioregistro" => $_SESSION['idusuario'],
            "codlegacy"     => $_POST["codlegacy"],
            "codactual"     => $_POST["codactual"],
            "nombre"        => $_POST["nombre"]
        ];

        $institucion->registrarInstitucion($datosEnviar);
    }

    if($_POST['op'] == 'actualizarInstitucion'){

        $datosEnviar = [
            "idinstitucion" => $_POST["idinstitucion"],
            "idusuarioregistro" => $_SESSION['idusuario'],
            "codlegacy"     => $_POST["codlegacy"],
            "codactual"     => $_POST["codactual"],
            "nombre"        => $_POST["nombre"]
        ];

        $institucion->actualizarInstitucion($datosEnviar);
    }


}


?>