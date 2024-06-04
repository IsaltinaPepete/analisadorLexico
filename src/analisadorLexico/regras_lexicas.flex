package analisadorLexico;
import analisadorLexico.Token;

import java.util.HashMap;

/**public class Lexer {

    private static final HashMap<String, Token> reservedWords = new HashMap<>();
    static {
        reservedWords.put("if", Token.T.IF);
        reservedWords.put("else", Token.T.ELSE);
        //reservedWords.put("elif", Token.ELIF);
        //reservedWords.put("while", Token.WHILE);
        //reservedWords.put("for", Token.FOR);
        //reservedWords.put("return", Token.RETURN);
        //reservedWords.put("int", Token.INT);
        //reservedWords.put("float", Token.FLOAT);
        // Adicione outras palavras reservadas aqui
    }
}**/


%%
%class Regras_Lexicas
%line
%caseless
%ignorecase
%type Token

%{

private Token token(Token.T type)
{
return new Token(type, yyline, yycolumn);
}
private Token token(Token.T type, Object val)
{
return new Token(type, val, yyline, yycolumn);
}
%}


/***********************************
*          ALFABETO                *
************************************/
Letra=[a-zA-Z_]+
Digito=[0-9]+
Esp_Tab_nLinha=[ ,\t,\r,\n]+

%{ 
   public String lexeme;
    public int GetLine() { return yyline + 1; }
%}
%%


/***********************************
*          TOKENS                  *
************************************/

// Words

[ ,\t,\r,\n]+ {/*Ignore*/}
"//".* {/*Ignore*/}

"\""({Letra}|{Digito}|{Esp_Tab_nLinha})*"\"" {lexeme=yytext(); return token(Token.T.Texto_Atribuido);}



//Operacoes
"+" { return token(Token.T.Soma); }
"++" { return token(Token.T.Incremento); }
"-" { return token(Token.T.Subtracao); }
/**"--" { return Token.Decremento; }
"*" { return Token.Multiplicacao; }
"**" { return Token.Exponenciacao; }
"/" { return Token.Divisao; }
"%" { return Token.Modulo; }
"=" { return Token.Atribuicao; }
"!=" { return Token.Diferente; }
"<" { return Token.Menor; }
"<=" { return Token.Menor_Igual; }
">" { return Token.Maior; }
">=" { return Token.Maior_Igual; }
"==" { return Token.Igual; }
"(" { return Token.Pc_Abre; }
")" { return Token.Pc_Fecha; }
"[" { return Token.Pr_Abre; }
"]" { return Token.Pr_Fecha; }
"{" { return Token.Ch_Abre; }
"}" { return Token.Ch_Fecha; }
"." { return Token.Ponto; }
"," { return Token.Virgula; }
";" { return Token.Ponto_Virgula; }**/


//Op. Logicas
"&&"  { return token(Token.T.and); }
"||"  { return token(Token.T.or); }
"!" { return token(Token.T.no); }



/********************************************************************
*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   
*                  P A L A V R A    R E S E R V A D A               *
*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *
********************************************************************/
boolean |
break |
decimal |
case |
catch |
string |
continue |
constant |
default |
do |
else |
elif |
if |
import |
int |
function |
return |
main |
switch |
throw |
try |
while |
true |
false |
null {lexeme=yytext(); return token(Token.T.Palavra_reservada);}


/**{Letra}({Letra}|{Digito})* {
    lexeme=yytext();

    Token.T type = reservedWords.get(lexeme);
    if (type != null) {
        return token(type);
    } else {
        return token(Token.T.Identificador, lexeme);
    }
    }
    **/
    
("(-"{Digito}+")")|{Digito}+ {lexeme=yytext(); return token(Token.T.Numero);}

//Essa regra define: qualquer caractere que nao seja definido pelas regras a cima será considerado erro
. {return token(Token.T.ERROR);}