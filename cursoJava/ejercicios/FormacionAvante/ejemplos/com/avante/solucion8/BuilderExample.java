package com.avante.solucion8;

import com.avante.ejemplo9.*;

public class BuilderExample {
	public static void main(String[] args) {
		Cocina cocina = new Cocina();
		PizzaBuilder hawai_pizzabuilder = new HawaiPizzaBuilder();
		PizzaBuilder picante_pizzabuilder = new PicantePizzaBuilder();

		cocina.setPizzaBuilder(hawai_pizzabuilder);
		cocina.construirPizza();

		Pizza pizza = cocina.getPizza();
		
		System.out.println(pizza.getMasa());
		System.out.println(pizza.getRelleno());
		System.out.println(pizza.getSalsa());
		
		cocina.setPizzaBuilder(picante_pizzabuilder);
		cocina.construirPizza();

		pizza = cocina.getPizza();
		
		System.out.println(pizza.getMasa());
		System.out.println(pizza.getRelleno());
		System.out.println(pizza.getSalsa());
	}
}