/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 /**
 *
 * @author Jorge Andres, Leidy Cuasquer, Valentina Peñafiel
 */

package com.mycompany.expocanina2;
import com.mycompany.expocanina2.Perro;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;



public class ExposicionPerros {

    ArrayList<Perro> darPerros = new ArrayList<>();
    
         // aqui es donde vamos a hacer uso de un array list para poder guardar los datos ingresados previamente y poder hacer su auditoria
    public static void guardarPerro(ArrayList<Perro> darPerros) {
        try {
         
            FileOutputStream fos = new FileOutputStream("perros.ser");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(darPerros);
            oos.close();
            System.out.println("Datos de perros guardados exitosamente en: perros.ser");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }
    }

   //se hace uso de los servlet para poder carga los perros con sus datos desde el array list 
   //
    public static ArrayList<Perro> cargarPerros(ServletContext servletContext) {
        ArrayList<Perro> darPerros = new ArrayList<>();
        try {
     
            FileInputStream fis = new FileInputStream("perros.ser");
            ObjectInputStream ois = new ObjectInputStream(fis);
            darPerros = (ArrayList<Perro>) ois.readObject();
            ois.close();
            System.out.println("Datos de perros cargados exitosamente desde: perros.ser");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de perros: " + e.getMessage());
        }
        return darPerros;
    }
    
}
