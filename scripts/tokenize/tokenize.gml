function tokenize(expr){
    var tokens = [];
    var current = "";
    var lastTokenWasOperator = true;  // Al inicio, es como si hubiera un operador
    
    for (var i = 1; i <= string_length(expr); i++) {
        var char = string_char_at(expr, i);
        
        if (isNumber(char)) {
            current += char;
            lastTokenWasOperator = false;
            
        } else if (isVariable(char)) {
            if (current != "") {
                array_push(tokens, {type: "number", value: real(current)});
                current = "";
            }
            array_push(tokens, {type: "variable", value: char});
            lastTokenWasOperator = false;
            
        } else if (isOperator(char)) {
            if (current != "") {
                array_push(tokens, {type: "number", value: real(current)});
                current = "";
            }
            
            // Detectar si es unario (negativo al inicio o después de otro operador)
            if (char == "-" && lastTokenWasOperator) {
                // Es unario: añadir un 0 antes para hacerlo binario
                array_push(tokens, {type: "number", value: 0});
                array_push(tokens, {type: "operator", value: "-"});
            } else {
                var newType = "operator";
                if (char == "(" || char == ")")
                    newType = char;
                array_push(tokens, {type: newType, value: char});
            }
            
            lastTokenWasOperator = true;
            
        } else if (char == "(") {
            if (current != "") {
                array_push(tokens, {type: "number", value: real(current)});
                current = "";
            }
            array_push(tokens, {type: "operator", value: char});
            lastTokenWasOperator = true;  // Después de ( puede venir unario
            
        } else if (char == ")") {
            if (current != "") {
                array_push(tokens, {type: "number", value: real(current)});
                current = "";
            }
            array_push(tokens, {type: "operator", value: char});
            lastTokenWasOperator = false;
            
        } else if (char != " ") {
            show_debug_message("Caracter no soportado: " + char);
            return [];
        }
    }
    
    if (current != "") {
        array_push(tokens, {type: "number", value: real(current)});
    }
    
    return tokens;
}