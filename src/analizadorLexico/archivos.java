/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorLexico;

import java.io.BufferedReader;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTextArea;

/**
 *
 * @author
 */
class archivos {

    public void probarLexerFile(JTextArea area) throws IOException {
        int contIDs = 0;

        File fichero = new File("arch.txt");
        PrintWriter writer;
        try {
            writer = new PrintWriter(fichero);
            writer.print(area.getText());
            writer.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(interfaz.class.getName()).log(Level.SEVERE, null, ex);
        }
        Reader reader = new BufferedReader(new FileReader("arch.txt"));
        Lexer lexer = new Lexer(reader);
        String resultado = "";
        while (true) {
            Token token = lexer.yylex();
            if (token == null) {
                System.out.println("Final del archivo");
                return;
            }
            switch (token) {
                case IDENTIFICADOR:
                case RESERVADA:
                case NUMERO:
                case ARITMETICOS:
                case ASIGNACION:
                case RELACIONALES:
                case SIMBOLO:
                    System.out.println("TOKEN: " + token + " " + lexer.lexeme);
                    break;
                case ERROR:
                    System.out.println("TOKEN: " + token + " " + lexer.lexeme);
                    break;
                
            }
        }
    }

}
