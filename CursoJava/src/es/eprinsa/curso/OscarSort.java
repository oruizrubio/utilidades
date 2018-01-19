package es.eprinsa.curso;

import java.util.Arrays;
import java.util.Collections;

public class OscarSort implements Strategy {

	@Override
	public void sort(Integer[] numbers) {
		// TODO Auto-generated method stub
		System.out.println("Ordenando con OscarSort");
		Arrays.sort(numbers, Collections.reverseOrder());  // hacer descendente
	}

}
