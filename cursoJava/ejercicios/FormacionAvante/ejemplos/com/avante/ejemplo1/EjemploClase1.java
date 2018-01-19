// Definimos el paquete de la clase. Nos ayuda a identificar y agrupar nuestras clases 
package com.avante.ejemplo1;

// Importamos otras clases que necesitamos para nuestra clase Java
import java.lang.String;


// Definimos la clase, así como su padre (Herencia) y las posibles implementaciones (polimorfismo)
// En la clase encapsulamos toda la funcionalidad y atributos asociados a la clase
public class EjemploClase1 extends Object implements EjemploInterfaz1{
	
	// Atributo de la clase al ser privado aplicamos el concepto de ocultación
	private String nombreAtributo;
	
	
	// Constructor para generar un objeto nuevo de la clase. (la clase crea un objeto nuevo objeto)
	public EjemploClase1(){
		// llamada al constructor del padre
		super();
	}
	
	// Constructor con parametros
	public EjemploClase1 (String nombreAtributo){
		// Inicializamos atributos desde el constructor
		this.nombreAtributo = nombreAtributo;
	}
	
	// método especial para poder ejecutar la clase.
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	// método de la clase para acceder a atributos de la misma
	public void setNombreAtributo(String nuevoNombreAtributo){
		this.nombreAtributo = nuevoNombreAtributo;
	}
	
	// metodo que estamos obligados a implementar por implementar el interfaz EjemploInterfaz1
	public void declaraUnaFuncion() {
		// Accion importante
		
	}

}
