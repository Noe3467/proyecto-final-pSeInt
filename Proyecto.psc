SubProceso saludar(nombre Por Referencia)
	// Utilizaremos la variable "nombre" por referencia para darle persistencia a los datos
	//
	// Este sub proceso se encargara de la bienvenida inicial del usuario
	// Solicita su nombre y lo almacena en la variable "nombre"
	Escribir "por favor, ingresá tu nombre";
	Leer nombre;
	Escribir "HOLA ", Mayusculas(nombre), "! Bienvenid@ a nuestro centro de belleza y spa";
FinSubProceso


SubProceso pedirTurno (tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje Por Referencia)
	//Utilizaremos un repetir para mostrar los horarios disponibles
	// Los datos traidos por referencia solo los utilizaremos para poder lanzar el siguiente sub proceso
	
	//El horario es muy importante. Designara que array utilizaremos para guardar los datos
	// y tambienel indice que utilizaremos
	
	Definir selector, horario Como Entero;
	Escribir "";
	Repetir
		Escribir "Elegí en que horario te gustaría atenderte. ";
		Escribir "------------- Turno Mañana -------------";
		Escribir "-->>ingresá 1 para el primer turno (8 a 10hs)";
		Escribir "-->>ingresá 2 para el segundo turno (10 a 12hs)";
		Escribir "";
		Escribir  "------------- Turno Tarde -------------";
		Escribir"-->>ingresá 3 para el primer turno (13 a 15hs)";
		Escribir "-->>ingresá 4 para el segundo turno (15 a 17hs)";
		Escribir "-->>ingresá 5 para el segundo turno (17 a 19hs)";
		Escribir "";
		Escribir "-->>Ingresa 0 para salir";
		Leer horario;
	Hasta Que horario = 1 o horario = 2 o horario = 3 o horario = 4 o horario = 5;
	confirmarFecha(horario, tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
	
FinSubProceso


SubProceso confirmarFecha(horario, tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje Por Referencia)
	Definir dia,i Como Entero;
	Definir turno Como caracter;// utilizaremos esta variable para convertir el horario en cadena ej: HORARIO = 1 entonces turno = mañana 10hs.
	dia<-0;
	Escribir "";
	Repetir // lanzaremos un repetir para permitir seleccionar el dia segun horario seleccionado anteriormente
		Escribir "Selecciona el dia para tu turno (Solo figuran dias habiles)";
		//Recorreremos el array para comprobar que los dias que vamos a mostrar tienen disponible el turno en ese horario
		Para i<-1 Hasta 15 Con Paso 1 Hacer
			Si (horario = 1) o (horario = 2) y (tManana[i,horario] = "libre") Entonces
				Escribir "Dia: ",abril[i];//  si los dias estan libres mostraremos su correspondiente contraparte en el arreglo abril
			FinSi// En cambio si el horario es 3,4 o 5 el turno es la tarde y utilizaremos el arreglo tTarde y comprobaremos que dias estan asignados como "libre"
			Si (horario = 3) o (horario = 4) o (horario = 5) y (tTarde[i,horario] = "libre") Entonces
				Escribir "Dia: ",abril[i]; //  si los dias estan libres mostraremos su correspondiente contraparte en el arreglo abril
			FinSi
		FinPara
		Leer dia;
	Hasta Que dia <>0
	
	// Una vez el usuario ha seleccionado el dia realizaremos la tarea de clasificar los datos faltantes y guardarlos
	Si dia <> 0 Entonces
		
		//Ahora dado que el usuario selecciona el dia visualizado pero no su indice en el arreglo, debemos buscarlo
		// utilizamos un para para comprobar su id y la guardamos
		Para i<-1 Hasta 15 Con Paso 1 Hacer
			Si abril[i] = dia Entonces
				dia<-i;
			FinSi
		FinPara
		
		//Dependiendo del horario sera el turno visualizado
		// con esto convertimos el horario (1,2,3,4,5) en una cadena 
		// y tambien aprobecharemos para almacenar el nombre del cliente en el arreglo correspondiente por ejemplo:
		// Cliente : Pepe, Dia: 2, Horario : Mañana, Turno : turno 1 mañana
		//Va a ser guardado en el arreglo tManana[Dia,Turno]=Nombre   tManana[2,1]= "Pepe"
		Si (horario = 1) o (horario = 2) Entonces
			//Dependiendo del horario sera el arreglo utilizado 1,2 tManana
			tManana[dia,horario]<-nombre; // array turno mañana
			Si horario = 1 Entonces
				turno <- "Mañana de 8-10hs";
				turno <- "Mañana de 8-10hs";
			SiNo
				turno <- "Mañana de 10-12hs";
			FinSi
		SiNo
			//3,4,5 tTarde
			tTarde[dia,horario]<-nombre;// array turno tarde
			Si horario = 3 Entonces
				turno <- "Tarde de 13-15hs";
			FinSi
			Si horario = 4 Entonces
				turno <- "Tarde de 15-17hs";
			FinSi
			Si horario = 5 Entonces
				turno <- "Tarde de 17-19hs";
			FinSi
		FinSi
		tpoMasaje[dia,horario]<-tpoMsj;
		
		//Damos por finalizada la carga de datos
		// Y se los mostramos al usuario
		Escribir "";
		Escribir "¡Felicitaciones! Su reserva ya se ha realizado";
		Escribir "Para el dia: ",abril[dia];
		Escribir "En el turno: ",turno;
		Escribir "Tipo de Masaje: ",tpoMsj;
	FinSi
FinSubProceso


SubProceso menuAdmin(nombre, abril, tTarde, tManana, tpoMasaje,tpoMje Por Referencia)
	Definir select,i,contador Como Entero;
	Definir password Como Caracter;
	Repetir
		Escribir  "Digite su contraseña";
		Escribir "0 - Salir";
		Leer password;
		Si password <> "12345" o password <> "0" Entonces
			contador <-0;
		FinSi
		Si password = "0" Entonces
			contador<-1;
		FinSi
		Si password = "12345" Entonces
			contador<-1;
			Escribir "bienvenid@ *", nombre, "* a la consola de administracion";
			Escribir "donde podras consultar los turnos asignados por tus clientes";
			Escribir "";
			Escribir "Selecciona la opcion :";
			Escribir "1 - Consulta de turnos";
			Escribir "0 - Salir";
			Leer select;
			Si select = 1 Entonces
				Para i<-1 Hasta 15 Con Paso 1 Hacer
					Escribir "| DIA | TurnoM 1 | TurnoM 2 | TurnoT 1 | TurnoT 2 | TurnoT 3 |";
					Escribir "| ",abril[i]," | ",tmanana[i,1]," | ",tmanana[i,2]," | ",tTarde[i,3]," | ",tTarde[i,4]," | ",tTarde[i,5]," | ";
				FinPara
			SiNo
				Si select = 0 Entonces
					Escribir "Saliendo al menu principal";
				FinSi
			FinSi
		FinSi
	Hasta Que contador = 1;
FinSubProceso


SubProceso menu(nombre, abril, tTarde, tManana, tpoMasaje Por Referencia)
	DEfinir opcion, horario como entero;
	Definir tpoMsj Como caracter;
	definir precio, descuento como real;
		Escribir "ingresá la opción deseada.";
		Escribir "";
		Escribir "1° MASAJES DESCONTRACTURANTES - $1500";
		Escribir "2° MASAJES TERAPÉUTICOS - $2000";
		Escribir "3° MASAJES CONVENCIONALES - $1200";
		Escribir "4° SALIR";
		Leer opcion;
		Escribir "";
		Segun opcion Hacer
			1:
				Escribir "elegiste `masajes descontracturantes`, debes confirmar el horario.";
				tpoMsj<-"masajes descontracturantes - $1500";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			2:
				Escribir "elegiste `masajes terápeuticos`, debes confirmar el horario.";
				tpoMsj<-"masajes terápeuticos  - $2000";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			3:
				Escribir "elegiste `masajes convencionales`, debes confirmar el horario.";
				tpoMsj<-"masajes convencionales  - $1200";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			4:
				Escribir "Elegiste la opción de SALIR";
				Escribir "";
			De Otro Modo:
				Escribir "Se equivocó de opción de menú, volver a elegir opciones";
					menu(nombre, abril, tTarde, tManana, tpoMasaje);
		FinSegun
		
FinSubProceso

Proceso principal
	// Utilizaremos arreglos para almacenar los datos introducidos pr el cliente
	// Y clasificaremos los datos de la siguiente manera:
	// Abril: Dias habiles del mes
	// tManana : Horarios habiles turno mañana asignados a un dia y un cliente Ej: Tmanana[DIA,TURNO] = "Nombre ClienteX"
	// tTarde : horarios habiles turno tarde asignados a un dia y un cliente Ej: tTarde[DIA,TURNO] = "Nombre ClienteX"
	
	Definir abril,i como entero;
	Definir tTarde Como cadena;
	Definir tManana Como cadena;
	Definir tpoMasaje Como cadena;
	Definir nombre como Cadena;
	Definir horario,selector Como Entero;
	
	// Inicializacion de arrays y carga de datos inicial
	Dimension tTarde[16,6];
	Dimension tManana[16,4];
	Dimension tpoMasaje[16,6];
	Dimension abril[16];
	
	Para i<-1 Hasta 15 Con Paso 1 Hacer
		tTarde[i,3]<-"libre";
		tTarde[i,4]<-"libre";
		tTarde[i,5]<-"libre";
		
		tManana[i,1]<-"libre";
		tManana[i,2]<-"libre";
		
		tpoMasaje[i,1]<-"libre";
		tpoMasaje[i,2]<-"libre";
		tpoMasaje[i,3]<-"libre";
		tpoMasaje[i,4]<-"libre";
		tpoMasaje[i,5]<-"libre";
	FinPara
	
	//**** Solamente agregamos los dias habiles laborales en abril
	abril[1]<-1;
	abril[2]<-4;
	abril[3]<-5;
	abril[4]<-6;
	abril[5]<-7;
	abril[6]<-8;
	abril[7]<-18;
	abril[8]<-19;
	abril[9]<-20;
	abril[10]<-21;
	abril[11]<-22;
	abril[12]<-25;
	abril[13]<-26;
	abril[14]<-27;
	abril[15]<-28;
	
	// fin carga de datos
	
	// Utilizaremos un repetir para iniciar el menu
	// Con esto se busca que el proceso principal no se cierre y pierda los datos ya cargados
	
	Repetir
		//Ofrecemos los modos de uso del programa 
		Escribir "Selecciona el modo de uso :";
		Escribir "1 - Modo Cliente (Ventas y reservas de turnos)";
		Escribir "2 - Modo Administracion (Consulta de turnos)";
		Escribir "0 - Cerrar Sesion (Borrado de turnos)";
		Leer selector;
		//Lanzamos el sub proceso que corresponda segun la opcion seleccionada
		Si selector = 1 Entonces
			saludar(nombre);	// Este sub proceso da la bienvenida a el usuario
			menu(nombre, abril, tTarde, tManana, tpoMasaje);// Este sub proceso solo permitira la carga por parte del cliente
		SiNo
			Si selector = 2 Entonces
				saludar(nombre);	// Este sub proceso da la bienvenida a el usuario
				menuAdmin(nombre,abril,tTarde,tManana,tpoMasaje,tpoMje);// Este sub proceso solo permitira la visualizacion de los datos por parte del arministrador
			FinSi
		FinSi
	Hasta Que selector = 0
	
FinProceso


