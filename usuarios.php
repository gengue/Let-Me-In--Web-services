
<?php

	/* connect to the db */
	$link = mysql_connect('mysql.hostinger.co','u530405213_root','admin123') or die('Cannot connect to the DB');
	mysql_select_db('u530405213_letme',$link) or die('Cannot select the DB');
	header("Access-Control-Allow-Origin: *");
	if(empty($_GET["id"])){
		$query = "SELECT * from Usuario ";
		$result = mysql_query("set names 'utf8'"); 
		$result = mysql_query($query,$link) or die('Errant query:  '.$query);
		while ($res = mysql_fetch_array($result)) {
			$usuarios[] = array('cedula' => $res[0], 'nombres' => $res[1],
								'apellidos' => $res[2], 'tipoEmpleado' => $res[3] ); 
		}
	}
	else{
		$cedula = $_GET["id"];
		$query = 'SELECT * from Usuario where cedula ='.$cedula;
		$result = mysql_query("set names 'utf8'"); 
		$result = mysql_query($query,$link) or die('Errant query:  '.$query);
		while ($res = mysql_fetch_array($result)) {
			$usuarios[] = array('cedula' => $res[0], 'nombres' => $res[1],
								'apellidos' => $res[2], 'tipoEmpleado' => $res[3] ); 
		}			
	}
	header("Content-type: application/json");
	echo json_encode($usuarios);
	mysql_close();	
	
?>