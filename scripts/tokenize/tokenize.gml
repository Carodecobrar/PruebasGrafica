function tokenize(expr){
    var tokens = [];
    var current = "";
    for (var i = 1; i <= string_length(expr); i++) {
    	var char = string_char_at(expr, i);
        if (isNumber(char)) {
            current += char;
        } else if (isVariable(char)) {
            if (current != "") {
                array_push(tokens, {
                    type: "number",
                    value: real(current)
                });
                current = "";
            }
            array_push(tokens, {
                type: "variable",
                value: char
            });
        } else if (isOperator(char)) {
            if (current != "") {
                array_push(tokens, {
                    type: "number",
                    value: real(current)
                });
                current = "";
            }
            array_push(tokens, {
                type: "operator",
                value: char
            });
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