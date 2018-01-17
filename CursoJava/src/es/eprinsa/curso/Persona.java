package es.eprinsa.curso;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import static java.util.Arrays.asList;

public abstract class Persona implements Comparable<Persona>, Cotizable, AutoCloseable {

	private String nombre;
	private String apellidos;
	private int edad;
	private String dni;
	private Date fechaNacimiento;
	private Date fechaIncorporacion;
	private int annoInicio, annoJubilacion;
	private TipoContrato tipo;
	private String email;
/*		
	public static void main(String[] args)  {
		// TODO Auto-generated method stub

		Persona a = new Persona("nombre", "apellidos", 10, "dni", new Date(), new Date());
		Persona b = new Persona("nombre", "apellidos", 11, "dni", new Date(), new Date());
		
		System.out.println(a.compareTo(b));
		
	}
	*/
	
	
	
	public int tiempoParaJubilarse() {
		int valor = 0;
		switch (this.getTipo()) {
			case JORNADA_COMPLETA:
				//valor = this.getAnnoInicio();
				//System.out.println("Año" + (new Date()).getYear());
				valor = (this.getAnnoJubilacion() - (new Date()).getYear() ) * this.getTipo().getMultiplicador();
				break;
				//break;
			case JORNADA_PARCIAL:
				//valor = this.getAnnoInicio() * 2;
				valor = (this.getAnnoJubilacion() - (new Date()).getYear()) * this.getTipo().getMultiplicador();
		}
		return valor;
	}
	
	public abstract boolean validaEmail();
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	//@Override
	//public abstract String toString();


	// ordena registros, no elimina duplicados
	public static List<Persona> ordenaPersonas(Persona... personas) {
		List<Persona> lista = Arrays.asList(personas);
		Collections.sort(lista);
		return lista;		
	}

	public static List<Persona> ordenaPersonas2(Persona... personas) {
		List<Persona> lista = asList(personas);
		Collections.sort(lista);
		return lista;		
	}	
	
	// ordena registros, elimina duplicados	
	static public Set<Persona> ordenaPersonas1(Persona...personas){
		Set<Persona> listaOrdenada = new TreeSet<Persona>();
		for(Persona p:personas) {
		listaOrdenada.add(p);
		}
		return listaOrdenada;
	}	
	
	//public int obtenerEdad(int )
	
	public boolean puedeJubilarse() {
		return (this.getAnnoInicio() < 1974 ^ this.getAnnoJubilacion() > 2018);
	}
	
	public TipoContrato getTipo() {
		return tipo;
	}

	public void setTipo(TipoContrato tipo) {
		this.tipo = tipo;
	}

	public int getAnnoInicio() {
		return annoInicio;
	}

	public void setAnnoInicio(int annoInicio) {
		this.annoInicio = annoInicio;
	}

	public int getAnnoJubilacion() {
		return annoJubilacion;
	}

	public void setAnnoJubilacion(int annoJubilacion) {
		this.annoJubilacion = annoJubilacion;
	}

	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellidos() {
		return apellidos;
	}


	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}


	public int getEdad() {
		return edad;
	}


	public void setEdad(int edad) {
		this.edad = edad;
	}

	// definiendo el método como final, no permites que se sobreescriban en las clases hijas
	public final String getDni() {
		return dni;
	}


	public final void setDni(String dni) {
		this.dni = dni;
	}


	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}


	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}


	public Date getFechaIncorporacion() {
		return fechaIncorporacion;
	}


	public void setFechaIncorporacion(Date fechaIncorporacion) {
		this.fechaIncorporacion = fechaIncorporacion;
	}

/*
	@Override
	public int compareTo(Object arg0) {
		// TODO Auto-generated method stub
		return this.getEdad() > ((Persona)arg0).getEdad() ? 1 : (this.getEdad() < ((Persona)arg0).getEdad() ? -1 : 0);
	}*/


	public Persona(String nombre, String apellidos, int edad, String dni, Date fechaNacimiento,
			Date fechaIncorporacion, int annoInicio, TipoContrato tipo) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.edad = edad;
		this.dni = dni;
		this.fechaNacimiento = fechaNacimiento;
		this.fechaIncorporacion = fechaIncorporacion;
		this.annoInicio = annoInicio;
		this.tipo = tipo;
	}

	public Persona(String nombre, String apellidos, int edad, String dni, Date fechaNacimiento,
			Date fechaIncorporacion, int annoInicio, int annoJubilacion, TipoContrato tipo) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.edad = edad;
		this.dni = dni;
		this.fechaNacimiento = fechaNacimiento;
		this.fechaIncorporacion = fechaIncorporacion;
		this.annoInicio = annoInicio;
		this.annoJubilacion = annoJubilacion;
		this.tipo = tipo;
	}	
	
	public Persona() {
	}		
	
	// se recibe persona porque está definido en la implementación
	// no haría falta definirlo abstracto porque se implemente la interfaz y estás obligado a definirlo	
	@Override
	public int compareTo(Persona o) {
		// TODO Auto-generated method stub
		return this.getEdad() > o.getEdad() ? 1 : (this.getEdad() < o.getEdad() ? -1 : 0);
	}

	// no puede recibir el tipo persona porque equals se implementa directamente en el objeto Object
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return this.getDni().compareTo(((Persona)obj).getDni()) == 0 ? true : false;
	}

	public void muestraPersonas(Persona... personas) {
		System.out.println("--------------ORDENADAS ascendente-------------");		
		List<Persona> emppub = Persona.ordenaPersonas(personas);
		for (Persona p: emppub) {
			System.out.println("2 " + p.toString());
		}		
	}
}
