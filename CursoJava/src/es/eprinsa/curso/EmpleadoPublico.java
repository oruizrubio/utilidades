package es.eprinsa.curso;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class EmpleadoPublico extends Persona  {

	private String grado;
	
	// si no tiene constructor, llamaría implícitamente al constructor vacío del padre.
	// si no existe, da error de compilación
	public EmpleadoPublico(String nombre, String apellidos, int edad, String dni, Date fechaNacimiento,
			Date fechaIncorporacion, int annoInicio, TipoContrato tipo, String grado) {
		super(nombre, apellidos, edad, dni, fechaNacimiento, fechaIncorporacion, annoInicio, tipo);
		this.grado = grado;
	}	

	public EmpleadoPublico(String nombre, String apellidos, int edad, String dni, Date fechaNacimiento,
			Date fechaIncorporacion, int annoInicio, TipoContrato tipo) {
		super(nombre, apellidos, edad, dni, fechaNacimiento, fechaIncorporacion, annoInicio, tipo);
		this.grado = null;
	}	
	
	public EmpleadoPublico() {
		super();
	}	
	
	public String getGrado() {
		return grado;
	}

	public void setGrado(String grado) {
		this.grado = grado;
	}

	public static List<EmpleadoPublico> ordenaPersonas(EmpleadoPublico... empleadosPublicos) {
		List<EmpleadoPublico> lista = Arrays.asList(empleadosPublicos);
		Collections.sort(lista,Collections.reverseOrder());
		return lista;		
	}
	
	public void muestraEmpleadosPublicos(EmpleadoPublico... empleadosPublicos) {
		System.out.println("--------------ORDENADAS descendente-------------");		
		List<EmpleadoPublico> emppub = EmpleadoPublico.ordenaPersonas(empleadosPublicos);
		for (EmpleadoPublico p: emppub) {
			System.out.println("2 " + p.toString());
		}		
	}

	@Override
	public boolean validaEmail() {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getNombre() + " " + this.getEdad();
	}

	@Override
	public void imprimeHistorial() {
		// TODO Auto-generated method stub
		System.out.println("El empleado público tiene el grado: "+ getGrado());
	}
	
	public boolean puedeTrabajar(boolean ... condiciones) {
		boolean rt = true;
		rt = super.puedeTrabajar(condiciones);
		
		// añadimos comprobamos que el empleado tenga más de 18 años
		Date hoy = new Date();
		//System.out.println(this.getFechaNacimiento().getYear());
		//System.out.println(hoy.getYear() - 18);
		try {
			if (this.getFechaNacimiento().getYear() < hoy.getYear() - 18) {
				System.out.println("pongo a false por ser menor de 18 años");
				rt = false;
			}
		} catch(Exception e) {
			
		}
		return rt;		
	}

	@Override
	public void close() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Cerrar");
		
	}

	public void muestraValor() {
		System.out.println("Pasa el filtro y se ejecuta " + this.getDni());
	}
	
}
