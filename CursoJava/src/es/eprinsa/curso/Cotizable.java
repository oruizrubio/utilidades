package es.eprinsa.curso;

public interface Cotizable {

	// public abstract por defecto 
	void imprimeHistorial();
	
	public default boolean puedeTrabajar(boolean ... condiciones) {
		boolean rt = true;
		for (boolean c: condiciones) {
			if (!c) {
				rt = false;
			}
		}
		return rt;		
	}
	
}
