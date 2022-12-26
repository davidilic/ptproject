package lexer;
import java.util.Hashtable;

class KWTable {
    private Hashtable<String, Integer> table;

    public KWTable() {
        table = new Hashtable<String, Integer>();
        table.put("print", new Integer(sym.PRINT));
        table.put("if", new Integer(sym.IF));
        table.put("else", new Integer(sym.ELSE));
        table.put("while", new Integer(sym.WHILE));
        table.put("for", new Integer(sym.FOR));
        table.put("def", new Integer(sym.DEF));
        table.put("return", new Integer(sym.RETURN));
        table.put("in", new Integer(sym.IN));
    }

    public int find(String keyword) {
        Object symbol = table.get(keyword);
        
        if (symbol == null) {
            return sym.IDENTIFIER;
        }

        return ((Integer) symbol).intValue();
    }
}