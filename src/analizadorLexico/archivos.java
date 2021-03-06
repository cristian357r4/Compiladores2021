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
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author
 */
class archivos {

    public void probarLexerFile(JTextArea area, JTable tbTokens) throws IOException {
        int contIDs = 0;
        DefaultTableModel model = (DefaultTableModel) tbTokens.getModel();

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
                case DESCONOCIDO:
                    model.addRow(new Object[]{token, lexer.lexeme, lexer.line, lexer.column});
                    System.out.println("TOKEN: " + token + " " + lexer.lexeme+" "+lexer.column+" "+lexer.line);
                    break;
                case ERROR:
                    System.out.println("TOKEN: " + token + " " + lexer.lexeme+" "+lexer.column+" "+lexer.line);
                    model.addRow(new Object[]{token, lexer.lexeme, lexer.line, lexer.column});

                    break;
                
            }
            tbTokens.setModel(model);
        }
    }

}
