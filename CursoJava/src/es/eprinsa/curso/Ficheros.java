package es.eprinsa.curso;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class Ficheros {
	
	private static String HOME = System.getProperty("user.home");	

	// prueba de agrupación de resultados en la colección y poner separados por comas
	public static void reducir(List<String> lineas){
		try {						
			Map<String, Long> ep = lineas.stream()
					.collect(Collectors.groupingBy(p -> p.substring(0,10), Collectors.counting()));
			
			String fechaMax = Collections.max(ep.entrySet(), Comparator.comparingLong(Map.Entry::getValue)).getKey();
			
			String fechaMin = Collections.min(ep.entrySet(), Comparator.comparingLong(Map.Entry::getValue)).getKey();
			
			System.out.println(fechaMax + " " + ep.get(fechaMax));
			
			System.out.println(fechaMin + " " + ep.get(fechaMin));
			
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}			
	}		

	// genera un fichero con las fecha+nº de incidencias
	public static void generaEstadisticas(List<String> lineas) {
		try {
			Path pa = Paths.get("D:/tmp/cursos/java/estadisticas.txt");			

			Map<String, Long> ep = lineas.stream()
					.collect(Collectors.groupingBy(p -> p.substring(0,10), Collectors.counting()));
						
			ep.forEach((k,v) -> {
				try {
					Files.write(pa, (k + " " + v + "\n").getBytes(), StandardOpenOption.APPEND);
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
			
			
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}
	}
	
	// genera mes: nm_incidencias y luego cada día del mes y sus número de incidencias y luego el otro mes
	public static void generaEstadisticas2(List<String> lineas) {
		try {
			Path pa = Paths.get("D:/tmp/cursos/java/estadisticas2.txt");			
		
			Map<String, Long> ep = lineas.stream()
					.collect(Collectors.groupingBy(p -> p.substring(0,7), Collectors.counting()));
						
			ep.forEach((k,v) -> {
				try {
					Files.write(pa, (k + " " + v + "\n").getBytes(), StandardOpenOption.APPEND);
					
					Map<String, Long> ep2 = lineas.stream()
							.filter(p -> p.substring(0,7).compareTo(k)==0 )
							.collect(Collectors.groupingBy(p -> p.substring(0,10), Collectors.counting()));
					
					ep2.forEach((z,m) -> {
						try {
							Files.write(pa, (z + " " + m + "\n").getBytes(), StandardOpenOption.APPEND);
						} catch (IOException e) {
							e.printStackTrace();
						}
					});
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
						
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}
	}	
	
	// uso de una clase genérica AnalisisDiario, que puede recibir cualquier tipo
	// se almacena la información en la clase genérica 
	public static void generaEstadisticas3(List<String> lineas) {
		try {
			Map<String, List<String>> ep = lineas.stream()
					.collect(Collectors.groupingBy(p -> p.substring(0,10)));

			AnalisisDiario<Integer,String>[] array =  (AnalisisDiario<Integer,String>[]) ep.values().stream()
				.map(k -> new AnalisisDiario<Integer,String>(k.size(), k.get(0).substring(0,11) ))
				.toArray(AnalisisDiario[]::new);
					
			for (AnalisisDiario g : array) {
				System.out.println("Resultado "+ g.getK() + " " + g.getV() );
			}
		} catch (Exception e) {
			System.out.println ("Excepcion estadisticas");
			e.printStackTrace();
		}
	}
	
	
	public static void reducirIterando(List<String> lista){
		try {						
			// se obtiene el día con más incidencias de forma manual.  Hay que conseguirlo con stream			
			ArrayList<String> listaFecha = new ArrayList<String>(){};
			for (String linea : lista) {
				listaFecha.add(linea.substring(0, 10));			
			}			
			Set<String> set = new HashSet<String>(listaFecha);
			int contador = 0;
			int valor = 0;
			String fecha = null;
		        for (String key : set) {		        	
		        	valor = Collections.frequency(listaFecha, key);
		        	if (valor > contador) {
		        		contador = valor;
		        		fecha  = key;
		        	}
		        }	
		        System.out.println(fecha + " " + contador);
			
		} catch (Exception e) {
			System.out.println ("Excepcion");
		}			
	}			
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Path p = Paths.get(HOME);
		
		System.out.println(p + " " + Files.exists(p));
		
		p = Paths.get("D:/tmp/cursos/java/timelog.log");
		
		System.out.println(p + " " + Files.exists(p));
		try {
			List<String> lista = Files.readAllLines(p);
			
			// obtenemos el día con más incidencias con streams
			Ficheros.reducir(lista);

			Ficheros.reducirIterando(lista);
			
			Ficheros.generaEstadisticas(lista);
			
			Ficheros.generaEstadisticas2(lista);
			
			Ficheros.generaEstadisticas3(lista);
			
		} catch (Exception e) {
			System.out.println("Excepción");
		}
	}
}
