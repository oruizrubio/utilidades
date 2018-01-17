package es.eprinsa.curso;

public class DniNoValidoException extends Exception {
	  String str1;
	  
	  DniNoValidoException(String str2) {
			str1=str2;
	  }
	  
	  DniNoValidoException() {
		  str1 = getErrorGenerico();
	  }	  
	  
	  public String toString(){ 
		return ("DniNoValidoException Occurred: "+str1) ;
	  }	  
	  
	  public String getErrorGenerico() {
		  return "Error genérico en el DNI";
	  }
}
