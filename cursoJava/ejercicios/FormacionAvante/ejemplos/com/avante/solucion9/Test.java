package com.avante.solucion9;

import com.avante.ejemplo10.*;

public class Test {


	public static void main (String[] args){
		Test test = new Test();
		
		test.usarMotorComun();
		test.usarMotorElectrico();
	}
	
	private void usarMotorComun() {
		Motor motor = new MotorComun();
		motor = new MotorComun();
		motor.encender();
		motor.acelerar();
		motor.apagar();
	}

	private void usarMotorElectrico() {
		Motor motor = new MotorElectricoAdapter();
		motor.encender();
		motor.acelerar();
		motor.apagar();
	}
}
