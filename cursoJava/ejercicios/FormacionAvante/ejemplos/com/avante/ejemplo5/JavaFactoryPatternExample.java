package com.avante.ejemplo5;

public class JavaFactoryPatternExample {
	public static void main(String[] args)
	  {
		FactoriaPerro factoria = new FactoriaPerro();

		Perro dog = factoria.getPerro("pequeño");
	    dog.ladra();

	    dog = factoria.getPerro("mediano");
	    dog.ladra();

	    dog = factoria.getPerro("nieve");
	    dog.ladra();
	  }
}
