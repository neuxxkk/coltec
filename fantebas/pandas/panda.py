grau = int(input("Digite o grau do polinomio: "))

coefs = [0]*grau

for i in range(grau, 0, -1):
    coefs[i-1] = int(input(f"Digite o coeficiente de x^{i}: "))

def derivada(coefs):
    result = ''
    for i in range(len(coefs), 0, -1):
        c = coefs[i-1]
        if c:
            result += "-" if c < 0 else '+'
            result += f"{i*c}x^{i-1}"
    
    return result

def integral(coefs):
    result = ''
    for i in range(len(coefs), 0, -1):
        c = coefs[i-1]
        if c:
            result += "-" if c < 0 else '+'
            result += f"{int(c/(i+1))}x^{i+1}"
    
    return result

print(integral(coefs))
