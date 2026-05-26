function parseEquation(equationString, X, Y){
    var tokens = tokenize(equationString);
    if (array_length(tokens) == 0) return 0;
    var postfix = infixToPostfix(tokens);
    if (array_length(postfix) == 0) return 0;
    return evaluatePostfix(postfix, X, Y);
}