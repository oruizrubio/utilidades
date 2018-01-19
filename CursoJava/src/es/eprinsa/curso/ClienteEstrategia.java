package es.eprinsa.curso;

public class ClienteEstrategia {

	Strategy s;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Integer[] numbers = {3, 4, 5, 7, 1};
		
		// paradigma Strategy
		// se define una interfaz con un comportamiento
		// después varias clases que la implementan
		// y una clase cliente que en momento de ejecución define la estrategia y la ejecuta
		ClienteEstrategia cliente = new ClienteEstrategia();
		
		String estrategia = "2";
		
		switch (estrategia){
		case "1":
			cliente.setS(new BubbleSort());
			break;
		case "2":
			cliente.setS(new EprinsaSort());
			break;
		case "3":
			cliente.setS(new OscarSort());
			break;						
		}
				
		cliente.performOperation(numbers);
		cliente.muestra(numbers);
		
	}
	
	public void muestra(Integer[] numbers) {
		for (Integer c: numbers) {
			System.out.println(c);
		}				
	}

	public Strategy getS() {
		return s;
	}

	public void setS(Strategy s) {
		this.s = s;
	}
	
	public void performOperation(Integer[] numbers ) {
		this.s.sort(numbers);
	}

}
