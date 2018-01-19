package com.avante.solucion4;

public interface StockObserver {
	public void addObserver (Notificacion n);
	public void removeObserver (Notificacion n);
	public void notificar ();
}
