<?php
	include 'ConexionBD.php';
	$sqlString = "UPDATE pedidos SET estado = 'Completo', hora = '".$_POST["hora"]."' WHERE id_pedidos = ".$_POST["id_pedido"].";";    
	if($result = mysqli_query($conn, $sqlString)) {
        $sqlString = "INSERT INTO pedidos_totales(id_pedidos, total) VALUES (".$_POST["id_pedido"].", ".$_POST["total"].");";    
        if($result = mysqli_query($conn, $sqlString)) {
            echo "exito";
        } else {
            echo "error: ".mysqli_error($conn);
        }
	} else {
		echo "error: ".mysqli_error($conn);
	}
?>