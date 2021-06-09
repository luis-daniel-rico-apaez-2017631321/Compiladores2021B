import json

class Nodo:
    def __init__(self, dato):
        self.izq = self.right = None
        self.produce = dato
        self.id = id


class thompson:
    def __init__(self):
        self.estados = []
    
    def Union(self, id, produce_izq, produce_der):
        edo_f = False
        edo_i = False
        if(id == 0):
            edo_i = True
        self.automata.append(
            {
                'id': id,
                'prod_izq': produce_izq,
                'prod_der': produce_der,
                'edo_sig': [id+1, id+2]
            }
        )





regex = input()
id = 0
i = 0
while(i < len(regex)):
    
    if(regex[i] == '\w'):
        
