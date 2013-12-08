#!/usr/bin/perl
 
use strict;
use warnings;
 
use DBI;
 
 my $dbname = 'letmeinw_letmein';
 my $dbhost = 'localhost';
 my $dbuser = 'letmeinw_root';
 my $dbpwd = 'admin123';
 
 my $dbh;
 my $stmt;
 my $sth;
 my $row;
 
 ## Conectarse a la base de datos
 ##
 $dbh = DBI->connect("DBI:mysql:$dbname;host=$dbhost", $dbuser, $dbpwd)
                     or die "Error de conexion: $DBI::errstr";
  
 ## Leer los registros de la tabla
 ##
 $sth = $dbh->prepare("select * from Usuario");
 $sth->execute();

 while ($row = $sth->fetchrow_hashref) {
 	 print "cedula: " . $row->{cedula} . "n";
     print "nombres: " . $row->{nombres} . "n";
     print "Apellidos: " . $row->{apellidos} . "n";     
     print "Tipo de Empleado: " . $row->{tipoEmpleado} . "n";
 }
 ## Desconectarse de la base de datos
 ##
 if (! $dbh->disconnect) {
     warn "Error al desconectarse de la base de datos: $DBI::errstr";
 }
#####################################################################