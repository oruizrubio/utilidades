package es.eprinsa.curso;

public class AnalisisDiario<K,V> {

	public AnalisisDiario(K k, V v) {
		super();
		this.k = k;
		this.v = v;
	}
	private K k;
	private V v;
	
	
	public K getK() {
		return k;
	}
	public void setK(K k) {
		this.k = k;
	}
	public V getV() {
		return v;
	}
	public void setV(V v) {
		this.v = v;
	}
	
}
