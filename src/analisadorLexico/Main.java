package analisadorLexico;

import java.io.StringReader;
import analisadorLexico.Regras_Lexicas;

public class Main {
    public static void main(String[] args) throws Exception {
        String codigoFonte = "if (x > 0) { y = x; } // exemplo de código\n $invalidChar";
        Regras_Lexicas lexer = new Regras_Lexicas(new StringReader(codigoFonte));
        
        Token token;
        while ((token = lexer.yylex()) != null) {
            // if (token == Token.ERROR) {
            //     System.err.println("Erro léxico na linha " + lexer.GetLine() + ": " + lexer.lexeme);
            // } else {
                System.out.println(token + " na linha " + lexer.GetLine());
            // }
        }
    }
} 