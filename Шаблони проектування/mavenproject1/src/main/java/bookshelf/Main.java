/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookshelf;

import bookshelf.bookstore.Book;

/**
 *
 * @author andrii
 */
public class Main {

    /**
     *
     * @param args
     * @throws CloneNotSupportedException
     */
    public static void main(String[] args) throws CloneNotSupportedException{
       BookShelf my_bsf = BookShelf.getInstance();
       ScannerData scan = new ScannerData();
       char box;
       menu();
       
       while(true){          
           box = scan.scan_command();
           
           if(box == 'C'){
               return;
           }
           else if(box == 'G'){
               for(int i=0;i<5;i++){
                  Book b=Generator.createBook();
                  my_bsf.addBook(b);
               }
               System.out.println("Вдало згенеровано");
           }
           else if(box == 'P'){
               if(my_bsf.checkEmpty()){
                   System.out.println("На вашій полиці нічого немає");
               }
               else{
                   my_bsf.printContent();
               }             
           }
           else if(box == 'D'){
               if(my_bsf.checkEmpty()){
                   System.out.println("На вашій полиці нічого немає");
               }
               else{
                   my_bsf.removeBook(scan.scan_isbn());   
               }
           }
           else{
               System.out.println("Невідома команда");
           }
       }   
    }
    
    private static void menu(){
       System.out.println("------Меню------");
       System.out.println("Для генерації 5 книг на вашу полицю введіть G");
       System.out.println("Для видалення книги, введіть D");
       System.out.println("Для виведення списку книг на вашій полиці, введіть P");
       System.out.println("Для закриття програми, введіть C");
    }
}
