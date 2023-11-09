Lenguaje = Sentencia*
Sentencia = Token_de_pregunta / No_token_de_pregunta
No_token_de_pregunta =
  token_1:(!(Token_de_pregunta).)+
    { return text() }
Token_de_pregunta = 
  token_1:"#{"
  pregunta:Subtoken_de_pregunta
  valor:Subtoken_de_valor?
  token_3:"}#"
    { return {pregunta,valor}}
Subtoken_de_pregunta =
  token_1:(!("="/"}#").)*
    { return text().trim() }
Subtoken_de_valor = 
  token_1:"="
  token_2:(!("}#").)*
    { return text().substr(1).trim() }