function isNumber(char){
    var isReal = false;
    //try to convert to a number
    try{  char=real(char);  }catch(e){}
    //if it failed, it's still a string
    if( is_string(char) ){
       //process as string
    }else{
       //process as a number
        isReal = true;
    }
    return isReal || char == ".";
}