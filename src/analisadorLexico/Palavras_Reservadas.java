package analisadorLexico;


import java.util.HashMap;

public class Palavras_Reservadas {
    public enum PR {
        BOOLEAN,
        BREAK,
        DECIMAL,
        CASE,
        CATCH,
        STRING,
        CONTINUE,
        CONSTANT,
        DEFAULT,
        DO,
        ELSE,
        ELIF,
        IF,
        IMPORT,
        INT,
        FUNCTION,
        RETURN,
        MAIN,
        SWITCH,
        THROW,
        TRY,
        WHILE,
        TRUE,
        FALSE,
        NULL 
    }

    private static final HashMap<String, PR> reservedWords = new HashMap<>();
    
    static {
        reservedWords.put("boolean", PR.BOOLEAN);
        reservedWords.put("break", PR.BREAK);
        reservedWords.put("decimal", PR.DECIMAL);
        reservedWords.put("case", PR.CASE);
        reservedWords.put("catch", PR.CATCH);
        reservedWords.put("string", PR.STRING);
        reservedWords.put("continue", PR.CONTINUE);
        reservedWords.put("constant", PR.CONSTANT);
        reservedWords.put("default", PR.DEFAULT);
        reservedWords.put("do", PR.DO);
        reservedWords.put("else", PR.ELSE);
        reservedWords.put("elif", PR.ELIF);
        reservedWords.put("if", PR.IF);
        reservedWords.put("import", PR.IMPORT);
        reservedWords.put("int", PR.INT);
        reservedWords.put("function", PR.FUNCTION);
        reservedWords.put("return", PR.RETURN);
        reservedWords.put("main", PR.MAIN);
        reservedWords.put("switch", PR.SWITCH);
        reservedWords.put("throw", PR.THROW);
        reservedWords.put("try", PR.TRY);
        reservedWords.put("while", PR.WHILE);
        reservedWords.put("true", PR.TRUE);
        reservedWords.put("false", PR.FALSE);
        reservedWords.put("null", PR.NULL);
    }

    public static PR getPalavraReservada(String palavra) {
        return reservedWords.get(palavra);
    }
}
