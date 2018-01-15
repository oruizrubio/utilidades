import sys

for arg in sys.argv[1:]:
    try:
        f = open(arg, 'r')
    except OSError:
        print('cannot open', arg)
    else:
        print(arg, 'has', len(f.readlines()), 'lines')
        f.close()
		
def divide(x, y):
	try:
		result = x / y
	except ZeroDivisionError:
		print("division by zero!")
	else:
		print("result is", result)
	finally:
		print("executing finally clause")		
		
divide(1,2)
divide(2,0)

with open(sys.argv[1:][0]) as f:
	for line in f:
		print(line, end="")