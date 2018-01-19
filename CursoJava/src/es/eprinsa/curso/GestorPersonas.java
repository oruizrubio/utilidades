package es.eprinsa.curso;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
					.sorted()
					.forEach(System.out::println);
	}
	
	public static void hilos(List<EmpleadoPublico> empleadosPublicos ) {
		empleadosPublicos.parallelStream()
					.filter(s ->  {
						System.out.format("filter: [%s] [%s] \n", s, Thread.currentThread().getName());
						return s.getEdad() > 10;
					})
					.sorted()
					.forEach(System.out::println);
	}	
	
	public static Double edadMediaEmpleado(List<EmpleadoPublico> empleadosPublicos){
		Double valor;		
		try {
			valor = empleadosPublicos.stream()
			.filter(s ->  s.getEdad() > 10 )				
			.mapToInt(s -> s.getEdad())
			.average().getAsDouble();
		} catch (Exception e) {
			valor = Double.valueOf("0");
		}
		
		return valor;
	}
	
	public static void upperDni(List<EmpleadoPublico> empleadosPublicos){
		try {
			empleadosPublicos.stream()
			.filter(s ->  {
				System.out.println("filter: " + s);
				return s.getEdad() > 10;
			})
			.forEach(System.out::println); ;				
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}
	
	// prueba de filtro de ep que empiezan por N
	public static void empiezaN(List<EmpleadoPublico> empleadosPublicos){
		try {
			List<EmpleadoPublico> ep = empleadosPublicos.stream()
			.filter(s ->  {
				System.out.println("filter: " + s);
				return s.getNombre().startsWith("N");
			})
			.collect(Collectors.toList());
			
			ep
			.forEach(p -> System.out.println(p.toString()));
			/* puedo recorrer la lista para trabajarla, aunque también se puede tratar con el foreach
			for (EmpleadoPublico c : ep) {
				System.out.println(c.toString());
			}*/
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}	
	
	// prueba de filtro de ep que empiezan por N
	public static void quitaDuplicados(List<EmpleadoPublico> empleadosPublicos){
		try {
			Set<EmpleadoPublico> ep = empleadosPublicos.stream()
			.filter(s ->  {
				System.out.println("filter: " + s);
				return s.getNombre().startsWith("N");
			})
			.collect(Collectors.toSet());
			
			ep
			.forEach(p -> System.out.println(p.toString()));
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}		
	
	// prueba de agrupación de resultados en la colección.  En este caso, agrupamos empleados por primera letra de los apellidos
	public static void agrupaApellidos(List<EmpleadoPublico> empleadosPublicos){
		try {
			Map<Object, List<EmpleadoPublico>> ep = empleadosPublicos.stream()
					.collect(Collectors.groupingBy(p -> p.getApellidos().charAt(0)));

			ep
			.forEach((apellido, p) -> System.out.format("age %s: %s\n", apellido, p));

		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}	
	
	// prueba de agrupación de resultados en la colección y poner separados por comas
	public static void concatena(List<EmpleadoPublico> empleadosPublicos){
		try {
			// se puede mapear o por un método, o por el método toString
			String ep = empleadosPublicos.stream()
					.map(EmpleadoPublico::getApellidos)
					//.map(s -> s.toString())
					.collect(Collectors.joining(", "));

			System.out.println("Secuencia: " + ep);

		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}		

	// prueba de agrupación de resultados en la colección y poner separados por comas
	public static void reducir(List<EmpleadoPublico> empleadosPublicos){
		try {
			empleadosPublicos.stream()
					.filter(s -> s.puedeTrabajar())
					.reduce((p1,p2) -> p1.getEdad() > p2.getEdad() ? p1 : p2)
					.ifPresent(System.out::println);
			
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}		
	
	// 
	public static void primeraLetraApellido(List<EmpleadoPublico> empleadosPublicos){
		try {
			List<EmpleadoPublico> ep = empleadosPublicos.stream()
			.filter(s ->  {
				System.out.println("filter: " + s);
				return s.equals(s);
			})
			.collect(Collectors.toList());
			
			for (EmpleadoPublico c : ep) {
				System.out.println(c.getNombre());
			}
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
	}	

	
	// define un stream y lo ejecuta varias veces, con distintas condiciones
	public static void guardaStream(List<EmpleadoPublico> empleadosPublicos ) {
		// se pueden añadir condiciones no modificables definiéndolas en el stream, o condiciones particulares en el get
		//Supplier<Stream<EmpleadoPublico>> streamSupplier =	() -> empleadosPublicos.stream();
		Supplier<Stream<EmpleadoPublico>> streamSupplier =	() -> empleadosPublicos.stream().filter(s -> s.getEdad()>10);		
		System.out.println("Supplier declarado pero no usado");		
		streamSupplier.get().forEach(System.out::println);	
		System.out.println("Supplier filtrado");
		streamSupplier.get().filter(s ->  s.getEdad() > 11 )
		                    .forEach(System.out::println);
		
	}	

	public static List<EmpleadoPublico> pruebaArray(List<EmpleadoPublico> empleadosPublicos ) {
		try {
			List<EmpleadoPublico> ep = empleadosPublicos.stream()
			.filter(s ->  {
				//System.out.println("filter: " + s);
				return s.getNombre().startsWith("N");
			})
			.collect(Collectors.toList());
			
			return ep;
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}	
			
		return null;
	}
	
}
