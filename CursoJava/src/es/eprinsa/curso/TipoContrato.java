package es.eprinsa.curso;

public enum TipoContrato {
	
	JORNADA_COMPLETA ("completa", 1), JORNADA_PARCIAL ("parcial", 3);
	
	private final String nombre;
	private final int multiplicador;
	
	TipoContrato(String nombre, int multiplicador) {
		this.nombre = nombre;
		this.multiplicador = multiplicador;
	}
	
	public String getNombre() {
		return nombre;
	}

	public int multiplicar(int anno) {
		anno *= this.multiplicador;
		return anno;
	}
	
	public static void main(String[] args) {
		for (TipoContrato a : TipoContrato.values()) {
			System.out.println (a.getNombre() + " " + a.multiplicar(2));
		}
		System.out.println (JORNADA_COMPLETA.getNombre() + " " + JORNADA_COMPLETA.multiplicar(2));
		System.out.println (JORNADA_PARCIAL.getNombre() + " " + JORNADA_PARCIAL.multiplicar(2));
	}

	public int getMultiplicador() {
		return multiplicador;
	}
		
}
