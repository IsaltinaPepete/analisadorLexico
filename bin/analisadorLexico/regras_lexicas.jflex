package analisadorLexico;
import analisadorLexico.Token;
import analisadorLexico.Palavras_Reservadas.PR;
import analisadorLexico.TabelaSimbolos;



%%
%class Regras_Lexicas
%line
%caseless
%ignorecase
%type Token

%{
TabelaSimbolos tabelaSimbolos = new TabelaSimbolos();
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
"+" { return token(Token.T.Soma, "+"); }
"++" { return token(Token.T.Incremento, "++"); }
"-" { return token(Token.T.Subtracao, "-"); }
"--" { return token(Token.T.Decremento, "--"); }
"*" { return token(Token.T.Multiplicacao, "*"); }
"**" { return token(Token.T.Exponenciacao, "**"); }
"/" { return token(Token.T.Divisao, "/"); }
"%" { return token(Token.T.Modulo, "%"); }
"=" { return token(Token.T.Atribuicao, "="); }
"!=" { return token(Token.T.Diferente, "!="); }
"<" { return token(Token.T.Menor, "<"); }
"<=" { return token(Token.T.Menor_Igual, "<="); }
">" { return token(Token.T.Maior, ">"); }
">=" { return token(Token.T.Maior_Igual, ">="); }
"==" { return token(Token.T.Igual, "=="); }
"(" { return token(Token.T.Pc_Abre, "("); }
")" { return token(Token.T.Pc_Fecha, ")"); }
"[" { return token(Token.T.Pr_Abre, "["); }
"]" { return token(Token.T.Pr_Fecha, "]"); }
"{" { return token(Token.T.Ch_Abre, "{"); }
"}" { return token(Token.T.Ch_Fecha, "}"); }
"." { return token(Token.T.Ponto, "."); }
"," { return token(Token.T.Virgula, ","); }
";" { return token(Token.T.Ponto_Virgula, ";"); }


//Op. Logicas
"&&"  { return token(Token.T.and, "&&"); }
"||"  { return token(Token.T.or, "||"); }
"!"   { return token(Token.T.no, "!"); }



//P A L A V R A S   R E S E R V A D A S   E   I D E N T I F I C A D O R E S//

{Letra}({Letra}|{Digito})* {
    lexeme=yytext();

    PR type = Palavras_Reservadas.getPalavraReservada(lexeme);
    if (type != null) {
        return token(Token.T.Palavra_reservada, lexeme);
    } else {
        if (!tabelaSimbolos.verificarIdentificador(lexeme)) {
            // Se não estiver na tabela, adiciona
            tabelaSimbolos.adicionarIdentificador(lexeme);
            return token(Token.T.Identificador, lexeme);
        } else {
            // Se já estiver na tabela, não faz nada
            return token(Token.T.Identificador, lexeme);
        }
    }
}
    
//numeros    
("(-"{Digito}+")")|{Digito}+ {lexeme=yytext(); return token(Token.T.Numero);}

//Essa regra define: qualquer caractere que nao seja definido pelas regras a cima será considerado erro
. {return token(Token.T.ERROR);}