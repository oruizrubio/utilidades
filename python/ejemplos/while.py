print ("\nWhile controlado con Conteo")
print ("===========================\n")

print ("Un ejemplo es un sumador numérico hasta 10, \ncomo se muestra a continuación:\n")

suma = 0
numero = 1
while numero <= 10:
    suma = numero + suma
    numero = numero + 1
print ("La suma es " + str(suma))

suma = 0
numero = 1
while numero <= 10:
    suma, numero = numero + suma, numero + 1
print ("La suma es " + str(suma))