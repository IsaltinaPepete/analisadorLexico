/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analisadorLexico;

/**
 *
 * @author Isaltina Pepete
 */
public class Token {
    public enum T {
        Texto_Atribuido,
        Palavra_reservada,
        Identificador,
        Numero,
        Soma,
        Incremento,
        Subtracao,
        Decremento,
        Multiplicacao,
        Exponenciacao,
        Divisao,
        Modulo,
        Atribuicao,
        and,
        or,
        no,
        Diferente,
        Menor,
        Menor_Igual,
        Maior,
        Maior_Igual,
        Igual,        
        Pc_Abre,
        Pc_Fecha,
        Pr_Abre,
        Pr_Fecha,
        Ch_Abre,
        Ch_Fecha,
        Ponto,
        Virgula,
        Ponto_Virgula,
        ERROR,
        IF,
        ELSE;

    }

    public T type;
    public Object val;
    public int line;
    public int col;
    
    public Token(T type, int line, int col)
    {
        this.type = type;
        this.line = line;
        this.col = col;
    }
    public Token(T type, Object val, int line, int col)
    {
        this.type = type;
        this.val = val;
        this.line = line;
        this.col = col;
    }  

}


