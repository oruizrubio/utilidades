package com.avante.solucion4;

import java.util.ArrayList;
import java.util.List;

public class GestionStock implements StockObserver{

	List<Notificacion> notificadores = new ArrayList<Notificacion>();
	boolean hayStock = false;
	
	public void incrementaStock(){
		hayStock = true;
		notificar();
	}
	
	@Override
	public void addObserver(Notificacion n) {
		notificadores.add(n);
		
	}

	@Override
	public void removeObserver(Notificacion n) {
		notificadores.remove(n);
		
	}

	@Override
	public void notificar() {
		for (Notificacion n: notificadores){
			n.enviarComunicacion();
		}
	}

}
