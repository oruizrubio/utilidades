package com.avante.ejemplo5;

public class FactoriaPerro implements CreadorPerros {
	public Perro getPerro(String criteria)
	  {
	    if ( criteria.equals("pequeño") )
	      return new Cocker();
	    else if ( criteria.equals("mediano") )
	      return new Rottweiler();
	    else if ( criteria.equals("nieve") )
	      return new Husky();

	    return null;
	  }
}
