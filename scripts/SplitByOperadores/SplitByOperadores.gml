function SplitByOperadores(str){
    var operadores = ["+", "-", "*", "/", "^", "√"];
    var unified = str;
    for (var i = 0; i < array_length(operadores); i++) {
        unified = string_replace_all(unified, operadores[i], "|");
    }
    return string_split(unified, "|", true);
}