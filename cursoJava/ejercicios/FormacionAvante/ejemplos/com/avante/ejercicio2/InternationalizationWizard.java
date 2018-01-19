package com.avante.ejercicio2;

import java.text.NumberFormat;
import java.util.HashMap;

public class InternationalizationWizard {
	// Esta clase es una fachada del resto de clases creadas. Nos proveerá una interfaz para crear la internacionalización necesaria
	
	private HashMap map;
	private Currency currency = new Currency();
	private InternationalizedText propertyFile = new InternationalizedText();
	
	public InternationalizationWizard() {
		// TODO crear tres naciones (Nations) y añadirlas al mapa
	}
	
	
	public void setNation(String name) {
		// TODO inicializa la currency y el fichero de propiedades
	}

	public Object[] getNations() {
		return map.values().toArray();
	}

	public Nation getNation(String name) {
		return (Nation) map.get(name);
	}

	public char getCurrencySymbol() {
		return currency.getCurrencySymbol();
	}

	public NumberFormat getNumberFormat() {
		return currency.getNumberFormat();
	}

	public String getPhonePrefix() {
		return PhoneNumber.getSelectedInterPrefix();
	}

	public String getProperty(String key) {
		return propertyFile.getProperty(key);
	}

	public String getProperty(String key, String defaultValue) {
		return propertyFile.getProperty(key, defaultValue);
	}
}
