package es.eprinsa.curso;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;

public class GestorPersonas {

	private static GestorPersonas miGestorPersonas;
	
	public  static GestorPersonas getGestorPersonas() {
		 
		 if (miGestorPersonas==null) {		 
			 miGestorPersonas=new GestorPersonas();
		 }
		 return miGestorPersonas;
	}	
	
	public boolean validaDni(Persona p) {
		boolean rt = false;
		
		if (p.getDni().length() == 9) {
			rt = true;			
		} else {
			rt = false;
		}
		
		return rt;
	}	
	
	public void cumpleanos(Persona p) {
		//añade un año a la edad si la fecha de nacimiento coincide con el día actual
		
		java.util.Date hoy = new Date();
		if (p.getFechaNacimiento().getDay() == hoy.getDay() && p.getFechaNacimiento().getMonth() == hoy.getMonth()) {
			p.getFechaNacimiento().setYear(p.getFechaNacimiento().getYear()+1);
		}
	}
	
	// comprobar que cada objeto accede a distintos métodos
	public void polimorfismo () {
		EmpleadoPublico p1 = new EmpleadoPublico();
		Persona p2 = new EmpleadoPublico();
		Cotizable p3 = new EmpleadoPublico();
		
		System.out.println(p1.getGrado());
		System.out.println(p2.getDni());
		System.out.println(p3.puedeTrabajar(true, true, false));
	}

	// función lambda
	public static void imprimeEmpleadoPublico (List<EmpleadoPublico> listaEmpleados, Predicate<EmpleadoPublico> checker) {
		for (EmpleadoPublico e: listaEmpleados) {
			if (checker.test(e)) {
				System.out.println("Pasa el test");
			} else {
				System.out.println("No pasa el test");				
			}
		}
	}
	
	// funcion lambda con consumidor
	public static void procesaPersona (List<EmpleadoPublico> listaEmpleados, Predicate<EmpleadoPublico> checker, Consumer<EmpleadoPublico> accion) {
		for (EmpleadoPublico e: listaEmpleados) {
			if (checker.test(e)) {
				accion.accept(e);
			} else {
				System.out.println("No pasa el test");				
			}
		}
	}	
	
	public static void pruebaStream(List<EmpleadoPublico> empleadosPublicos ) {
	//public static void pruebaStream(EmpleadoPublico... ep) {
		//List<EmpleadoPublico> empleadosPublicos = Arrays.asList(ep);
		empleadosPublicos.stream()
		            .filter(s -> !s.puedeJubilarse())
					//.map(EmpleadoPublico::toUpperCase)
					.sorted()
					.forEach(System.out::println);
	}
	
}
