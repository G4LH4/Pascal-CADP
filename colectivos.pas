{
    dispone estructura de datos con la info de todos los viajes realizados

    viajes se conoce: codigo de viaje, numero de coche (entre 1000 y 2500), el mes , cantidad de pasajes y dni del chofer. NO SE ENCUENTRA ORDENADA
    ademas la empresa dispone de una estructura de datos con informacion sobre la capacidad maxima de cad coche

    a) numero de coche con el cual se realizaron mas viajes
}

program colectivos;
const 
 max_coche = 2500;
type
 viajeRegistro = record
  numero_coche: 1000..max_coche;
  mes: 1..12;
  cantidad_pasajes: Integer;
  DNI_chofer: Integer;
 end;

 capacidad_maxima_vector = array[1000..max_coche] of Integer;
 vector_contador = array[1000..max_coche] of Integer;

 listaViajes = ^nodo;
 nuevaLista = ^nodo;

 nodo = record
  elem: viajeRegistro;
  sig: listaViajes;
 end;

 procedure IniciarEstructuras(var viajes, nuevaLista: listaViajes; ;var capacidad_maxima: capacidad_maxima_vector; var contador: vector_contador);
 var
  i: Integer;
 begin
   viajes:=nil;
   nuevaLista:=nil;

   for i:=1000 to max_coche do begin
     capacidad_maxima[i]:= 0;
   end;

   for i:=1000 to max_coche do begin
     contador[i]:=0;
   end;
 end;


 procedure CargarContador(viajes: listaViajes; var contador: vector_contador);
 begin
   while(viajes <> nil) do begin
     contador[viajes^.elem.numero_coche]:= contador[viajes^.elem.numero_coche] + 1;
     viajes:=viajes^.sig;
   end;
 end;


// a)

procedure LeerContador(contador: vector_contador);
var
 i, num_mas_viajes, masViajesTotal: Integer;
begin
  num_mas_viajes:=0;
  masViajesTotal:=0;

  for i:=1000 to max_coche do begin
    if(contador[i] > num_mas_viajes) then begin
      num_mas_viajes:=contador[i];
      masViajesTotal:=i;
    end;
  end;
end;

//b)
// genere una lista con los viajes realizados en el mes 2 por un chofer con dni multiplo de 10, donde la cantidad de pasajes 
// vendidos no alcanza la capacidad maxima del coche

procedure InsertarAdelante(var nuevaLista : listaViajes; elem: viajeRegistro );
var
 nuevo: listaViajes;
begin
  new(nuevo); nuevo^.elem:= elem; nuevo^.sig:=nil;

  if(nuevaLista = nil) then nuevaLista:=nuevo
  else begin
    nuevo^.sig:=pI;
    pI:=nuevo;
  end;
end;

procedure Generar_nueva_lista(var nuevaLista: listaViajes; viajes: listaViajes; capacidad_maxima: capacidad_maxima_vector );
begin
  while(viajes <> nil) do begin
    if(viajes^.elem.mes = 2) and ((viajes^.elem.DNI_chofer mod 10) = 0) and (viajes^.elem.cantidad_pasajes < capacidad_maxima[viajes^.elem.numero_coche]) then begin
      // donde la cantidad de pasajes vendidos NO ALCANZA la capacidad maxima del coche
      InsertarAdelante(nuevaLista, viajes^.elem);
    end;
     viajes:=viajes^.sig;
  end;
end;


var
 viajes: listaViajes;
 nuevaLista: listaViajes;
 viaje: viajeRegistro;
 capacidad_maxima: capacidad_maxima_vector;
 contador: vector_contador;
begin
  IniciarEstructuras(viajes,nuevaLista, capacidad_maxima, contador);
  cargarLista(viajes, viaje); // se dispone
  cargarVector(capacidad_maxima_vector); // se dispone
end.