package analizadorLexico;

import java.io.File;

/**
 *
 * @author 
 */
public class analizadorLexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       interfaz ventana = new interfaz();
       ventana.setVisible(true);
        String path = "src/analizadorLexico/Lexer.flex";
        generarLexer(path);

    }
    public static void generarLexer(String path){
        File file=new File(path);
        jflex.Main.generate(file);
    }
    
    
}
