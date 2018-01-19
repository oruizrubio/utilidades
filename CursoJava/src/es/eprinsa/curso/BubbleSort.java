package es.eprinsa.curso;

import java.util.Arrays;

public class BubbleSort implements Strategy {

	@Override
	public void sort(Integer[] numbers) {
		// TODO Auto-generated method stub
		System.out.println("Ordenando con BubbleSort");
		Arrays.sort(numbers);
	}

}
