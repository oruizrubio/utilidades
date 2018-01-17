package es.eprinsa.curso;

import java.util.Date;

public class HolaMundo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// pruebas genéricas
		short a = (short)1000000;
		
		int b = 1, c=2, d=0;
		
		d = ++b + c++;
		
		System.out.println(b + " " + c + " " + d );
		
		String var = "cadena";
		System.out.println("Hola Mundo "+a);
		System.out.println("pausa "+var);
		var = "cadena2";
		System.out.println("pausa2 "+var);
		System.out.println("Adiós Mundo");
		
		EmpleadoPublico p1 = new EmpleadoPublico("nombre", "apellidos", 10, "dni", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		EmpleadoPublico p2 = new EmpleadoPublico("nombre", "apellidos", 11, "dni1", new Date(), new Date(), 1973, TipoContrato.JORNADA_PARCIAL);	
		
		// prueba de override compareTo
		System.out.println(p1.compareTo(p2));		
		
		// prueba de o-exclusivo
		if (p2.puedeJubilarse()) {
			System.out.println("puede jubilarse");
		} else {
			System.out.println("no puede jubilarse");
		}
		
		// prueba override equals
		if (p1.equals(p2)) {
			System.out.println("iguales");
		} else {
			System.out.println("distintos");
		}
		
		// prueba de switch
		System.out.println("----- tiempo_para_jubilarse--------");
		System.out.println(p1.tiempoParaJubilarse() + " " + p2.tiempoParaJubilarse());
		System.out.println("");
		
		// prueba de break:label
		String[][] multi;
		multi = new String [2][2];
		multi[0][0] = "dim0-0";
		multi[0][1] = "dim0-1";
		multi[1][0] = "dim1-0";
		multi[1][1] = "dim1-1";
		
		for1:for (int i=0; i<2; i++) {
			for (int j=0; j<2; j++) {
				if (i==1) {
					break for1;
				}
				System.out.println (multi[i][j]);
			}
		}						
		
	}

}
