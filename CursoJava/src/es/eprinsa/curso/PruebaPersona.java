package es.eprinsa.curso;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.TreeSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class PruebaPersona {
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Persona p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
		
		p1 = new EmpleadoPublico("nombre1", "apellidos1", 10, "dni1", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);		
		p2 = new EmpleadoPublico("nombre2", "apellidos2", 11, "dni2", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p3 = new EmpleadoPublico("nombre3", "apellidos3", 12, "dni3", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p4 = new EmpleadoPublico("nombre4", "apellidos4", 10, "dni4", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);		
		p5 = new EmpleadoPublico("nombre5", "apellidos5", 10, "dni5", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p6 = new EmpleadoPublico("nombre6", "apellidos6", 10, "dni6", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p7 = new EmpleadoPublico("nombre7", "apellidos7", 10, "dni7", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);		
		p8 = new EmpleadoPublico("nombre8", "apellidos8", 10, "dni8", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p9 = new EmpleadoPublico("nombre9", "apellidos9", 10, "dni9", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p10 = new EmpleadoPublico("nombre10", "apellidos10", 10, "dni10", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);		
		p11 = new EmpleadoPublico("nombre11", "apellidos11", 10, "dni11", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p12 = new EmpleadoPublico("nombre12", "apellidos12", 10, "dni12", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p13 = new EmpleadoPublico("nombre13", "apellidos13", 10, "dni13", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		p14 = new EmpleadoPublico("nombre14", "apellidos14", 10, "dni14", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);		
		p15 = new EmpleadoPublico("nombre15", "apellidos15", 10, "dni14", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA);
		
		ArrayList<Persona> lista = new ArrayList<Persona>();
		lista.add(p1);
		lista.add(p2);
		lista.add(p3);		
		lista.add(p4);		
		lista.add(p5);
		lista.add(p6);
		lista.add(p7);
		lista.add(p8);		
		lista.add(p9);
		lista.add(p10);
		lista.add(p11);		
		lista.add(p12);
		lista.add(p13);
		lista.add(p14);
		lista.add(p15);		
		
		for (Persona elemento: lista) {
			System.out.println("1" + elemento.toString());
		}
		
		System.out.println("--------------ORDENADAS 1-------------");		
		List<Persona> per = Persona.ordenaPersonas(p1,p2,p3,p4);
		for (Persona p: per) {
			System.out.println("2 " + p.toString());
		}
		
		System.out.println("--------------ORDENADAS 2-------------");
		Set<Persona> personasOrdenadas = Persona.ordenaPersonas1(p1,p2,p3,p4);
		for(Persona p : personasOrdenadas) {
		System.out.println("3" + p.toString());
		}		
		
		System.out.println("--------------IMPORT STATIC-------------");
		List<Persona> per2 = Persona.ordenaPersonas2(p1,p2,p3,p4);
		for (Persona p: per2) {
			System.out.println("4 " + p.toString());
		}
		
		EmpleadoPublico ep1 = new EmpleadoPublico("Nombre1", "apellidos1", 12, "cc", new Date(), new Date(), 2011, TipoContrato.JORNADA_COMPLETA, "superior");
		EmpleadoPublico ep2 = new EmpleadoPublico("Kombre1", "bpellidos1", 10, "aa", new Date(), new Date(), 2017, TipoContrato.JORNADA_COMPLETA, "superior");
		EmpleadoPublico ep3 = new EmpleadoPublico("Nombre1", "apellidos1", 11, "bb", new Date(), new Date(), 2018, TipoContrato.JORNADA_COMPLETA, "superior");		
	
		// ocultación.  La primera llama al método estático de EmpleadoPublico y la segunda al de Persona
		ep1.muestraEmpleadosPublicos(ep1, ep2, ep3);	
		ep1.muestraPersonas(ep1, ep2, ep3);

		System.out.println("--------------INTERFACES-------------");		
		if (ep1.puedeTrabajar(true, true, false)) {
			System.out.println("Puede trabajar");
		} else {
			System.out.println("No Puede trabajar");
		}
		
		System.out.println("--------------POLIMORFISMO-------------");
		GestorPersonas gestor = new GestorPersonas();
		gestor.polimorfismo();
		
		System.out.println("--------------EXCEPCIONES-PROPIAS-------------");
		try {
			System.out.println("DNI: " + ep1.getDni());
			if (!gestor.validaDni(ep1)) {
				throw new DniNoValidoException("Error en el Dni");
			}
		} catch(DniNoValidoException e) {
			System.out.println(e);
			System.out.println(e.getErrorGenerico());
		}
		
		System.out.println("--------------TRY-WITH-RESOURCE-------------");
		try (EmpleadoPublico emp = new EmpleadoPublico()) {			
			System.out.println("Trabajo");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		System.out.println("--------------LAMBDA-------------");
		List<EmpleadoPublico> listaEP = new ArrayList<EmpleadoPublico>();
		listaEP.add(ep1);
		listaEP.add(ep2);
		listaEP.add(ep3);

		GestorPersonas.imprimeEmpleadoPublico(listaEP, a -> a.getEdad()<40 && a.getEdad()>11);
		System.out.println("-----Con return: ");
		GestorPersonas.imprimeEmpleadoPublico(listaEP, (EmpleadoPublico a) -> {return a.getEdad()<40 && a.getEdad()>11; });
		System.out.println("-----Con consumidor: ");
		GestorPersonas.procesaPersona(listaEP, a -> a.getEdad()<40 && a.getEdad()>11, c -> c.muestraValor() );
		
		System.out.println("--------------STREAMS-------------");
		GestorPersonas.pruebaStream(listaEP);
		//GestorPersonas.pruebaStream(ep1, ep2, ep3);
		
		System.out.println("Edad empleados : " + ep1.getEdad());
		System.out.println("Edad empleados : " + ep2.getEdad());
		System.out.println("Edad empleados : " + ep3.getEdad());		
		System.out.println("Edad media de los empleados : " + GestorPersonas.edadMediaEmpleado(listaEP));
		
		System.out.println("--------------STREAMS UPPER------");		
		GestorPersonas.upperDni(listaEP);
		
		System.out.println("--------------STREAMS.SUPPLIER------");		
		GestorPersonas.guardaStream(listaEP);
		
		System.out.println("--------------STREAMS.COLLECT------");		
		GestorPersonas.empiezaN(listaEP);		
		System.out.println("--------------STREAMS.AGRUPA------");		
		GestorPersonas.agrupaApellidos(listaEP);				
		System.out.println("--------------STREAMS.QUITA_DUPLICADOS------");		
		GestorPersonas.quitaDuplicados(listaEP);						
		System.out.println("--------------STREAMS.CONCATENA------");		
		GestorPersonas.concatena(listaEP);
		System.out.println("--------------STREAMS.REDUCIR------");		
		GestorPersonas.reducir(listaEP);
		System.out.println("--------------STREAMS.HILOS------");
		long totalSumSerie = 0;
		long totalSumParalelo = 0;
		long startTime = System.currentTimeMillis();
		
		ArrayList<EmpleadoPublico> listaGrande = new ArrayList<EmpleadoPublico>();		
		for (int i=0; i<1000; i++ ){
			for(EmpleadoPublico ep : listaEP) {
				listaGrande.add(ep);
			}
		}
		GestorPersonas.hilos(listaGrande);
		totalSumParalelo+= (System.currentTimeMillis()-startTime);

		startTime = System.currentTimeMillis();		
		GestorPersonas.pruebaStream(listaGrande);
		totalSumSerie+= (System.currentTimeMillis()-startTime);
		System.out.println("Serie: "+totalSumSerie);
		System.out.println("Paralelo: "+totalSumParalelo);		

		System.out.println("--------------ARRAYS------");
		// ordena un array y busca un elemento. Para la ordenación busca el método compareTo de EmpleadoPublico
		List<EmpleadoPublico> miLista = GestorPersonas.pruebaArray(listaEP);
		EmpleadoPublico[] miArray = miLista.toArray(new EmpleadoPublico[miLista.size()]);
		Arrays.sort(miArray);
		for (EmpleadoPublico e: miArray) {
			System.out.println("Array : "+ e.toString());
		}
		int encontrado = Arrays.binarySearch(miArray, ep1);
		System.out.println(encontrado + " " + miArray[encontrado]);
		
		System.out.println("--------------WRAPPERS------");
		// tipos primitivos (no serializables) vs wrappers (si serializables)
		boolean b = Boolean.parseBoolean("true");
		Boolean B = Boolean.parseBoolean(("FALSE"));
		if (b) {
			System.out.println("correcto");			
		} else {
			System.out.println("Falso");
		}
		if (B) {
			System.out.println("correcto");			
		} else {
			System.out.println("Falso");
		}		
		
		Float f = Float.valueOf("5.5");
		System.out.println(f + " " + Float.MAX_VALUE + " " + Integer.MAX_VALUE + " " + Double.MAX_VALUE);
	}

}
