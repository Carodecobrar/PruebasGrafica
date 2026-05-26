function infixToPostfix(tokens){
    var output = [];
    var operators = [];
    var precedence = function(operator) {
        switch (operator) {
            case "^": return 4;
            case "*": return 3;
            case "/": return 3;
            case "+": return 2;
            case "-": return 2;
            default: return 0;
        }
    };
    var leftAssociative = function(operator) {
        return operator != "^";
    };
    for (var i = 0; i < array_length(tokens); i++) {
        var token = tokens[i];
        switch (token.type) {
            case "number":
            case "variable":
                array_push(output, token);
                break;
            case "operator":
                var op = token.value;
                while (array_length(operators) > 0) {
                    var top = operators[array_length(operators) - 1];
                    if (top.value == "(")
                        break;
                    var topPrec = precedence(top.value);
                    var currPrec = precedence(op);
                    var a = leftAssociative(op) && currPrec <= topPrec;
                    var b = !leftAssociative(op) && currPrec < topPrec;
                    if (a || b) {
                        array_push(output, array_pop(operators));
                    } else {
                        break;
                    }
                }
                array_push(operators, token);
                break;
            case "(":
                array_push(operators, token);
                break;
            case ")":
                while (array_length(operators) > 0 && operators[array_length(operators) - 1].value != "(") {
                    array_push(output, array_pop(operators));
                }
                if (array_length(operators) > 0 && operators[array_length(operators) - 1].value == "(") {
                    array_pop(operators);
                } else {
                    show_debug_message("Error: Paréntesis no balanceados");
                    return [];
                }
                break;
        }
    }
    while (array_length(operators) > 0) {
        var top = array_pop(operators);
        if (top.value == "(" || top.value == ")") {
            show_debug_message("Error: Paréntesis no balanceados");
            return [];
        }
        array_push(output, top);
    }
    return output;
}