package analisadorLexico;
import java.util.HashMap;
import java.util.Set;

public class TabelaSimbolos {
    private HashMap<String, Integer> tabela;

    public TabelaSimbolos() {
        tabela = new HashMap<>();
    }

    public void adicionarIdentificador(String identificador) {
        if (!tabela.containsKey(identificador)) {
            // Se o identificador ainda não estiver na tabela, adicione-o com um valor padrão
            tabela.put(identificador, 0); 
        }
    }

    public boolean verificarIdentificador(String identificador) {
        return tabela.containsKey(identificador);
    }
    public Set<String> getIdentificadores() {
        return tabela.keySet();
    }
}
