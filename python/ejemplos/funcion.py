def funcion():
	print("Hola Mundo")
	
def recorrer_parametros_arbitrarios(parametro_fijo, *arbitrarios, **kwords): 
    print (parametro_fijo )
    for argumento in arbitrarios: 
        print (argumento) 
 
    # Los argumentos arbitrarios tipo clave, se recorren como los diccionarios 
    for clave in kwords: 
        print ("El valor de", clave, "es", kwords[clave])
		
def calcular(importe, descuento): 
    return importe - (importe * descuento / 100) 		

# Function definition is here
sum = lambda arg1, arg2: arg1 + arg2;
	
funcion()

recorrer_parametros_arbitrarios("Fixed", "arbitrario 1", "arbitrario 2", "arbitrario 3", clave1="valor uno", clave2="valor dos")

datos = {"descuento": 10, "importe": 1500} 
print ("calcular: ",calcular(**datos))

datos = {"descuento": 20, "importe": 1500} 
total = calcular(**datos)
print ("calcular: ",total)


# Now you can call sum as a function
print ("Value of total : ", sum( 10, 20 ))
print ("Value of total : ", sum( 20, 20 ))
