#A -> aBa
#B -> bAb
#B -> a

def evaluar(cadena):
    i = 0

    def consumir(x):
        nonlocal i
        if(cadena[i] == x):
            i += 1
        else:
            exit()

    def A():
        consumir('a')
        B()
        consumir('a')

    def B():
        nonlocal i
        if(cadena[i] == 'b'):
            consumir('b')
            A()
            consumir('b')
        elif(cadena[i] == 'a'):
            consumir('a')
        else:
            exit()
    
    A()

    print(i)
    
    if(i < len(cadena) - 1):
        return False
    else:
        return True


cadena = input()
resultado = evaluar(cadena)

if(resultado):
    print("La cadena "+ cadena +" pertence")
