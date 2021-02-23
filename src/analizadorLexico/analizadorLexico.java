package analizadorLexico;

import java.io.File;


//TODO

//comentario
 
//"hola compiladores"
  
//hol"aaa
 
//a==b!=c
   
//95b =! h5   token desconocido[95b y =!] 


//@#
  
//ç
//[11:25 a.m.] Nely Plata Cesar
//    
//95b, desconocido
//​[11:25 a.m.] Nely Plata Cesar
//    
//=!
//​[11:25 a.m.] Nely Plata Cesar
//    
//desconocido
//​[11:26 a.m.] Nely Plata Cesar
//    
//a=3
/**
 *
 * @author 
 */
public class analizadorLexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Home ventana = new Home();
       ventana.setVisible(true);
        String path = "src/analizadorLexico/Lexer.flex";
        generarLexer(path);

    }
    public static void generarLexer(String path){
        File file=new File(path);
        jflex.Main.generate(file);
    }
    
    
}
