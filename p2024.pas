program p2024;
const
 TotalEquipos=32;
type
 jugadorRegistro = record
  dni: Integer;
  nombre: String;
  numcamiseta: 1..99;
 end;

 listaJugadores = ^nodo;
 
 nodo = record
  elem: jugadorRegistro;
  sig: listaJugadores;
 end;

 vectorEquipos = Array[1..32] of ListaJugadores;
 vectorCamisetas = Array[1..99] of Integer;

 procedure IniciarLista(var jugadores: listaJugadores);
 begin
   jugadores:=nil;
 end;

 procedure IniciarVectores(var equipos: vectorEquipos; var camisetas: vectorCamisetas);
 var
  i:Integer;
 begin
   for i:=1 to TotalEquipos do begin
     equipos[i]:=0
   end;
   for i:=1 to 99 do begin
     camisetas[i]:=0
   end;
 end;

 procedure LeerRegistroJugadores(var jugadorReg: jugadorRegistro);
 begin
   Read(jugadorReg.dni);
   if(jugadorReg.dni <> 0) then begin
     Read(jugadorReg.nombre);
     Read(jugadorReg.camiseta);
   end;
 end;

procedure InsertarAtras(var jugadores, pU: listaJugadores; jugadorReg: jugadorRegistro);
var
 nuevo: listaJugadores;
begin
  new(nuevo); nuevo^.elem:=jugadorReg; nuevo^.sig:=nil;
  
  if(jugadores = nil) then begin
    jugadores:=nuevo;
    pU:=nuevo;
  end
  else begin
    ult^.sig:=nuevo;
    ult:=nuevo;
  end;
end;


procedure InsertarCamisetaVector(numJugadorCamiseta: Integer; camisetas: vectorCamisetas);
var
 i,dl:Integer;
begin
 dl:=0;
 if((dl +1) <= 99) then
  begin
   dl:=dl+1;
    camisetas[dl]:=numJugadorCamiseta;
  end;    
end;

procedure CargarLista(var jugadores:listaJugadores; var camisetas: vectorCamisetas);
var
 jugadorReg: jugadorRegistro;
 camisetaUsada: Boolean;
begin
  camisetaUsada:=False;
  LeerRegistroJugadores(jugadorReg);
  while(jugadorReg.dni <> 0) do begin
    //validar numero de camiseta
    for i:=1 to 99 do begin
      if(vectorCamisetas[i] = jugadorReg.numcamiseta) then camisetaUsada:=True;
    end;
    
    if(camisetaUsada= false) then begin
     InsertarAtras( pI, pU, jugadorReg);
     InsertarCamisetaVector(camisetas,jugadorReg.numcamiseta); // INSERTAR EN VECTOR LA CAMISETA  
    end;  
    camisetaUsada:=False;
    LeerRegistroJugadores(jugadorReg);
  end;
end;



 procedure CargarJugadorEnVector(var equipos: vectorEquipos; jugadores: listaJugadores);
 var
  i,dl: Integer;
 begin
  while(listaJugadores <> nil) and ((dl + 1) <= 32) do begin
   dl:=dl + 1;
   equipos[dl]:=listaJugadores; 
  end;
 end;

 // implementar modulo para cargar jugador, considerando que el numero de camiseta no debe repetirse en el equipo. Implementar la validacion sin recorrer la lista
var
 jugadores, pU: listaJugadores;
 equipos: vectorEquipos; 
 camisetas: vectorCamisetas;
begin
 IniciarLista(jugadores);
 IniciarVectores(equipos, camisetas);
 CargarLista(camisetas, jugadores);
 CargarJugadorEnVector(equipos, jugadores);
end.