<?php

session_start();

require_once '../models/Empleados.php';
require_once '../models/Serverside.php';

if(isset($_GET['op'])){

    $empleado= new Empleado();

    if($_GET['op'] == 'listarEmpleados'){
        $data = $serverSide->get("vs_empleados", "idempleado", array("idempleado", "codigomodular", "codigodni" , "empleado" ,"encargadoregistro"));
    } 

    if($_GET['op'] == 'obtenerEmpleados'){
        $data = $empleado->obtenerEmpleados(["idempleado" => $_GET['idempleado']]);

        if($data){
            echo json_encode($data);
        }
    }


   /*  if($_GET['op'] == 'buscarEmpleados'){
        $data;

        $data = $empleado->buscarEmpleados(["search" => $_GET['search']]);

        listadoEmpleados($data);

    } 
 */
    if($_GET['op'] == 'registrarEmpleados'){

        $datosEnviar = [
            "idusuarioregistro" => $_SESSION['idusuario'],
            "codigomodular"     => $_GET["codigomodular"],
            "codigodni"         => $_GET["codigodni"],
            "apellidos"         => $_GET["apellidos"],
            "nombres"           => $_GET["nombres"],
            "telefono"          => $_GET["telefono"]
        ];

        $empleado->registrarEmpleados($datosEnviar);
    }

    if($_GET['op'] == 'actualizarEmpleados'){

        $datosEnviar = [
            "idempleado"        => $_GET["idempleado"],
            "idusuarioregistro" => $_SESSION['idusuario'],
            "codigomodular"     => $_GET["codigomodular"],
            "codigodni"         => $_GET["codigodni"],
            "apellidos"         => $_GET["apellidos"],
            "nombres"           => $_GET["nombres"],
            "telefono"          => $_GET["telefono"]
        ];

        $empleado->actualizarEmpleados($datosEnviar);
    }
}



   



?>