/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookshelf;

import java.util.Scanner;

/**
 *
 * @author andrii
 */
public class ScannerData {
    Scanner scanner;
    
    public ScannerData(){
        this.scanner = new Scanner(System.in);
    } 

    public int scan_isbn(){
        while (true) {
            System.out.print("Введіть ISBN книги для видалення: ");
            if (scanner.hasNextInt()) {
                return scanner.nextInt();
            } else {
                System.out.println("Будь ласка, введіть коректні дані.");
                scanner.next();
            }
        }       
    } 
    
    public char scan_command(){
         while (true) {
            System.out.println("Введіть команду: ");
            if (scanner.hasNext()) {
                String input = scanner.next();
                if (input.length() == 1) {
                    return input.charAt(0);
                } else {
                    System.out.println("Будь ласка, введіть тільки один символ.");
                }
            } else {
                System.out.println("Будь ласка, введіть коректні дані.");
                scanner.next();
            }
        }     
    } 
}
