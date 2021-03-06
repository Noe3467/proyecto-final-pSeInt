SubProceso saludar(nombre Por Referencia)
	// Utilizaremos la variable "nombre" por referencia para darle persistencia a los datos
	//
	// Este sub proceso se encargara de la bienvenida inicial del usuario
	// Solicita su nombre y lo almacena en la variable "nombre"
	Escribir "****************************************************************";
	Escribir "";
	Escribir "por favor, ingres� tu nombre";
	Leer nombre;
	Escribir "****************************************************************";
	Escribir "";
	Escribir "HOLA ", Mayusculas(nombre), "!! Bienvenid@ a nuestro centro de Belleza y Spa !!";
	Escribir "";
	Escribir "****************************************************************";
	Escribir "";
FinSubProceso


SubProceso pedirTurno (tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje Por Referencia)
	//Utilizaremos un repetir para mostrar los horarios disponibles
	// Los datos traidos por referencia solo los utilizaremos para poder lanzar el siguiente sub proceso
	
	//El horario es muy importante. Designara que array utilizaremos para guardar los datos
	// y tambienel indice que utilizaremos
	
	Definir selector, horario Como Entero;
	Escribir "";
	Repetir
		Escribir "****************************************************************";
		Escribir "";
		Escribir "Eleg� en que horario te gustar�a atenderte. ";
		Escribir "----------------------------------------------------------------";
		Escribir "";
		Escribir "------------- Turno Ma�ana -------------";
		Escribir "";
		Escribir "-->>ingres� 1 para el primer turno (8 a 10hs)";
		Escribir "";
		Escribir "-->>ingres� 2 para el segundo turno (10 a 12hs)";
		Escribir "";
		Escribir  "------------- Turno Tarde -------------";
		Escribir "";
		Escribir"-->>Ingres� 3 para el primer turno (13 a 15hs)";
		Escribir "";
		Escribir "-->>Ingres� 4 para el segundo turno (15 a 17hs)";
		Escribir "";
		Escribir "-->>Ingres� 5 para el segundo turno (17 a 19hs)";
		Escribir "";
		Escribir "-->>Ingresa 0 para salir";
		Escribir "";
		Escribir "****************************************************************";
		Leer horario;
	Hasta Que horario = 1 o horario = 2 o horario = 3 o horario = 4 o horario = 5;
	confirmarFecha(horario, tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
	
FinSubProceso


SubProceso confirmarFecha(horario, tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje Por Referencia)
	Definir dia,i Como Entero;
	Definir turno Como caracter;// utilizaremos esta variable para convertir el horario en cadena ej: HORARIO = 1 entonces turno = ma�ana 10hs.
	dia<-0;
	Escribir "****************************************************************";
	Escribir "";
	Repetir // lanzaremos un repetir para permitir seleccionar el dia segun horario seleccionado anteriormente
		Escribir "****************************************************************";
		Escribir "";
		Escribir "Selecciona el dia para tu turno (Solo figuran dias habiles)";
		Escribir "";
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
		// Cliente : Pepe, Dia: 2, Horario : Ma�ana, Turno : turno 1 ma�ana
		//Va a ser guardado en el arreglo tManana[Dia,Turno]=Nombre   tManana[2,1]= "Pepe"
		Si (horario = 1) o (horario = 2) Entonces
			//Dependiendo del horario sera el arreglo utilizado 1,2 tManana
			tManana[dia,horario]<-nombre; // array turno ma�ana
			Si horario = 1 Entonces
				turno <- "Ma�ana de 8-10hs";
				turno <- "Ma�ana de 8-10hs";
			SiNo
				turno <- "Ma�ana de 10-12hs";
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
		Escribir "****************************************************************";
		Escribir "";
		Escribir "�Felicitaciones! Su reserva ya se ha realizado";
		Escribir "";
		Escribir "----------------------------------------------------------------";
		Escribir "";
		Escribir "Para el dia: ",abril[dia];
		Escribir "";
		Escribir "En el turno: ",turno;
		Escribir "";
		Escribir "Tipo de Masaje: ",tpoMsj;
		Escribir "";
		Escribir "****************************************************************";
	FinSi
FinSubProceso


SubProceso menuAdmin(nombre, abril, tTarde, tManana, tpoMasaje,tpoMje Por Referencia)
	Definir select,i,contador Como Entero;
	Definir password Como Caracter;
	Repetir
		Escribir "****************************************************************";
		Escribir "";
		Escribir  "Digite su contrase�a";
		Escribir "";
		Escribir "0 - Salir";
		Escribir "****************************************************************";
		Escribir "";
		Leer password;
		Si password <> "12345" o password <> "0" Entonces
			contador <-0;
		FinSi
		Si password = "0" Entonces
			contador<-1;
		FinSi
		Si password = "12345" Entonces
			contador<-1;
			Escribir "****************************************************************";
			Escribir "";
			Escribir "Bienvenid@ *", nombre, "* a la consola de administracion";
			Escribir "";
			Escribir "Donde podras consultar los turnos asignados por tus clientes";
			Escribir "";
			Escribir "------------------------------------------------------------------";
			Escribir "";
			Escribir "Selecciona la opcion :";
			Escribir "";
			Escribir "1 - Consulta de turnos";
			Escribir "";
			Escribir "0 - Salir";
			Escribir "";
			Escribir "****************************************************************";
			Leer select;
			Si select = 1 Entonces
				Para i<-1 Hasta 15 Con Paso 1 Hacer
					Escribir "****************************************************************";
					Escribir "";
					Escribir "| DIA | TurnoM 1 | TurnoM 2 | TurnoT 1 | TurnoT 2 | TurnoT 3 |";
					Escribir "";
					Escribir "";
					Escribir "| ",abril[i]," | ",tmanana[i,1]," | ",tmanana[i,2]," | ",tTarde[i,3]," | ",tTarde[i,4]," | ",tTarde[i,5]," | ";
					Escribir "";
					Escribir "";
					Escribir "****************************************************************";
					Escribir "";
					Escribir "";
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
		Escribir "****************************************************************";
		Escribir                "Ingres� la opci�n deseada.";
		Escribir "------------------------------------------------------------------";
		Escribir "";
		Escribir "1� MASAJES DESCONTRACTURANTES - $1500";
		Escribir "";
		Escribir "2� MASAJES TERAP�UTICOS - $2000";
		Escribir "";
		Escribir "3� MASAJES CONVENCIONALES - $1200";
		Escribir "";
		Escribir "4� SALIR";
		Escribir "";
		Escribir "****************************************************************";
		Leer opcion;
		Escribir "";
		Segun opcion Hacer
			1:
				Escribir "Elegiste `masajes descontracturantes`, debes confirmar el horario.";
				tpoMsj<-"masajes descontracturantes - $1500";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			2:
				Escribir "Elegiste `masajes ter�peuticos`, debes confirmar el horario.";
				tpoMsj<-"masajes ter�peuticos  - $2000";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			3:
				Escribir "Elegiste `masajes convencionales`, debes confirmar el horario.";
				tpoMsj<-"masajes convencionales  - $1200";
				pedirTurno(tpoMsj, nombre, abril, tTarde, tManana, tpoMasaje);
				Escribir "";
			4:
				Escribir "Elegiste la opci�n de SALIR";
				Escribir "";
			De Otro Modo:
				Escribir "Se equivoc� de opci�n de men�, volver a elegir una opcion";
					menu(nombre, abril, tTarde, tManana, tpoMasaje);
		FinSegun
		
FinSubProceso

Proceso principal
	// Utilizaremos arreglos para almacenar los datos introducidos pr el cliente
	// Y clasificaremos los datos de la siguiente manera:
	// Abril: Dias habiles del mes
	// tManana : Horarios habiles turno ma�ana asignados a un dia y un cliente Ej: Tmanana[DIA,TURNO] = "Nombre ClienteX"
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
		//Escribir    "                    __                             ";
		//Escribir    "                  .'  '.                           ";
		//Escribir    "              _.-'/  |  \                          ";
		//Escribir    " ,        _.-"  ,|  /  0 `-.                       ";
		//Escribir    " |\    .-"       `--""-.__.'=====================-,";
		//Escribir    " \ '-'`        .___.--._)=========================|";
		//Escribir    "  \            .'      | ************************ |";
		//Escribir    "   |     /,_.-'        |     Los                  |";
		//Escribir    " _/   _.'(             |        Perricornios      |";
		//Escribir    "/  ,-' \  \            |                          |";
		//Escribir    "\  \    `-'            | ********************     |";
		//Escribir    " `-'                   '--------------------------'";
		Escribir "****************************************************************";
		Escribir                 "Selecciona el modo de uso :";
		Escribir "----------------------------------------------------------------";
		Escribir "";
		Escribir         "1 - Modo Cliente (Ventas y reservas de turnos)";
		Escribir "";
		Escribir         "2 - Modo Administracion (Consulta de turnos)";
		Escribir "";
		Escribir         "0 - Cerrar Sesion (Borrado de turnos)";
		Escribir "";
		Escribir "******************************************************************";
		Escribir "";
		
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




















//Escribir "                                   n.nr4?+nMhnxh..                 ";             
//Escribir "                                ..J?%!!!!!!`(<!!(*L..                ";           
//Escribir "                              'd?!!!!!!!!!!!:!!!!!!(M                  ";         
//Escribir "                             x?!!!!!!!!!!!!!<!!!!!!!!?M                  ";       
//Escribir "                            r!!!!!!!UU)UUX!!!!~:?!!!!!!*M                  ";     
//Escribir "                          n=!<!!Xd$$#o$$#?!!!!!!!!!!!!!!!n.                  ";   
//Escribir "                        xx)!!!!4$$FRP?!!!!!!!!!!!!!!!!!!~<*..                  "; 
//Escribir "                        M<!<!!!MMM.!!!!!!!!!!!!!!!!!!!X!!<:4                    ";
//Escribir "                        M!)!!!!?(!!!!!!!:!!!!!!!!!!!!!#$X!:~M                   ";
//Escribir "                        M!!!!!!!!!!!!<><!?!!!!!!!!!!!!!Ri&!<C                   ";
//Escribir "                        M!!!!!!!!!~` <!!!!!:!!!!!!~!!!!!$$b!M                   ";
//Escribir "                        M!\!!!!!!<<:/~::!~<!<'!!!!<!!!!!M?$H4  ....   .....     ";
//Escribir "                        MX!!!!!.~ ~.xHR!:!!!!!!'!!~!!!!!.M?4M  fh/M   4M@L.     ";
//Escribir "                        MM!!!!<!!!WM#>:/!<t!!\!!!!`!>!!!X!!<M  >MMh   4tMP      ";
//Escribir "                         f!!!!!!!\$  %u'?J%!H!!!!!'! !!!:>!!/  MMMM  MXHMXMd2N>     ";
//Escribir "                        nH!!!!!:!!7Wi$$$$NWP!~!<)R!<!!!!!!\!   !?!M 'k!#XMMdM?>     ";
//Escribir "                        4X!!!!<!~!h$$$$$$$$R!X>-+)~!!!!!!!HX<  /MM?..XM<MMTMM4r    ";
//Escribir "                        4M!!<<<!<~/X$$$$$$RU(( 3!~!'!~\X!!M?d  MMM/MMMMMMdM*M>.   ";
//Escribir "                         'h!<<<~<(<M5$$$$$$B$$$R!` !<?XX~HH)M  MkMM4%M(M(MLM>M?C  ";
//Escribir "                          PXX<~<`d)Q$$$$$$##9$R!:<<\FfMXM!MMH*<M?MMkMM<XMMMMM3Mh   ";
//Escribir "                           "M?<<hh9$$$e@$$$$MT~<<:JMM """)d.<<MMWMMMMMM:!MMhHMX)  ";
//Escribir "                            Mc<<<!~R$$$N@#!` < <n<M*=     ^kh<<=dMi!MMMHx!<</*"    ";
//Escribir "                            !$$$iL'>!#"`<L"!`n!d<d3        M8x<iMRMH<MM*MkxMh     ";
//Escribir "                          nh$~$$$$  nnH$MhMMM%CU3C*M<      4X$MM99R!MXMM:/       ";
//Escribir "                         4Mb$e.$$$ HM"`$ """9$$$$$$$CMJ      M$RRM!<<MMMMJ      ";
//Escribir "                      nnM!.P$$$$$?#RMMX3. <<<<"$5"  ^$K=     M#$?!<<:?M*<Mr     ";
//Escribir "                . ....M"<L$$$$Ib$$$#2@88N$$ << $9. < #$MM    3MP$HHMMH~<XM      ";
//Escribir "                MSb$$"<\$$$$$$X$$W$$$$$$$$F<<< $$RN@R@$Et    JP8^*MMMMMMHC      ";
//Escribir "              M"*$$$ <<@$$$$$$MP$$$$$$$$$$     R$$$NW$$R\    >~$$NI@MMMd>       ";
//Escribir "            MM  <$$ <<~$$$$$***"$$$$$$$$$"       $$$$$$!M    .$$$$I$R8x*(       ";
//Escribir "           MH' z5$    $$$$$2@S:$$$$$$$$         $$$$$$4M    M#$$$$$$$$R>       ";
//Escribir "            MXM9X$$    $$$$eo$e$$$I$N$$$i        $$$$$$4M    .dWF7$*$$R4>       ";
//Escribir "            MH$N$$$  .$$$$$$$$$$$$$$$$$$$c      3$$$$$RXM    d$$$MMMMMP*>       ";
//Escribir "            "M$$$$$ $NdN$$$$3$$$$$$$$$$$$B      '$$$$$N94    "$$$$NM%>"         ";
//Escribir "              ?$$$l$$$$$$$$$$$$$$$$$$$$$$R    X   "$$$"%M  *M #$$$RMM           ";
//Escribir "              M$$l$$$$$$$$$$$$$$$RMMMR$$$M    M     $$KxM  M   $$$MxM           ";
//Escribir "              M$%$$$$$$$d$$$$$$$$MMMMMMMM!   <.      #$hX  M   $$$MM*           ";
//Escribir "              M$$$$$$$$*"*$$$$$RMMMMMMMMP    hX       "$M  ~  J$$Mx*            ";
//Escribir "              "J/R$$$Rf<  ^$$$MMMMMMMM9`   iMM\r       "/M"   $$$MM             ";
//Escribir "               M$?MMMM>    $$$$MxWN@dMMM XMMMX)M        #f    $$R%L             ";
//Escribir "               M$  ""3k    $$$$$*$$$NQ2N@$$M)  4x             $$MMM             ";
//Escribir "               *$   %$$   x$$#...` ..  'MMMMH  -*.           $$$PP>             ";
//Escribir "                R  :'$$L' $$$!    `'   .M!h"n    M           $$MH"              ";
//Escribir "                f ~  '$$ d$$$       .!` M        '/          $MMh               ";
//Escribir "                M  '  $$L$$$$e...nnMMMMf"        MHN        <RM^P               ";
//Escribir "                4     '$K$$$$$$$MMMMM*M>         '"/$       :M!MM               ";
//Escribir "                dL     $$$$$$$$$$8MMMLM>           M$       H*M=                ";
//Escribir "                xM     4$#$$$$$$$$M8$$(>           M7L    xM)*'                 ";
//Escribir "                       '$%$$$$$$$$$$$$$M           *4$  u$MhM                   ";
//Escribir "                  L    J$$$$$$$$$$$$$$$$t.           hN$$PH                     ";
//Escribir "                  M    $$$$$$$$$$$$$$$$$$>n          MHRC""                     ";
//Escribir "                  M    $$$$$$$$$$$$$$$$$$$M..        " ""                       ";
//Escribir "                  %    $$$$$$$$$$$$$$$$$@$$2>                                   ";
//Escribir "                 P     $$$$$$$$$$$$$$$$$$$@$HnC                                 ";
//Escribir "                M~     $$$9$$$$$$$$$E$$$$$$$NP4                                 ";
//Escribir "              nn)      '$$%$$$$$$$$$R$$$$$$$$$HM.                               ";
//Escribir "              MM$       #$NR$$$$$$$$X$$$$$$$$$$M? .                             ";
//Escribir "              M)$       x$$K$$$$$$$$?$$$$$$$$$$$MhM                             ";
//Escribir "              M$$       Mb$$4$$$$$$$33$$$$$$$$$$NMLhx                           ";
//Escribir "              M$$      :P>N$$G$$$$$$$N$$$$$$$$$$$$M M                           ";
//Escribir "              M$$      M "!R$$*$$$$$$$$$$$$$$$$$$$~ /:                          ";
//Escribir "              f$F     xr  /HRRNB$$$$$$f$$$$$$$$$$$  M4M                         ";
//Escribir "              d$"    .)\ 4!(?R*$$$$$$&$$$$$$$$$$$  dMHM                         ";
//Escribir "            dP$$     M  nMt)xX$$@$$$$$2$$$$$$$$$  z$MMf                         ";
//Escribir "           Md$$    :M  M)4MMMXR$B$$$$M9$$$$$$$> .$$RMMMM                       ";
//Escribir "            M$$~    MC  M%MMMMX97NR$$$M9$$$$$$P  $$$$MM?M                       ";
//Escribir "          ..3$$$.  .h-  MX9MMMMM?X$$$$M8$$$$$$  $$$$$MM~M                       ";
//Escribir "          JM$$$RMh M    PCXMMMMMMXxRRMM$$$$$$F x$$$$$MM 4                       ";
//Escribir "        M3NW$$$MMMJM    JhhMRMMMMH9?!*M9$$$$$  $$$$$$M" H                       ";
//Escribir "       C3$$$$$*$$RMM   .RMMMMMMMHMMP)H!9$$$$$e$$$$$$$` JMMM                     ";
//Escribir "      'M$$<<~?*$$etM  nd4MMMMMMMMXHHH!X8$$$$$$$$$$$$   MMM"                     ";
//Escribir "      '*M)Ri><<$$$\*  MktXMMMMMMMMM!MH9$$$$$$$$$$$$" .MMMM.                     ";
//Escribir "        4?bMHRm$$$M'  M3MMMMMMMMMHM9XMM$$$$$$$$$$$F :MMMMtM                        ";
//Escribir "      Mn9$$$$MMM**    MWMXMMMMMMMMMMXhP$$$$$$$$$$$  RMMMM4M                     ";
//Escribir "    .nt@$$$$$M?M""    MRHMMMMMMMMMMMXSM$$$$$$$$$$  @MMMMM4M                     ";
//Escribir "  .n*$$$$$$$$E#4      MRMMMMMMMMMMMMS*H$$$$$$$$$` d$MMMMM4M                     ";
//Escribir ". MQ$$$$$$$$%XM/      MRMMMMMMMMMMMMhXk$$$$$$$$F  $$MMMMM4M             ";        
//Escribir "Mt@$$$#$$$$3H"        MMMMMMMMMMMMMMPEM$$$$$$$$$e$$MMMMMM4M               ";      
//Escribir "M$$$#>!d$$PM          MMMMMMMMMMMMMM@HM$$$$$$$$$$$$MMMMMMXM    ";