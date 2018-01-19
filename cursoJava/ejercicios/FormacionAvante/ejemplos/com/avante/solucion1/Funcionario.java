package com.avante.solucion1;

public class Funcionario extends Persona{
	
	public static void main (String [] args){
		
		Persona funcionario = new Funcionario ("Alejandro", "Pérez", "C/ Mayor 1", 123);
		
		Funcionario segundoFuncionario = new Funcionario("Bea", "Márquez", "C/ Menor 1", 12);
		
		Persona tercerFuncionario = new Persona("Carlos", "Sánchez", "C/ Alta 1");
				
		// Esto no es válido
		//Funcionario cuartoFuncionario = new Persona("Luis", "Márquez", "C/ Menor 1");
		
		System.out.println(funcionario);
		System.out.println(segundoFuncionario);
		System.out.println(tercerFuncionario);
		
	}
	
	// Atributo
	private int numeroIdentificación = 0;
	
	// Constructores
	public Funcionario(){
		super();
	}
	
	public Funcionario(String nombre, String apellidos, String direccion, int numeroIdentificacion){
		super (nombre, apellidos, direccion);
		this.setNumeroIdentificación(numeroIdentificacion);
	}

	// Métodos
	public int getNumeroIdentificación() {
		return numeroIdentificación;
	}

	public void setNumeroIdentificación(int numeroIdentificación) {
		this.numeroIdentificación = numeroIdentificación;
	}
	
	@Override
	public String toString(){
		return super.toString() + " . Numero de identificación: " + this.numeroIdentificación; 
	}
	
}
