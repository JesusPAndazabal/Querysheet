<?php

require_once '../models/Graficos.php';

$grafico = new Grafico();

if(isset($_GET['op'])){

    if($_GET['op'] == 'nivelesUsuario'){
        $data;

        if(!isset($_GET['fechainicio']) || !isset($_GET['fechafin'])){
            $data = $grafico->nivelesUsuario();
        }else{
            $data = $grafico->nivelesUsuarioFecha([
                "fechainicio" => $_GET['fechainicio'],
                "fechafin"    => $_GET['fechafin']
            ]);
        }

        if($data){
            echo json_encode($data);
        }
    }

    if($_GET['op'] == 'boletasUsuario'){
        $data;

        if(!isset($_GET['fechainicio']) || !isset($_GET['fechafin'])){
            $data = $grafico->boletasUsuario();
        }else{
            $data = $grafico->boletasUsuarioFecha([
                "fechainicio" => $_GET['fechainicio'],
                "fechafin"    => $_GET['fechafin']
            ]);
        }

        if($data){
            echo json_encode($data);
        }
    }

    if($_GET['op'] == 'boletasEstado'){
        $data;

        if(!isset($_GET['fechainicio']) || !isset($_GET['fechafin'])){
            $data = $grafico->boletasEstado();
        }else{
            $data = $grafico->boletasEstadoFecha([
                "fechainicio" => $_GET['fechainicio'],
                "fechafin"    => $_GET['fechafin']
            ]);
        }

        if($data){
            echo json_encode($data);
        }
    }



}


?>