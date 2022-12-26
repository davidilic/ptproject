import java.io.FileReader;
import lexer.MPLexer;
import parser.MPParser;

public class Main {

    public static void main(String[]args) throws Exception {
        MPLexer lexer = new MPLexer(new FileReader("test.txt"));
        MPParser parser = new MPParser(lexer);
        parser.parse();
    }

}
