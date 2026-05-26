function evaluatePostfix(tokens, X, Y){
    var stack = [];
    for (var i = 0; i < array_length(tokens); i++) {
        var token = tokens[i];
        switch (token.type) {
            case "number":
                array_push(stack, token.value);
                break;
            case "variable":
                if (token.value == "x") {
                    array_push(stack, X);
                } else if (token.value == "y") {
                    array_push(stack, Y);
                }
                break;
            case "operator":
                if (array_length(stack) < 2) {
                    show_debug_message("Error: Expresión inválida - operandos insuficientes");
                    return 0;
                }
                var b = array_pop(stack);
                var a = array_pop(stack);
                var result = 0;
                switch (token.value) {
                    case "+": result = a + b; break;
                    case "-": result = a - b; break;
                    case "*": result = a * b; break;
                    case "/": 
                        if (b == 0) {
                            show_debug_message("Error: División por cero");
                            return 0;
                        }
                        result = a / b; 
                        break;
                    case "^": result = power(a, b); break;
                    default: 
                        show_debug_message("Error: Operador desconocido " + token.value);
                        return 0;
                }
                array_push(stack, result);
                break;
        }
    }
    if (array_length(stack) != 1) {
        show_debug_message("Error: Expresión inválida - demasiados valores en la pila");
        return 0;
    }
    return array_pop(stack);
}