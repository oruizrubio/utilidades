package com.avante.solucion1;

public class Persona {
	
	// Atributos
	private String nombre;
	private String apellidos;
	private String direccion;
	
	// Constructores
	public Persona(){
		super();
	}
	
	public Persona(String nombre, String apellidos, String direccion){
		this.setNombre(nombre);
		this.setApellidos(apellidos);
		this.setDireccion(direccion);
	}
	
	
	// Métodos
	
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

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	@Override
	public String toString(){
		return "Nombre: " + this.nombre + ". Apellidos: " + this.apellidos + ". Direccion: " + this.direccion;
	}
	
	
	
}
