<?php
	include 'ConexionBD.php';
	$sqlString = "SELECT id_pedidos_comidas_guisos, cantidad, id_comidas, nombre_comida, precio_unitario, estado, id_guisos, nombre_guiso, estado FROM pedidos WHERE id_usuarios = ".$_POST["id_usuario"]." AND estado = 'Incompleto';";    
	if($result = mysqli_query($conn, $sqlString)){
		$registro = mysqli_fetch_array($result);
        if($registro){
            echo $registro["id_pedidos"];
        }else{
            echo "null";
        }
	}
	else{
		echo "error: ".mysqli_error($conn);
	}
?>