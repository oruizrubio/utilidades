package com.avante.solucion4;

public class Test {
	public static void main (String[] args){
		GestionStock gs = new GestionStock();
		
		NotificacionApp nApp = new NotificacionApp();
		gs.addObserver(nApp);
		gs.addObserver(new NotificacionEmail());
		
		gs.incrementaStock();
		
		gs.removeObserver(nApp);
		
		gs.incrementaStock();
	}
}
