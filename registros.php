
<?php

	/* connect to the db */
	$link = mysql_connect('mysql.hostinger.co','u530405213_root','admin123') or die('Cannot connect to the DB');
	mysql_select_db('u530405213_letme',$link) or die('Cannot select the DB');
	header("Access-Control-Allow-Origin: *");
	if(empty($_GET["id"])){
		$query =    "select r2.entradaid, nombres, apellidos, fechaYhora from (select Usuario.nombres, Usuario.apellidos, Usuario.cedula, RegistroLaboral.id from Usuario
					join RegistroLaboral
					on Usuario.cedula = RegistroLaboral.usuario)as r1
					join 
					(select Entradas.id as entradaid, Entradas.fechaYHora, RegistroLaboral.id from Entradas
					join RegistroLaboral
					on Entradas.id = RegistroLaboral.entrada) as r2
					on r1.id = r2.id";
		$result = mysql_query("set names 'utf8'"); 
		$result = mysql_query($query,$link) or die('Errant query:  '.$query);
		while ($res = mysql_fetch_array($result)) {
			$ingreso[] = array('entradaid' => $res[0], 'nombres' => $res[1],
								'apellidos' => $res[2], 'fechaYhora' => $res[3] ); 
		}
	}
	else{
		$id = $_GET["id"];
		$query = "select Usuario.nombres, Usuario.apellidos, Usuario.tipoEmpleado, fechaentrada, fechasalida from Usuario,(select Entradas.FechaYhora as fechaentrada, Salidas.FechaYhora as fechasalida, Salidas.id as salidaid, Entradas.id as entradaid from Salidas join Entradas on Salidas.entrada=Entradas.id) as r, RegistroLaboral
				  where r.entradaid=".$id." and RegistroLaboral.entrada = ".$id. " and Usuario.cedula = RegistroLaboral.usuario";
		$result = mysql_query("set names 'utf8'"); 
		$result = mysql_query($query,$link) or die('Errant query:  '.$query);
		while ($res = mysql_fetch_array($result)) {
			$ingreso[] = array('nombres' => $res[0],'apellidos' => $res[1], 
								'tipoEmpleado' => $res[2], 'fechaentrada'=>$res[3],
								'fechasalida'=> $res[4]); 
		}
			
	}
	header("Content-type: application/json");
	echo json_encode($ingreso);
	mysql_close();	
	
?>