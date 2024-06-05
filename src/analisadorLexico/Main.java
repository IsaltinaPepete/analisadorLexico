package analisadorLexico;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import analisadorLexico.Regras_Lexicas;
import analisadorLexico.TabelaSimbolos;

public class Main {
    public static void main(String[] args) throws Exception {
        String filePath = "C:/exemplo.txt";
        File inputFile = new File(filePath);

        if (!inputFile.exists() || !inputFile.isFile()) {
            System.err.println("Arquivo não encontrado: " + filePath);
            System.exit(1);
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            StringBuilder codigoFonte = new StringBuilder();
            String linha;

            while ((linha = reader.readLine()) != null) {
                codigoFonte.append(linha).append("\n");
            }

            Regras_Lexicas lexer = new Regras_Lexicas(new StringReader(codigoFonte.toString()));

            Token token;
            while ((token = lexer.yylex()) != null) {
                // System.out.println(token);               
                System.out.println(token.type + "         " + token.val + "          na linha " + lexer.GetLine());
            }

            TabelaSimbolos tabelaSimbolos = lexer.getTabelaSimbolos();

            System.out.println(" ");
            System.out.println("************************************");
            System.out.println("*********Tabela de símbolos:********");
            System.out.println("************************************");
            for (String identificador : tabelaSimbolos.getIdentificadores()) {
                System.out.println(identificador);
            }
        
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}